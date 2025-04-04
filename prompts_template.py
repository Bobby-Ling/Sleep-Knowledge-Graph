# %%
import tiktoken


CYPHER_CONSTRAINT_SCHEMA = """
// 创建唯一性约束
CREATE CONSTRAINT disease_name IF NOT EXISTS
FOR (d:Disease) REQUIRE d.name IS UNIQUE;

CREATE CONSTRAINT symptom_name IF NOT EXISTS
FOR (s:Symptom) REQUIRE s.name IS UNIQUE;

CREATE CONSTRAINT examination_name IF NOT EXISTS
FOR (e:Examination) REQUIRE e.name IS UNIQUE;

CREATE CONSTRAINT treatment_name IF NOT EXISTS
FOR (t:Treatment) REQUIRE t.name IS UNIQUE;

CREATE CONSTRAINT risk_factor_name IF NOT EXISTS
FOR (r:RiskFactor) REQUIRE r.name IS UNIQUE;

CREATE CONSTRAINT complication_name IF NOT EXISTS
FOR (c:Complication) REQUIRE c.name IS UNIQUE;

// 创建索引以提高查询性能
CREATE INDEX disease_index IF NOT EXISTS
FOR (d:Disease) ON (d.name);

CREATE INDEX symptom_index IF NOT EXISTS
FOR (s:Symptom) ON (s.name);

CREATE INDEX examination_index IF NOT EXISTS
FOR (e:Examination) ON (e.name);

CREATE INDEX treatment_index IF NOT EXISTS
FOR (t:Treatment) ON (t.name);

CREATE INDEX riskfactor_index IF NOT EXISTS
FOR (d:RiskFactor) ON (d.name);

CREATE INDEX complication_index IF NOT EXISTS
FOR (s:Complication) ON (s.name);

CREATE INDEX examination_index IF NOT EXISTS
FOR (e:Examination) ON (e.name);
"""

CYPHER_SCHEMA = """
// name都是主键

// 定义节点属性示例
// 疾病节点
CREATE (:Disease {
    name: String,           // 疾病名称
    code: String,           // 疾病编码
    description: String,    // 疾病描述
    category: String,       // 疾病分类
    severity: String        // 严重程度
});

// 症状节点
CREATE (:Symptom {
    name: String,           // 症状名称
    description: String,    // 症状描述
    severity: String,       // 严重程度
    frequency: String       // 发生频率
});

// 检查项目节点
CREATE (:Examination {
    name: String,           // 检查名称
    description: String,    // 检查描述
    method: String,         // 检查方法
    requirement: String     // 检查要求
});

// 治疗方案节点
// 药物治疗节点
CREATE (:DrugTreatment {
    name: String,           // 药物名称
    description: String,    // 药物描述
    dosage: String,        // 用药剂量
    frequency: String,     // 用药频率 
    duration: String,      // 疗程
    route: String,         // 给药途径
    contraindication: String, // 禁忌症
});

// 非药物治疗节点  
CREATE (:NonDrugTreatment {
    name: String,           // 治疗名称
    description: String,    // 治疗描述
    duration: String,       // 持续时间
    frequency: String,      // 治疗频率
    contraindication: String, // 禁忌症
    equipment: String,      // 所需设备
});

// 病史或者风险因素节点
CREATE (:RiskFactor {
    name: String,           // 因素名称
    type: String,           // 候选: [现病史, 既往史, 家族史, 其他风险]
    description: String,    // 描述
    impact_level: String    // 影响程度
});

// 并发症节点
CREATE (:Complication {
    name: String,           // 并发症名称
    description: String,    // 描述
    severity: String        // 严重程度
});

// 定义关系类型
// 症状-疾病关系
CREATE (:Symptom)-[:INDICATES {
    confidence: Float,      // 置信度
    frequency: String,      // 发生频率
    severity: String        // 严重程度
}]->(:Disease);

// 疾病-检查关系
CREATE (:Disease)-[:REQUIRES_EXAM {
    priority: String,       // 优先级
    mandatory: Boolean      // 是否必需
}]->(:Examination);

// 疾病-治疗关系
CREATE (:Disease)-[:TREATED_BY {
    effectiveness: Float,   // 有效性
    priority: String,       // 优先级
    stage: String          // 治疗阶段
}]->(:Treatment);

// 疾病-并发症关系
CREATE (:Disease)-[:MAY_CAUSE {
    probability: Float,     // 发生概率
    timeframe: String      // 时间框架
}]->(:Complication);

// 疾病-风险或病史因素关系
CREATE (:Disease)-[:INFLUENCED_BY {
    impact_level: String,   // 影响程度
    evidence_level: String  // 证据等级
}]->(:RiskFactor);
"""


