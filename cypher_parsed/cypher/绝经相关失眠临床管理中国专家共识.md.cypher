// File: 绝经相关失眠临床管理中国专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:50
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠不佳的症状'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:NonDrugTreatment {name: '睡眠卫生教育'})
SET 
    n.description = coalesce(n.description, '帮助患者营造良好的睡眠氛围'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '出院后持续关注');

MERGE (n:DrugTreatment {name: '激素治疗'})
SET 
    n.description = coalesce(n.description, '使用雌激素或孕激素改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '依据患者情况'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '根据疗效调整');

MERGE (n:Complication {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '长期失眠可导致健康问题'),
    n.severity = coalesce(n.severity, '高');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠卫生教育'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '全程管理');

MATCH (from) WHERE from.name = '激素治疗'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '根据病情调整');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '激素治疗'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

