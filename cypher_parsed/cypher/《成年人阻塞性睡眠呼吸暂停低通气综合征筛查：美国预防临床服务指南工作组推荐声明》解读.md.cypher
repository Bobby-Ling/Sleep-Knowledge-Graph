// File: 《成年人阻塞性睡眠呼吸暂停低通气综合征筛查：美国预防临床服务指南工作组推荐声明》解读.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:08:58
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸障碍,表现为在睡眠期间呼吸暂停和上呼吸道阻塞'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '常见');

MERGE (n:Disease {name: '高血压'});

MERGE (n:Disease {name: '糖尿病'});

MERGE (n:Disease {name: '冠心病'});

MERGE (n:Disease {name: '脑卒中'});

MERGE (n:Disease {name: '肥胖'});

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

