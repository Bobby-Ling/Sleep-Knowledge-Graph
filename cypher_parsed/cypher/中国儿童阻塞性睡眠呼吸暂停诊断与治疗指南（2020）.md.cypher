// File: 中国儿童阻塞性睡眠呼吸暂停诊断与治疗指南（2020）.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:56:05
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '儿童常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '与正常体重患儿相比, 术前肥胖患儿发生术后OSA持续存在的风险是其4.11倍'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '超重'})
SET 
    n.description = coalesce(n.description, '超重患儿与体重正常患儿相比, 不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '伴随疾病'})
SET 
    n.description = coalesce(n.description, '伴随哮喘和变应性鼻炎不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: '家族史'})
SET 
    n.description = coalesce(n.description, 'SDB家族史和过敏家族史不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:NonDrugTreatment {name: '无创正压通气'})
SET 
    n.description = coalesce(n.description, '用于OSA患儿的有效治疗方法'),
    n.duration = coalesce(n.duration, '持续使用'),
    n.frequency = coalesce(n.frequency, '必要时使用'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '正压通气设备');

MERGE (n:Complication {name: '再睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '术后OSA患儿可能持续存在的呼吸暂停'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: 'OSA症状'})
SET 
    n.description = coalesce(n.description, '包括打鼾、呼吸暂停等症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '超重'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '低');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '伴随疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '低');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '家族史'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '低');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '无创正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '再睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.18),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = 'OSA症状'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:56:08
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '儿童睡眠过程中频繁发生部分或完全上气道阻塞, 干扰儿童的正常通气和睡眠结构而引起的一系列病理生理变化'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '腺样体肥大'})
SET 
    n.description = coalesce(n.description, '腺样体肥大可能导致儿童上气道阻塞'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '扁桃体肥大可能导致儿童上气道阻塞'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '颌面发育异常'})
SET 
    n.description = coalesce(n.description, '腺样体面容引起的颌面发育异常'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '学习障碍'})
SET 
    n.description = coalesce(n.description, '儿童因OSA导致的学习能力下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '生长发育落后'})
SET 
    n.description = coalesce(n.description, '儿童因OSA导致的生长问题'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '神经认知损伤'})
SET 
    n.description = coalesce(n.description, '因OSA影响儿童的认知能力'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '内分泌代谢失调'})
SET 
    n.description = coalesce(n.description, 'OSA可能导致的内分泌问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '儿童因OSA导致的高血压问题'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '肺动脉高压'})
SET 
    n.description = coalesce(n.description, '因OSA导致的肺动脉压力增高'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出声响'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中出现停顿'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠时张嘴呼吸'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠障碍的标准方法'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

MERGE (n:NonDrugTreatment {name: '手术'})
SET 
    n.description = coalesce(n.description, '腺样体和扁桃体切除术'),
    n.duration = coalesce(n.duration, '一次性'),
    n.frequency = coalesce(n.frequency, '不适用'),
    n.contraindication = coalesce(n.contraindication, '无手术禁忌'),
    n.equipment = coalesce(n.equipment, '手术器械');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '颌面发育异常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '学习障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '生长发育落后'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '神经认知损伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '内分泌代谢失调'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肺动脉高压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '主要治疗');



// =====================================