INIT_MSG = """
[背景信息]
我现在正在进行睡眠医疗知识图谱的构建工作, 以便辅助基层医疗分诊; 计划使用大语言模型进行**实体识别、关系抽取和知识规则构建**, 使其输出可供neo4j直接导入;
已有数据集的统计信息如下(见[附加信息]部分, 表头包含分词/token等的统计信息), 请等待我接下来的命令.
[本条回答格式]
理解我的意思了就回答: "// 明白;"
[附加信息]
Size      Basic  Punct  Split  CN     EN     Tokens Cost($)File   
----------------------------------------------------------------------------------------------------
24.84 KB  4957   4969   4070   4406   460    9272   0.0139  《成年人阻塞性睡眠呼吸暂停低通气综合征筛查: 美国预防临床服务指南工作组推荐声明》解读.md
97.97 KB  16743  16767  15160  14306  2220   30832  0.0462  女性阻塞性睡眠呼吸暂停诊治专家共识.md
38.90 KB  8074   8090   6190   7588   307    15483  0.0232  绝经相关失眠临床管理中国专家共识.md
58.65 KB  8988   8999   6769   8572   352    17496  0.0262  中国帕金森病睡眠障碍管理专家共识.md
16.84 KB  3609   3618   2834   3454   88     6996   0.0105  多发性硬化合并睡眠障碍研究进展.md
18.45 KB  4077   4086   3426   3669   347    7685   0.0115  睡眠相关的节律性运动障碍的临床特点.md
41.83 KB  9037   9054   6992   8729   238    17696  0.0265  成人阻塞性睡眠呼吸暂停高危人群筛查与管理专家共识.md
29.95 KB  6220   6227   4618   5606   527    11739  0.0176  孤独症谱系障碍儿童睡眠障碍临床实践相关指南解读.md
1.38 MB   404331 405472 297675 391217 6850   789284 1.1839  睡眠医学_14370617.md
42.41 KB  4215   4230   4462   3898   201    7997   0.0120  儿童中枢性睡眠呼吸暂停56例临床分析.md
67.48 KB  13756  13795  11254  13033  500    26566  0.0398  中国发作性睡病诊断与治疗指南(2022版).md
73.90 KB  12284  12344  10360  11669  408    23746  0.0356  中国不宁腿综合征的诊断与治疗指南(2021版).md
52.36 KB  10494  10539  8623   9945   405    20295  0.0304  卒中相关睡眠障碍评估与管理中国专家共识.md
83.44 KB  18333  18425  17275  17107  910    35124  0.0527  中国儿童阻塞性睡眠呼吸暂停诊断与治疗指南(2020).md
16.93 KB  3799   3810   2960   3674   78     7426   0.0111  睡眠相关的节律性运动障碍.md
46.81 KB  9889   9923   8065   9416   308    19140  0.0287  认知功能损害患者睡眠障碍评估和管理的专家共识.md
59.06 KB  11054  11079  8452   10490  387    21367  0.0321  基层医疗机构失眠症诊断和治疗中国专家共识.md
28.68 KB  5351   5368   4659   4995   294    10284  0.0154  特发性过度睡眠: 一类不容忽视的睡眠障碍.md
50.08 KB  8420   8437   7725   7896   355    16147  0.0242  中国6岁以下儿童就寝问题和夜醒治疗指南(2023).md
25.40 KB  4739   4751   3954   3997   620    8614   0.0129  脑卒中伴睡眠期周期性肢体运动患者的睡眠结构研究.md
121.16 KB 17457  17492  13876  16768  517    34053  0.0511  中国成人失眠诊断与治疗指南(2023版) (2).md
25.39 KB  4471   4494   3549   4230   147    8607   0.0129  中国快速眼球运动睡眠期行为障碍诊断与治疗专家共识.md
21.97 KB  5469   5490   4680   4587   670    9844   0.0148  慢性偏头痛住院患者医疗质量评价与改进专家共识.md
76.61 KB  13729  13756  10811  13208  411    26827  0.0402  日间过度思睡临床诊断和治疗专家共识.md
----------------------------------------------------------------------------------------------------
Total: 2.47 MB, Tokens: 1182520
"""

