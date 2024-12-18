// File: 中国快速眼球运动睡眠期行为障碍诊断与治疗专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:27
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD'),
    n.description = coalesce(n.description, '是一种以REM睡眠期间伴随梦境及肢体活动为特征的睡眠疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '路易体痴呆'});

MERGE (n:Disease {name: '多系统萎缩'});

MERGE (n:Symptom {name: '梦境行为演绎'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期出现与梦境相关的行为'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '暴力行为'})
SET 
    n.description = coalesce(n.description, '伴随有暴力内容的梦境行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '肢体活动'})
SET 
    n.description = coalesce(n.description, '睡眠期间表现出的各种肢体动作'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '安全的睡眠环境'})
SET 
    n.description = coalesce(n.description, '为患者提供相对安全的睡眠环境'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '规律'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '床垫、包角软物');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '有效药物，能减少RBD行为和外伤'),
    n.dosage = coalesce(n.dosage, '0.25-2.00 mg'),
    n.frequency = coalesce(n.frequency, '睡前15分钟'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, 'RBD伴有痴呆或OSAS患者');

MERGE (n:DrugTreatment {name: '褪黑素'})
SET 
    n.description = coalesce(n.description, '对于治疗合并DLB、帕金森病、MSA的RBD患者有明确疗效'),
    n.dosage = coalesce(n.dosage, '3-12 mg'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '多巴受体激动剂'})
SET 
    n.description = coalesce(n.description, '对RBD有一定疗效'),
    n.dosage = coalesce(n.dosage, '每日最大剂量0.7 mg'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '帕罗西汀'})
SET 
    n.description = coalesce(n.description, '可能诱发或加重RBD症状'),
    n.dosage = coalesce(n.dosage, '10-40 mg'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '不推荐用于RBD治疗');

MERGE (n:DrugTreatment {name: '多奈哌齐'})
SET 
    n.description = coalesce(n.description, '可能对RBD症状有缓解作用'),
    n.dosage = coalesce(n.dosage, '10-15 mg'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '有争议');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.33),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多系统萎缩'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 1.0),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '梦境行为演绎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '暴力行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '肢体活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '安全的睡眠环境'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '非药物治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多巴受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '帕罗西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多奈哌齐'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '药物治疗');



// =====================================

