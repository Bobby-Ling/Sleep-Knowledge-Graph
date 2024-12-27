// File: 《成年人阻塞性睡眠呼吸暂停低通气综合征筛查：美国预防临床服务指南工作组推荐声明》解读.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:20
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠呼吸障碍，表现为在睡眠期间呼吸暂停和上呼吸道阻塞'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸停顿'})
SET 
    n.description = coalesce(n.description, '在睡眠期间出现的呼吸停止情况'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于诊断OSAHS的睡眠检查方法'),
    n.method = coalesce(n.method, '综合多项生理数据监测'),
    n.requirement = coalesce(n.requirement, '住院观察');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸停顿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

