// File: 中国帕金森病睡眠障碍管理专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:46
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种常见的中老年人神经系统退行性疾病，临床特征包括动作迟缓、震颤、肌强直等运动症状和非运动症状。'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '尽管有合适的睡眠机会和睡眠环境，依然对睡眠时间和质量感到不满足，影响日间社会功能的主观体验。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '30.0%-86.8%');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在日间应该维持清醒的主要时段难以持续保持清醒和警觉状态，出现难以抑制的困倦欲睡。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '21%-76%');

MERGE (n:Symptom {name: 'REM睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '以REM睡眠期间伴随梦境及肢体活动为特征的睡眠疾病，发病时暴力行为可造成自身及同床者伤害。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '22.2%-60.0%');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '患者在休息时感到腿部不适，会有一种强烈的想要移动的冲动。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '12%');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '是一组睡眠中呼吸异常的疾病，包括阻塞性睡眠呼吸暂停和中枢性睡眠呼吸暂停等。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '20%-60%');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '患者在睡眠中会出现反复的肢体不自主运动。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不详');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'REM睡眠行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

