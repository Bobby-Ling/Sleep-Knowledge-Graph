# %%
import json
import logging
import os
import re
from abc import ABC, abstractmethod
from dataclasses import dataclass
from enum import Enum, auto
from pathlib import Path
from typing import (Any, Callable, ClassVar, Dict, List, Optional, Tuple, Type,
                    Union)

import pandas as pd
import pdfplumber
import pymupdf
import torch
from torch.utils.data import Dataset
from tqdm import tqdm


def extract_text_pdfplumber(pdf_path):
    text = ""
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            text += page.extract_text() + "\n"
    return text

def extract_table_pdfplumber(pdf_path):
    """
    使用 pdfplumber 提取所有页面的表格并合并
    """
    all_tables = []
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            tables = page.extract_tables()
            if tables:  # 只添加非空的表格
                all_tables.extend(tables)

    return json.dumps(all_tables, indent=4, ensure_ascii=False)

def extract_text_pymupdf(pdf_path):
    doc = pymupdf.open(pdf_path)
    text = ""

    for page in doc:
        text += page.get_text() + "\n" # type: ignore

    doc.close()
    return text

SCHEMA_DIR = "scale_schemas"

class SchemaData:
    """Schema数据存储类"""
    _schema_data: Dict['Schema', Tuple[List[Dict], List[Dict]]] = {}
    _columns: Dict['Schema', List[str]] = {}

    @classmethod
    def _load_schema_data(cls, schema: 'Schema', schema_dir: str = SCHEMA_DIR) -> None:
        """加载schema数据"""
        if schema in cls._schema_data:
            return

        if schema.value == Schema.UNIMPLEMENTED:
            raise ValueError(f"{schema.value}!")

        file_path = Path(schema_dir) / schema.json_file
        with open(file_path, "r", encoding="utf-8") as f:
            schema_data = json.load(f)

        elements = schema_data["pages"][0]["elements"]
        answer_value_schema = []

        # TODO
        for question in elements:
            if question["type"] == "text":
                if question.get("inputType") == "time":
                    answer_value_schema.append({"_type": "time"})
                elif question.get("inputType") == "number":
                    answer_value_schema.append({"_type": "number"})
                else:
                    answer_value_schema.append({"_type": "text"})
            elif question["type"] == "number":
                answer_value_schema.append({"_type": "number"})
            else:
                choices = {
                    choice["text"]: choice["value"]
                    for choice in question.get("choices", [])
                }
                answer_value_schema.append(choices)

        cls._schema_data[schema] = (elements, answer_value_schema)
        cls._columns[schema] = [
            element["name"] for element in elements if "name" in element
        ]

class Schema(Enum):
    """量表Schema枚举"""
    AISI = "AISI"
    ESS = "ESS"
    HAMA = "HAMA"
    HAMD = "HAMD"
    IRLSSG = "IRLSSG"
    PSQI = "PSQI"
    RBDSQ = "RBDSQ"
    STOPBANG = "StopBang"
    UNIMPLEMENTED = "UNIMPLEMENTED"

    @classmethod
    def json_schema_files(cls) -> dict['Schema', str]:
        """返回所有Schema的JSON文件名字典"""
        return {
            schema: f"{schema.value}.json"
            for schema in cls
            if schema != cls.UNIMPLEMENTED
        }

    @property
    def json_file(self) -> str:
        """获取当前Schema的JSON文件名"""
        if self.value == Schema.UNIMPLEMENTED:
            raise ValueError(f"{self.value}!")
        return f"{self.value}.json"

    @classmethod
    def scale_files(cls) -> dict['Schema', str]:
        """返回所有量表PDF文件名字典"""
        return {
            Schema.AISI: "阿森斯失眠量表AISI.pdf",
            Schema.ESS: "Epworth嗜睡量表ESS.pdf",
            Schema.HAMA: "汉密顿焦虑量表HAMA.pdf",
            Schema.HAMD: "汉密顿抑郁量表HAMD.pdf",
            Schema.IRLSSG: "国际不宁腿综合征研究组评分标准IRLS.pdf",
            Schema.PSQI: "匹茨堡睡眠量表PSQI.pdf",
            Schema.RBDSQ: "快动眼睡眠行为障碍筛查问卷RBDSQ.pdf",
            Schema.STOPBANG: "睡眠呼吸暂停初筛量表Stop-Bang.pdf"
        }

    @property
    def scale_file(self) -> str:
        """获取当前Schema的PDF文件名"""
        if self.value == Schema.UNIMPLEMENTED:
            raise ValueError(f"{self.value}!")
        return self.scale_files()[self]

    @classmethod
    def from_filename(cls, filename: str) -> Optional['Schema']:
        """从文件名判断量表类型"""
        filename_to_schema = {
            fname: schema
            for schema, fname in cls.scale_files().items()
        }

        for known_filename, schema in filename_to_schema.items():
            if known_filename in filename:
                return schema

        return None

    @property
    def scale_schema_data(self) -> Tuple[List, List]:
        """获取量表schema定义"""
        SchemaData._load_schema_data(self)
        return SchemaData._schema_data[self]

    @property
    def columns(self) -> List[str]:
        """获取列名列表"""
        SchemaData._load_schema_data(self)
        return SchemaData._columns[self]

