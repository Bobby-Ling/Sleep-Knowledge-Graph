// File: 脑卒中伴睡眠期周期性肢体运动患者的睡眠结构研究.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:53
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'});

MERGE (n:Disease {name: '睡眠期周期性肢体运动障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'PLMD');

MERGE (n:Symptom {name: '睡眠障碍'});

MERGE (n:Symptom {name: '睡眠效率降低'});

MERGE (n:Symptom {name: '清醒期PLMI'});

MERGE (n:Symptom {name: 'N1期睡眠占总睡眠时间比例'});

MERGE (n:Symptom {name: 'N2期睡眠占总睡眠时间比例'});

MERGE (n:Symptom {name: 'N3期睡眠占总睡眠时间比例'});

MERGE (n:Symptom {name: 'REM期睡眠占总睡眠时间比例'});

MERGE (n:Symptom {name: '睡眠呼吸暂停低通气指数(AHI)'});

MERGE (n:Symptom {name: '睡眠潜伏期'});

MERGE (n:Symptom {name: '觉醒指数'});

MERGE (n:Symptom {name: '周期性肢体运动觉醒指数'});

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '多样');

MATCH (from) WHERE from.name = '睡眠效率降低'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '清醒期PLMI'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '反复'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'N1期睡眠占总睡眠时间比例'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = 'N2期睡眠占总睡眠时间比例'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = 'N3期睡眠占总睡眠时间比例'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.55),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = 'REM期睡眠占总睡眠时间比例'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气指数(AHI)'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠潜伏期'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '觉醒指数'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '周期性肢体运动觉醒指数'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

