// File: 女性阻塞性睡眠呼吸暂停诊治专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:43
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种睡眠障碍，特征为睡眠中发生反复呼吸暂停或低通气'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间发出声响，影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦，难以保持清醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或维持睡眠的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时头部疼痛的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '因睡眠障碍引发的情绪紧张'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠呼吸暂停'),
    n.method = coalesce(n.method, '监测呼吸、睡眠状态'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:NonDrugTreatment {name: '持续气道正压通气(CPAP)'})
SET 
    n.description = coalesce(n.description, '通过持续正压气体维持气道通畅的治疗方法'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '严重肺部疾病'),
    n.equipment = coalesce(n.equipment, '呼吸机');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '体重指数(BMI)较高，是OSA的重要危险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '绝经'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '女性绝经后激素水平变化，与OSA的发病有关'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, 'OSA可增加女性高血压和心脏病的风险'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '妊娠期并发症'})
SET 
    n.description = coalesce(n.description, 'OSA增加孕妇和胎儿健康风险，包括胎儿生长受限'),
    n.severity = coalesce(n.severity, '高');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '晨起头痛'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '持续气道正压通气(CPAP)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '绝经'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:46
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '女性群体中普遍存在的睡眠呼吸疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头疼'})
SET 
    n.description = coalesce(n.description, '早晨起床时感到头痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或睡眠不深'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '感到紧张或不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '诊断阻塞性睡眠呼吸暂停的金标准'),
    n.method = coalesce(n.method, '整夜录制睡眠数据'),
    n.requirement = coalesce(n.requirement, '在睡眠中心进行监测');

MERGE (n:NonDrugTreatment {name: '减重'})
SET 
    n.description = coalesce(n.description, '通过减少体重来改善OSA症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '定期'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '体位治疗'})
SET 
    n.description = coalesce(n.description, '通过改变睡眠位置来减轻OSA症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '定期'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '睡姿训练器');

MERGE (n:NonDrugTreatment {name: '运动疗法'})
SET 
    n.description = coalesce(n.description, '进行适度运动以改善OSA症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '定期'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '运动器材');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, '阻塞性睡眠呼吸暂停可能导致的心血管问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '与阻塞性睡眠呼吸暂停相关的代谢性疾病'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头疼'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '减重'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '体位治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '运动疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