# %%
class BaseScale:
    """量表基类"""
    schema: Schema = Schema.UNIMPLEMENTED

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        """提取内容，返回文本或JSON字符串，由子类实现
        
        Args:
            filepath: PDF文件路径
            
        Returns:
            str: 提取的文本内容或JSON格式的表格内容
        """
        raise NotImplementedError

    @classmethod
    def extract(cls, filepath: str) -> pd.DataFrame:
        """提取量表数据并转换为DataFrame
        
        Args:
            filepath: PDF文件路径
            
        Returns:
            包含量表数据的DataFrame
        """

        content = cls.extract_content(filepath)
        answers = cls.extract_answers(content)
        values = cls.extract_values(answers)
        return pd.DataFrame([values])

    @classmethod
    def extract_question_values_common(cls, answers: List[str], schema_name: str) -> Dict[str, int]:
        """通用的答案值提取方法
        
        Args:
            answers: 原始答案列表
            schema_name: Schema中的量表名称
            
        Returns:
            答案值字典
        """
        schema, answer_values_schema = cls.schema.scale_schema_data
        result = {}

        for question, answer, values in zip(schema, answers, answer_values_schema):
            column = question['name']
            # 处理特殊类型
            if isinstance(values, dict) and '_type' in values:
                if values['_type'] == 'number':
                    result[column] = float(answer)
                elif values['_type'] == 'time':
                    if ':' in answer:
                        hours, minutes = map(int, answer.split(':'))
                        result[column] = hours * 60 + minutes
                    else:
                        result[column] = int(answer)
            else:
                # 普通选项值转换
                result[column] = values.get(answer, 0)

        return result

    @classmethod
    def extract_answers(cls, content: str) -> Union[List[str], List[int]]:
        """提取答案，由子类实现"""
        raise NotImplementedError

    @classmethod
    def extract_values(cls, answers: Union[List[str], List[int]]) -> Dict[str, int]:
        """转换答案为最终值，由子类实现"""
        raise NotImplementedError

class AISIScale(BaseScale):
    """AISI量表"""
    schema: Schema = Schema.AISI

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_text_pymupdf(filepath)

    @classmethod
    def extract_answers(cls, text: str) -> List[str]:
        """提取答案列表"""
        # 预处理文本
        text = text.replace(
            """7.白天身体功能（体力或精神：如记忆\n力、认知力和注意力等）""",
            "7.白天身体功能（体力或精神：如记忆力、认知力和注意力等）"
        )

        answers = []
        for line in text.split("\n"):
            match = re.match(r"^\d+\.", line)
            if match:
                next_line = text.split("\n")[
                    text.split("\n").index(line) + 1
                ].strip()
                answers.append(next_line)
        return answers

    @classmethod
    def extract_values(cls, answers: List[str]) -> Dict[str, int]:
        """转换答案为数值"""
        text_value_map = {
            "没问题": 0,
            "无": 0,
            "轻微延迟": 1,
            "显著延迟": 2,
            "严重延迟或没有睡觉": 3,
            "延迟严重或没有睡觉": 3,
        }

        values = [text_value_map[answer] for answer in answers]
        return dict(zip(cls.schema.columns, values))

class ESSScale(BaseScale):
    """ESS量表"""
    schema: Schema = Schema.ESS

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_table_pdfplumber(filepath)

    @classmethod
    def extract_answers(cls, table_json: str) -> List[str]:
        """提取答案列表"""
        table = json.loads(table_json)[0]
        return [contents[1] for contents in table[1:]]

    @classmethod
    def extract_values(cls, answers: List[str]) -> Dict[str, int]:
        """转换答案为数值"""
        return cls.extract_question_values_common(answers, cls.schema.value)

