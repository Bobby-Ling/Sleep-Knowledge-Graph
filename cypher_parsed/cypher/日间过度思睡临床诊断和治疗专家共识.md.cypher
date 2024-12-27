// File: 日间过度思睡临床诊断和治疗专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:13
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '一种表现为在日间过度的嗜睡状态'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '无预警地突然陷入睡眠的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '对外界刺激反应迟缓，容易入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠图(PSG)'})
SET 
    n.description = coalesce(n.description, '全面评估夜间睡眠状态及相关事件'),
    n.method = coalesce(n.method, '监测脑电活动和生理参数'),
    n.requirement = coalesce(n.requirement, '需在睡眠实验室进行');

MERGE (n:Examination {name: '睡眠潜伏期测验(MSLT)'})
SET 
    n.description = coalesce(n.description, '评估个体在白天的入睡倾向'),
    n.method = coalesce(n.method, '多次短时间入睡测试'),
    n.requirement = coalesce(n.requirement, '结合夜间PSG结果');

MERGE (n:Examination {name: '清醒维持测验(MWT)'})
SET 
    n.description = coalesce(n.description, '评估参与者在日间保持清醒的能力'),
    n.method = coalesce(n.method, '在安静环境中保持清醒'),
    n.requirement = coalesce(n.requirement, '多次测试');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '过度思睡'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '多导睡眠图(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠潜伏期测验(MSLT)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '清醒维持测验(MWT)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:23
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在一天需要保持清醒的时间段内无法维持清醒和警觉的状态，伴有不能抑制的睡眠需求'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '过度困倦'})
SET 
    n.description = coalesce(n.description, '出现躯体和精神上严重的困倦感，难以保持清醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '不经意的入睡'})
SET 
    n.description = coalesce(n.description, '在不自主情况下突然入睡的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠发作'})
SET 
    n.description = coalesce(n.description, '无任何预警突然入睡的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '主观体力和精力缺乏，难以启动活动的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠架构和呼吸状态'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: '艾普沃斯嗜睡量表'})
SET 
    n.description = coalesce(n.description, '评估患者的日间嗜睡程度'),
    n.method = coalesce(n.method, '自评问卷'),
    n.requirement = coalesce(n.requirement, '根据实际情况填写');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '过度困倦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '不经意的入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '艾普沃斯嗜睡量表'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

