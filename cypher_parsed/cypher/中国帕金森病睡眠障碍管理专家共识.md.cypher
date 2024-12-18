// File: 中国帕金森病睡眠障碍管理专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:11
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍类型，发生率为30.0%至86.8%'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在日间应该维持清醒的主要时段难以持续保持清醒和警觉状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期间伴随梦境及肢体活动的睡眠疾病'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '较常见');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种常见的神经系统感觉运动障碍'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '睡眠中呼吸异常的疾病'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '失眠认知行为治疗'})
SET 
    n.description = coalesce(n.description, '通过改变思维模式和行为来改善睡眠问题'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '需要时'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '强光治疗'})
SET 
    n.description = coalesce(n.description, '通过强光照射改善睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '强光灯');

MERGE (n:DrugTreatment {name: '复方左旋多巴缓释剂'})
SET 
    n.description = coalesce(n.description, '用于优化多巴胺能治疗'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '严重脑功能障碍');

MERGE (n:DrugTreatment {name: '褪黑素'})
SET 
    n.description = coalesce(n.description, '一种用于改善睡眠的药物'),
    n.dosage = coalesce(n.dosage, '3mg'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对褪黑素过敏');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '用于改善帕金森病合并RBD的药物'),
    n.dosage = coalesce(n.dosage, '0.25-2.0mg'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '严重胃肠疾病');

MERGE (n:Complication {name: '睡眠障碍引起的生活质量下降'})
SET 
    n.description = coalesce(n.description, '帕金森病患者因睡眠障碍而影响生活质量'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:RiskFactor {name: '抑郁焦虑'})
SET 
    n.description = coalesce(n.description, '影响帕金森病患者睡眠质量的心理因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '多巴胺激动剂'})
SET 
    n.description = coalesce(n.description, '可能导致睡眠质量下降的药物'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重要');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '较重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '失眠认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '强光治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '医师指导下治疗');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '复方左旋多巴缓释剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '个体化治疗');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '睡眠障碍引起的生活质量下降'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '抑郁焦虑'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '多巴胺激动剂'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

