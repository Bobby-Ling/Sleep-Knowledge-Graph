// File: 中国发作性睡病诊断与治疗指南（2022版）.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 4

/* Response #1
   Timestamp: 2024-12-18 09:56:10
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种神经内科的罕见病'),
    n.severity = coalesce(n.severity, '罕见');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天难以遏制的困倦或睡眠反复发作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '发作性睡病最具特征性的临床表现'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '约75%');

MERGE (n:Symptom {name: '人睡前幻觉'})
SET 
    n.description = coalesce(n.description, '在觉醒-睡眠转换期的一种梦境样体验'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '33%-80%');

MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '发生在刚入睡或从睡眠向觉醒转换过程'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '25%-50%');

MERGE (n:Symptom {name: '夜间睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '表现为反复夜间睡眠中断'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '30%-95%');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估夜间睡眠状况'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '要求患者卧床时间至少7小时');

MERGE (n:DrugTreatment {name: '兴奋剂'})
SET 
    n.description = coalesce(n.description, '用于减少日间过度思睡症状'),
    n.dosage = coalesce(n.dosage, '个体化'),
    n.frequency = coalesce(n.frequency, '根据症状'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '心血管疾病患者');

MERGE (n:NonDrugTreatment {name: '日间规律小睡'})
SET 
    n.description = coalesce(n.description, '通过小睡改善觉醒水平'),
    n.duration = coalesce(n.duration, '每日'),
    n.frequency = coalesce(n.frequency, '2-3次'),
    n.contraindication = coalesce(n.contraindication, '应避免疲劳过度'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '发作性睡病患者体重多高于同龄人'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '精神障碍'})
SET 
    n.description = coalesce(n.description, '25%的患者有惊恐发作或社交恐惧等症状'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '人睡前幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠瘫痪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '夜间睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '兴奋剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期管理');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间规律小睡'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '精神障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:56:13
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'EDS'),
    n.description = coalesce(n.description, '发作性睡病是一种影响日间警觉性和睡眠模式的神经系统疾病。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'EDS'),
    n.description = coalesce(n.description, '日间过度思睡是发作性睡病常见的症状之一。'),
    n.category = coalesce(n.category, '症状'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '猝倒'})
SET 
    n.code = coalesce(n.code, 'cataplexy'),
    n.description = coalesce(n.description, '猝倒是发作性睡病的一种症状，表现为突发的肌肉无力。'),
    n.category = coalesce(n.category, '症状'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:DrugTreatment {name: '替洛利生'})
SET 
    n.description = coalesce(n.description, '替洛利生是一种新型的组胺H3受体拮抗剂/反向激动剂，用于改善发作性睡病患者的EDS和猝倒。'),
    n.dosage = coalesce(n.dosage, '18-36 mg/d'),
    n.frequency = coalesce(n.frequency, '每天一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:DrugTreatment {name: '莫达非尼'})
SET 
    n.description = coalesce(n.description, '莫达非尼用于治疗发作性睡病，可改善患者的EDS。'),
    n.dosage = coalesce(n.dosage, '200-400 mg/d'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '青光眼患者');

MERGE (n:DrugTreatment {name: '羟丁酸钠'})
SET 
    n.description = coalesce(n.description, '羟丁酸钠能够改善发作性睡病患者的EDS和猝倒。'),
    n.dosage = coalesce(n.dosage, '6.0 g/d'),
    n.frequency = coalesce(n.frequency, '每天一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '严重呼吸抑制');

MERGE (n:DrugTreatment {name: '阿莫达非尼'})
SET 
    n.description = coalesce(n.description, '阿莫达非尼为莫达非尼的R型异构体，用于治疗发作性睡病的EDS。'),
    n.dosage = coalesce(n.dosage, '50-100 mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:DrugTreatment {name: '哌甲酯'})
SET 
    n.description = coalesce(n.description, '哌甲酯是一种苯丙胺类药物，改善发作性睡病患者的EDS。'),
    n.dosage = coalesce(n.dosage, '18-54 mg/d'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '高血压患者');

MERGE (n:DrugTreatment {name: '马吲哚'})
SET 
    n.description = coalesce(n.description, '马吲哚是一种精神振奋剂，用于改善发作性睡病患者的EDS和猝倒。'),
    n.dosage = coalesce(n.dosage, '75-150 mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '心血管疾病患者');

MERGE (n:DrugTreatment {name: '索林非妥'})
SET 
    n.description = coalesce(n.description, '索林非妥为多巴胺和去甲肾上腺素再摄取抑制剂，用于治疗发作性睡病的EDS。'),
    n.dosage = coalesce(n.dosage, '75-150 mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '有心脏病史');

MERGE (n:DrugTreatment {name: '文拉法辛'})
SET 
    n.description = coalesce(n.description, '文拉法辛为抗抑郁药，用于改善发作性睡病患者的猝倒症状。'),
    n.dosage = coalesce(n.dosage, '37.5-225 mg/d'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '糖尿病患者');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到极度困倦，影响正常生活和工作。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '猝倒发作'})
SET 
    n.description = coalesce(n.description, '突发性肌肉无力，导致患者倒下或失去控制。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '阿莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '哌甲酯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '马吲哚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '索林非妥'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '文拉法辛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '羟丁酸钠'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #3
   Timestamp: 2024-12-18 16:48:13
*/
// 节点更新


// =====================================

/* Response #4
   Timestamp: 2024-12-18 16:48:13
*/
// 节点更新


// =====================================

