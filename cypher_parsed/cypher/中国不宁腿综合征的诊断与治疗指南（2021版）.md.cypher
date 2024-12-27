// File: 中国不宁腿综合征的诊断与治疗指南（2021版）.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:31
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种感觉运动障碍性疾病，主要表现为强烈的活动腿的欲望，通常在休息时加重'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适感'})
SET 
    n.description = coalesce(n.description, '迫切想移动肢体的冲动，通常伴随各种不适感如蚁爬感、灼烧感等'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '夜间睡眠困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '因RLS导致的不断担忧'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于检测睡眠中周期性肢体运动'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '患者需在医院进行观察');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:38
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种导致患者感到腿部不适的神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '在休息状态下感觉到腿部不适'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '睡眠中频繁觉醒，导致深度睡眠减少'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪障碍'})
SET 
    n.description = coalesce(n.description, '由于睡眠不足导致的情绪低落'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '适当体育锻炼'})
SET 
    n.description = coalesce(n.description, '通过渐进式有氧运动改善腿部不适症状'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '每周几次'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '物理疗法'})
SET 
    n.description = coalesce(n.description, '使用气动压缩装置等来减轻临床症状'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '气动压缩装置');

MERGE (n:NonDrugTreatment {name: '针灸疗法'})
SET 
    n.description = coalesce(n.description, '通过针灸改善RLS症状及睡眠质量'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '针具');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断RLS的监测方法'),
    n.method = coalesce(n.method, '在医院进行多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '保持安静和舒适');

// 关系更新
MATCH (from) WHERE from.name = '腿部不适'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间睡眠质量下降'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '情绪障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '适当体育锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '物理疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '对症支持治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '针灸疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '对症支持治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

