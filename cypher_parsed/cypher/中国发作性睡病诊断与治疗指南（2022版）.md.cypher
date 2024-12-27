// File: 中国发作性睡病诊断与治疗指南（2022版）.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:38
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种导致白天过度嗜睡和猝倒的神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度的困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '突发的肌肉无力与意识丧失'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Symptom {name: '夜间睡眠不安'})
SET 
    n.description = coalesce(n.description, '夜间睡眠质量差'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '人睡前幻觉'})
SET 
    n.description = coalesce(n.description, '入睡时出现的幻觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '入睡或醒来时的身体暂时无法动弹'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:DrugTreatment {name: '替洛利生'})
SET 
    n.description = coalesce(n.description, '新型组胺H3受体拮抗剂/反向激动剂，用于改善EDS和猝倒'),
    n.dosage = coalesce(n.dosage, '最高36 mg/d'),
    n.frequency = coalesce(n.frequency, '每天一次'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '严重不良反应患者禁用');

MERGE (n:DrugTreatment {name: '莫达非尼'})
SET 
    n.description = coalesce(n.description, '用于治疗发作性睡病的首选药物，增强中枢神经的唤醒作用'),
    n.dosage = coalesce(n.dosage, '100~400 mg/d'),
    n.frequency = coalesce(n.frequency, '每天一次到两次'),
    n.duration = coalesce(n.duration, '长期疗程'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '精神病患者慎用');

MERGE (n:DrugTreatment {name: 'γ-羟丁酸钠'})
SET 
    n.description = coalesce(n.description, '神经递质，改善EDS和夜间睡眠不安症状'),
    n.dosage = coalesce(n.dosage, '400~6000 mg'),
    n.frequency = coalesce(n.frequency, '根据患者反应调整'),
    n.duration = coalesce(n.duration, '长期疗程'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '呼吸抑制风险');

MERGE (n:DrugTreatment {name: '索林非妥'})
SET 
    n.description = coalesce(n.description, '双重作用的多巴胺和去甲肾上腺素再摄取抑制剂，用于改善发作性睡病相关症状'),
    n.dosage = coalesce(n.dosage, '75~150 mg/d'),
    n.frequency = coalesce(n.frequency, '每天一次'),
    n.duration = coalesce(n.duration, '长期疗程'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '睡前8小时内禁用');

MERGE (n:DrugTreatment {name: '马吲哚'})
SET 
    n.description = coalesce(n.description, '非苯丙胺类精神振奋剂，用于改善发作性睡病患者的EDS'),
    n.dosage = coalesce(n.dosage, '最大剂量约为" + "75 mg/d'),
    n.frequency = coalesce(n.frequency, '根据需要调整'),
    n.duration = coalesce(n.duration, '长期疗程'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '心脏病患者慎用');

MERGE (n:DrugTreatment {name: '阿莫达非尼'})
SET 
    n.description = coalesce(n.description, '莫达非尼的R型异构体，用于治疗日间嗜睡'),
    n.dosage = coalesce(n.dosage, '100~400 mg/d'),
    n.frequency = coalesce(n.frequency, '每天一次到两次'),
    n.duration = coalesce(n.duration, '长期疗程'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '习惯性滥用者禁用');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '夜间睡眠不安'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '人睡前幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠瘫痪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '改善EDS');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '改善EDS和猝倒');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'γ-羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '改善EDS');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '索林非妥'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '改善EDS');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '马吲哚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '改善EDS');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '阿莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '改善EDS');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:42
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种神经内科的罕见病，主要特征包括日间过度思睡、猝倒、人睡前幻觉和睡眠瘫痪'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在日常生活中难以控制的困倦感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '患者在清醒状态下突然失去肌肉张力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '人睡前幻觉'})
SET 
    n.description = coalesce(n.description, '在入睡前的幻觉体验'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '在入睡或醒来时无法自主活动或讲话的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '夜间睡眠频繁中断'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '脑脊液Hcrt-1检测'})
SET 
    n.description = coalesce(n.description, '用于确认发作性睡病1型的脑脊液Hcrt-1浓度检测'),
    n.method = coalesce(n.method, '脑脊液检测'),
    n.requirement = coalesce(n.requirement, '患者有相关症状');

MERGE (n:Examination {name: '多次睡眠潜伏期试验'})
SET 
    n.description = coalesce(n.description, '用于评估日间过度思睡的严重程度'),
    n.method = coalesce(n.method, '小睡测试'),
    n.requirement = coalesce(n.requirement, '需保证前夜睡眠时间大于6小时');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '人睡前幻觉'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠瘫痪'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间睡眠紊乱'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '脑脊液Hcrt-1检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多次睡眠潜伏期试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

