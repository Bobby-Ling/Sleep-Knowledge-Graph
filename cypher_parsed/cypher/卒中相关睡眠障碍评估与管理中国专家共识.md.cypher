// File: 卒中相关睡眠障碍评估与管理中国专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:35
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '卒中后常见的睡眠障碍症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '无法获得充足的睡眠或无法保持睡眠状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦，易于入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠期间出现呼吸暂停或呼吸困难的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '快速眼动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '在REM睡眠时期表现出异常的行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '强烈的腿部活动欲望，伴随不适感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现周期性的肢体运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.description = coalesce(n.description, '睡眠和觉醒周期的失常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠障碍的标准检查'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '快速眼动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:36
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '卒中 patients experiencing sleep difficulties due to stroke-related issues'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.description = coalesce(n.description, '周期性肢体运动导致患者睡眠障碍的病症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '静息腿综合症'})
SET 
    n.description = coalesce(n.description, '患者在安静时感到腿部不适，从而影响睡眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '患者在休息或夜间感到腿部持续不适感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '夜间无法获得足够的睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测用于确诊RLS和PLMS'),
    n.method = coalesce(n.method, '多导睡眠图'),
    n.requirement = coalesce(n.requirement, '住院监测');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

