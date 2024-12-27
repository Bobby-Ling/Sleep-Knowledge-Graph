// File: 孤独症谱系障碍儿童睡眠障碍临床实践相关指南解读.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:12
*/
// 节点更新
MERGE (n:Disease {name: '孤独症谱系障碍'});

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '睡眠质量、时长和就寝时间异常的总称'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '在合适的睡眠时间和条件下，儿童反复出现启动或维持睡眠的困难'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '睡眠行为紊乱'})
SET 
    n.description = coalesce(n.description, '包括就寝抵抗、睡眠潜伏期、睡眠连续性等异常行为'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '晚上清醒'})
SET 
    n.description = coalesce(n.description, '儿童在夜间频繁醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间功能损害'})
SET 
    n.description = coalesce(n.description, '由于睡眠障碍导致的日间生理和心理功能下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '就寝抵抗'})
SET 
    n.description = coalesce(n.description, '儿童在上床后拒绝入睡的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠时间不足'})
SET 
    n.description = coalesce(n.description, '儿童整体睡眠时间不足以满足需求'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '睡眠图监测'})
SET 
    n.description = coalesce(n.description, '监测和记录儿童的睡眠结构和睡眠问题'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: '临床评估'})
SET 
    n.description = coalesce(n.description, '对ASD儿童的睡眠障碍进行的综合性临床评估'),
    n.method = coalesce(n.method, '临床访谈'),
    n.requirement = coalesce(n.requirement, '专业人员进行');

// 关系更新
MATCH (from) WHERE from.name = '晚上清醒'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间功能损害'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '就寝抵抗'
MATCH (to) WHERE to.name = '睡眠行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠时间不足'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠图监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '临床评估'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

