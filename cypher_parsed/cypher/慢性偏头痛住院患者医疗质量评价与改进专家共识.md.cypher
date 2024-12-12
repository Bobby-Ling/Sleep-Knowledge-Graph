// File: 慢性偏头痛住院患者医疗质量评价与改进专家共识.md
// Processed at: 2024-12-12 01:31:26
// Total pairs: 12

/* Response #1
   Timestamp: 2024-12-12 01:30:58
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:31:01
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:31:04
*/
// 节点更新
MERGE (n:Disease {name: '慢性偏头痛'})
SET 
    n.description = coalesce(n.description, '脑部的慢性疼痛状态，通常表现为反复发作的剧烈头痛');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '通常为一侧或双侧的剧烈疼痛'),
    n.severity = coalesce(n.severity, '中重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '急性止痛药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解头痛急性发作的药物'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '持续至疼痛缓解'),
    n.contraindication = coalesce(n.contraindication, '对药物过敏');

// 关系更新
MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '慢性偏头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '急性止痛药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '发作时');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:31:04
*/
// 节点更新


// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:31:08
*/
// 节点更新
MERGE (n:Disease {name: '偏头痛'})
SET 
    n.description = coalesce(n.description, '一种高致残性的原发性头痛疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '发作时伴随的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发作时');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '发作时伴随的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发作时');

MERGE (n:Symptom {name: '畏光'})
SET 
    n.description = coalesce(n.description, '发作时伴随的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发作时');

MERGE (n:Symptom {name: '畏声'})
SET 
    n.description = coalesce(n.description, '发作时伴随的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发作时');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '常与慢性偏头痛合并的共病'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '常与慢性偏头痛合并的共病'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '常与慢性偏头痛合并的共病'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '畏光'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '畏声'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:31:10
*/
// 节点更新
MERGE (n:Disease {name: '偏头痛'})
SET 
    n.description = coalesce(n.description, '一种高发病率、高致残率的原发性疾病，以发作性中重度的搏动样头痛为特征');

MERGE (n:Disease {name: '慢性偏头痛'})
SET 
    n.description = coalesce(n.description, '当患者头痛持续超过3个月，每月头痛超过15天，符合偏头痛特点的头痛天数超过8天可诊断为慢性偏头痛');

MERGE (n:Disease {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '一种常见的心理障碍，表现为过度担忧和紧张');

MERGE (n:Disease {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '一种常见的情绪障碍，导致持久的悲伤和失去兴趣');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '表现为难以入睡、维持睡眠或早醒等问题');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '一种不适，这种感觉通常伴随着呕吐');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '反射性排出胃内容物的过程');

MERGE (n:Symptom {name: '畏光'})
SET 
    n.description = coalesce(n.description, '对光线的过敏反应');

MERGE (n:Symptom {name: '畏声'})
SET 
    n.description = coalesce(n.description, '对声音的敏感或不适');

// 关系更新
MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每月超过15天'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每月超过15天'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '畏光'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每月超过15天'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '畏声'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每月超过15天'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '常见');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '常见');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '常见');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:31:10
*/
// 节点更新


// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:31:10
*/
// 节点更新


// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:31:13
*/
// 节点更新
MERGE (n:Disease {name: '慢性偏头痛'});

