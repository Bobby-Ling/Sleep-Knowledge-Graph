// File: 睡眠相关的节律性运动障碍的临床特点.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:52
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '以身体多部位反复的节律性刻板样动作为表现的综合征'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '不适用');

MERGE (n:Symptom {name: '不自主摇头'})
SET 
    n.description = coalesce(n.description, '入睡后出现的左右摇动头部的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每天多次');

MERGE (n:Symptom {name: '双手紧握'})
SET 
    n.description = coalesce(n.description, '发作时患者双手紧握的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '可变');

MERGE (n:Symptom {name: '头部摆动'})
SET 
    n.description = coalesce(n.description, '睡眠中头部不自主摆动的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '用于治疗SRMD的药物'),
    n.dosage = coalesce(n.dosage, '0.5-1.0 mg'),
    n.frequency = coalesce(n.frequency, '睡前一次'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对本药过敏的患者');

MERGE (n:DrugTreatment {name: '盐酸曲唑酮'})
SET 
    n.description = coalesce(n.description, '辅助治疗SRMD的药物'),
    n.dosage = coalesce(n.dosage, '50 mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对该药物过敏的患者');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '盐酸曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '不自主摇头'
MATCH (to) WHERE to.name = '睡眠相关的节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日多次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '双手紧握'
MATCH (to) WHERE to.name = '睡眠相关的节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '可变'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头部摆动'
MATCH (to) WHERE to.name = '睡眠相关的节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '每晚'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

