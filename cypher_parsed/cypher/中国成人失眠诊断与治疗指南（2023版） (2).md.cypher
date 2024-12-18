// File: 中国成人失眠诊断与治疗指南（2023版） (2).md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 3

/* Response #1
   Timestamp: 2024-12-18 09:55:37
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '运动性腿综合症'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Disease {name: '脑血管病'});

MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.short_name = coalesce(n.short_name, 'COPD');

MERGE (n:Disease {name: '心血管疾病'});

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Disease {name: '焦虑症'});

MERGE (n:Disease {name: '抑郁症'});

MERGE (n:Disease {name: '精神分裂症'});

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '运动性腿综合症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '精神分裂症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:55:38
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠是最为常见的睡眠问题之一'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '人睡困难'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '睡眠维持障碍'})
SET 
    n.description = coalesce(n.description, '整夜觉醒次数大于等于2次'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比期望时间过早醒来'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '睡眠质量不满意'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '总睡眠时间减少'})
SET 
    n.description = coalesce(n.description, '通常少于6.5小时'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '整夜PSG主要用于失眠的鉴别诊断和疗效评估'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '申请相关检查');

MERGE (n:Examination {name: '量表测评'})
SET 
    n.description = coalesce(n.description, '辅助失眠诊断的量表评估'),
    n.method = coalesce(n.method, '主观评估'),
    n.requirement = coalesce(n.requirement, '进行自我评估');

MERGE (n:DrugTreatment {name: '苯二氮草受体激动剂'})
SET 
    n.description = coalesce(n.description, '具有镇静、催眠作用'),
    n.dosage = coalesce(n.dosage, '根据医嘱'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '肝肾功能损害患者禁用');

MERGE (n:DrugTreatment {name: '非苯二氮草类药物'})
SET 
    n.description = coalesce(n.description, '非选择性激动γ-氨基丁酸受体'),
    n.dosage = coalesce(n.dosage, '根据医嘱'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对药物反应不良者');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '较重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠维持障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '较重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '较重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '较重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '总睡眠时间减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '较重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '量表测评'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯二氮草受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '非苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');



// =====================================

/* Response #3
   Timestamp: 2024-12-18 09:55:39
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'F51.9'),
    n.description = coalesce(n.description, '失眠是一种常见的睡眠障碍，表现为入睡困难、维持睡眠困难或早醒等症状。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡需要较长的时间，常常辗转反侧。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '维持睡眠困难'})
SET 
    n.description = coalesce(n.description, '夜间经常醒来，并且很难再次入睡。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '在预期起床时间之前醒来，并且无法再次入睡。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '通过记录多种生理变量以评估睡眠质量和异常情况。'),
    n.method = coalesce(n.method, '临床监测'),
    n.requirement = coalesce(n.requirement, '患者需在医院过夜进行监测。');

MERGE (n:DrugTreatment {name: '异丙酚'})
SET 
    n.description = coalesce(n.description, '通过增强GABA和甘氨酸受体的功能来调节体内的睡眠平衡。'),
    n.dosage = coalesce(n.dosage, '2-10 mg/kg'),
    n.frequency = coalesce(n.frequency, '每晚'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.route = coalesce(n.route, '静脉输注'),
    n.contraindication = coalesce(n.contraindication, '严重心肺功能不全');

MERGE (n:DrugTreatment {name: '唑吡坦'})
SET 
    n.description = coalesce(n.description, '对失眠症患者提供快速和有效的治疗，有数据支持其长期应用。'),
    n.dosage = coalesce(n.dosage, '通常为10mg'),
    n.frequency = coalesce(n.frequency, '每晚'),
    n.duration = coalesce(n.duration, '不超过4周'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '与其他药物相互作用风险');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '可能由于失眠引起或加重的精神状况。'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '药物成瘾'})
SET 
    n.description = coalesce(n.description, '长期使用某些药物可能导致成瘾。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '心理健康问题'})
SET 
    n.description = coalesce(n.description, '焦虑、抑郁等问题可能会影响睡眠。'),
    n.impact_level = coalesce(n.impact_level, '中等');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '维持睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 't1'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '首选'),
    r.stage = coalesce(r.stage, '开始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '异丙酚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '次选'),
    r.stage = coalesce(r.stage, '开始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '唑吡坦'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '首选'),
    r.stage = coalesce(r.stage, '长期管理');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '药物成瘾'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '心理健康问题'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