MERGE (n:Symptom {name: '头痛发作严重程度'})
SET 
    n.description = coalesce(n.description, '记录头痛严重程度（视觉模拟量表 VAS评分）的例数'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头痛发作频率'})
SET 
    n.description = coalesce(n.description, '记录头痛发作频率的例数'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Treatment {name: '急性期治疗药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解头痛的药物'),
    n.dosage = coalesce(n.dosage, '根据处方'),
    n.duration = coalesce(n.duration, '根据发作情况'),
    n.contraindication = coalesce(n.contraindication, '阿片类药物可能导致成瘾性');

MERGE (n:Treatment {name: '对乙酰氨基酚'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '常用的急性期治疗药物'),
    n.dosage = coalesce(n.dosage, '根据剂量'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '肝功能不全');

MERGE (n:Treatment {name: '非甾体抗炎药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解疼痛的药物'),
    n.dosage = coalesce(n.dosage, '根据剂量'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '胃肠道溃疡');

MERGE (n:Treatment {name: '曲坦类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '偏头痛急性治疗药物'),
    n.dosage = coalesce(n.dosage, '根据处方'),
    n.duration = coalesce(n.duration, '根据发作情况'),
    n.contraindication = coalesce(n.contraindication, '局部血管病');

MERGE (n:Treatment {name: '降钙素基因相关肽受体拮抗剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于偏头痛治疗的药物'),
    n.dosage = coalesce(n.dosage, '根据医生指导'),
    n.duration = coalesce(n.duration, '根据发作情况'),
    n.contraindication = coalesce(n.contraindication, '心血管疾病');

MERGE (n:Complication {name: '药物过度使用性头痛'})
SET 
    n.description = coalesce(n.description, '因药物过度使用而引发的头痛'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '耐药性'})
SET 
    n.description = coalesce(n.description, '对药物的敏感性下降'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '头痛发作严重程度'
MATCH (to) WHERE to.name = '慢性偏头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '头痛发作频率'
MATCH (to) WHERE to.name = '慢性偏头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '急性期治疗药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '对乙酰氨基酚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '非甾体抗炎药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.87),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '曲坦类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.92),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '降钙素基因相关肽受体拮抗剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.91),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '药物过度使用性头痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '药物过度使用性头痛'
MATCH (to) WHERE to.name = '耐药性'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:31:17
*/
// 节点更新


// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:31:25
*/
// 节点更新
MERGE (n:Disease {name: '慢性偏头痛'});

MERGE (n:Treatment {name: '止痛药物戒断'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对过度使用止痛药的患者进行戒断治疗'),
    n.duration = coalesce(n.duration, '根据患者个体情况'),
    n.contraindication = coalesce(n.contraindication, '药物过敏');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '反复发作的头痛症状'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每月多次');

MERGE (n:Scale {name: '偏头痛残疾程度评估问卷(MIDAS)'})
SET 
    n.description = coalesce(n.description, '评估偏头痛患者的残疾程度'),
    n.score_range = coalesce(n.score_range, '0-100'),
    n.interpretation = coalesce(n.interpretation, '得分越高，残疾程度越重');

MERGE (n:Scale {name: '儿童青少年头痛残疾量表(RedMIDAS)'})
SET 
    n.description = coalesce(n.description, '专门评估儿童和青少年偏头痛的残疾程度'),
    n.score_range = coalesce(n.score_range, '0-100'),
    n.interpretation = coalesce(n.interpretation, '得分越高，残疾程度越重');

MERGE (n:Scale {name: '头痛影响测定量表(HIT-6)'})
SET 
    n.description = coalesce(n.description, '评估头痛对患者生活质量的影响'),
    n.score_range = coalesce(n.score_range, '36-78'),
    n.interpretation = coalesce(n.interpretation, '得分越高，影响越大');

// 关系更新
MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '慢性偏头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '止痛药物戒断'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '偏头痛残疾程度评估问卷(MIDAS)'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.95),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '儿童青少年头痛残疾量表(RedMIDAS)'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '适用');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '头痛影响测定量表(HIT-6)'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.92),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:31:26
*/
// 节点更新
MERGE (n:Disease {name: '慢性偏头痛'});

MERGE (n:Disease {name: '共病睡眠障碍'});

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '显著增加了慢性偏头痛患者的疾病负担');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '显著增加了慢性偏头痛患者的疾病负担');

MERGE (n:Scale {name: '广泛性焦虑量表 (GAD-7)'})
SET 
    n.description = coalesce(n.description, '用于评估焦虑状态');

MERGE (n:Scale {name: '汉密尔顿焦虑量表 (HAMA)'})
SET 
    n.description = coalesce(n.description, '用于评估焦虑状态');

MERGE (n:Scale {name: 'PHQ-9 健康问卷'})
SET 
    n.description = coalesce(n.description, '用于评估抑郁状态');

MERGE (n:Scale {name: '汉密尔顿抑郁量表 (HAMD)'})
SET 
    n.description = coalesce(n.description, '用于评估抑郁状态');

MERGE (n:Scale {name: '匹兹堡睡眠质量指数 (PSQI)'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠质量');

// 关系更新
MATCH (from) WHERE from.name = '慢性偏头痛'
MATCH (to) WHERE to.name = '共病睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '住院期间');



// =====================================

