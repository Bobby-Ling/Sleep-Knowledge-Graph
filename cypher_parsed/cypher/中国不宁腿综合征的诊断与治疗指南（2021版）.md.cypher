// File: 中国不宁腿综合征的诊断与治疗指南（2021版）.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:56:07
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种感觉运动障碍性疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Symptom {name: '想要移动腿部的冲动'})
SET 
    n.description = coalesce(n.description, '强烈的、几乎不可抗拒的活动腿的欲望'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '腿部不适感'})
SET 
    n.description = coalesce(n.description, '如蚁爬感、蠕动感、灼烧感、触电感等'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '包括人睡困难、睡眠维持困难等'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '白天');

MERGE (n:Complication {name: '失眠'})
SET 
    n.description = coalesce(n.description, '严重影响生活质量的症状'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '抑郁'})
SET 
    n.description = coalesce(n.description, 'RLS患者常见的心理问题'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, 'RLS患者面临的心理困扰'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, 'PSG能客观显示RLS患者的睡眠紊乱'),
    n.method = coalesce(n.method, '多导睡眠监测(PSG)'),
    n.requirement = coalesce(n.requirement, '夜间监测');

MERGE (n:DrugTreatment {name: '普拉克索'})
SET 
    n.description = coalesce(n.description, 'D1、D2、D3受体激动剂'),
    n.dosage = coalesce(n.dosage, '0.125mg'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '易引起症状恶化');

MERGE (n:DrugTreatment {name: '罗匹尼罗'})
SET 
    n.description = coalesce(n.description, 'D2、D3受体激动剂'),
    n.dosage = coalesce(n.dosage, '0.25mg'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '易引起头昏');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '想要移动腿部的冲动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:56:09
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '卒中'});

MERGE (n:Disease {name: '快速眼动睡眠期行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Disease {name: '缺铁性贫血'});

MERGE (n:Disease {name: '慢性肾脏疾病'});

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '患者表现为腿部不适的症状');

MERGE (n:Symptom {name: '情绪障碍'})
SET 
    n.description = coalesce(n.description, '患者出现情绪障碍的症状');

MERGE (n:NonDrugTreatment {name: '适当体育锻炼'})
SET 
    n.description = coalesce(n.description, '可改善原发性RLS腿部不适症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '定期');

MERGE (n:NonDrugTreatment {name: '物理疗法'})
SET 
    n.description = coalesce(n.description, '改善RLS患者的临床症状、睡眠质量及健康相关生活质量'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每晚');

MERGE (n:NonDrugTreatment {name: '针灸疗法'})
SET 
    n.description = coalesce(n.description, '改善RLS症状及睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '不定期');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '适当体育锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '物理疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '针灸疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '腿部不适'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '情绪障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '快速眼动睡眠期行为障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '快速眼动睡眠期行为障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '缺铁性贫血'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '慢性肾脏疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

