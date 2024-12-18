// File: 认知功能损害患者睡眠障碍评估和管理的专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:56:01
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害'});

MERGE (n:Disease {name: '轻度认知功能损害'})
SET 
    n.code = coalesce(n.code, 'MCI');

MERGE (n:Disease {name: '痴呆'});

MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.code = coalesce(n.code, 'AD');

MERGE (n:Disease {name: '血管性痴呆'})
SET 
    n.code = coalesce(n.code, 'VaD');

MERGE (n:Disease {name: '额颞叶变性'})
SET 
    n.code = coalesce(n.code, 'FTLD/FTD');

MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.code = coalesce(n.code, 'LBD');

MERGE (n:Disease {name: '帕金森病痴呆'})
SET 
    n.code = coalesce(n.code, 'PDD');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '患者在夜间无法入睡或维持睡眠的状态');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到过度困倦');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '患者在睡眠期间出现呼吸暂停或低通气的情况');

MERGE (n:Symptom {name: '异态睡眠'})
SET 
    n.description = coalesce(n.description, '患者在快速眼球运动睡眠期间表现出异常行为');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '患者在休息时感到腿部不适，活动后缓解');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '患者出现周期性腿部动作的情况');

MERGE (n:Symptom {name: '昼夜节律失调性睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '患者的睡眠觉醒周期与生物钟不同步');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '异态睡眠'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '周期性肢体运动'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '少数'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '额颞叶变性'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '帕金森病痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:56:03
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害'});

MERGE (n:Disease {name: '睡眠-觉醒紊乱'});

MERGE (n:Disease {name: '睡眠-觉醒时相延迟障碍'});

MERGE (n:Disease {name: '内在昼夜节律性睡眠-觉醒障碍'});

MERGE (n:Disease {name: '日落综合征'});

MERGE (n:Symptom {name: '睡眠明显片段化'});

MERGE (n:Symptom {name: '觉醒次数增加'});

MERGE (n:Symptom {name: '夜间徘徊不睡'});

MERGE (n:Symptom {name: '维持困难'});

MERGE (n:Symptom {name: '精神行为异常'});

MERGE (n:Symptom {name: '昼夜节律变化'});

MERGE (n:Symptom {name: '日间过度思睡'});

MERGE (n:Symptom {name: '失眠'});

MERGE (n:Examination {name: '睡眠日记'});

MERGE (n:Examination {name: 'ACT检测'});

MERGE (n:NonDrugTreatment {name: '光照治疗'});

MERGE (n:NonDrugTreatment {name: '褪黑素应用'});

MERGE (n:NonDrugTreatment {name: '体育锻炼'});

MERGE (n:NonDrugTreatment {name: '增加社交活动'});

MERGE (n:DrugTreatment {name: '外源性褪黑素'});

MERGE (n:NonDrugTreatment {name: '蓝光治疗'});

MERGE (n:NonDrugTreatment {name: '清晨光照治疗'});

MERGE (n:NonDrugTreatment {name: '傍晚光照治疗'});

// 关系更新
MATCH (from) WHERE from.name = '睡眠明显片段化'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '觉醒次数增加'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '夜间徘徊不睡'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '维持困难'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '精神行为异常'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '昼夜节律变化'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠-觉醒紊乱'
MATCH (to) WHERE to.name = '光照治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '睡眠-觉醒紊乱'
MATCH (to) WHERE to.name = '褪黑素应用'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '睡眠-觉醒紊乱'
MATCH (to) WHERE to.name = '体育锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '睡眠-觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '褪黑素应用'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '内在昼夜节律性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '外源性褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '日落综合征'
MATCH (to) WHERE to.name = '蓝光治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '日落综合征'
MATCH (to) WHERE to.name = '清晨光照治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '睡眠-觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠-觉醒时相延迟障碍'
MATCH (to) WHERE to.name = 'ACT检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '睡眠-觉醒紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '内在昼夜节律性睡眠-觉醒障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '日落综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