INSTRUCT_MSG = f"""
[命令]
我现在给出本项目中我期望的neo4j知识图谱的实体和关系定义, 如[附加信息]部分所示, 接下来我将会批量给你上文markdown数据集中的文本, 
接下来的每次对话中, 请你在收到每段我提供的文本(在稍后的[dataset]部分)后, 依据下面[附加信息]部分提供的neo4j schema进行实体和关系抽取, 输出纯neo4j Cypher语句, 以便最后可以汇总直接导入neo4j数据库;
接下来的对话我的输入格式定义如[输入格式]部分所示, 实体或关系提取方式如[示例输出]中所示, 输出格式参见每次我输出内容的[本条回答格式]部分;
[输入格式]
"
    [本条回答格式]
    ...
    [关系抽取说明]
    ...
    [隶属文件名]
    ...
    [隶属文件分块号]
    ...
    [文本块]
    ...
    [本条回答格式]
    ...
"
[本条回答格式]
理解我的意思了就回答: "// 明白;"
[附加信息]
{CYPHER_SCHEMA}
"""

PREPROCESS_INIT_MSG = """
[背景信息]
我现在正在进行睡眠医疗知识图谱的构建工作, 计划使用大语言模型进行文本块**预处理**;
已有数据集的统计信息如下(见[附加信息]部分, 表头包含分词/token等的统计信息), 请等待我接下来的命令.
[本条回答格式]
理解我的意思了就回答: "明白"
[附加信息]
Size      Basic  Punct  Split  CN     EN     Tokens Cost($)File   
----------------------------------------------------------------------------------------------------
24.84 KB  4957   4969   4070   4406   460    9272   0.0139  《成年人阻塞性睡眠呼吸暂停低通气综合征筛查: 美国预防临床服务指南工作组推荐声明》解读.md
97.97 KB  16743  16767  15160  14306  2220   30832  0.0462  女性阻塞性睡眠呼吸暂停诊治专家共识.md
38.90 KB  8074   8090   6190   7588   307    15483  0.0232  绝经相关失眠临床管理中国专家共识.md
58.65 KB  8988   8999   6769   8572   352    17496  0.0262  中国帕金森病睡眠障碍管理专家共识.md
16.84 KB  3609   3618   2834   3454   88     6996   0.0105  多发性硬化合并睡眠障碍研究进展.md
18.45 KB  4077   4086   3426   3669   347    7685   0.0115  睡眠相关的节律性运动障碍的临床特点.md
41.83 KB  9037   9054   6992   8729   238    17696  0.0265  成人阻塞性睡眠呼吸暂停高危人群筛查与管理专家共识.md
29.95 KB  6220   6227   4618   5606   527    11739  0.0176  孤独症谱系障碍儿童睡眠障碍临床实践相关指南解读.md
1.38 MB   404331 405472 297675 391217 6850   789284 1.1839  睡眠医学_14370617.md
42.41 KB  4215   4230   4462   3898   201    7997   0.0120  儿童中枢性睡眠呼吸暂停56例临床分析.md
67.48 KB  13756  13795  11254  13033  500    26566  0.0398  中国发作性睡病诊断与治疗指南(2022版).md
73.90 KB  12284  12344  10360  11669  408    23746  0.0356  中国不宁腿综合征的诊断与治疗指南(2021版).md
52.36 KB  10494  10539  8623   9945   405    20295  0.0304  卒中相关睡眠障碍评估与管理中国专家共识.md
83.44 KB  18333  18425  17275  17107  910    35124  0.0527  中国儿童阻塞性睡眠呼吸暂停诊断与治疗指南(2020).md
16.93 KB  3799   3810   2960   3674   78     7426   0.0111  睡眠相关的节律性运动障碍.md
46.81 KB  9889   9923   8065   9416   308    19140  0.0287  认知功能损害患者睡眠障碍评估和管理的专家共识.md
59.06 KB  11054  11079  8452   10490  387    21367  0.0321  基层医疗机构失眠症诊断和治疗中国专家共识.md
28.68 KB  5351   5368   4659   4995   294    10284  0.0154  特发性过度睡眠: 一类不容忽视的睡眠障碍.md
50.08 KB  8420   8437   7725   7896   355    16147  0.0242  中国6岁以下儿童就寝问题和夜醒治疗指南(2023).md
25.40 KB  4739   4751   3954   3997   620    8614   0.0129  脑卒中伴睡眠期周期性肢体运动患者的睡眠结构研究.md
121.16 KB 17457  17492  13876  16768  517    34053  0.0511  中国成人失眠诊断与治疗指南(2023版) (2).md
25.39 KB  4471   4494   3549   4230   147    8607   0.0129  中国快速眼球运动睡眠期行为障碍诊断与治疗专家共识.md
21.97 KB  5469   5490   4680   4587   670    9844   0.0148  慢性偏头痛住院患者医疗质量评价与改进专家共识.md
76.61 KB  13729  13756  10811  13208  411    26827  0.0402  日间过度思睡临床诊断和治疗专家共识.md
----------------------------------------------------------------------------------------------------
Total: 2.47 MB, Tokens: 1182520
"""

