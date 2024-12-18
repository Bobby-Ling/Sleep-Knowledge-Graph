// File: 睡眠相关的节律性运动障碍的临床特点.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:08:29
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.description = coalesce(n.description, '以身体多部位反复的节律性刻板样动作为表现的综合征');

MERGE (n:Symptom {name: '不自主摇头'})
SET 
    n.description = coalesce(n.description, '患者睡眠时不自主地摇头'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每晚');

MERGE (n:Symptom {name: '头部不自主摆动'})
SET 
    n.description = coalesce(n.description, '患者在睡觉时出现的头部不自主摆动'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每晚');

MERGE (n:NonDrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '用药可减轻症状及改善睡眠质量'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.frequency = coalesce(n.frequency, '睡前口服'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '盐酸曲唑酮'})
SET 
    n.description = coalesce(n.description, '试用于治疗SRMD的药物'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.frequency = coalesce(n.frequency, '每日1次'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '伴有抑郁状态'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '不自主摇头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '头部不自主摆动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '盐酸曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

