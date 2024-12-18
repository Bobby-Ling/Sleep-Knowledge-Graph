# %%
import json
import os
import re
from typing import Any, Dict, List, Tuple

import pandas as pd
import pdfplumber
import pymupdf
import torch
from torch.utils.data import Dataset

SCHEMA_DIR = "scale_schemas"

def extract_text_pdfplumber(pdf_path):
    text = ""
    with pdfplumber.open(pdf_path) as pdf:
        for page in pdf.pages:
            text += page.extract_text() + "\n"
    return text

def extract_table_pdfplumber(pdf_path, page_number=0):
    """
    使用 pdfplumber 提取表格
    """
    tables = []
    with pdfplumber.open(pdf_path) as pdf:
        page = pdf.pages[page_number]
        tables = page.extract_tables()
    return tables

def extract_text_pymupdf(pdf_path):
    doc = pymupdf.open(pdf_path)
    text = ""

    for page in doc:
        text += page.get_text() + "\n"

    doc.close()
    return text


class SleepDisorderScaleDataset:
    def __init__(self, schema_dir="scale_schemas"):
        self.schema_dir = schema_dir
        self.base_columns = [
            "patient_id",  # 病人ID
            "assessment_date",  # 评估日期
            "assessment_count",  # 评估次数
            "diagnosis_label",  # 疾病分类标签
        ]

        self.ais_columns = []
        self.ess_columns = []
        self.hama_columns = []
        self.hamd_columns = []
        self.irlssg_columns = []
        self.psqi_columns = []
        self.rbdsq_columns = []
        self.stopbang_columns = []

        # 初始化各量表的列名列表
        self.scale_schema_metas = {
            "AISI": self.ais_columns,
            "ESS": self.ess_columns,
            "HAMA": self.hama_columns,
            "HAMD": self.hamd_columns,
            "IRLSSG": self.irlssg_columns,
            "PSQI": self.psqi_columns,
            "RBDSQ": self.rbdsq_columns,
            "StopBang": self.stopbang_columns,
        }

        # 加载schema
        self._load_schemas()

        # 生成完整的列名列表
        self.all_columns = sum(self.scale_schema_metas.values(), self.base_columns)

        # 初始化空的DataFrame
        self.df = pd.DataFrame(columns=self.all_columns)

        # 初始化提取函数字典
        self.extract_funcs = {
            "AISI": self.extract_answer_list_AISI,
            "ESS": self.extract_ESS,
            "HAMA": self.extract_HAMA,
            "HAMD": self.extract_HAMD,
            "IRLSSG": self.extract_IRLSSG,
            "PSQI": self.extract_PSQI,
            "RBDSQ": self.extract_RBDSQ,
            "StopBang": self.extract_StopBang,
        }

    def _extract_schema(self, json_data):
        """从JSON中提取schema"""
        columns = []
        for page in json_data["pages"]:
            for element in page["elements"]:
                if "name" in element:
                    columns.append(element["name"])
        return columns

    def _load_schemas(self):
        """加载所有量表的schema"""
        for scale_name in self.scale_schema_metas.keys():
            with open(f"{self.schema_dir}/{scale_name}.json", "r") as file:
                self.scale_schema_metas[scale_name].extend(
                    self._extract_schema(json.loads(file.read()))
                )

    def get_schema(self, schema_name: str) -> Tuple[List, List]:
        """
        获取json Schema和问卷答案str->int的映射列表

        Args:
            schema (str): schema name

        Returns:
            Tuple[List, List]:
                schema: 原始schema列表
                answer_value_schema: 答案映射列表，包含：
                    - 选择题: 答案映射字典
                    - 时间输入: {"_type": "time"}
                    - 数字输入: {"_type": "number"}
                    - 文本输入: {"_type": "text"}
        """
        with open(f"{self.schema_dir}/{schema_name}.json", "r", encoding="utf-8") as f:
            schema_data = json.load(f)

        schema = schema_data["pages"][0]["elements"]
        answer_value_schema = []

        for question in schema:
            if question["type"] == "text":
                # 处理文本输入类型的问题
                if question.get("inputType") == "time":
                    answer_value_schema.append({"_type": "time"})
                elif question.get("inputType") == "number":
                    answer_value_schema.append({"_type": "number"})
                else:
                    answer_value_schema.append({"_type": "text"})
            elif question["type"] == "number":
                # 处理数字类型的问题
                answer_value_schema.append({"_type": "number"})
            else:
                # 处理选择题
                choices = {
                    choice["text"]: choice["value"]
                    for choice in question.get("choices", [])
                }
                answer_value_schema.append(choices)

        return schema, answer_value_schema

    def extract_question_values_common(
        self, scale_result: List[str], schema_name: str
    ) -> List[int]:
        """将答案列表转换为List[int]

        Args:
            scale_result: 答案文本列表
            schema_name: "AISI", ...
        Returns:
            List[int]: 包含量表Value数据的List[int]
        """

        schema, answer_values_schema = self.get_schema(schema_name)

        # 确保答案数量与schema中的问题数量匹配
        if len(scale_result) != len(answer_values_schema):
            raise ValueError(
                f"答案数量({len(scale_result)})与题目数量({len(answer_values_schema)})不匹配"
            )

        # 初始化结果字典
        results = {}

        for answer, question, answer_value in zip(
            scale_result, schema, answer_values_schema
        ):
            # 将答案文本转换为数值
            if answer in answer_value:
                results[question["name"]] = answer_value[answer]
            else:
                raise ValueError(
                    f"{question['name']}: 找不到此项答案 {answer} 对应的文本 in {answer_value}"
                )

        return results

    def extract_answer_list_AISI(self, scale_text: str) -> List[str]:
        """从AISI量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[str]: 答案文本列表
        """

        # 示例文本
        """
        阿森斯失眠量表（AISI）
        填表人：_________
        填表时间_________
        第_____次评定
        1.入睡时间（关灯后到睡着的时间）
        轻微延迟
        2.夜间苏醒
        轻微延迟
        3.比期望的时间早醒
        轻微延迟
        4.总睡眠时间
        轻微延迟
        5.总睡眠质量（无论睡多长）
        轻微延迟
        6.白天情绪
        轻微延迟
        7.白天身体功能（体力或精神：如记忆
        力、认知力和注意力等）
        轻微延迟
        8.白天思睡
        没问题 
        得分：7
        """

        scale_text = scale_text.replace(
            """7.白天身体功能（体力或精神：如记忆
力、认知力和注意力等）""",
            "7.白天身体功能（体力或精神：如记忆力、认知力和注意力等）",
        )
        answers = []

        for line in scale_text.split("\n"):
            match = re.match(r"^\d+\.", line)
            if match:
                # 找到题目后,取下一行作为答案
                next_line = scale_text.split("\n")[
                    scale_text.split("\n").index(line) + 1
                ].strip()
                answers.append(next_line)

        return answers

    def extract_question_values_AISI(self, answer_list: List[str]) -> List[int]:

        text_value_map = {
            "没问题": 0,
            "轻微延迟": 1,
            "显著延迟": 2,
            "严重延迟或没有睡觉": 3,
            "延迟严重或没有睡觉": 3,
        }
        columns = self.ais_columns

        # 一般情形, 但是这里的问卷结果比较呃呃
        # question_values = self.extract_question_values_common(answer_text, "AISI")

        answer_values = [text_value_map[answer] for answer in answer_list]
        question_values = {
            column: value for column, value in zip(columns, answer_values)
        }
        return question_values

    def extract_AISI(self, filepath: str) -> pd.DataFrame:
        """提取AISI量表数据"""

        scale_text = extract_text_pymupdf(filepath)
        answer_list = self.extract_answer_list_AISI(scale_text)
        question_values = self.extract_question_values_AISI(answer_list)
        return pd.DataFrame([question_values])

    def extract_answer_list_ESS(self, scale_text: str) -> List[str]:
        """从ESS量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[str]: 答案文本列表
        """

        """
        [
            [
                [
                    "情况 打瞌睡的可能",
                    null
                ],
                [
                    "坐着阅读书刊",
                    "从不打瞌睡"
                ],
                [
                    "看电视",
                    "从不打瞌睡"
                ],
                [
                    "在公共场所坐着不动（例如在剧场或开\n会）",
                    "从不打瞌睡"
                ],
                [
                    "作为乘客在汽车中坐1小时，中间不休息",
                    "从不打瞌睡"
                ],
                [
                    "在环境许可时，下午躺下休息",
                    "从不打瞌睡"
                ],
                [
                    "坐下与人谈话",
                    "从不打瞌睡"
                ],
                [
                    "午餐不喝酒，餐后安静地坐着",
                    "从不打瞌睡"
                ],
                [
                    "遇堵车时停车数分钟",
                    "从不打瞌睡"
                ]
            ]
        ]

        """
        table = json.loads(scale_text)[0]
        answers = [contents[1] for contents in table[1:]]
        return answers

    def extract_question_values_ESS(self, answer_list: List[str]) -> List[int]:

        # 一般情形
        question_values = self.extract_question_values_common(answer_list, "ESS")
        return question_values

    def extract_ESS(self, filepath: str) -> pd.DataFrame:
        """提取ESS量表数据"""

        scale_text = json.dumps(extract_table_pdfplumber(filepath))
        answer_list = self.extract_answer_list_ESS(scale_text)
        question_values = self.extract_question_values_ESS(answer_list)
        return pd.DataFrame([question_values])

    def extract_answer_list_HAMA(self, scale_text: str) -> List[int]:
        """从HAMA量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[int]: 答案文本列表
        """

        """
        [
            [
                [
                    "1．焦虑心境",
                    "2",
                    "2．紧张",
                    "2"
                ],
                [
                    "3．害怕",
                    "2",
                    "4．失眠",
                    "2"
                ],
                [
                    "5．认知功能",
                    "0",
                    "6．抑郁心境",
                    "1"
                ],
                [
                    "7．躯体性焦虑",
                    "1",
                    "8．精神性焦虑",
                    "2"
                ],
                [
                    "9．心血管系统症状",
                    "0",
                    "10．呼吸系统症状",
                    "0"
                ],
                [
                    "11．胃肠道症状",
                    "0",
                    "12．生殖泌尿神经系统症状",
                    "0"
                ],
                [
                    "13．植物神经系统症状",
                    "0",
                    "14．会谈时行为表现",
                    "1"
                ]
            ]
        ]
        """
        table = json.loads(scale_text)[0]
        answers = []
        for row in table:
            # 每行包含两组问题和分数，分别提取
            answers.append(int(row[1]))  # 第一个分数
            if len(row) > 3:  # 确保存在第二组
                answers.append(int(row[3]))  # 第二个分数
        return answers

    def extract_question_values_HAMA(self, answer_list: List[int]) -> List[int]:
        columns = self.hama_columns
        question_values = {column: value for column, value in zip(columns, answer_list)}
        return question_values

    def extract_HAMA(self, filepath: str) -> pd.DataFrame:
        """提取HAMA量表数据"""

        scale_text = json.dumps(extract_table_pdfplumber(filepath))
        answer_list = self.extract_answer_list_HAMA(scale_text)
        question_values = self.extract_question_values_HAMA(answer_list)
        return pd.DataFrame([question_values])

    def extract_answer_list_HAMD(self, scale_text: str) -> List[int]:
        """从HAMD量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[int]: 答案文本列表
        """

        """
        [
            [
                [
                    "1．抑郁情绪",
                    "1",
                    "2．有罪感",
                    "1"
                ],
                [
                    "3．自杀",
                    "0",
                    "4．入睡困难",
                    "1"
                ],
                [
                    "5．睡眠不深",
                    "1",
                    "6．早醒",
                    "1"
                ],
                [
                    "7．工作和兴趣",
                    "2",
                    "8．阻滞",
                    "3"
                ],
                [
                    "9．激越",
                    "1",
                    "10．精神性焦虑",
                    "2"
                ],
                [
                    "11．躯体性焦虑",
                    "1",
                    "12．胃肠道症状",
                    "0"
                ],
                [
                    "13．全身症状",
                    "0",
                    "14．性症状",
                    "0"
                ],
                [
                    "15．疑病",
                    "2",
                    "16．体重减轻",
                    "0"
                ],
                [
                    "17．自知力",
                    "0",
                    "日夜变化",
                    ""
                ],
                [
                    null,
                    null,
                    "A．早",
                    "0"
                ],
                [
                    null,
                    null,
                    "B．晚",
                    "0"
                ],
                [
                    "19．人格或现实解体",
                    "0",
                    "20．偏执症状",
                    "1"
                ],
                [
                    "21．强迫症状",
                    "1",
                    "22．能力减退感",
                    "2"
                ]
            ]
        ]

        """
        table = json.loads(scale_text)[0]
        answers = []
        # 处理前17题
        for row in table[:9]:
            if row[1] is not None:  # 提取每行第一个答案
                answers.append(int(row[1]))
            if row[3] is not None:  # 提取每行第二个答案
                try:
                    answers.append(int(row[3]))
                except:
                    pass

        # 处理第18题 (日夜变化)
        answers.append(int(table[9][3]))  # A.早
        answers.append(int(table[10][3]))  # B.晚

        # 处理19-22题
        for row in table[11:]:
            if row[1] is not None:  # 提取每行第一个答案
                answers.append(int(row[1]))
            if row[3] is not None:  # 提取每行第二个答案
                answers.append(int(row[3]))
        return answers

    def extract_question_values_HAMD(self, answer_list: List[int]) -> List[int]:
        columns = self.hamd_columns
        question_values = {column: value for column, value in zip(columns, answer_list)}
        return question_values

    def extract_HAMD(self, filepath: str) -> pd.DataFrame:
        """提取HAMD量表数据"""

        scale_text = json.dumps(extract_table_pdfplumber(filepath))
        answer_list = self.extract_answer_list_HAMD(scale_text)
        question_values = self.extract_question_values_HAMD(answer_list)
        return pd.DataFrame([question_values])

    def extract_answer_list_IRLSSG(self, scale_text: str) -> List[int]:
        """从IRLSSG量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[int]: 答案文本列表
        """

        """
        国际不宁腿综合征研究组评分标准(IRLSSG）
        请根据最近 1 个星期您的平均状况，回答以下 10 个问题：
        1.总体上讲，您腿部（或者：臂部）的不适症状达到何种程度？
        E、没有不适
        2.总体上讲，您因为腿部不适而需要起来活动的欲望达到何种程
        度？
        E、没有不适
        3.总体上讲，通过活动，您腿部（或：臂部）的不适症状得到多大
        程度的缓解？
        E、没有RLS症状，此问题不适合我
        4.总体上讲，因为 RLS 症状，您的睡眠受到多大的影响？
        E、没有影响
        5.因为 RLS 的症状，您的疲惫和困倦感 达到何种程度？
        E、完全没有
        6.总体上讲，您 RLS 症状对生活的影响有多严重？
        E、完全没有
        7.您多久出现一次 RLS 症状？
        E、无症状出现
        8.如果出现 RLS 症状，一天内的平均持续时间有多久？
        E、无症状出现
        9.总体上讲，您的 RLS 症状对您处理日常生活事务的能力有多大影
        响？包括：家庭、学校和社会事务等。
        E、没有影响
        10.您的 RLS 症状对您情绪的影响有多严重？如出现气恼、忧郁、悲
        伤、焦虑和激惹等？
        E、没有影响
        得分：0
        """
        answers = []
        # 将文本按行分割
        lines = scale_text.split("\n")

        # 遍历每一行
        for line in lines:
            # 如果行以A、B、C、D、E开头且是答案行
            if line.startswith(("A", "B", "C", "D", "E")):
                # 将A-E转换为4-0的分数
                score = {"A": 4, "B": 3, "C": 2, "D": 1, "E": 0}.get(line[0])
                answers.append(score)
        return answers

    def extract_question_values_IRLSSG(self, answer_list: List[int]) -> List[int]:
        columns = self.irlssg_columns
        question_values = {column: value for column, value in zip(columns, answer_list)}
        return question_values

    def extract_IRLSSG(self, filepath: str) -> pd.DataFrame:
        """提取IRLSSG量表数据"""

        scale_text = extract_text_pdfplumber(filepath)
        answer_list = self.extract_answer_list_IRLSSG(scale_text)
        question_values = self.extract_question_values_IRLSSG(answer_list)
        return pd.DataFrame([question_values])

    def extract_answer_list_PSQI(self, scale_text: str) -> List[str]:
        """从PSQI量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[str]: 答案文本列表
        """

        """
        匹茨堡睡眠质量指数量表
        （Pittsburgh Sleep Quality Index,PSQI）
        填表提示：以下的问题仅与您过去一个月的睡眠习惯有关。你应该对过去一个月中
        多数白天和晚上的睡眠情况作精确的回答，要回答所有的问题。
        1. 过去一个月你通常上床睡觉的时间是？上床睡觉的时间是：22:30
        2. 过去一个月你每晚通常要多长时间（分钟）才能入睡？多少分钟：≥60(min)
        3. 过去一个月每天早上通常什么时候起床？起床时间：06:30
        4. 过去一个月你每晚实际睡眠的时间有多少？每晚实际睡眠的时间：4
        ◆从以下每一个问题中选一个最符合你的情况作答，打“√”
        5. 过去一个月你是否因为以下问题而经常睡眠不好：
        （a）不能在30分钟内入睡：
        每周平均三个或更多晚上
        （b）在晚上睡眠中醒来或早醒：
        每周平均三个或更多晚上
        （c）晚上有无起床上洗手间：
        每周平均三个或更多晚上
        （d）不舒服的呼吸：
        过去一个月没有
        （e）大声咳嗽或打鼾声：
        过去一个月没有
        （f）感到寒冷：
        过去一个月没有
        （g）感到太热：
        过去一个月没有
        （h）做不好的梦：
        每周平均一或两个晚上
        （i）出现疼痛：
        过去一个月没有
        （j）其他原因，请描述：
        过去一个月没有
        6. 你对过去一个月总睡眠质量评分：
        不好
        7. 过去一个月，你是否经常要服药（包括从以医生处方或者在外面药店购买）才能入
        睡？
        每周平均三个或更多晚上
        8. 过去一个月你在开车、吃饭或参加社会活动时难以保持清醒状态？
        每周平均不足一个晚上
        9. 过去一个月，你在积极完成时事情上是否有困难？
        有一点困难
        得分：16
        """
        scale_text = scale_text.replace(
            """过去一个月，你是否经常要服药（包括从以医生处方或者在外面药店购买）才能入
睡？""",
            "过去一个月，你是否经常要服药（包括从以医生处方或者在外面药店购买）才能入睡？",
        )

        # 示例输出
        # ['22:30', '≥60(min)', '06:30', '4', '每周平均三个或更多晚上', ... , '有一点困难']
        answers = []
        lines = scale_text.split("\n")

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

    def extract_question_values_PSQI(self, answer_list: List[str]) -> List[int]:
        columns = self.psqi_columns
        question_values = {}

        schema, answer_values_schema = self.get_schema("PSQI")

        for column, answer, question_schema, answer_schema in zip(
            columns, answer_list, schema, answer_values_schema
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

    def extract_PSQI(self, filepath: str) -> pd.DataFrame:
        """提取PSQI量表数据"""

        scale_text = extract_text_pdfplumber(filepath)
        answer_list = self.extract_answer_list_PSQI(scale_text)
        question_values = self.extract_question_values_PSQI(answer_list)
        return pd.DataFrame([question_values])

    def extract_answer_list_RBDSQ(self, scale_text: str) -> List[int]:
        """从RBDSQ量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[int]: 答案文本列表
        """

        """
        [
            [
                [
                    "问题",
                    "是/否"
                ],
                [
                    "1、我有时做很生动的梦",
                    "否"
                ],
                [
                    "2、我梦里常出现带攻击或暴力行为",
                    "否"
                ],
                [
                    "3、我睡着后所做的动作大部分与我梦境一致",
                    "否"
                ],
                [
                    "4、我知道睡着时我的手或脚会动",
                    "否"
                ],
                [
                    "5、我睡觉时曾发生或几乎要发生自己受伤或伤及床伴的事",
                    "否"
                ],
                [
                    "6、我睡觉时发生过或现在存在下列情况：",
                    "0"
                ],
                [
                    "6.1 说梦话、大喊大叫、咒骂、大笑",
                    "否"
                ],
                [
                    "6.2 突发肢体大动作，如“打斗”",
                    "否"
                ],
                [
                    "6.3睡觉时没必要的手势、复杂动作，如挥手、敬礼、\n拍蚊子、手伸出床外",
                    "否"
                ],
                [
                    "6.4东西掉下床，如床头灯、书本、眼镜等",
                    "否"
                ],
                [
                    "7、我曾被睡觉后做出的动作惊醒",
                    "否"
                ],
                [
                    "8、醒后梦的大部分内容我记得很清楚",
                    "否"
                ],
                [
                    "9、我的睡眠常受上述情况影响",
                    "否"
                ],
                [
                    "10、我曾患或正患神经系统疾病（如脑卒中、脑外外伤后帕\n金森综合征、不安腿综合征、发作性睡病、抑郁、癫痫、脑\n炎等）",
                    "否"
                ]
            ]
        ]
        """
        table = json.loads(scale_text)[0]
        answers = [contents[1] for contents in table[1:6] + table[7:]]
        return answers

    def extract_question_values_RBDSQ(self, answer_list: List[int]) -> List[int]:
        question_values = self.extract_question_values_common(answer_list, "RBDSQ")
        return question_values

    def extract_RBDSQ(self, filepath: str) -> pd.DataFrame:
        """提取RBDSQ量表数据"""

        scale_text = json.dumps(extract_table_pdfplumber(filepath))
        answer_list = self.extract_answer_list_RBDSQ(scale_text)
        question_values = self.extract_question_values_RBDSQ(answer_list)
        return pd.DataFrame([question_values])

    def extract_answer_list_StopBang(self, scale_text: str) -> List[str]:
        """从StopBang量表文本中提取答案列表

        Args:
            scale_text: 提取出来的量表文本

        Returns:
            List[str]: 答案文本列表
        """

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
        lines = scale_text.split('\n')

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

    def extract_question_values_StopBang(self, answer_list: List[str]) -> List[int]:
        question_values = self.extract_question_values_common(answer_list, "StopBang")
        return question_values

    def extract_StopBang(self, filepath: str) -> pd.DataFrame:
        """提取StopBang量表数据"""

        scale_text = extract_text_pdfplumber(filepath)
        answer_list = self.extract_answer_list_StopBang(scale_text)
        question_values = self.extract_question_values_StopBang(answer_list)
        return pd.DataFrame([question_values])

    def process_scale_files(self, file_dir: str) -> pd.DataFrame:
        """
        处理所有量表文件并合并结果

        Args:
            file_dir: 一批量表文件路径, 如"1-轻度阻塞性睡眠后续暂停"

        Returns:
            合并后的DataFrame
        """

        # TODO

        return self.df

    def __len__(self):
        return len(self.df)

    def __getitem__(self, idx):
        features = torch.FloatTensor(self.data.iloc[idx].values)

        # 获取诊断标签
        label = self.data.iloc[idx]["diagnosis_label"]

        return features, label

    @property
    def data(self):
        """返回完整的DataFrame"""
        return self.df


# %%
if __name__ == "__main__":
    pass

# %%
SCALE_SOURCE_DIR = "/mnt/c/Users/bobby/DATA/文档/项目/知识图谱/睡眠障碍诊断知识图谱培训材料/睡眠数据库--修改版"
SCALE_TARGET_DIR = "dataset-origin/dataset_scale"
DEMO_DIR = f"{SCALE_TARGET_DIR}/1-轻度阻塞性睡眠后续暂停"

DEMO_SCHEMA = "Stop-Bang"
DEMO_FILE = f"{DEMO_DIR}/{[filename for filename in os.listdir(DEMO_DIR) if DEMO_SCHEMA in filename][0]}"

text = extract_text_pdfplumber(DEMO_FILE)
print(text)
# table = extract_table_pdfplumber(DEMO_FILE)
# print(json.dumps(table, indent=4, ensure_ascii=False))

dataset = SleepDisorderScaleDataset()
df = dataset.extract_StopBang(DEMO_FILE)
print(df)
# %%
import camelot
import pandas as pd
import pdfplumber
import pymupdf
import tabula


def extract_table_pdfplumber(pdf_path, page_number=0):
    """
    使用 pdfplumber 提取表格
    优点: 处理简单表格效果好,可以处理有线表格
    缺点: 处理复杂表格可能会有问题
    """
    tables = []
    with pdfplumber.open(pdf_path) as pdf:
        page = pdf.pages[page_number]
        tables = page.extract_tables()
    return tables


def extract_table_tabula(pdf_path, page_number=1):
    """
    使用 tabula-py 提取表格
    优点: 处理复杂表格效果好
    缺点: 依赖Java环境
    """
    tables = tabula.read_pdf(pdf_path, pages=page_number, multiple_tables=True)
    return tables


def extract_table_camelot(pdf_path, page_number="1"):
    """
    使用 camelot 提取表格
    优点: 精确度高,支持流式和格子两种提取模式
    缺点: 配置复杂,依赖Ghostscript
    """
    tables = camelot.read_pdf(
        pdf_path,
        pages=page_number,
        flavor="lattice",  # 格子模式,也可选择 'stream' 流式模式
    )
    return tables


def compare_extractions(pdf_path, page_number=0):
    """比较不同库的提取结果"""
    results = {}

    # pdfplumber
    try:
        results["pdfplumber"] = extract_table_pdfplumber(pdf_path, page_number)
    except Exception as e:
        results["pdfplumber"] = f"Error: {str(e)}"

    # tabula
    try:
        results["tabula"] = extract_table_tabula(pdf_path, page_number + 1)
    except Exception as e:
        results["tabula"] = f"Error: {str(e)}"

    # camelot
    try:
        results["camelot"] = extract_table_camelot(pdf_path, str(page_number + 1))
    except Exception as e:
        results["camelot"] = f"Error: {str(e)}"

    return results


# 使用示例
# if __name__ == "__main__":
#     pdf_path = DEMO_FILE
#     results = compare_extractions(pdf_path)

#     # 打印各库提取结果
#     for lib_name, tables in results.items():
#         print(f"\n{lib_name} results:")
#         # print(json.dumps(tables, indent=4, ensure_ascii=False))
#         print(tables)
# %%
