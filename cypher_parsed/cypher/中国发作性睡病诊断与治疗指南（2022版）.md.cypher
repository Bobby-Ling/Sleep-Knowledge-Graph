// File: 中国发作性睡病诊断与治疗指南（2022版）.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:09:25
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种神经内科的罕见病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天难以遏制的困倦或睡眠反复发作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '每日均会发生');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '发作性睡病1型最具特征性的临床表现'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '人睡前幻觉'})
SET 
    n.description = coalesce(n.description, '发生于觉醒-睡眠转换期的一种梦境样体验'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '意识清醒但无法自主活动或讲话'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '反复夜间睡眠中断、觉醒次数增多'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '日间规律小睡'})
SET 
    n.description = coalesce(n.description, '通过日间规律小睡改善觉醒水平'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '睡眠卫生习惯'})
SET 
    n.description = coalesce(n.description, '维持有利于睡眠的环境'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '兴奋性药物'})
SET 
    n.description = coalesce(n.description, '用于改善日间过度思睡症状'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '怀孕');

MERGE (n:Complication {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '包括工作记忆、执行功能和持续注意力缺陷'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '可能与发作性睡病并存'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '人睡前幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠瘫痪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '夜间睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间规律小睡'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠卫生习惯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '基础治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '兴奋性药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物控制');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:09:38
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种以日间过度嗜睡和睡眠发作为主要特征的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在醒着时出现过度困倦的状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '突发性的肌肉无力，通常受到情绪刺激的影响'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Disease {name: '晕厥'})
SET 
    n.description = coalesce(n.description, '由于大脑缺血导致的短暂丧失意识及肌肉张力下降'),
    n.category = coalesce(n.category, '疾病'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '晕厥'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

