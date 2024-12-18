// File: 多发性硬化合并睡眠障碍研究进展.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:56:09
*/
// 节点更新
MERGE (n:Disease {name: '多发性硬化'})
SET 
    n.code = coalesce(n.code, 'MS'),
    n.description = coalesce(n.description, '一种慢性中枢神经系统自身免疫性脱髓鞘疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '人睡困难、睡眠维持困难或早醒'),
    n.severity = coalesce(n.severity, '轻至重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '不安腿综合征'})
SET 
    n.description = coalesce(n.description, '累及感觉运动的疾病，表现为肢体运动的欲望'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '包括阻塞性睡眠呼吸暂停和中枢性睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以过度日间嗜睡为特征的慢性睡眠障碍'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: 'REM期睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期肌肉弛缓现象消失，并出现异常运动行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '昼夜节律失调性睡眠障碍'})
SET 
    n.description = coalesce(n.description, '睡眠与觉醒节律和外部环境不协调'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '持久的疲惫感，影响生活质量'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.54),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.319),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.08),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.1),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.014),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠障碍'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.2),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '疲劳'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');



// =====================================

