// File: 慢性偏头痛住院患者医疗质量评价与改进专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:14
*/
// 节点更新
MERGE (n:Disease {name: '慢性偏头痛'})
SET 
    n.description = coalesce(n.description, '一种高致残性的原发性头痛疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '头痛发作时伴随的恶心感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '头痛发作时伴随的呕吐现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '畏光'})
SET 
    n.description = coalesce(n.description, '对光线的敏感反应'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '畏声'})
SET 
    n.description = coalesce(n.description, '对声音的敏感反应'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '与慢性偏头痛合并的焦虑状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '与慢性偏头痛合并的抑郁状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '慢性偏头痛患者常见的睡眠问题'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '头痛严重程度记录'})
SET 
    n.description = coalesce(n.description, '记录头痛发作的严重程度'),
    n.method = coalesce(n.method, '视觉模拟量表(VAS)'),
    n.requirement = coalesce(n.requirement, '动态记录');

MERGE (n:Examination {name: '头痛发作频率记录'})
SET 
    n.description = coalesce(n.description, '记录患者头痛发作的频率'),
    n.method = coalesce(n.method, '统计记录'),
    n.requirement = coalesce(n.requirement, '每月记录');

MERGE (n:Examination {name: '药物使用情况记录'})
SET 
    n.description = coalesce(n.description, '记录最近急性期药物使用情况'),
    n.method = coalesce(n.method, '病历记录'),
    n.requirement = coalesce(n.requirement, '详细记录使用药物信息');

// 关系更新
MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '畏光'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '畏声'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '头痛严重程度记录'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '头痛发作频率记录'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '药物使用情况记录'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

