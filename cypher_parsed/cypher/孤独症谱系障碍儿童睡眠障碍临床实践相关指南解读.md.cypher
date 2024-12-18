// File: 孤独症谱系障碍儿童睡眠障碍临床实践相关指南解读.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:51
*/
// 节点更新
MERGE (n:Disease {name: '孤独症谱系障碍'})
SET 
    n.code = coalesce(n.code, 'ASD'),
    n.description = coalesce(n.description, '一种起病于儿童早期的神经发育障碍'),
    n.category = coalesce(n.category, '神经发育障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.code = coalesce(n.code, 'Sleep Disorder'),
    n.description = coalesce(n.description, '睡眠质量、时长和就寝时间异常'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'Insomnia'),
    n.description = coalesce(n.description, '启动或维持睡眠上反复出现困难，导致日间功能损害'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'Obstructive Sleep Apnea'),
    n.description = coalesce(n.description, '一种睡眠中反复呼吸暂停的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'Restless Legs Syndrome'),
    n.description = coalesce(n.description, '在休息时感到不适的症状'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Treatment {name: '行为治疗'})
SET 
    n.description = coalesce(n.description, '通过认知行为疗法等调整睡眠习惯'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '褪黑素'})
SET 
    n.description = coalesce(n.description, '用于调节昼夜节律的药物'),
    n.dosage = coalesce(n.dosage, '1-3 mg/d'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '儿童虽未验证长期安全性');

// 关系更新
MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后期');



// =====================================

