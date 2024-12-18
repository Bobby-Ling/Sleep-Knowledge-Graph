// File: 基层医疗机构失眠症诊断和治疗中国专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:08:14
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:NonDrugTreatment {name: '光照疗法'})
SET 
    n.description = coalesce(n.description, '光线调节昼夜节律'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '重复经颅磁刺激'})
SET 
    n.description = coalesce(n.description, '低频磁刺激改善睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '设备需要');

MERGE (n:NonDrugTreatment {name: '经颅电刺激'})
SET 
    n.description = coalesce(n.description, '向头皮施加低强度电流调节大脑活动'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '设备需要');

MERGE (n:NonDrugTreatment {name: '生物反馈疗法'})
SET 
    n.description = coalesce(n.description, '减少条件唤醒，改善入睡时间'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '苯二氮草类药物'})
SET 
    n.description = coalesce(n.description, '用于治疗失眠的镇静催眠药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '不超过4周'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度呼吸衰竭');

MERGE (n:Complication {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '失眠可能导致焦虑症状加重'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '失眠与抑郁症状相关联'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '光照疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '重复经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '经颅电刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '生物反馈疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:25
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '最常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');



// =====================================

