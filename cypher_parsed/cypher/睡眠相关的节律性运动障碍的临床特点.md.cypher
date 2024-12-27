// File: 睡眠相关的节律性运动障碍的临床特点.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:21
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.description = coalesce(n.description, '与睡眠相关的，以身体多部位反复的节律性刻板样动作为表现的综合征'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '不自主摇头'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现的人头部左右摆动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '发作性摇头'})
SET 
    n.description = coalesce(n.description, '睡眠中头部不自主摆动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到困乏无力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抑郁状态'})
SET 
    n.description = coalesce(n.description, '伴随入睡障碍的抑郁表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '视频多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于监测睡眠相关运动障碍'),
    n.method = coalesce(n.method, '视频脑电图监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: '脑电图'})
SET 
    n.description = coalesce(n.description, '监测发作期间的脑电活动'),
    n.method = coalesce(n.method, '脑电图监测'),
    n.requirement = coalesce(n.requirement, '静止状态下进行');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '不自主摇头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '发作性摇头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '视频多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '脑电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

