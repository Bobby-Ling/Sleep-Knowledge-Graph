// File: 绝经相关失眠临床管理中国专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:08:54
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠不佳的症状'),
    n.severity = coalesce(n.severity, '常见'),
    n.frequency = coalesce(n.frequency, '持续不能缓解');

MERGE (n:Symptom {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '失眠症的发展状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长时间');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