PREPROCESS_MSG = """
[指令]
整理下面的[文本块], 以便我之后可以提取neo4j实体及关系, 仅输出整理后的文本, 不要输出任何其他指示内容
[文本块]
{0}
"""

COMMAND_TEMPLATE = """
[本条回答格式]
严格根据之前的Schema中的关系提取Cypher数据语句, 不要分号, 不需要其他任何内容;
如果当前块没有之前Schema中的关系或者无法提取, 则返回"// 空";
注意, 我将会直接将你生成的语句合并后导入neo4j, 因此请务必保证语法正确性.
[关系抽取说明]
抽取时请重点关注上文Schema中的这些实体节点: Disease Symptom NonDrugTreatment DrugTreatment Complication
以及这些关系INDICATES TREATED_BY REQUIRES_EXAM
[隶属文件名]
{0}
[隶属文件分块号]
{1}
[文本块]
{2}
"""

API_COMMAND_MSG = f"""
[背景信息]
我现在正在进行睡眠医疗知识图谱的构建工作, 想请你对文本进行实体识别、关系抽取和知识规则构建, 输出neo4j cypher语句.
[命令]
[CYPHER_SCHEMA]部分定义了本项目中我期望的neo4j知识图谱的实体和关系定义, 接下来我将会给你数据集([隶属文件名]和[隶属文件分块名]部分)中的[文本块];
请参考[示例输出]部分的Cypher语句依据[CYPHER_SCHEMA]部分提供的neo4j schema进行实体和关系抽取, 输出纯neo4j Cypher语句
[详细补充需求]
输出的Cypher语句不要分号, 不需要转义, 也不需要使用markdown语法等, 以便最后我可以通过字符串拼接直接导入neo4j数据库;
请保证你生成的语句可以多次执行而不出现重复定义问题;
请保证语法正确性;
请一定尽可能抽取Cypher语句, 当无法抽取符合主题的语句时输出"// 空"(不含引号)
[CYPHER_SCHEMA]
{CYPHER_SCHEMA}
[关系抽取说明]
抽取主题侧重与睡眠相关;
抽取时请重点关注[CYPHER_SCHEMA]中的这些实体节点: Symptom Disease Treatment Complication
以及这些关系INDICATES TREATED_BY INDICATES REQUIRES_EXAM;
文本可能很长很长, 请尽你可能抽取全部实体和关系; 
请务必保证逻辑合理性;
请尽量区分Symptom和Disease, 因为最终的查询依靠Symptom列表, 比如"抗癫痫药物相关嗜睡"和"昼夜节律失调性睡眠觉醒障碍"属于疾病(Disease)而非症状(Symptom);
请根据医学惯例适当规范化name的描述, 比如"人睡前幻觉"应该为"睡前幻觉"
[示例输出一]
MERGE (d1:Disease {{name: "快动眼睡眠行为障碍", description: "一种在快动眼睡眠期表现出的异常行为症状", severity: "中等"}})
MERGE (s1:Symptom {{name: "夜间手舞足蹈", description: "反复在夜间出现手舞足蹈的行为", severity: "严重", frequency: "频繁"}})
MERGE (s2:Symptom {{name: "做噩梦", description: "夜间出现噩梦的现象", severity: "中等", frequency: "几乎每天"}})
MERGE (s3:Symptom {{name: "梦话", description: "夜间说梦话的表现", severity: "轻微", frequency: "频繁"}})
MERGE (s1)-[:INDICATES {{confidence: 0.9, frequency: "频繁", severity: "严重"}}]->(d1)
MERGE (s2)-[:INDICATES {{confidence: 0.9, frequency: "几乎每天", severity: "中等"}}]->(d1)
MERGE (s3)-[:INDICATES {{confidence: 0.8, frequency: "频繁", severity: "轻微"}}]->(d1)
MERGE (e1:Examination {{name: "PSG检查", description: "多导睡眠图检查，用于诊断睡眠障碍", method: "多导睡眠监测", requirement: "在安静环境中进行"}})
MERGE (e2:Examination {{name: "MRI", description: "核磁共振成像，用于排查神经系统问题", method: "核磁共振扫描", requirement: "在扫描前保持放松"}})
MERGE (d1)-[:REQUIRES_EXAM {{priority: "高", mandatory: true}}]->(e1)
MERGE (d1)-[:REQUIRES_EXAM {{priority: "中", mandatory: false}}]->(e2)
MERGE (d1)-[:TREATED_BY {{effectiveness: 0.75, priority: "高", stage: "对症支持治疗"}}]->(:NonDrugTreatment {{name: "对症支持治疗", description: "通过改善多梦等症状来支持患者", duration: "短期", frequency: "根据需要", contraindication: "无", equipment: "无"}})
[示例输出二]
MERGE (d1:Disease {{name: "睡眠呼吸暂停低通气综合征"}})
MERGE (s1:Symptom {{name: "打鼾", description: "夜间睡眠时发出声响", severity: "中等", frequency: "常见"}})
MERGE (s2:Symptom {{name: "日间嗜睡", description: "白天感到过度困倦", severity: "严重", frequency: "常见"}})
MERGE (d1)-[:INDICATES {{confidence: 0.95, frequency: "常见", severity: "中等"}}]->(s1)
MERGE (d1)-[:INDICATES {{confidence: 0.9, frequency: "常见", severity: "严重"}}]->(s2)
MERGE (d1)-[:REQUIRES_EXAM {{priority: "高", mandatory: true}}]->(:Examination {{name: "PSG检查", description: "多导睡眠监测", method: "睡眠观察", requirement: "住院观察"}})
MERGE (d1)-[:TREATED_BY {{effectiveness: 0.8, priority: "高", stage: "初始治疗"}}]->(:NonDrugTreatment {{name: "无创呼吸机辅助通气", description: "通过呼吸机支持患者呼吸", duration: "持续", frequency: "根据需要", contraindication: "无", equipment: "呼吸机"}})
"""

