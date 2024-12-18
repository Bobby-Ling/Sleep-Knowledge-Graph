// File: 女性阻塞性睡眠呼吸暂停诊治专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:08:22
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '女性阻塞性睡眠呼吸暂停，简称OSA，常见于女性，特征包括夜间打鼾、睡眠中憋醒、白天过度嗜睡等'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '合并症'})
SET 
    n.description = coalesce(n.description, '阻塞性睡眠呼吸暂停可能引发多种合并症，如心血管疾病、高脂血症、糖尿病等'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，难以入睡或保持睡眠'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '在白天感到异常疲倦或者困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头疼'})
SET 
    n.description = coalesce(n.description, '早上起床时感到头部不适'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落，失去兴趣'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:NonDrugTreatment {name: '减重'})
SET 
    n.description = coalesce(n.description, '控制体重，通过饮食和运动改善健康'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '体位治疗'})
SET 
    n.description = coalesce(n.description, '通过改变睡眠姿势减轻症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '智能止鼾枕');

MERGE (n:NonDrugTreatment {name: '运动'})
SET 
    n.description = coalesce(n.description, '增加身体活动有助于改善OSA'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '口腔矫治器'})
SET 
    n.description = coalesce(n.description, '用于不耐受CPAP治疗的轻-中度OSA患者'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '定制口腔矫治器');

MERGE (n:NonDrugTreatment {name: 'NPPV'})
SET 
    n.description = coalesce(n.description, '无创正压通气，一线治疗选项'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '每晚'),
    n.contraindication = coalesce(n.contraindication, '低血压、气胸'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头疼'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '减重'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '体位治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '运动'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治器'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'NPPV'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '合并症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:23
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '阻塞性睡眠呼吸暂停是一种常见的睡眠障碍，表现为睡眠时反复呼吸暂停和低通气。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'HT'),
    n.description = coalesce(n.description, '高血压是一种常见的慢性疾病，其血压水平明显高于正常范围。'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '2型糖尿病'})
SET 
    n.code = coalesce(n.code, 'T2DM'),
    n.description = coalesce(n.description, '2型糖尿病是一种代谢性疾病，主要表现为胰岛素抵抗和高血糖。'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '妊娠期高血压'})
SET 
    n.code = coalesce(n.code, 'HDP'),
    n.description = coalesce(n.description, '妊娠期高血压是指妊娠期间血压升高的病症。'),
    n.category = coalesce(n.category, '妊娠期疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '妊娠期糖尿病'})
SET 
    n.code = coalesce(n.code, 'GDM'),
    n.description = coalesce(n.description, '妊娠期糖尿病是指妊娠期间首次发现或持续的糖尿病。'),
    n.category = coalesce(n.category, '妊娠期疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠是指入睡困难或睡眠不质量低。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间疲劳感'})
SET 
    n.description = coalesce(n.description, '患者在白天感到无力或精力不足。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到头痛。'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '感到紧张和不安。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '在睡眠中经历不愉快的梦。'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '夜间打鼾'})
SET 
    n.description = coalesce(n.description, '在睡眠中发出大声鼾声。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '被观察到的呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在他人眼中睡眠中呼吸暂停的现象。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '腿部在休息时感到不适，需活动以缓解。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间遗尿'})
SET 
    n.description = coalesce(n.description, '睡眠中意外排尿。'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶见');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间疲劳感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '被观察到的呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间遗尿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '中期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '中期');



// =====================================

