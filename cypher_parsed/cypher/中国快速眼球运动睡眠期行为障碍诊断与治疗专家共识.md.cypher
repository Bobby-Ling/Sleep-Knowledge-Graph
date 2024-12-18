// File: 中国快速眼球运动睡眠期行为障碍诊断与治疗专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:56
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD'),
    n.description = coalesce(n.description, '以REM睡眠期间伴随梦境及肢体活动为特征的睡眠疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '与梦境相关的肢体活动'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期出现持续或间歇性肌张力增高、多梦及梦境演绎行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '暴力行为'})
SET 
    n.description = coalesce(n.description, '在发作时可能对自己或他人造成伤害'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Complication {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '神经系统变性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '多系统萎缩'})
SET 
    n.description = coalesce(n.description, '神经系统变性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '路易体痴呆'})
SET 
    n.description = coalesce(n.description, '神经系统变性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:NonDrugTreatment {name: '安全的睡眠环境'})
SET 
    n.description = coalesce(n.description, '为伴有伤害性行为的RBD患者提供相对安全的睡眠环境'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '床垫、软物包装家具边角');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '治疗RBD的有效药物'),
    n.dosage = coalesce(n.dosage, '0.25-2.00 mg'),
    n.frequency = coalesce(n.frequency, '睡前15分钟'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '伴有痴呆、步态异常、OSAS的患者');

MERGE (n:DrugTreatment {name: '褪黑素'})
SET 
    n.description = coalesce(n.description, '对治疗合并DLB、帕金森病、MSA的RBD患者有明确疗效'),
    n.dosage = coalesce(n.dosage, '3-12 mg'),
    n.frequency = coalesce(n.frequency, '睡前'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '多巴受体激动剂'})
SET 
    n.description = coalesce(n.description, '对RBD治疗效果尚不肯定，部分有效'),
    n.dosage = coalesce(n.dosage, '每日最大剂量不超过0.7 mg'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '持续'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '伴有神经退行性疾病的RBD患者');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '与梦境相关的肢体活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '暴力行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.33),
    r.timeframe = coalesce(r.timeframe, '数年或数十年');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多系统萎缩'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '数年或数十年');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 1.0),
    r.timeframe = coalesce(r.timeframe, '数年或数十年');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '安全的睡眠环境'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

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



// =====================================