class HAMAScale(BaseScale):
    """HAMA量表"""
    schema: Schema = Schema.HAMA

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_table_pdfplumber(filepath)

    @classmethod
    def extract_answers(cls, table_json: str) -> List[int]:
        """提取答案列表"""
        table = json.loads(table_json)[0]
        answers = []
        for row in table:
            answers.append(int(row[1]))  # 第一个分数
            if len(row) > 3:  # 确保存在第二组
                answers.append(int(row[3]))  # 第二个分数
        return answers

    @classmethod
    def extract_values(cls, answers: List[int]) -> Dict[str, int]:
        return dict(zip(cls.schema.columns, answers))

class HAMDScale(BaseScale):
    """HAMD量表"""
    schema: Schema = Schema.HAMD

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_table_pdfplumber(filepath)

    @classmethod
    def extract_answers(cls, table_json: str) -> List[int]:
        """提取答案列表"""
        table = json.loads(table_json)[0] + json.loads(table_json)[1]
        answers = []

        # 处理前17题
        for row in table[:9]:
            if row[1] is not None:
                answers.append(int(row[1]))
            if row[3] is not None:
                try:
                    answers.append(int(row[3]))
                except ValueError:
                    pass

        # 处理第18题 (日夜变化)
        answers.append(int(table[9][3]))  # A.早
        answers.append(int(table[10][3])) # B.晚

        # 处理19-24题
        for row in table[11:]:
            if row[1] is not None:
                answers.append(int(row[1]))
            if row[3] is not None:
                answers.append(int(row[3]))
        return answers

    @classmethod
    def extract_values(cls, answers: List[int]) -> Dict[str, int]:
        return dict(zip(cls.schema.columns, answers))

class IRLSSGScale(BaseScale):
    """IRLSSG量表"""
    schema: Schema = Schema.IRLSSG

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_text_pymupdf(filepath)

    @classmethod
    def extract_answers(cls, text: str) -> List[int]:
        """提取答案列表"""
        answers = []
        for line in text.split('\n'):
            if line.startswith(('A', 'B', 'C', 'D', 'E')):
                score = {
                    'A': 4, 'B': 3, 'C': 2, 'D': 1, 'E': 0
                }.get(line[0])
                answers.append(score)
        return answers

    @classmethod
    def extract_values(cls, answers: List[int]) -> Dict[str, int]:
        return dict(zip(cls.schema.columns, answers))

class PSQIScale(BaseScale):
    """PSQI量表"""
    schema: Schema = Schema.PSQI

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_text_pdfplumber(filepath)

    @classmethod
    def extract_answers(cls, text: str) -> List[str]:
        """提取答案字典"""
        text = text.replace(
            """过去一个月，你是否经常要服药（包括从以医生处方或者在外面药店购买）才能入\n睡？""",
            "过去一个月，你是否经常要服药（包括从以医生处方或者在外面药店购买）才能入睡？"
        )

        answers = []
        lines = text.split("\n")

        # 提取前4题答案
        for line in lines:
            if "上床睡觉的时间是：" in line:
                time = line.split("：")[-1]
                answers.append(time)
            elif "多少分钟：" in line:
                minutes = line.split("：")[-1]
                answers.append(minutes)
            elif "起床时间：" in line:
                wake_time = line.split("：")[-1]
                answers.append(wake_time)
            elif "每晚实际睡眠的时间：" in line:
                sleep_hours = line.split("：")[-1]
                answers.append(sleep_hours)

        # 提取5(a-i)题答案
        # 不提取j
        sub_questions = [
            "（a）",
            "（b）",
            "（c）",
            "（d）",
            "（e）",
            "（f）",
            "（g）",
            "（h）",
            "（i）",
        ]

        for q in sub_questions:
            for i, line in enumerate(lines):
                if q in line and i + 1 < len(lines):
                    answer = lines[i + 1].strip()
                    answers.append(answer)
                    break

        # 提取6-9题答案
        questions = ["6.", "7.", "8.", "9."]

        for q in questions:
            for i, line in enumerate(lines):
                if line.startswith(q):
                    # 找到下一行的答案
                    for j in range(i + 1, len(lines)):
                        potential_answer = lines[j].strip()
                        if potential_answer and not potential_answer.startswith(
                            ("6.", "7.", "8.", "9.")
                        ):
                            answers.append(potential_answer)
                            break
                    break
        return answers

    @classmethod
    def extract_values(cls, answers: List[str]) -> Dict[str, int]:
        columns = cls.schema.columns
        question_values = {}

        schema, answer_values_schema = cls.schema.scale_schema_data

        for column, answer, question_schema, answer_schema in zip(
            columns, answers, schema, answer_values_schema
        ):
            # 检查是否是特殊输入类型
            if isinstance(answer_schema, dict) and "_type" in answer_schema:
                input_type = answer_schema["_type"]

                if input_type == "time":
                    # 处理时间输入
                    if ':' in answer:
                        hours, minutes = map(int, answer.split(':'))
                        # 转换为分钟数
                        value = hours * 60 + minutes
                        # 或者转换为半小时刻度
                        # value = hours * 2 + (1 if minutes >= 30 else 0)
                        question_values[column] = value
                    else:
                        raise ValueError(f"无效的时间格式: {answer}")

                elif input_type == "number":
                    # 处理数字输入，包括 type="number" 和 inputType="number"
                    try:
                        # 处理可能带有单位的数字，如 "4小时" 或 "4 小时"
                        number_str = ''.join(c for c in answer if c.isdigit() or c == '.')
                        value = float(number_str)
                        # 如果是整数，转换为int
                        if value.is_integer():
                            value = int(value)
                        question_values[column] = value
                    except ValueError:
                        raise ValueError(f"无效的数字格式: {answer}")

                elif input_type == "text":
                    # 处理普通文本输入
                    question_values[column] = answer

            else:
                # 处理选择题
                if answer in answer_schema:
                    question_values[column] = answer_schema[answer]
                else:
                    raise ValueError(
                        f"{column}: 找不到此项答案 {answer} 对应的文本 in {answer_schema}"
                    )

        return question_values