API_PAYLOAD_TEMPLATE = """
[隶属文件名]
{0}
[隶属文件分块名]
{1}
[文本块]
{2}
"""

DEMO_MSG = COMMAND_TEMPLATE.format(
    "睡眠相关的节律性运动障碍的临床特点.md",
    "001",
    """# 一、流行病学及概述

SRMD是指重复、刻板和节律性的大组肌群(尤其是头和颈部)的运动,多发生在人睡时和睡眠中,少数发生在早晨将醒时,由撞头、摇头、身体前后摆动及身体旋转等复杂而固定模式的异常运动组成. 发作的频率为 $0.\;5\sim2.\;0$ 次/s,持续时间通常不超过 $15\,\mathrm{\min}$ . 亦有人称之为睡中撞头、夜间摇头. 绝大多数研究认为男女发病率没有差异,仅有个别报道在成年患者中存在男性优势. 关于SRMD的发病率,不同年龄段,其发病率差别较大,ICSD-3及其他研究显示 $59\%$ 的婴幼儿在9个月时会出现一些节律性运动,18个月时患病率降至 $33\%$ ,症状通常在4岁以后逐渐好转或消失,到5岁时患病率仅为 $5\%$ [26]. 成年 SRMD 患病有如下 3 种情况:婴幼儿时期发病且症状持续至成年;婴幼儿时期患有SRMD,随后自愈,成年后再次复发;青春期或成年后首次出现SRMD,后者又称为迟发型或晚发型SRMD[7].
    """,
)

