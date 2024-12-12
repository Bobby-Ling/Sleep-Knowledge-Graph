// File: 中国成人失眠诊断与治疗指南（2023版） (2).md
// Processed at: 2024-12-12 01:29:21
// Total pairs: 30

/* Response #1
   Timestamp: 2024-12-12 01:27:15
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '最为常见的睡眠问题之一');

MERGE (n:Treatment {name: '失眠药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '失眠的药物治疗');

MERGE (n:Treatment {name: '心理治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '失眠的心理治疗');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '心理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:27:35
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'ICD-10: F51.0'),
    n.description = coalesce(n.description, '最为常见的睡眠问题之一'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到中度');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响个体的正常生活和工作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用新型治疗药物'),
    n.dosage = coalesce(n.dosage, '依照医嘱'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '个人敏感');

MERGE (n:Treatment {name: '心理治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '基于心理学的治疗方法'),
    n.dosage = coalesce(n.dosage, '依照医嘱'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '严重心理问题');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '心理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '持续');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:27:37
*/
// 节点更新


// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:27:42
*/
// 节点更新


// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:27:46
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为入睡困难、睡眠质量差或过早醒来等症状');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '主要用于失眠的鉴别诊断和疗效评估'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '适用于周期性肢体运动障碍、睡眠呼吸暂停、快速眼动睡眠期行为障碍等');

MERGE (n:Examination {name: '体动记录仪'})
SET 
    n.description = coalesce(n.description, '简单方便的非侵入性监测方法，评估身体活动和休息-活动周期'),
    n.method = coalesce(n.method, '体动记录仪'),
    n.requirement = coalesce(n.requirement, '在无 PSG 条件下评估患者夜间总睡眠时间和睡眠模式');

MERGE (n:Examination {name: '可穿戴设备'})
SET 
    n.description = coalesce(n.description, '改进了体动记录仪的缺点，保留了便携性，可进行多参数监测'),
    n.method = coalesce(n.method, '可穿戴设备'),
    n.requirement = coalesce(n.requirement, '可用于多参数监测');

MERGE (n:Examination {name: '神经影像'})
SET 
    n.description = coalesce(n.description, '影像学检查有助于排除其他疾病，如颅内肿瘤、脑血管疾病'),
    n.method = coalesce(n.method, '神经影像'),
    n.requirement = coalesce(n.requirement, '可为无创神经调控治疗精准定位刺激部位');

MERGE (n:Examination {name: '实验室检查'})
SET 
    n.description = coalesce(n.description, '排除系统性疾病以及寻找失眠病因的重要工具'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '根据患者情况进行血常规等检查');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '体动记录仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '可穿戴设备'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '神经影像'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '实验室检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:28:01
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '失眠持续时间≥3个月，发作频次≥3次/周，并存在与夜间睡眠紊乱相关的至少1项日间症状'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '短期失眠'})
SET 
    n.description = coalesce(n.description, '睡眠素乱和相关日间症状持续不足3个月'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '其他失眠'})
SET 
    n.description = coalesce(n.description, '具备睡眠起始困难和维持困难但不符合慢性或短期失眠诊断标准的罕见情况'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '与失眠存在密切关系的情绪障碍'),
    n.category = coalesce(n.category, '心理疾病'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '与失眠存在密切关系的情绪障碍'),
    n.category = coalesce(n.category, '心理疾病'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '入睡困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '维持睡眠困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '比期望时间过早醒来'})
SET 
    n.description = coalesce(n.description, '早醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '白天疲劳感'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '注意力或记忆损害'})
SET 
    n.description = coalesce(n.description, '注意力和记忆问题'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '情绪紊乱'})
SET 
    n.description = coalesce(n.description, '情绪问题'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每日');

// 关系更新
MATCH (from) WHERE from.name = '睡眠起始困难'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠维持困难'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '比期望时间过早醒来'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '疲劳'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '注意力或记忆损害'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '情绪紊乱'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '基础');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '基础');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:28:11
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '尽管有合适的睡眠机会和睡眠环境，依然对睡眠时间和睡眠质量感到不满意，并且影响日间功能或引起躯体不适的一种主观体验。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到中度');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '成人人睡潜伏期超过 30 min'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现 3 次');

MERGE (n:Symptom {name: '睡眠维持障碍'})
SET 
    n.description = coalesce(n.description, '整夜觉醒次数 ≥ 2 次'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现 3 次');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '较早醒来，无法再入睡'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '每周至少出现 3 次');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '感到睡眠质量较差'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现 3 次');

