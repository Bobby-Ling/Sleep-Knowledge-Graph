// File: 儿童中枢性睡眠呼吸暂停56例临床分析.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:11
*/
// 节点更新
MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '一种以呼吸驱动缺乏或异常导致的通气功能障碍，常见于儿童'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠过程中频繁发生部分或全部上气道阻塞，表现为张口呼吸、打鼾和呼吸暂停'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '由于气道阻塞造成的呼吸停止现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间叹气样呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠中出现叹气样呼吸'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '生长发育异常'})
SET 
    n.description = coalesce(n.description, '儿童期可能由于呼吸异常而影响生长发育'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪波动'})
SET 
    n.description = coalesce(n.description, '表现为脾气暴躁等情绪变化'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '呼吸暂停'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间叹气样呼吸'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