DEMO_API_PAYLOAD = API_PAYLOAD_TEMPLATE.format(
    "《成年人阻塞性睡眠呼吸暂停低通气综合征筛查: 美国预防临床服务指南工作组推荐声明》解读.md",
    "《成年人阻塞性睡眠呼吸暂停低通气综合征筛查: 美国预防临床服务指南工作组推荐声明》解读/012-35-潜在的干预措施.md",
    """# 潜在的干预措施

USPSTF推荐不仅关注成年人OSAHS的筛查和识别, 还强调了潜在的干预措施, 以帮助患者管理和治疗这一疾病. USPSTF推荐的干预措施包含但不仅限于以下几种.

## 体质量管理和生活方式改变
1. **体质量管理**: 肥胖是OSAHS的主要危险因素之一. 对于肥胖或超重的患者, 重要的干预措施之一是体质量管理, 包括饮食控制和适度的体育锻炼, 旨在减轻体质量. 即使是适度的体质量减轻也可以显著改善OSAHS症状, 包括减轻打鼾和减少呼吸暂停的发生次数.

2. **生活方式改变**: 除了体质量管理, 生活方式改变也可以对OSAHS患者产生积极影响, 包括戒烟、限制酒精摄入、避免晚餐过量饮食、规律作息和改进睡眠环境等. 这些生活方式可能影响OSAHS的严重程度和发生频率. 医生可以为患者提供支持和指导, 以帮助他们在日常生活中实施这些建议.

## 正压通气(PAP)治疗
1. **PAP设备**: 对于确诊为OSAHS的患者, 特别是那些症状较为严重的患者, PAP设备是一种有效的治疗方法. 最常见的PAP设备是持续气道正压通气(CPAP). 这些设备通过面罩或鼻罩提供气道正压, 防止气道坍塌, 确保患者在夜间呼吸通畅. 这一治疗方法通常能够显著减少呼吸暂停的发生, 改善氧饱和度, 减轻日间嗜睡和提高生活质量.

2. **自动调节压力正压通气(APAP)设备**: 可以根据患者的呼吸情况进行调整, 以提供更个性化的治疗. APAP设备能够动态调整气道正压, 以适应不同睡眠阶段的需要, 提供更加舒适和有效的治疗.

这些干预措施的目标是减轻OSAHS症状、改善患者的生活质量, 并降低与OSAHS相关的全身性健康风险. 在确定患者的治疗方案时, 医生应综合考虑患者的临床情况、病情严重程度和个体差异, 以提供最佳的医疗服务. 通过这些干预措施的实施, 可以帮助患者更好地管理OSAHS, 降低疾病负担, 提高其未来的生活质量.

此外, USPSTF推荐提出未来需要聚焦于以下几方面的临床研究:
1. 针对无症状人群OSAHS筛查的设计研究, 探索OSAHS筛查对患者重要结局事件(例如死亡、心血管疾病事件、车祸事故、生活质量等)的影响;
2. 在社区人群中, 尤其是在未被识别OSAHS或症状轻微的人群中, 评估筛查工具的准确性;
3. 开发准确的风险评估工具, 识别最有可能从OSAHS筛查中受益的人群;
4. 针对OSAHS自然进程的研究, 尤其是关于从轻度OSAHS进展至重度OSAHS方面的研究, 以及OSAHS被早期识别及治疗的临床获益方面的研究.
"""
)

DEMO_API_COMMAND = API_COMMAND_MSG + DEMO_API_PAYLOAD

CHAT_SYSTEM_MSG = """
[角色任务]
你是一名医疗睡眠助手, 用于基层医疗分诊, 具备记忆能力(我会给你提供相关上下文);
我会在第一次消息中(本系统消息不会提供)给你提供一个基于neo4j知识图谱、量表、病历等信息的json格式[患者分析结果], 这个结果很重要,
在后续对话中请根据这个[患者分析结果], 并参考我在[知识库]中提供的文本和用户输入, 回答用户咨询, 帮助用户解决睡眠问题, 提供相关的建议和解决方案等;

[回答需求]
1. 专业性
你需要以专业的态度和能力为用户提供建议, 确保建议的有效性和可靠性.
你可以在第一次对话中获取获取[患者分析结果]的json.
2. 第一条会话之后应该以面对患者的口吻回答.
"""

CHAT_PAYLOAD_MSG = """
[知识库]
{0}
"""

CHAT_INIT_PAYLOAD = """
[工具能力]
你可以获取neo4j睡眠医疗知识图谱的[查询结果]如下:
{neo4j_result}
"""