MERGE (n:Symptom {name: '总睡眠时间减少'})
SET 
    n.description = coalesce(n.description, '通常少于 6.5 h'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每周至少出现 3 次');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少出现 3 次'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠维持障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少出现 3 次'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每周至少出现 3 次'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '每周至少出现 3 次'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '总睡眠时间减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '每周至少出现 3 次'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:28:14
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '精神障碍'});

MERGE (n:Disease {name: '躯体疾病'});

MERGE (n:Disease {name: '药物或物质滥用'});

MERGE (n:Disease {name: '其他类型的睡眠障碍'});

MERGE (n:Disease {name: '睡眠相关呼吸障碍'});

MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Disease {name: '周期性肢体运动障碍'});

MERGE (n:Disease {name: '昼夜节律失调性睡眠觉醒障碍'});

MERGE (n:Disease {name: '环境性睡眠困难'});

MERGE (n:Disease {name: '睡眠不足综合征'});

MERGE (n:Disease {name: '短睡眠者'});

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '躯体疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '药物或物质滥用'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '其他类型的睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '其他类型的睡眠障碍'
MATCH (to) WHERE to.name = '睡眠相关呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '其他类型的睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '其他类型的睡眠障碍'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '其他类型的睡眠障碍'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '其他类型的睡眠障碍'
MATCH (to) WHERE to.name = '环境性睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '其他类型的睡眠障碍'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '其他类型的睡眠障碍'
MATCH (to) WHERE to.name = '短睡眠者'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:28:18
*/
// 节点更新


// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:28:23
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠疾病');

