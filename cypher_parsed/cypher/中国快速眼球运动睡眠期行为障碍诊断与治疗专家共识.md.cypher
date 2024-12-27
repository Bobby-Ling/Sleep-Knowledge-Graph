// File: 中国快速眼球运动睡眠期行为障碍诊断与治疗专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:12
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '一种以REM睡眠期间伴随梦境及肢体活动为特征的睡眠疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '梦境相关的复杂运动'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期出现持续或间歇性肌张力增高、多梦及梦境演绎行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '自伤行为'})
SET 
    n.description = coalesce(n.description, '患者在发作时可导致自身伤害的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '暴力行为'})
SET 
    n.description = coalesce(n.description, '与梦境相关的暴力行为，可能伤及他人'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天思睡'})
SET 
    n.description = coalesce(n.description, '虽然REM睡眠表现个体差异明显，但少数患者主诉白天思睡'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, 'PSG监测，检测REM期骨骼肌活动情况'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在临床环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '梦境相关的复杂运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '自伤行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '暴力行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '白天思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

