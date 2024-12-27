// File: 中国儿童阻塞性睡眠呼吸暂停诊断与治疗指南（2020）.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:19
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '儿童常见的睡眠障碍，表现为夜间呼吸暂停或气流减少'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '鼾声'})
SET 
    n.description = coalesce(n.description, '夜间发出的声音，通常与阻塞性睡眠呼吸暂停有关'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天出现的异常困倦状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '体重增加'})
SET 
    n.description = coalesce(n.description, '超重或肥胖状态，可能导致OSA的风险增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于监测睡眠中呼吸情况的检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '住院观察');

MERGE (n:DrugTreatment {name: '鼻用糖皮质激素'})
SET 
    n.description = coalesce(n.description, '用于减轻鼻部症状的类固醇药物'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '鼻用'),
    n.contraindication = coalesce(n.contraindication, '对成分过敏');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '体重过重会增加OSA的发生风险'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Complication {name: '低氧血症'})
SET 
    n.description = coalesce(n.description, '睡眠期间血氧水平降低'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼾声'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '体重增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻用糖皮质激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '对症治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '低氧血症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:24
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '指儿童睡眠过程中频繁发生部分或完全上气道阻塞，干扰儿童的正常通气和睡眠结构而引起的一系列病理生理变化'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠时张开嘴巴呼吸'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中呼吸暂时停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '学习障碍'})
SET 
    n.description = coalesce(n.description, '在学习过程中表现出的困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '情绪或行为表现异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '反复觉醒'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '住院观察');

MERGE (n:NonDrugTreatment {name: '腺样体和扁桃体切除术'})
SET 
    n.description = coalesce(n.description, '切除腺样体和扁桃体作为中度和重度OSA患儿的治疗方案'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '一次性'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '手术器械');

MERGE (n:Complication {name: '颌面发育异常'})
SET 
    n.description = coalesce(n.description, '面部发育出现异常'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '神经认知损伤'})
SET 
    n.description = coalesce(n.description, '大脑功能受损'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '血压升高'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '扁桃体肥大'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '扁桃体增大导致上气道阻塞'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '腺样体肥大'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '腺样体增大阻塞气道'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '超重可能加剧阻塞'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '学习障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '行为异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '反复觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体和扁桃体切除术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '主要治疗');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '颌面发育异常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '神经认知损伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '中期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '扁桃体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