class RBDSQScale(BaseScale):
    """RBDSQ量表"""
    schema: Schema = Schema.RBDSQ

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_table_pdfplumber(filepath)

    @classmethod
    def extract_answers(cls, table_json: str) -> List[str]:
        """提取答案列表"""
        table = json.loads(table_json)[0]
        # 取第2列(答案列)，跳过表头，跳过第6行(是6.的小题)
        return [contents[1] for contents in table[1:6] + table[7:]]

    @classmethod
    def extract_values(cls, answers: List[str]) -> Dict[str, int]:
        """转换答案为数值"""
        return cls.extract_question_values_common(answers, cls.schema.value)

class StopBangScale(BaseScale):
    """StopBang量表"""
    schema: Schema = Schema.STOPBANG

    @classmethod
    def extract_content(cls, filepath: str) -> str:
        return extract_text_pdfplumber(filepath)

    @classmethod
    def extract_answers(cls, text: str) -> List[str]:

        """
        Stop Bang 评测表
        打鼾： 你是否大声打鼾（大过说话声音，或者隔着关闭的门也能听到）？
        否
        疲劳： 你是否白天感觉累，疲惫或者想睡觉？
        否
        呼吸暂停： 是否有人观察到你睡觉时有呼吸停止现象？
        否
        高血压： 你是否曾经或者目前是高血压患者？
        否
        BMI： 体重指数是否大于35？
        否
        年龄： 年龄是否超过50岁？
        是
        颈围： 颈围是否大于40厘米？
        否
        性别： 是否男性？
        是
        得分：2
        """

        # 输出格式: ['否', ... , '是']
        answers = []
        lines = text.split('\n')

        # 定义要查找的问题关键词
        questions = ['打鼾：', '疲劳：', '呼吸暂停：', '高血压：',
                    'BMI：', '年龄：', '颈围：', '性别：']

        for q in questions:
            for i, line in enumerate(lines):
                if q in line and i+1 < len(lines):
                    # 获取下一行作为答案
                    answer = lines[i+1].strip()
                    answers.append(answer)
                    break
        return answers

    @classmethod
    def extract_values(cls, answers: List[str]) -> Dict[str, int]:
        return cls.extract_question_values_common(answers, cls.schema.value)

