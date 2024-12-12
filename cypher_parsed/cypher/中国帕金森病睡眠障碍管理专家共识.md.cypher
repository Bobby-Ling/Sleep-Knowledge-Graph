// File: 中国帕金森病睡眠障碍管理专家共识.md
// Processed at: 2024-12-12 01:33:20
// Total pairs: 15

/* Response #1
   Timestamp: 2024-12-12 01:32:44
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:32:52
*/
// 节点更新
MERGE (n:Disease {name: '快速动眼睡眠行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: 'CPAP'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '连续气道正压通气'),
    n.dosage = coalesce(n.dosage, 'null'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, 'null');

// 关系更新
MATCH (from) WHERE from.name = '快速动眼睡眠行为障碍'
MATCH (to) WHERE to.name = 'CPAP'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗措施');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:32:52
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '帕金森病患者最常见的非运动症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或睡眠维持困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: 'REM睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '快速眼球运动睡眠期的异常行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较少');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '腿部不适感，常在睡眠时加重'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '睡眠时腿部周期性运动'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '睡眠期间的呼吸暂停或不规律'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = 'REM睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:32:54
*/
// 节点更新
MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '以REM睡眠期间伴随梦境及肢体活动为特征的睡眠疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种中枢神经系统退行性疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '生动梦境'})
SET 
    n.description = coalesce(n.description, '在REM睡眠状态下生动的梦境体验'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '暴力行为'})
SET 
    n.description = coalesce(n.description, '发病时伴随的身体暴力行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠相关伤害行为'})
SET 
    n.description = coalesce(n.description, '在睡眠中表现出的伤害性行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高频率');

MERGE (n:Examination {name: '多导睡眠监测 (PSG)'})
SET 
    n.description = coalesce(n.description, '通过监测脑电活动等指标来判断睡眠质量'),
    n.method = coalesce(n.method, '电生理监测'),
    n.requirement = coalesce(n.requirement, '需要专业操作');

MERGE (n:Complication {name: '硬膜下血肿'})
SET 
    n.description = coalesce(n.description, '头部受伤引起的脑膜下出血'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '骨折'})
SET 
    n.description = coalesce(n.description, '由于暴力行为造成的骨折'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '生动梦境'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '暴力行为'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠相关伤害行为'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高频率'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '硬膜下血肿'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '骨折'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '多导睡眠监测 (PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:32:54
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种影响运动功能的神经退行性疾病');

MERGE (n:Disease {name: '过度嗜睡症'})
SET 
    n.description = coalesce(n.description, '日间难以保持清醒的障碍');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '在日间需要持续保持清醒时难以抑制的困倦状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间睡眠质量差'})
