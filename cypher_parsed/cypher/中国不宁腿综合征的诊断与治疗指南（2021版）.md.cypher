// File: 中国不宁腿综合征的诊断与治疗指南（2021版）.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:08:15
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '感觉运动障碍性疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量下降，难以入睡或维持睡眠的状态'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落伴随其他功能受损的精神疾病'),
    n.category = coalesce(n.category, '精神疾病');

MERGE (n:Disease {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '过度担忧与焦躁不安的情绪障碍'),
    n.category = coalesce(n.category, '精神疾病');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '影响运动协调的神经系统疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:19
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种以腿部不适和强烈的运动冲动为特征的神经系统疾病');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '患者在静止时感到不适，伴随强烈的运动冲动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '适当体育锻炼'})
SET 
    n.description = coalesce(n.description, '通过渐进式有氧运动改善腿部不适症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每周'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '物理疗法'})
SET 
    n.description = coalesce(n.description, '通过气动压缩装置和激光光疗法提高睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '气动压缩装置');

MERGE (n:NonDrugTreatment {name: '针灸疗法'})
SET 
    n.description = coalesce(n.description, '通过针灸改善RLS症状及睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '针灸针');

MERGE (n:NonDrugTreatment {name: '健康教育'})
SET 
    n.description = coalesce(n.description, '提高对RLS的认知和管理能力'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '多巴胺受体激动剂'})
SET 
    n.description = coalesce(n.description, '用于缓解RLS症状的药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，表现为入睡困难或维持睡眠困难');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '一种临床表现为睡眠期间反复呼吸暂停的疾病');

MERGE (n:DrugTreatment {name: '短效GABA活性催眠药'})
SET 
    n.description = coalesce(n.description, '用于改善失眠的药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '用于改善RLS但在OSA患者中可能恶化病情'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '阻塞性睡眠呼吸暂停');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '适当体育锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '物理疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '针灸疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '健康教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '基础治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '短效GABA活性催眠药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.2),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '禁忌');



// =====================================

