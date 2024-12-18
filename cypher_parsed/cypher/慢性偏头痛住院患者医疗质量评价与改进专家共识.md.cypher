// File: 慢性偏头痛住院患者医疗质量评价与改进专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:55
*/
// 节点更新
MERGE (n:Disease {name: '偏头痛'})
SET 
    n.description = coalesce(n.description, '高致残性的原发性头痛疾病'),
    n.category = coalesce(n.category, '原发性头痛'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '慢性偏头痛'})
SET 
    n.description = coalesce(n.description, '发作性偏头痛进展而来的疾病'),
    n.category = coalesce(n.category, '头痛'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '常见的情绪障碍'),
    n.category = coalesce(n.category, '心理疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落并伴随多种功能障碍'),
    n.category = coalesce(n.category, '心理疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响睡眠质量或时间的疾病'),
    n.category = coalesce(n.category, '睡眠疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '一种不适的感觉，常伴随呕吐'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '胃内容物被强行排出'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '畏光'})
SET 
    n.description = coalesce(n.description, '对光线的敏感'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '畏声'})
SET 
    n.description = coalesce(n.description, '对声音的敏感'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '头痛严重程度记录'})
SET 
    n.description = coalesce(n.description, '记录头痛发作的严重程度'),
    n.method = coalesce(n.method, '视觉模拟量表评分'),
    n.requirement = coalesce(n.requirement, '需记录');

MERGE (n:Examination {name: '共病筛查'})
SET 
    n.description = coalesce(n.description, '筛查焦虑、抑郁及睡眠障碍'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '需进行');

// 关系更新
MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '畏光'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '畏声'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '头痛严重程度记录'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '共病筛查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');



// =====================================