MERGE (n:Symptom {name: '夜间觉醒次数'})
SET 
    n.description = coalesce(n.description, '睡眠过程中醒来的次数'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '早于期望时间醒来'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到困倦的状态'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '症状波动性'})
SET 
    n.description = coalesce(n.description, '失眠症状的轻重变化'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '不定');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '夜间觉醒次数'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '症状波动性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '不定'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:28:28
*/
// 节点更新
MERGE (n:Scale {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '记录失眠情况的工具'),
    n.score_range = coalesce(n.score_range, '无'),
    n.interpretation = coalesce(n.interpretation, '全面了解患者的睡眠及日间状况');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到严重');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '高');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:28:29
*/
// 节点更新
MERGE (n:Treatment {name: '非苯二氮平类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '主要包括唑吡坦、扎来普隆、右佐匹克隆和佐匹克隆');

MERGE (n:Disease {name: '失眠'});

MERGE (n:Treatment {name: '地达西尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'γ-氨基丁酸A型受体的部分正向别构调节剂');

// 关系更新
MATCH (from) WHERE from.name = '非苯二氮平类药物'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '地达西尼'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:28:35
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为入睡困难、维持睡眠困难或早醒等症状');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物改善睡眠质量和延长睡眠时间'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '肝肾功能损害、重症肌无力等患者禁用');

MERGE (n:Treatment {name: '心理治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过心理干预方法改善睡眠'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '物理治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括光照疗法、经颅电刺激等治疗失眠'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '中医治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过中医方法治疗失眠'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: 'CBT-I'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '认知行为疗法，用于纠正睡眠认知与行为'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '数字CBT-I'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '基于数字平台的认知行为疗法'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '患者难以入睡的状态'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '维持睡眠困难'})
SET 
    n.description = coalesce(n.description, '患者在夜间醒来后难以再次入睡'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '患者比预期时间早醒'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '心理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '物理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '中医治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'CBT-I'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '数字CBT-I'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '维持睡眠困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:28:42
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '一种持续的睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '认知行为治疗（CBT-I）'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '结合认知和行为治疗的多组分疗法');

MERGE (n:Treatment {name: '物理治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括无创神经调控治疗、生物反馈、光照治疗、声音治疗等');

// 关系更新
MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '认知行为治疗（CBT-I）'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '物理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:28:43
*/
// 节点更新
MERGE (n:Scale {name: '匹兹堡睡眠质量指数'})
SET 
    n.description = coalesce(n.description, 'PSQI自评工具'),
    n.score_range = coalesce(n.score_range, '0-21'),
    n.interpretation = coalesce(n.interpretation, '分数越高，睡眠质量越差');

MERGE (n:Scale {name: '失眠严重程度指数'})
SET 
    n.description = coalesce(n.description, 'Insomnia Severity Index, ISI，自评工具'),
    n.score_range = coalesce(n.score_range, '0-28'),
    n.interpretation = coalesce(n.interpretation, '分数越高，失眠程度越严重');

MERGE (n:Scale {name: '爱泼沃斯思睡量表'})
SET 
    n.description = coalesce(n.description, 'Epworth Sleepiness Scale, ESS'),
    n.score_range = coalesce(n.score_range, '0-24'),
    n.interpretation = coalesce(n.interpretation, '分数越高，白天嗜睡程度越严重');

MERGE (n:Scale {name: '睡前觉醒状态量表'})
SET 
    n.description = coalesce(n.description, 'Pre-Sleep Arousal Scale, PSAS'),
    n.score_range = coalesce(n.score_range, '0-28'),
    n.interpretation = coalesce(n.interpretation, '分数越高，睡前觉醒状态越严重');

MERGE (n:Scale {name: '疲劳严重程度量表'})
SET 
    n.description = coalesce(n.description, 'Fatigue Severity Scale, FSS'),
    n.score_range = coalesce(n.score_range, '0-40'),
    n.interpretation = coalesce(n.interpretation, '分数越高，疲劳程度越严重');

MERGE (n:Scale {name: '清晨型与夜晚型睡眠问卷'})
SET 
    n.description = coalesce(n.description, 'Morning and Evening Questionnaire, MEQ'),
    n.score_range = coalesce(n.score_range, '0-25'),
    n.interpretation = coalesce(n.interpretation, '分数反映清晨与夜晚的睡眠偏好');

MERGE (n:Scale {name: '简明健康调查问卷'})
SET 
    n.description = coalesce(n.description, 'Short Form-36 Health Survey, SF-36'),
    n.score_range = coalesce(n.score_range, '0-100'),
    n.interpretation = coalesce(n.interpretation, '分数越高，健康状况越好');

MERGE (n:Scale {name: '睡眠信念和态度量表'})
SET 
    n.description = coalesce(n.description, 'Dysfunctional Beliefs and Attitudes about Sleep Scale, DBAS'),
    n.score_range = coalesce(n.score_range, '0-83'),
    n.interpretation = coalesce(n.interpretation, '分数越高，负面睡眠信念越明显');

MERGE (n:Scale {name: '汉密尔顿焦虑量表'})
SET 
    n.description = coalesce(n.description, 'Hamilton Anxiety Scale, HAMA'),
    n.score_range = coalesce(n.score_range, '0-56'),
    n.interpretation = coalesce(n.interpretation, '分数越高，焦虑程度越严重');

MERGE (n:Scale {name: '汉密尔顿抑郁量表'})
SET 
    n.description = coalesce(n.description, 'Hamilton Depression Scale, HAMD'),
    n.score_range = coalesce(n.score_range, '0-52'),
    n.interpretation = coalesce(n.interpretation, '分数越高，抑郁程度越严重');

MERGE (n:Scale {name: '贝克抑郁量表'})
SET 
    n.description = coalesce(n.description, 'Beck Depression Inventory, BDI'),
    n.score_range = coalesce(n.score_range, '0-63'),
    n.interpretation = coalesce(n.interpretation, '分数越高，抑郁程度越严重');

MERGE (n:Scale {name: '状态-特质焦虑问卷'})
SET 
    n.description = coalesce(n.description, 'State-Trait Anxiety Inventory, STAI'),
    n.score_range = coalesce(n.score_range, '20-80'),
    n.interpretation = coalesce(n.interpretation, '分数越高，焦虑程度越高');

MERGE (n:Scale {name: '广泛性焦虑障碍量表'})
SET 
    n.description = coalesce(n.description, 'Generalized Anxiety Disorder Scale, GAD-7'),
    n.score_range = coalesce(n.score_range, '0-21'),
    n.interpretation = coalesce(n.interpretation, '分数越高，焦虑障碍程度越严重');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:28:44
*/
// 节点更新
MERGE (n:Treatment {name: '苏沃雷生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '双食欲素受体拮抗剂，适应症为阿尔茨海默病患者的失眠、急性脑卒中患者的主观失眠'),
    n.dosage = coalesce(n.dosage, '10 mg或20 mg'),
    n.duration = coalesce(n.duration, '睡前口服');

MERGE (n:Treatment {name: '莱博雷生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善睡眠效率、缩短潜伏期、改善觉醒时间'),
    n.dosage = coalesce(n.dosage, '5 mg或10 mg'),
    n.contraindication = coalesce(n.contraindication, '安全性和耐受性：A级证据，I级推荐');

MERGE (n:Treatment {name: '达利雷生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善夜间睡眠和日间功能，低日间思睡发生比例'),
    n.dosage = coalesce(n.dosage, '25 mg或50 mg，睡前30分钟口服'),
    n.contraindication = coalesce(n.contraindication, '安全性：A级证据，I级推荐');

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '急性脑卒中'});

MERGE (n:Disease {name: '慢性阻塞性肺病'})
SET 
    n.short_name = coalesce(n.short_name, 'COPD');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAS');

// 关系更新
MATCH (from) WHERE from.name = '苏沃雷生'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '莱博雷生'
MATCH (to) WHERE to.name = '慢性阻塞性肺病'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '慢性');

MATCH (from) WHERE from.name = '莱博雷生'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '慢性');

MATCH (from) WHERE from.name = '达利雷生'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苏沃雷生'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '莱博雷生'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '达利雷生'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '低');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:28:48
*/
// 节点更新
MERGE (n:Treatment {name: '米氮平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '快速镇静, 改善睡眠, 增加慢波睡眠, 有助于睡眠持续'),
    n.dosage = coalesce(n.dosage, '3.75 ~ 15.00 mg'),
    n.contraindication = coalesce(n.contraindication, '可引起或加重RLS, 噩梦, 半衰期长, 易出现白天困倦, 长期使用易出现锥体外系不良反应');

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '焦虑抑郁'});

MERGE (n:Treatment {name: '盐酸曲唑酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善睡眠结构和连续性');

MERGE (n:Treatment {name: '短效BZRAs'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '如唑吡坦、佐匹克隆或右佐匹克隆，联合应用早期缓解失眠');

MERGE (n:Treatment {name: '喹硫平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '增加总睡眠时间, 改善睡眠结构, 减少觉醒时间'),
    n.contraindication = coalesce(n.contraindication, '尚缺乏循证医学证据，不建议无精神疾病的失眠患者使用');

MERGE (n:Treatment {name: '小剂量米氮平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '镇静作用，一般不需要联用类药物');

// 关系更新
MATCH (from) WHERE from.name = '米氮平'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '盐酸曲唑酮'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '中');

MATCH (from) WHERE from.name = '短效BZRAs'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '中');

MATCH (from) WHERE from.name = '喹硫平'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '高');

MATCH (from) WHERE from.name = '小剂量米氮平'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:28:49
*/
// 节点更新
MERGE (n:Treatment {name: '光照治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过调整内源性睡眠-觉醒周期改善睡眠质量'),
    n.duration = coalesce(n.duration, '30分钟至2小时'),
    n.contraindication = coalesce(n.contraindication, '躁狂, 偏头痛, 视网膜光敏性');

MERGE (n:Disease {name: '慢性失眠'});

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '轻微的不良反应'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '眼疲劳'})
SET 
    n.description = coalesce(n.description, '轻微的不良反应'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '恶心呕吐'})
SET 
    n.description = coalesce(n.description, '轻微的不良反应'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '光照治疗'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '辅助');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '眼疲劳'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '恶心呕吐'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:28:50
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种使人无法正常入睡或维持睡眠状态的疾病');

MERGE (n:Treatment {name: '右美托咪定'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种α2肾上腺素能受体激动剂，能显著改善睡眠效率，增加N2期睡眠。'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '依据患者情况'),
    n.contraindication = coalesce(n.contraindication, '超适应证用药(B级证据，不推荐)');

MERGE (n:Treatment {name: '异丙酚'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '通过增强GABA和甘氨酸受体的功能，抑制N-甲基-D-天冬氨酸(NMDA)受体的功能，调节睡眠平衡。'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '依据患者情况'),
    n.contraindication = coalesce(n.contraindication, 'D级证据，II级推荐');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '右美托咪定'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '异丙酚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性治疗');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:28:50
*/
// 节点更新
MERGE (n:Disease {name: '昼夜节律失调型睡眠觉醒障碍'});

MERGE (n:Disease {name: '昼夜节律延迟综合征'});

MERGE (n:Disease {name: '时差变化所致失眠'});

MERGE (n:Disease {name: '失眠合并抑郁情绪'});

MERGE (n:Disease {name: '急性失眠'});

MERGE (n:Disease {name: '以睡眠维持困难为特征的失眠'});

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '调节睡眠-觉醒周期'),
    n.dosage = coalesce(n.dosage, '缓释片（2 mg）适用于55岁以上中老年人群失眠治疗'),
    n.duration = coalesce(n.duration, '长期使用影响内源性褪黑素的分泌'),
    n.contraindication = coalesce(n.contraindication, '不推荐作为常规药物治疗失眠');

MERGE (n:Treatment {name: '褪黑素受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '激动褪黑素受体，发挥催眠作用'),
    n.dosage = coalesce(n.dosage, '根据具体药物而定'),
    n.duration = coalesce(n.duration, '根据具体适应症而定'),
    n.contraindication = coalesce(n.contraindication, '禁用于乙型肝炎/丙型肝炎病毒携带者及肝功能损害者');

MERGE (n:Treatment {name: '多西拉敏'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '镇静、缩短睡眠潜伏期'),
    n.dosage = coalesce(n.dosage, '推荐剂量7.5~25.0 mg'),
    n.duration = coalesce(n.duration, '根据具体适应症而定'),
    n.contraindication = coalesce(n.contraindication, '重症肌无力及青光眼患者慎用');

MERGE (n:Treatment {name: '苯海拉明'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '镇静作用，适用于妊娠呕吐'),
    n.dosage = coalesce(n.dosage, '推荐剂量25~50 mg'),
    n.duration = coalesce(n.duration, '根据具体适应症而定'),
    n.contraindication = coalesce(n.contraindication, '根据患者情况而定');

MERGE (n:Treatment {name: '多塞平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '具有镇静作用'),
    n.dosage = coalesce(n.dosage, '小剂量3~6 mg/d'),
    n.duration = coalesce(n.duration, '根据具体适应症而定'),
    n.contraindication = coalesce(n.contraindication, '闭角型青光眼或尿潴留患者慎用');

MERGE (n:Treatment {name: '曲唑酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '拮抗5-羟色胺2A受体和H1受体'),
    n.dosage = coalesce(n.dosage, '小剂量25~150 mg/d'),
    n.duration = coalesce(n.duration, '根据具体适应症而定'),
    n.contraindication = coalesce(n.contraindication, '根据患者情况而定');

// 关系更新
MATCH (from) WHERE from.name = '昼夜节律失调型睡眠觉醒障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '昼夜节律延迟综合征'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '时差变化所致失眠'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '失眠合并抑郁情绪'
MATCH (to) WHERE to.name = '褪黑素受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '急性失眠'
MATCH (to) WHERE to.name = '多西拉敏'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '以睡眠维持困难为特征的失眠'
MATCH (to) WHERE to.name = '多塞平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '以睡眠维持困难为特征的失眠'
MATCH (to) WHERE to.name = '曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');



// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:28:52
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为入睡困难、维持睡眠困难或早醒等症状');

MERGE (n:Treatment {name: '唑吡坦'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种非苯二氮卓类药物，用于治疗失眠'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '右佐匹克隆'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种非苯二氮卓类药物，用于改进失眠症状'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '扎来普隆'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗失眠的短效药物'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '地达西尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '新型失眠治疗药物'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '苏沃雷生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '食欲素受体拮抗剂，非成瘾性的新靶点药物'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '莱博雷生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '食欲素受体拮抗剂，适用于失眠患者'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '达利雷生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '食欲素受体拮抗剂，适用于失眠患者'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '曲唑酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '具有镇静催眠作用的抗抑郁药物'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '米氮平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗伴随焦虑和抑郁症状的失眠患者'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '多塞平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '镇静催眠作用的抗抑郁药物'),
    n.dosage = coalesce(n.dosage, '根据医师处方'),
    n.duration = coalesce(n.duration, '根据医师建议'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '唑吡坦'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '右佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '扎来普隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '地达西尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苏沃雷生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '莱博雷生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '达利雷生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '米氮平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多塞平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:28:54
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'F51.0'),
    n.description = coalesce(n.description, '失眠症状导致的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '经颅电刺激(TES)'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过电极将低强度电流作用于脑区，调节突触可塑性'),
    n.dosage = coalesce(n.dosage, '2mA'),
    n.duration = coalesce(n.duration, '20-60分钟'),
    n.contraindication = coalesce(n.contraindication, '可能有头皮不适');

MERGE (n:Treatment {name: '经皮耳迷走神经刺激(ta-VNS)'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '无创神经刺激技术，通过耳部电极刺激迷走神经'),
    n.contraindication = coalesce(n.contraindication, '疗效个体差异大，机制不明');

MERGE (n:Treatment {name: '生物反馈'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过传感器控制生理功能，促进放松'),
    n.contraindication = coalesce(n.contraindication, '证据存在争议');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '经颅电刺激(TES)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '经皮耳迷走神经刺激(ta-VNS)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '生物反馈'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '联合治疗');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:28:54
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠是指在接受心理、生理或环境适应的情况下，难以入睡或维持睡眠，导致白天功能受损的现象。');

MERGE (n:Treatment {name: '经颅磁刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '经颅磁刺激通过线圈置于局部大脑皮质对应的头皮部位，利用电磁感应产生电流，改变神经元膜电位，影响特定皮质区的兴奋性。'),
    n.duration = coalesce(n.duration, '根据个体情况调整'),
    n.contraindication = coalesce(n.contraindication, '有既往癫痫病史或对磁场敏感者');

MERGE (n:Treatment {name: '认知行为治疗（CBT-I）'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对失眠的认知行为治疗，是多组分治疗干预技术。'),
    n.duration = coalesce(n.duration, '根据个体情况调整'),
    n.contraindication = coalesce(n.contraindication, '无具体禁忌症');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '睡眠质量较差，难以达到理想的休息效果。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡或维持睡眠的症状。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比预期的时间早醒，并难以再次入睡的现象。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '睡眠质量下降'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗前期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知行为治疗（CBT-I）'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗后期');



// =====================================

/* Response #24
   Timestamp: 2024-12-12 01:28:54
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'F51.0'),
    n.description = coalesce(n.description, '失眠是一种常见的睡眠障碍，表现为入睡困难、维持睡眠的困难或早醒，导致白天功能障碍。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Treatment {name: '认知行为疗法（CBT-I）'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '一种针对失眠的认知行为疗法，通过改变思维和行为来改善睡眠质量。'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Disease {name: '妊娠期失眠'})
SET 
    n.code = coalesce(n.code, 'O99.3'),
    n.description = coalesce(n.description, '妊娠期失眠是指在妊娠期间出现的失眠症状，可能与 hormonal changes 和心理因素有关。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '哺乳期失眠'})
SET 
    n.code = coalesce(n.code, 'O99.4'),
    n.description = coalesce(n.description, '哺乳期失眠是指在哺乳期间发生的失眠症状，可能因心理和生理因素影响。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知行为疗法（CBT-I）'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '妊娠期失眠'
MATCH (to) WHERE to.name = '认知行为疗法（CBT-I）'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '哺乳期失眠'
MATCH (to) WHERE to.name = '认知行为疗法（CBT-I）'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '妊娠期失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '哺乳期失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #25
   Timestamp: 2024-12-12 01:28:58
*/
// 节点更新


// =====================================

/* Response #26
   Timestamp: 2024-12-12 01:28:59
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠在中医学中称为“不寐”');

MERGE (n:Treatment {name: '声音疗法'})
SET 
    n.description = coalesce(n.description, '采用音乐治疗和噪声治疗作为手段'),
    n.type = coalesce(n.type, '非药物');

MERGE (n:Treatment {name: '音乐治疗'})
SET 
    n.description = coalesce(n.description, '缩短睡眠潜伏期, 提高睡眠效率, 提高睡眠质量'),
    n.type = coalesce(n.type, '非药物'),
    n.recommendation_level = coalesce(n.recommendation_level, 'A级');

MERGE (n:Treatment {name: '白噪声'})
SET 
    n.description = coalesce(n.description, '改善睡眠, 证据质量低'),
    n.type = coalesce(n.type, '非药物');

MERGE (n:Treatment {name: '粉红噪声'})
SET 
    n.description = coalesce(n.description, '增强睡眠慢波活动, 不引起唤醒, 提高睡眠质量'),
    n.type = coalesce(n.type, '非药物');

MERGE (n:Treatment {name: '中成药'})
SET 
    n.description = coalesce(n.description, '改善失眠, 循证医学证据'),
    n.type = coalesce(n.type, '药物');

MERGE (n:Treatment {name: '植物药'})
SET 
    n.description = coalesce(n.description, '单用或联合其他治疗改善睡眠质量'),
    n.type = coalesce(n.type, '药物');

MERGE (n:Treatment {name: '紫花地丁'})
SET 
    n.description = coalesce(n.description, '改善PSQI评分, 主观睡眠质量等'),
    n.type = coalesce(n.type, '药物');

MERGE (n:Treatment {name: '南非醉茄提取物'})
SET 
    n.description = coalesce(n.description, '改善成年人睡眠, 需更多安全数据评估长期使用适宜性'),
    n.type = coalesce(n.type, '药物');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '声音疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '音乐治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '白噪声'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '粉红噪声'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '中成药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '植物药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '紫花地丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.77),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '南非醉茄提取物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '声音疗法'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, 'I级');

MATCH (from) WHERE from.name = '音乐治疗'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, 'I级');

MATCH (from) WHERE from.name = '白噪声'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.4),
    r.recommendation_level = coalesce(r.recommendation_level, 'II级');

MATCH (from) WHERE from.name = '粉红噪声'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.6),
    r.recommendation_level = coalesce(r.recommendation_level, 'II级');

MATCH (from) WHERE from.name = '中成药'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.75),
    r.recommendation_level = coalesce(r.recommendation_level, 'II级');

MATCH (from) WHERE from.name = '植物药'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.7),
    r.recommendation_level = coalesce(r.recommendation_level, 'II级');



// =====================================

/* Response #27
   Timestamp: 2024-12-12 01:29:06
*/
// 节点更新
MERGE (n:Disease {name: '围绝经期失眠'})
SET 
    n.description = coalesce(n.description, '围绝经期和绝经期女性失眠问题');

MERGE (n:Disease {name: '儿童失眠'})
SET 
    n.description = coalesce(n.description, '儿童和青少年阶段的失眠问题');

MERGE (n:Disease {name: '倒班人群失眠'})
SET 
    n.description = coalesce(n.description, '因工作时间不规律导致的失眠问题');

MERGE (n:Symptom {name: '睡眠质量降低'})
SET 
    n.description = coalesce(n.description, '睡眠时间不足或质量差的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠严重程度提高'})
SET 
    n.description = coalesce(n.description, '失眠问题出现加重的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Treatment {name: '雌激素替代治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于改善围绝经期女性的睡眠质量'),
    n.contraindication = coalesce(n.contraindication, '心血管疾病风险');

MERGE (n:Treatment {name: 'CBT-I'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '认知行为治疗针对失眠的有效方法'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '褪黑素治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗注意缺陷多动障碍和孤独症患者的失眠'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, '由雌激素替代治疗可能引发的风险'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '睡眠不足'})
SET 
    n.description = coalesce(n.description, '睡眠时间不足导致的身心问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '昼夜节律紊乱'})
SET 
    n.description = coalesce(n.description, '因工作时间不规律导致的生物钟失衡'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '围绝经期失眠'
MATCH (to) WHERE to.name = '雌激素替代治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '围绝经期失眠'
MATCH (to) WHERE to.name = '睡眠质量降低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '围绝经期失眠'
MATCH (to) WHERE to.name = '失眠严重程度提高'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '儿童失眠'
MATCH (to) WHERE to.name = 'CBT-I'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初次治疗');

MATCH (from) WHERE from.name = '儿童失眠'
MATCH (to) WHERE to.name = '睡眠质量降低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班人群失眠'
MATCH (to) WHERE to.name = '褪黑素治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '管理');

MATCH (from) WHERE from.name = '倒班人群失眠'
MATCH (to) WHERE to.name = '失眠严重程度提高'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班人群失眠'
MATCH (to) WHERE to.name = '昼夜节律紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '围绝经期失眠'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '围绝经期失眠'
MATCH (to) WHERE to.name = '睡眠不足'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #28
   Timestamp: 2024-12-12 01:29:07
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '一系列情绪特征，包括紧张、不安等行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪持续低落，失去兴趣或愉快的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '睡眠质量差'})
SET 
    n.description = coalesce(n.description, '睡眠时间短或睡眠不深，影响睡眠的质量'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Treatment {name: '针刺'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过刺激体内特定经络以改善睡眠'),
    n.duration = coalesce(n.duration, '根据患者需要'),
    n.contraindication = coalesce(n.contraindication, '无明显禁忌症');

MERGE (n:Treatment {name: '认知行为疗法 (CBT-I)'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过改变患者对失眠的认知与行为来改善睡眠'),
    n.duration = coalesce(n.duration, '视乎个体情况而定'),
    n.contraindication = coalesce(n.contraindication, '无明显禁忌症');

MERGE (n:Treatment {name: '多塞平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种抗抑郁药，用于改善睡眠'),
    n.dosage = coalesce(n.dosage, '低剂量'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '注意可能相互作用');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于调整生物钟，改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '缓释剂'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.contraindication = coalesce(n.contraindication, '个别情况需谨慎使用');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠质量差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '针刺'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.92),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知行为疗法 (CBT-I)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多塞平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '持续');



// =====================================

/* Response #29
   Timestamp: 2024-12-12 01:29:12
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '不宁腿综合症'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Disease {name: '脑血管病'});

MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.short_name = coalesce(n.short_name, 'COPD');

MERGE (n:Symptom {name: '睡眠片段化'})
SET 
    n.description = coalesce(n.description, '夜间睡眠分段或中断的现象');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '缺乏能量或精力');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '感到困难或阻力呼吸的症状');

MERGE (n:Treatment {name: '认知行为疗法-失眠'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过心理干预改善失眠的疗法'),
    n.duration = coalesce(n.duration, '因患者情况而异');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物来控制失眠'),
    n.duration = coalesce(n.duration, '根据药物种类');

MERGE (n:Treatment {name: 'PAP治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '夜间正压通气治疗'),
    n.duration = coalesce(n.duration, '长期');

MERGE (n:Treatment {name: '针灸'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '传统针刺疗法'),
    n.duration = coalesce(n.duration, '根据患者情况');

MERGE (n:Treatment {name: '褪黑素受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于调节睡眠的药物');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠片段化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠片段化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知行为疗法-失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首选治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PAP治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首选治疗');

MATCH (from) WHERE from.name = '脑血管病'
MATCH (to) WHERE to.name = '认知行为疗法-失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '不宁腿综合症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '较重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '针灸'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '褪黑素受体激动剂'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #30
   Timestamp: 2024-12-12 01:29:21
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'I10'),
    n.description = coalesce(n.description, '一种常见疾病，表现为持续的血压升高。'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '2型糖尿病'})
SET 
    n.code = coalesce(n.code, 'E11'),
    n.description = coalesce(n.description, '常见的糖尿病类型，通过胰岛素抵抗和胰岛素分泌不足引起。'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.code = coalesce(n.code, 'E66'),
    n.description = coalesce(n.description, '体内脂肪过量积聚的疾病。'),
    n.category = coalesce(n.category, '代谢疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.code = coalesce(n.code, 'F32'),
    n.description = coalesce(n.description, '一种严重的情感障碍，影响思维和行为。'),
    n.category = coalesce(n.category, '精神障碍'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '焦虑症'})
SET 
    n.code = coalesce(n.code, 'F41'),
    n.description = coalesce(n.description, '常见的心理疾病，以过度担忧和紧张为特征。'),
    n.category = coalesce(n.category, '精神障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '精神分裂症'})
SET 
    n.code = coalesce(n.code, 'F20'),
    n.description = coalesce(n.description, '一种严重的精神疾病，影响思维、情感和行为。'),
    n.category = coalesce(n.category, '精神障碍'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Treatment {name: '唑吡坦'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善高血压病患者的睡眠质量和应激状况。'),
    n.dosage = coalesce(n.dosage, '按需服用'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '对应药物过敏');

MERGE (n:Treatment {name: '选择性食欲素受体拮抗剂苏沃雷生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善2型糖尿病患者的睡眠质量和肥胖相关变量。'),
    n.dosage = coalesce(n.dosage, '按需服用'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '对应药物过敏');

MERGE (n:Treatment {name: '右佐匹克隆'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善2型糖尿病失眠患者的睡眠和血糖控制。'),
    n.dosage = coalesce(n.dosage, '按需服用'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '对应药物过敏');

MERGE (n:Treatment {name: '褪黑激素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善睡眠质量和血糖控制，但可能诱导不良影响。'),
    n.dosage = coalesce(n.dosage, '按需服用'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '对应药物过敏');

MERGE (n:Treatment {name: 'CBT-I'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '治疗失眠共病精神障碍的有效方法。'),
    n.dosage = coalesce(n.dosage, '按需使用'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '镇静催眠药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '单独使用不改善抑郁，与抗抑郁剂组合可改善。'),
    n.dosage = coalesce(n.dosage, '按需服用'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '对应药物过敏');

MERGE (n:Treatment {name: '阿戈美拉汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '具有催眠和抗抑郁的双重作用。'),
    n.dosage = coalesce(n.dosage, '按需服用'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '对应药物过敏');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '2型糖尿病'
MATCH (to) WHERE to.name = '选择性食欲素受体拮抗剂苏沃雷生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '2型糖尿病'
MATCH (to) WHERE to.name = '右佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '唑吡坦'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '褪黑激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'CBT-I'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '镇静催眠药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '抑郁症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '焦虑症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');



// =====================================

