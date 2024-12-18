// File: 多发性硬化合并睡眠障碍研究进展.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:01
*/
// 节点更新
MERGE (n:Disease {name: '多发性硬化'})
SET 
    n.code = coalesce(n.code, 'MS'),
    n.description = coalesce(n.description, '慢性中枢神经系统自身免疫性脱髓鞘疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '不安腿综合征'})
SET 
    n.description = coalesce(n.description, '感觉运动相关疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA'),
    n.description = coalesce(n.description, '睡眠期间气道堵塞导致的呼吸暂停'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以日间嗜睡为特征的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: 'REM期睡眠行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD'),
    n.description = coalesce(n.description, 'REM睡眠期的异常运动行为'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.54),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '不安腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.319),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.08),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '相对常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = 'REM期睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.014),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

