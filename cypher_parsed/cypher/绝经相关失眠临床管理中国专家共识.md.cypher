// File: 绝经相关失眠临床管理中国专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:12
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '与绝经相关的失眠，常见于围绝经期女性，影响健康水平'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠不佳的症状，当该症状持续不能缓解时发展为失眠症'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '昼夜节律紊乱'})
SET 
    n.description = coalesce(n.description, '由于激素水平变化引起的生理节律失衡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间频繁觉醒'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来，影响睡眠质量'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '实时监测患者的心电图、脑电图等，评估睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '患者需在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '昼夜节律紊乱'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间频繁觉醒'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

