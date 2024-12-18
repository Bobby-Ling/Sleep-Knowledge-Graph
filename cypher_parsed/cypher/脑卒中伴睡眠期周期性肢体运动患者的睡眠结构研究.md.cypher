// File: 脑卒中伴睡眠期周期性肢体运动患者的睡眠结构研究.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:20
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'});

MERGE (n:Disease {name: '睡眠期周期性肢体运动障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'PLMD');

MERGE (n:Symptom {name: '睡眠效率降低'})
SET 
    n.description = coalesce(n.description, '睡眠效率降低'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '觉醒次数增多'})
SET 
    n.description = coalesce(n.description, '患者在睡眠期间觉醒的频率增多'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:RiskFactor {name: '睡眠期间反复肢体运动'})
SET 
    n.description = coalesce(n.description, '睡眠期周期性肢体运动对脑卒中患者的影响'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠障碍的检查方法'),
    n.method = coalesce(n.method, '多导监测'),
    n.requirement = coalesce(n.requirement, '患者准入条件');

MERGE (n:NonDrugTreatment {name: '改善睡眠的干预措施'})
SET 
    n.description = coalesce(n.description, '通过非药物方法改善患者睡眠质量'),
    n.duration = coalesce(n.duration, '个体化'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠效率降低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '觉醒次数增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠期间反复肢体运动'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '适中');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '改善睡眠的干预措施'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '综合治疗');

MATCH (from) WHERE from.name = '睡眠期周期性肢体运动障碍'
MATCH (to) WHERE to.name = '睡眠期间反复肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