class SleepDisorderScaleDataset():
    """睡眠障碍量表数据集"""

    # 基础列
    BASE_COLUMNS = [
        "patient_id",      # 病人ID
        "assessment_date", # 评估日期
        "diagnosis_label", # 疾病分类标签
    ]

    # 所有量表类
    SCALE_CLASSES: List[Type[BaseScale]] = [
        AISIScale,
        ESSScale,
        HAMAScale,
        HAMDScale,
        IRLSSGScale,
        PSQIScale,
        RBDSQScale,
        StopBangScale
    ]

    @staticmethod
    def _get_diagnosis_label(dir_name: str) -> str:
        """从目录名获取诊断标签"""
        return dir_name.split('-')[1]

    @staticmethod
    def _get_case_id(dir_name: str) -> str:
        """从目录名获取病例ID"""
        return dir_name.split('-')[0]

    def __init__(self, dataset_dir: str):
        """初始化数据集
        
        Args:
            dataset_dir: 数据集根目录 
            schema_dir: schema文件目录
        """

        self.logger = logging.getLogger(__class__.__name__)
        self.logger.setLevel(logging.DEBUG)  # logger 的级别要设为最低，这样两个 handler 才能分别工作

        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)

        file_handler = logging.FileHandler(f'logs/{__class__.__name__}.log')
        file_handler.setLevel(logging.DEBUG)

        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')

        console_handler.setFormatter(formatter)
        file_handler.setFormatter(formatter)

        self.logger.addHandler(console_handler)
        self.logger.addHandler(file_handler)

        # 生成完整的列名列表
        all_columns = self.BASE_COLUMNS.copy()
        for scale_cls in self.SCALE_CLASSES:
            all_columns.extend(scale_cls.schema.columns)

        self.df = self._process_scale_files(dataset_dir, all_columns)

    def _process_scale_files(self, dataset_dir: str, all_columns: list) -> pd.DataFrame:
        """处理所有量表文件
        
        Args:
            dataset_dir: 数据集根目录
            all_columns: 完整的列名列表
            
        Returns:
            pd.DataFrame: 处理后的数据框
        """

        logger = self.logger

        # 处理所有数据
        all_data = []
        case_dirs = [d for d in os.listdir(dataset_dir) if os.path.isdir(os.path.join(dataset_dir, d))]

        for case_dir in tqdm(case_dirs, desc="Processing cases"):
            case_path = os.path.join(dataset_dir, case_dir)

            # 获取基础信息
            case_data = {
                'patient_id': self._get_case_id(case_dir),
                'diagnosis_label': self._get_diagnosis_label(case_dir),
                'assessment_date': None # 暂不处理日期
            }

            # 处理每个量表文件
            for scale_cls in self.SCALE_CLASSES:
                pdf_filename = scale_cls.schema.scale_file
                filepath = os.path.join(case_path, pdf_filename)
                if not os.path.exists(filepath):
                    logger.debug(f"数据集不存在: {filepath}")
                    continue
                try:
                    df = scale_cls.extract(filepath)
                    case_data.update(df.iloc[0].to_dict())
                except Exception as e:
                    logger.error(f"文件处理失败: \n\t\t{filepath}: \n\t\t{str(e)}")

            all_data.append(case_data)

        logger.info(f"Processed {len(all_data)} cases in total")

        # 创建完整的DataFrame
        return pd.DataFrame(all_data, columns=all_columns)

    def __len__(self):
        return len(self.df)

    def __getitem__(self, idx):
        features = torch.FloatTensor(self.df.iloc[idx].values)
        label = self.df.iloc[idx]["diagnosis_label"]
        return features, label

    @property
    def data(self):
        return self.df

# %%
if __name__ == "__main__":
    df = pd.read_csv('dataset.csv')
    result_df = pd.DataFrame()
    result_df['diagnosis_label'] = df['diagnosis_label']
    for schema in Schema:
        if schema is not Schema.UNIMPLEMENTED:
            if schema == Schema.PSQI:
                # continue
                pass
            for column in schema.columns:
                if column == "psqi_bedtime" or column == "psqi_wake_time":
                    continue
                # hama, psqi, ...
                result_column = column.split('_')[0]
                if result_column not in result_df:
                    result_df[result_column] = df[column]
                else:
                    result_df[result_column] += df[column]
    result_df.to_csv("scale_result.csv", index_label=False, index=False)

# %%
SCALE_SOURCE_DIR = "/mnt/c/Users/bobby/DATA/文档/项目/知识图谱/睡眠障碍诊断知识图谱培训材料/睡眠数据库--修改版"
# SCALE_SOURCE_DIR = "dataset-origin/dataset_scale"
SCALE_TARGET_DIR = "dataset-origin/dataset_scale"
DEMO_DIR = f"{SCALE_TARGET_DIR}/1-轻度阻塞性睡眠后续暂停"

# dataset = SleepDisorderScaleDataset(SCALE_SOURCE_DIR)
# df = dataset.data
# print(df)
# df.to_csv("dataset.csv", index=False)
# df
# %%
# hamd_df = HAMDScale.extract(f"{DEMO_DIR}/{Schema.HAMD.scale_file}")

# %%
# scale_form_result = {}
# for scale_cls in SleepDisorderScaleDataset.SCALE_CLASSES:
#     if scale_cls.schema is Schema.PSQI:
#         # continue
#         pass
#     scale_values =  scale_cls.extract_values(
#             scale_cls.extract_answers(
#                 scale_cls.extract_content(
#                     os.path.join(DEMO_DIR, scale_cls.schema.scale_file)
#                 )
#             )
#         )
#     print(scale_values)
#     scale_form_result[scale_cls.schema.value] = [scale_values[column_name] for column_name in scale_cls.schema.columns]
# print(json.dumps(scale_form_result))
# %%
