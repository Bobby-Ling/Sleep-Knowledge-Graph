// File: 孤独症谱系障碍儿童睡眠障碍临床实践相关指南解读.md
// Processed at: 2024-12-12 01:30:29
// Total pairs: 10

/* Response #1
   Timestamp: 2024-12-12 01:29:54
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:29:57
*/
// 节点更新
MERGE (n:Disease {name: '孤独症谱系障碍'})
SET 
    n.code = coalesce(n.code, 'ASD'),
    n.description = coalesce(n.description, '一种起病于儿童早期的神经发育障碍，其核心症状为社交障碍、重复刻板的行为和局限狭窄的兴趣'),
    n.category = coalesce(n.category, '神经发育障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, 'ASD儿童最常见的共患疾病之一,与睡眠时间不足或睡眠节律紊乱相关'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠不足'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '睡眠行为紊乱'})
SET 
    n.description = coalesce(n.description, '包括就寝抵抗'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Treatment {name: '行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对睡眠障碍的行为干预'),
    n.duration = coalesce(n.duration, '根据个体情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '褪黑素治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用褪黑素改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '根据年龄和体重'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.contraindication = coalesce(n.contraindication, '对褪黑素过敏');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠行为紊乱'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初步干预');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '褪黑素治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '短期治疗');

MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:29:58
*/
// 节点更新
MERGE (n:Disease {name: '孤独症谱系障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'ASD');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响睡眠质量和模式的疾病');

MERGE (n:Disease {name: '失眠'});

MERGE (n:Complication {name: '共患疾病'})
SET 
    n.description = coalesce(n.description, '与孤独症谱系障碍并存的其他疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Examination {name: 'ASD儿童睡眠障碍筛查'})
SET 
    n.description = coalesce(n.description, '用于评估ASD儿童的睡眠问题'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '具备相关背景的医务人员');

MERGE (n:Treatment {name: '睡眠干预'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对ASD儿童睡眠障碍的非药物疗法'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Scale {name: 'ASD睡眠质量评分量表'})
SET 
    n.description = coalesce(n.description, '评估ASD儿童睡眠质量的工具'),
    n.score_range = coalesce(n.score_range, '0-10'),
    n.interpretation = coalesce(n.interpretation, '分数越高，睡眠质量越差');

// 关系更新
MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = '共患疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = 'ASD儿童睡眠障碍筛查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期干预');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'ASD睡眠质量评分量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:30:03
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '在睡眠时间和睡眠条件适合的情况下，儿童在启动或维持睡眠上反复出现困难，导致日间功能损害'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '反复出现的呼吸暂停，影响睡眠质量'),
    n.category = coalesce(n.category, '原发性睡眠疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '在休息时出现不适感，并迫使患者活动以缓解症状'),
    n.category = coalesce(n.category, '原发性睡眠疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '就寝抵抗'})
SET 
    n.description = coalesce(n.description, '儿童在入睡时拒绝就寝，表现出抗拒行为'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间觉醒'})
SET 
    n.description = coalesce(n.description, '儿童在夜间频繁醒来'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '就寝抵抗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '夜间觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:30:03
*/
// 节点更新
MERGE (n:Disease {name: 'ASD儿童睡眠障碍'})
SET 
    n.description = coalesce(n.description, '孤独症谱系障碍儿童的睡眠障碍');

MERGE (n:Treatment {name: '重力毯'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '一种重力感应的毯子，旨在提供深压触觉以促进放松和睡眠'),
    n.recommendation_level = coalesce(n.recommendation_level, 'B级推荐');

MERGE (n:Treatment {name: '特殊睡眠床垫'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '专为改善睡眠质量而设计的床垫'),
    n.recommendation_level = coalesce(n.recommendation_level, 'B级推荐');

MERGE (n:Treatment {name: '按摩'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过手法刺激身体来促进放松和睡眠');

MERGE (n:Treatment {name: '瑜伽'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '结合身体姿势与呼吸培训，旨在提升身心健康');

MERGE (n:Treatment {name: '芳香疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用植物提取的香精来帮助放松和改善睡眠');

MERGE (n:Treatment {name: 'omega-3脂肪酸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种脂肪酸补充剂，常用于改善心理健康'),
    n.contraindication = coalesce(n.contraindication, 'NICE指南不建议使用');

MERGE (n:Treatment {name: '维生素等特殊营养补充剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '包括复合维生素和其他营养补充剂');

MERGE (n:Treatment {name: '按摩疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '以缓解压力和改善睡眠为目的的专业按摩');

// 关系更新
MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '重力毯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '特殊睡眠床垫'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '按摩'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '瑜伽'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '芳香疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = 'omega-3脂肪酸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.2),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '维生素等特殊营养补充剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.3),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '按摩疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.2),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:30:05
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '睡眠行为紊乱'});

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'});

MERGE (n:Disease {name: '癫痫'});

MERGE (n:Disease {name: '夜间胃食管反流'});

MERGE (n:Disease {name: '焦虑'});

MERGE (n:Disease {name: '抑郁'});

MERGE (n:Disease {name: '双相情感障碍'});

MERGE (n:Disease {name: '精神障碍'});

MERGE (n:Disease {name: '注意力缺陷多动障碍'});

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '睡眠行为紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '夜间胃食管反流'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '抑郁'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '中期');

MATCH (from) WHERE from.name = '双相情感障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '精神障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '注意力缺陷多动障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '夜间胃食管反流'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '抑郁'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '双相情感障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '精神障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '注意力缺陷多动障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:30:07
*/
// 节点更新
MERGE (n:Disease {name: '孤独症谱系障碍儿童睡眠障碍'});

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '由大脑的松果体产生，具有调节昼夜节律的功能和催眠作用'),
    n.dosage = coalesce(n.dosage, '1~10 mg/d'),
    n.duration = coalesce(n.duration, '临床医生建议'),
    n.contraindication = coalesce(n.contraindication, '尚缺乏长期使用安全性的数据');

MERGE (n:Disease {name: '儿童失眠'});

// 关系更新
MATCH (from) WHERE from.name = '孤独症谱系障碍儿童睡眠障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, 'B 级推荐'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '儿童失眠'
MATCH (to) WHERE to.name = '孤独症谱系障碍儿童睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:30:08
*/
// 节点更新
MERGE (n:Disease {name: 'ASD儿童睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与自闭症谱系障碍儿童相关的睡眠问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，难以入睡或维持睡眠状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '睡眠行为紊乱'})
SET 
    n.description = coalesce(n.description, '睡眠模式异常，可能表现为夜醒或异常行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '针对ASD儿童失眠的药物方案'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏的患者禁用');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括认知行为疗法等方式来改善睡眠'),
    n.dosage = coalesce(n.dosage, '不适用'),
    n.duration = coalesce(n.duration, '通常为数周'),
    n.contraindication = coalesce(n.contraindication, '无特定禁忌');

// 关系更新
MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '睡眠行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:30:08
*/
// 节点更新
MERGE (n:Disease {name: 'ASD儿童失眠'})
SET 
    n.description = coalesce(n.description, 'ASD儿童青少年睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或保持睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '睡眠教育/行为干预'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过教育和行为调整来改善睡眠'),
    n.duration = coalesce(n.duration, '持续性');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物来改善失眠'),
    n.dosage = coalesce(n.dosage, '根据医嘱'),
    n.duration = coalesce(n.duration, '视情况而定');

MERGE (n:Complication {name: '睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '夜间呼吸暂停，导致睡眠中断'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '腿部不适，导致夜间难以入睡'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = 'ASD儿童失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'ASD儿童失眠'
MATCH (to) WHERE to.name = '睡眠教育/行为干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = 'ASD儿童失眠'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = 'ASD儿童失眠'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = 'ASD儿童失眠'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:30:16
*/
// 节点更新
MERGE (n:Disease {name: 'ASD儿童睡眠障碍'})
SET 
    n.description = coalesce(n.description, '孤独症谱系障碍儿童的睡眠障碍');

MERGE (n:Treatment {name: '行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对ASD儿童失眠的行为干预'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '认知行为疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '认知行为疗法经调整后适用于年龄较大的ASD儿童'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '消退法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改善睡眠习惯的行为疗法'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '积极就寝程序'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '积极的睡眠准备程序'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '逐渐消退法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '逐渐减少对ASD儿童的依赖'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '父母睡眠教育'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对父母的睡眠习惯教育'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '消退法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '积极就寝程序'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '逐渐消退法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = 'ASD儿童睡眠障碍'
MATCH (to) WHERE to.name = '父母睡眠教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '一线');



// =====================================

