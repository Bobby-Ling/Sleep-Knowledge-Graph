// File: 基层医疗机构失眠症诊断和治疗中国专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:55:55
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '最常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '可能引起失眠的精神障碍'),
    n.category = coalesce(n.category, '精神障碍');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '可能与失眠症相关的精神障碍'),
    n.category = coalesce(n.category, '精神障碍');

MERGE (n:Disease {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '与慢性失眠相关的躯体疾病'),
    n.category = coalesce(n.category, '躯体疾病');

MERGE (n:Symptom {name: '睡眠困难'})
SET 
    n.description = coalesce(n.description, '入睡困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠不深'})
SET 
    n.description = coalesce(n.description, '睡眠质量差'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '睡眠中频繁醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比期望时间早醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '睡眠不深'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:55:56
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:NonDrugTreatment {name: '光照疗法'})
SET 
    n.description = coalesce(n.description, '通过光线调节昼夜节律，改善失眠患者日间思睡，减少睡眠片段化'),
    n.duration = coalesce(n.duration, '30~45 min'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:NonDrugTreatment {name: '重复经颅磁刺激'})
SET 
    n.description = coalesce(n.description, '低频rTMS通过降低失眠患者的皮质异常兴奋性、诱导慢波睡眠、增加睡眠深度');

MERGE (n:NonDrugTreatment {name: '经颅电刺激'})
SET 
    n.description = coalesce(n.description, 'TES通过向头皮施加低强度电流来调节大脑活动');

MERGE (n:NonDrugTreatment {name: '生物反馈疗法'})
SET 
    n.description = coalesce(n.description, '通过减少条件唤醒，减少失眠者的入睡时间和觉醒次数');

MERGE (n:NonDrugTreatment {name: '迷走神经刺激'});

MERGE (n:NonDrugTreatment {name: '虚拟现实(VR)'});

MERGE (n:NonDrugTreatment {name: '听觉刺激'});

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '光照疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '重复经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '经颅电刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '生物反馈疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '迷走神经刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '虚拟现实(VR)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '听觉刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低');



// =====================================

