// File: 中国成人失眠诊断与治疗指南（2023版） (2).md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 3

/* Response #1
   Timestamp: 2024-12-19 00:08:15
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难或睡眠质量差的状态'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '一种影响情绪、思维和行为的心理疾病'),
    n.category = coalesce(n.category, '心理疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:DrugTreatment {name: '异丙酚'})
SET 
    n.description = coalesce(n.description, '通过增强GABA功能抑制N-甲基-D-天冬氨酸受体，调节睡眠平衡'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '静脉输注'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:NonDrugTreatment {name: 'CBT-I'})
SET 
    n.description = coalesce(n.description, '认知行为疗法，改善失眠症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '肌肉放松'})
SET 
    n.description = coalesce(n.description, '增强放松，改善睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '异丙酚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'CBT-I'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '心理治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '肌肉放松'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '非药物治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:18
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '尽管有合适的睡眠机会和环境，仍对睡眠质量感到不满意'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '人睡潜伏期超过30分钟'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '整夜觉醒次数≥2次'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比期望时间过早醒来'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '总睡眠时间减少'})
SET 
    n.description = coalesce(n.description, '通常少于6.5小时'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '主观感受的睡眠质量降低'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:DrugTreatment {name: '苯二氮草受体激动剂'})
SET 
    n.description = coalesce(n.description, '药物用于治疗失眠的短期疗效'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度呼吸衰竭');

MERGE (n:DrugTreatment {name: '非苯二氮草类药物'})
SET 
    n.description = coalesce(n.description, '选择性激动GABA受体，安全有效'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度呼吸衰竭');

MERGE (n:NonDrugTreatment {name: '认知行为疗法'})
SET 
    n.description = coalesce(n.description, 'CBT-I'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '与失眠共病，影响日常功能'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '与失眠共病，影响日常功能'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '整夜PSG主要用于失眠的鉴别诊断和疗效评估'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '需进行设备监测');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '总睡眠时间减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯二氮草受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '非苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #3
   Timestamp: 2024-12-19 00:08:19
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.code = coalesce(n.code, 'RLS');

MERGE (n:Disease {name: '反复噩梦'});

MERGE (n:Disease {name: '脑血管病'});

MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.code = coalesce(n.code, 'COPD');

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Disease {name: '心血管疾病'});

MERGE (n:Disease {name: '焦虑症'});

MERGE (n:Disease {name: '抑郁症'});

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '反复噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