SLEEP_ANALYZER_SYSTEM_MSG = """
[角色]
你是一名睡眠neo4j知识图谱分析助手
[知识]
1.睡眠知识库
包括症状/疾病/病史/药物非药物治疗等信息;
[我会提供给你的信息]
1.neo4j睡眠知识图谱查询结果
在对话中, 我将会给你json格式的neo4j睡眠知识图谱查询结果, 包含几组可能的[症状组-疾病-药物非药物治疗方法]
2.可能的既往病史等病历信息(可能没有)
3.可能的量表结果信息(疾病预测及可能性)
[指令]
之后的对话中, 请你根据我每次对话中"我会提供给你的信息"(neo4j睡眠知识图谱查询结果/病史/量表结果), 综合睡眠知识库的内容, 给出
1.患者症状分析
2.可能疾病分析
3.疾病对应的药物和非药物治疗方法分析
4.检查建议
5.诊疗计划
6.科室推荐
7.其他额外建议
[额外要求]
主要参照neo4j查询结果中的内容
[输出格式]
纯json格式, 不使用markdown, 不要使用注释, 因为我会直接使用json.loads()进行加载
[输出json示例]
{
  "patient_info": {
    "age": 62,
    "main_complaints": ["失眠", "头晕"],
    "history": {
      "insomnia_duration": "3年"
    }
  },
  "symptoms": [
    {
      "name": "入睡困难",
      "severity": "严重" // 缺失则为"轻微"
    }
  ],
  "possible_diseases": [
    {
      "name": "失眠",
      "description": "睡眠质量下降",
      "treatments": {
        "drugs": [
          {
            "name": "褪黑素",
            "dosage": "3mg"
          }
        ],
        "non_drug": ["光照疗法"]
      }
    }
  ],
  "recommended_examinations": [
    {
      "name": "多导睡眠监测",
      "purpose": "评估睡眠障碍"
    }
  ],
  "treatment_plan": [
    "进行检查明确诊断",
    "制定治疗方案"
  ],
  "recommended_departments": [
    {
      "name": "睡眠医学科",
      "purpose": "诊治睡眠障碍"
    }
  ],
  "additional_suggestions": [
    "改善睡眠环境"
  ]
}
"""

SLEEP_ANALYZER_PAYLOAD_TEMPLATE = """
[neo4j睡眠知识图谱查询结果]
{neo4j_result}
"""

MEDICAL_HISTORY_EXTRACTOR_SYSTEM_MSG = """
[指令]
仿照示例, 将下面的病历信息提取出患者基本信息、患者症状、既往史、现病史、家族史等信息的json
[要求]
纯json, 不要注释等信息, 以便可以直接json.loads()载入
[示例输出]
{
    "patient": {
        "name": "患者x",
        "gender": "女",
        "age": 62
    },
    "symptoms": {
        "current": [
            {
                "name": "脑鸣",
                "details": "脑内有电流声"
            },
            {
                "name": "恶心",
                "details": "无呕吐"
            },
            {
                "name": "心慌",
                "details": ""
            }
        ],
        "denied": [
            "视物成双",
            "头痛"
        ]
    },
    "medical_history": {
        "past": "无特殊",
        "personal": "无特殊",
        "family": "无相关信息"
    },
    "course": {
        "duration": "3年",
        "aggravation_period": "2个月",
        "sleep_condition": "夜间只能睡2、3个小时",
        "recent_changes": "近2、3个月头晕明显"
    }x
}
[病历信息]
"""

GEN_FOLLOWUP_SYSTEM_MSG = """
请你根据我提供的历史记录和用户的最近一次输入意图生成三条追问, 
比如, 用户可能问这样的问题:
我的详细症状是什么?
我可能的疾病是什么?
我应该采用哪些药物治疗和非药物治疗?
我应该进行哪些测试?
我应该去哪些科室检查?
我下一步应该怎么做?
...
示例输出如下:
(请严格遵循下面的格式, 包括json间的换行符)
{
    "content": "我应该采用哪些药物治疗和非药物治疗?"
}

{
    "content": "我应该进行哪些测试?"
}

{
    "content": "我应该去哪些科室检查?"
}
"""


# %%
if __name__ == "__main__":
    encoding = tiktoken.get_encoding("cl100k_base")
    print(len(encoding.encode(API_COMMAND_MSG)))
    print(DEMO_API_COMMAND)

# %%