SET 
    n.description = coalesce(n.description, '夜间的睡眠受到影响，质量下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Treatment {name: 'CBT'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '认知行为治疗，以改善失眠'),
    n.duration = coalesce(n.duration, '具体时长根据情况而定');

MERGE (n:Treatment {name: '强光治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '利用强光改善睡眠-觉醒周期'),
    n.duration = coalesce(n.duration, '具体时长根据情况而定');

MERGE (n:Treatment {name: '莫达非尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗帕金森病患者的过度嗜睡'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '按需');

MERGE (n:Treatment {name: '阿托莫西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可用于治疗伴有抑郁的过度嗜睡'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '按需');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜间睡眠质量差'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = 'CBT'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '过度嗜睡症'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '过度嗜睡症'
MATCH (to) WHERE to.name = '阿托莫西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:32:55
*/
// 节点更新


// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:32:55
*/
// 节点更新


// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:32:57
*/
// 节点更新
MERGE (n:Disease {name: '快速眼动行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '作为轻症患者的主要干预，主要包括规律作息、良好睡眠卫生等');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '参照原发性RLS的治疗方案，进行合理调整'),
    n.contraindication = coalesce(n.contraindication, '避免将左旋多巴作为主要药物');

MERGE (n:Treatment {name: '补充铁剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '建议补充铁剂，首选口服铁剂联合维生素C治疗'),
    n.duration = coalesce(n.duration, '3个月');

MERGE (n:Complication {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '调整多巴胺受体激动剂剂量需谨慎，防止不良反应如幻觉'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '撤药综合征'})
SET 
    n.description = coalesce(n.description, '调整多巴胺受体激动剂剂量需谨慎，防止不良反应如撤药综合征'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '冲动控制障碍'})
SET 
    n.description = coalesce(n.description, '调整多巴胺受体激动剂剂量需谨慎，防止不良反应如冲动控制障碍'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '快速眼动行为障碍'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '轻症');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '重症');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '重症');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '补充铁剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '补充');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '撤药综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '冲动控制障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:32:58
*/
// 节点更新


// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:33:01
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Treatment {name: '复方左旋多巴缓释剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于夜间帕金森病运动症状加重的药物治疗');

MERGE (n:Treatment {name: '长效多巴胺受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '如罗替高汀贴剂、普拉克索缓释片、罗匹尼罗缓释片');

MERGE (n:Treatment {name: '单胺氧化酶B抑制剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '如雷沙吉兰、恩他卡朋双多巴片');

MERGE (n:Treatment {name: '右佐匹克隆'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '适用于原发性人睡困难和睡眠维持障碍的帕金森病患者');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可考虑用于同时合并失眠、RBD的帕金森病患者及昼夜节律失调性睡眠觉醒障碍');

MERGE (n:Treatment {name: '阿戈美拉汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可考虑用于同时合并失眠、RBD的帕金森病患者及昼夜节律失调性睡眠觉醒障碍');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '复方左旋多巴缓释剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '长效多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '单胺氧化酶B抑制剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '右佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阿戈美拉汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:33:03
*/
// 节点更新


// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:33:06
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病其他异态睡眠'})
SET 
    n.description = coalesce(n.description, '帕金森病患者中多种异态睡眠表现的综合情况');

MERGE (n:Symptom {name: '夜间遗尿'})
SET 
    n.description = coalesce(n.description, '夜间排尿的症状'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '梦魔'})
SET 
    n.description = coalesce(n.description, '梦中受到惊吓或产生困扰的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '夜惊'})
SET 
    n.description = coalesce(n.description, '睡眠中突然惊醒的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '睡行症'})
SET 
    n.description = coalesce(n.description, '在睡眠状态下行走的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠相关性进食障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠中进行进食行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '保证安全措施和良好的睡眠卫生');

MERGE (n:Treatment {name: '催眠疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过催眠技术改善症状');

MERGE (n:Treatment {name: '认知行为疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, 'CBT有助于改善症状');

MERGE (n:Complication {name: 'RBD'})
SET 
    n.description = coalesce(n.description, '快速眼动睡眠行为障碍'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '夜间遗尿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '梦魔'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '夜惊'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '睡眠相关性进食障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '催眠疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '帕金森病其他异态睡眠'
MATCH (to) WHERE to.name = 'RBD'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:33:10
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病失眠'})
SET 
    n.description = coalesce(n.description, '帕金森病常见的睡眠障碍，发生率为30.0%至86.8%.');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '尽管有合适的睡眠机会和环境，仍对睡眠时间和/或质量感到不满足，对日间社会功能影响明显.'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡潜伏期超过30分钟'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '睡眠维持障碍'})
SET 
    n.description = coalesce(n.description, '整夜觉醒次数≥2次，每次觉醒时间>5分钟或总觉醒时间>30分钟'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '夜间过早醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '睡眠质量明显降低'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '总睡眠时间减少'})
SET 
    n.description = coalesce(n.description, '通常睡眠时间少于6.5小时'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Treatment {name: '失眠认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括睡眠卫生教育、刺激控制、限制睡眠、反向意念控制和放松疗法等'),
    n.duration = coalesce(n.duration, '根据患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '音乐疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '有效的治疗方法'),
    n.duration = coalesce(n.duration, '根据患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '体育锻炼'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '中-高强度的锻炼可改善睡眠质量'),
    n.duration = coalesce(n.duration, '根据患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '强光治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '日间和/或睡前接受强光可能对失眠有效'),
    n.duration = coalesce(n.duration, '根据患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '重复经颅磁刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '刺激或抑制大脑特定区域的神经活动改善睡眠质量'),
    n.duration = coalesce(n.duration, '根据治疗计划'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '脑深部电刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '显著改善患者夜间睡眠质量'),
    n.duration = coalesce(n.duration, '根据患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '日间功能障碍'})
SET 
    n.description = coalesce(n.description, '由于失眠影响患者白天功能'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '失眠可能伴随焦虑情绪'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '睡眠维持障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '总睡眠时间减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '失眠认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '音乐疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '体育锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '强光治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '重复经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '脑深部电刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '日间功能障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:33:12
*/
// 节点更新
MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '不宁腿综合症'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗RBD的药物'),
    n.dosage = coalesce(n.dosage, '4 mg'),
    n.duration = coalesce(n.duration, '8周');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗特发性RBD的药物'),
    n.dosage = coalesce(n.dosage, '0.25~2.0 mg'),
    n.contraindication = coalesce(n.contraindication, '增加跌倒风险');

MERGE (n:Treatment {name: '多巴胺受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可用于同时改善运动症状的治疗');

MERGE (n:Treatment {name: '雷美替胺'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '褪黑素受体激动剂');

MERGE (n:Treatment {name: '阿戈美拉汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '褪黑素受体激动剂');

// 关系更新
MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.329),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.15),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '不宁腿综合症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合症'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合症'
MATCH (to) WHERE to.name = '雷美替胺'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合症'
MATCH (to) WHERE to.name = '阿戈美拉汀'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:33:12
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '缺铁性贫血'});

MERGE (n:Disease {name: '糖尿病周围神经病'});

MERGE (n:Disease {name: '肾功能不全'});

MERGE (n:Disease {name: '肺心病'});

MERGE (n:Disease {name: '心律失常'});

MERGE (n:Disease {name: '睡眠低通气综合征'});

MERGE (n:Disease {name: '上气道阻力综合征'});

MERGE (n:Symptom {name: '白天疲劳'});

MERGE (n:Symptom {name: '晨起头痛'});

MERGE (n:Symptom {name: '嗜睡'});

MERGE (n:Symptom {name: '抑郁'});

MERGE (n:Symptom {name: '焦虑'});

MERGE (n:Symptom {name: '性欲减退'});

MERGE (n:Symptom {name: '高血压'});

MERGE (n:Symptom {name: '记忆力下降'});

MERGE (n:Symptom {name: '注意力下降'});

MERGE (n:Symptom {name: '判断力下降'});

MERGE (n:Symptom {name: '警觉性下降'});

MERGE (n:Symptom {name: '精神萎靡'});

MERGE (n:Symptom {name: '失眠'});

MERGE (n:Treatment {name: '持续气道正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '治疗帕金森病合并OSA最有效的方法'),
    n.duration = coalesce(n.duration, '长期');

MERGE (n:Treatment {name: '左旋多巴'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '对上气道梗阻可能有帮助'),
    n.duration = coalesce(n.duration, '根据需要');

MERGE (n:Treatment {name: '息宁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '减轻帕金森病患者夜间OSA症状'),
    n.duration = coalesce(n.duration, '根据需要');

// 关系更新
MATCH (from) WHERE from.name = '白天疲劳'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '晨起头痛'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '嗜睡'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '抑郁'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '性欲减退'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '高血压'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '持续气道正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗通过气道正压通气');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肺心病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '心律失常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '缺铁性贫血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '糖尿病周围神经病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肾功能不全'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '白天疲劳'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '嗜睡'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

