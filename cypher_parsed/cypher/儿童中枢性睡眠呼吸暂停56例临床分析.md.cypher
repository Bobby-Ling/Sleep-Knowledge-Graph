// File: 儿童中枢性睡眠呼吸暂停56例临床分析.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:51
*/
// 节点更新
MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '以呼吸驱动缺乏或异常导致的通气功能障碍为特征'),
    n.code = coalesce(n.code, 'CSA'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '轻度至重度');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠过程中频繁发生部分或全部上气道阻塞'),
    n.code = coalesce(n.code, 'OSA'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '轻度至重度');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠时出现的暂停呼吸现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出的响亮呼吸声'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠时嘴巴张开呼吸'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:RiskFactor {name: '腺样体肥大'})
SET 
    n.description = coalesce(n.description, '腺样体增生导致气道阻塞'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:Complication {name: 'Chiari畸形'})
SET 
    n.description = coalesce(n.description, '小脑扁桃体下疝'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '脑干肿瘤'})
SET 
    n.description = coalesce(n.description, '影响中枢神经功能的肿瘤'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Complication {name: '遗传代谢病'})
SET 
    n.description = coalesce(n.description, '由基因异常引起的代谢问题'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.673),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.673),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'Chiari畸形'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.1),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '脑干肿瘤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.1),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '遗传代谢病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.1),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

