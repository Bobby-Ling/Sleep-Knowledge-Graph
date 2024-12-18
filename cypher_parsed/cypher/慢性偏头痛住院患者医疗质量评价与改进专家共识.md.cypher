// File: 慢性偏头痛住院患者医疗质量评价与改进专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:24
*/
// 节点更新
MERGE (n:Disease {name: '偏头痛'})
SET 
    n.description = coalesce(n.description, '高发病率、高致残率的原发性疾病'),
    n.category = coalesce(n.category, '头痛'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '慢性偏头痛'})
SET 
    n.description = coalesce(n.description, '由发作性偏头痛进展而来'),
    n.category = coalesce(n.category, '头痛'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '伴随头痛的症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '伴随头痛的症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '畏光'})
SET 
    n.description = coalesce(n.description, '伴随头痛的症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '畏声'})
SET 
    n.description = coalesce(n.description, '伴随头痛的症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '药物戒断治疗'})
SET 
    n.description = coalesce(n.description, '对止痛药物戒断的治疗方案'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:RiskFactor {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '慢性偏头痛常合并的共病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '慢性偏头痛常合并的共病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '慢性偏头痛常合并的共病'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '畏光'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '畏声'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '药物戒断治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

