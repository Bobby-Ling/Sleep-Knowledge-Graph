// File: 中国儿童阻塞性睡眠呼吸暂停诊断与治疗指南（2020）.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:08:17
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '与正常体重患儿相比，术前肥胖患儿发生术后OSA持续存在的风险显著增加'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '超重'})
SET 
    n.description = coalesce(n.description, '与体重正常患儿相比，超重患儿不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '伴随疾病'})
SET 
    n.description = coalesce(n.description, '伴随哮喘和变应性鼻炎不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: '疾病家族史'})
SET 
    n.description = coalesce(n.description, '有SDB家族史和过敏家族史均不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:NonDrugTreatment {name: '鼻用糖皮质激素'})
SET 
    n.description = coalesce(n.description, '治疗轻、中度OSA的药物'),
    n.duration = coalesce(n.duration, '6周'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '孟鲁司特钠'})
SET 
    n.description = coalesce(n.description, '用于OSA治疗的药物'),
    n.duration = coalesce(n.duration, '3个月'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, 'OSA相关的呼吸暂停症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '低氧血症'})
SET 
    n.description = coalesce(n.description, 'OSA引发的低氧血症'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '超重'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '伴随疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '弱');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '疾病家族史'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '弱');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻用糖皮质激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '孟鲁司特钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '低氧血症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:22
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '指儿童睡眠过程中频繁发生部分或完全上气道阻塞，干扰儿童的正常通气和睡眠结构而引起的一系列病理生理变化'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '腺样体肥大'})
SET 
    n.description = coalesce(n.description, '腺样体的增生或肥大，可能导致上气道阻塞'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '扁桃体的增生或肥大，可能导致上气道阻塞'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重超标，可能导致或加重睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '儿童因睡眠呼吸暂停导致的情绪或行为问题'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '学习障碍'})
SET 
    n.description = coalesce(n.description, '因睡眠呼吸暂停引起的学习方面的困难'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '神经认知损伤'})
SET 
    n.description = coalesce(n.description, '儿童因睡眠呼吸暂停导致的认知能力受损'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '因睡眠呼吸暂停导致的血压升高'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出的声音，可能是呼吸道阻塞的表现'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠时的一种中断呼吸状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到极度困倦和疲劳'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠图，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '监测睡眠时生理变化'),
    n.requirement = coalesce(n.requirement, '医院');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '扁桃体肥大'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '行为异常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '学习障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '神经认知损伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

