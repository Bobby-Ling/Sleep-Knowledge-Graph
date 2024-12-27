// File: 脑卒中伴睡眠期周期性肢体运动患者的睡眠结构研究.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:32
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '一种影响脑部的疾病，可以导致各种并发症'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠期周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '在睡眠期间反复出现的刻板肢体运动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响睡眠质量的各种症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '清醒期PLMI'})
SET 
    n.description = coalesce(n.description, '清醒状态下的周期性肢体运动指数'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠效率降低'})
SET 
    n.description = coalesce(n.description, '睡眠期间效率低下的表现'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '普遍');

MERGE (n:Symptom {name: '觉醒指数增加'})
SET 
    n.description = coalesce(n.description, '夜间觉醒次数增多的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠质量的检测方法'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '清醒期PLMI'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠效率降低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '觉醒指数增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

