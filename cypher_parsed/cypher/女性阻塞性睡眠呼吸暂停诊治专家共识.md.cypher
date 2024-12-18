// File: 女性阻塞性睡眠呼吸暂停诊治专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:55:59
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种因上气道反复塌陷而导致的睡眠呼吸障碍，表现为夜间打鼾、呼吸暂停和日间过度嗜睡等症状'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠中发出的噪音，可能伴随呼吸暂停'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常困倦，影响日常活动和生活'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每天');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或维持睡眠困难，夜间经常醒来'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到头痛，可能与睡眠质量差有关'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '每天');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '感到紧张或担忧的情绪状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '每天');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '梦中经历恐怖或烦恼的情节，常导致觉醒'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重过重，对呼吸道施加了额外压力，增加OSA风险'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '脱发'})
SET 
    n.description = coalesce(n.description, '可能与内分泌变化或生活方式有关，影响OSA症状'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '绝经'})
SET 
    n.description = coalesce(n.description, '性激素水平变化，可能导致OSA发生的风险增加'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '一种可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '心力衰竭'})
SET 
    n.description = coalesce(n.description, 'OSA可增加心力衰竭的发生风险'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Treatment {name: '连续气道正压通气(CPAP)'})
SET 
    n.description = coalesce(n.description, '常用于治疗OSA的设备，通过持续气道正压保持上气道开放'),
    n.effectiveness = coalesce(n.effectiveness, '0.90'),
    n.priority = coalesce(n.priority, '高'),
    n.stage = coalesce(n.stage, '长期');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '脱发'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '绝经'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '连续气道正压通气(CPAP)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:56:01
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '睡眠期间反复出现呼吸暂停或通气减少的疾病'),
    n.category = coalesce(n.category, '呼吸系统疾病'),
    n.severity = coalesce(n.severity, '中-重度');

MERGE (n:NonDrugTreatment {name: '减重'})
SET 
    n.description = coalesce(n.description, '通过减轻体重来改善OSA症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '肥胖患者');

MERGE (n:NonDrugTreatment {name: '饮食控制'})
SET 
    n.description = coalesce(n.description, '通过合理饮食来辅助减重和改善OSA症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '对食物过敏');

MERGE (n:NonDrugTreatment {name: '运动'})
SET 
    n.description = coalesce(n.description, '通过有氧运动和抗阻训练来改善OSA症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每周几次'),
    n.contraindication = coalesce(n.contraindication, '心肺疾病患者');

MERGE (n:NonDrugTreatment {name: '体位治疗'})
SET 
    n.description = coalesce(n.description, '通过改变睡眠姿势来减轻OSA症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每晚'),
    n.contraindication = coalesce(n.contraindication, '对体位舒适性要求');

MERGE (n:NonDrugTreatment {name: '减少乙醇摄入'})
SET 
    n.description = coalesce(n.description, '限制酒精摄入量以降低OSA风险'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每周'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:NonDrugTreatment {name: '慎用镇静催眠药物'})
SET 
    n.description = coalesce(n.description, '谨慎使用可能加重OSA症状的药物'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Disease {name: '合并症'})
SET 
    n.code = coalesce(n.code, 'MC'),
    n.description = coalesce(n.description, '与OSA相关的其他疾病'),
    n.category = coalesce(n.category, '综合症'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, '可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '高脂血症'})
SET 
    n.description = coalesce(n.description, '可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '支气管哮喘'})
SET 
    n.description = coalesce(n.description, '可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, '可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '骨关节疾病'})
SET 
    n.description = coalesce(n.description, '可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '反流性胃炎'})
SET 
    n.description = coalesce(n.description, '可能由OSA引起的并发症'),
    n.severity = coalesce(n.severity, '低');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '评价夜间睡眠和呼吸'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '夜间监测');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '减重'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '饮食控制'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '基础治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '运动'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '基础治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '体位治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '减少乙醇摄入'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '风险控制');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '慎用镇静催眠药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '风险控制');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高脂血症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '支气管哮喘'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺功能减退症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '骨关节疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.45),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '反流性胃炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

