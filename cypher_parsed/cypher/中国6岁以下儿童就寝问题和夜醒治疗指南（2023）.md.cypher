// File: 中国6岁以下儿童就寝问题和夜醒治疗指南（2023）.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:33
*/
// 节点更新
MERGE (n:Disease {name: '失眠障碍'})
SET 
    n.description = coalesce(n.description, '6岁以下儿童的就寝问题和夜醒属于失眠障碍的诊断范畴'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '就寝问题'})
SET 
    n.description = coalesce(n.description, '儿童在就寝时表现出的抗拒或拖延行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜醒'})
SET 
    n.description = coalesce(n.description, '儿童在夜间频繁醒来的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '过度困倦'})
SET 
    n.description = coalesce(n.description, '儿童在白天表现出过度困倦的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '儿童在日常活动中无法集中注意力的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多动'})
SET 
    n.description = coalesce(n.description, '儿童表现出过度活跃的不寻常行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪问题'})
SET 
    n.description = coalesce(n.description, '儿童情绪波动较大，容易发脾气或不高兴'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '行为治疗'})
SET 
    n.description = coalesce(n.description, '采用行为治疗技术改善儿童就寝问题和夜醒的效果'),
    n.method = coalesce(n.method, '行为疗法'),
    n.requirement = coalesce(n.requirement, '需在专业指导下实施');

MERGE (n:NonDrugTreatment {name: '睡眠卫生习惯指导'})
SET 
    n.description = coalesce(n.description, '通过教育和指导家长改善儿童的睡眠习惯'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续改善'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '褪黑素'})
SET 
    n.description = coalesce(n.description, '一种用于改善儿童夜醒的药物'),
    n.dosage = coalesce(n.dosage, '根据体重'),
    n.frequency = coalesce(n.frequency, '就寝前30~60分钟'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '有发育障碍儿童应谨慎用药');

MERGE (n:NonDrugTreatment {name: '睡前抚触'})
SET 
    n.description = coalesce(n.description, '通过抚触提高儿童入睡质量'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.frequency = coalesce(n.frequency, '习惯性'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '就寝问题'
MATCH (to) WHERE to.name = '失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '过度困倦'
MATCH (to) WHERE to.name = '失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '注意力不集中'
MATCH (to) WHERE to.name = '失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多动'
MATCH (to) WHERE to.name = '失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '情绪问题'
MATCH (to) WHERE to.name = '失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠障碍'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠障碍'
MATCH (to) WHERE to.name = '睡眠卫生习惯指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首次干预');

MATCH (from) WHERE from.name = '失眠障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代方案');

MATCH (from) WHERE from.name = '失眠障碍'
MATCH (to) WHERE to.name = '睡前抚触'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助手段');



// =====================================

