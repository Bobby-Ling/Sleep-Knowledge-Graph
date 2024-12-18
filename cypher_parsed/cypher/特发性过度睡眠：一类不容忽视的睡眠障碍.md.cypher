// File: 特发性过度睡眠：一类不容忽视的睡眠障碍.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:02
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.code = coalesce(n.code, 'IH'),
    n.description = coalesce(n.description, '一种慢性中枢性嗜睡疾病，主要表现为正常或延长的睡眠时间但白天过度嗜睡。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '过度嗜睡'})
SET 
    n.description = coalesce(n.description, '尽管睡眠时间正常或延长，白天仍会出现过度嗜睡。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠惰性'})
SET 
    n.description = coalesce(n.description, '醒后难以快速清醒，类似醉酒样的感觉。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '认知功能障碍'})
SET 
    n.description = coalesce(n.description, '包括记忆力减退、注意力不集中和常忘记事情。'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '认知行为治疗'})
SET 
    n.description = coalesce(n.description, '通过心理干预改善患者对疾病的认识和应对能力。'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '光照疗法设备');

MERGE (n:NonDrugTreatment {name: '健康教育'})
SET 
    n.description = coalesce(n.description, '对患者进行疾病知识和健康指导。'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '定期'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '抑郁症状'})
SET 
    n.description = coalesce(n.description, '患者可能出现抑郁相关的情绪变化。'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '头痛'})
SET 
    n.description = coalesce(n.description, '常见的伴随症状，可能是偏头痛或紧张型头痛。'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠惰性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '认知功能障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = 'e1'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = 'e2'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '健康教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '常规治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '抑郁症状'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

