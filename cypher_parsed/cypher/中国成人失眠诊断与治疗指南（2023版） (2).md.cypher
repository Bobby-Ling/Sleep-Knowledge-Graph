// File: 中国成人失眠诊断与治疗指南（2023版） (2).md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 3

/* Response #1
   Timestamp: 2024-12-27 20:08:14
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '尽管有合适的睡眠机会和睡眠环境,依然对睡眠时间和睡眠质量感到不满意'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '人睡困难'})
SET 
    n.description = coalesce(n.description, '入睡困难或者睡眠维持障碍'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '在期望时间较早醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少出现3次');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '日间疲劳感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续出现');

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '情绪不佳，易激惹'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续出现');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '注意力或记忆损害'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续出现');

MERGE (n:NonDrugTreatment {name: '睡眠卫生教育'})
SET 
    n.description = coalesce(n.description, '建立良好的睡眠卫生习惯'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '认知行为疗法'})
SET 
    n.description = coalesce(n.description, '纠正失眠患者错误的睡眠认知与不恰当的行为因素'),
    n.duration = coalesce(n.duration, '需多次参与'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于失眠的鉴别诊断和疗效评估'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '无特殊要求');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '记录每日上床时间，共享睡眠质量'),
    n.method = coalesce(n.method, '自我报告'),
    n.requirement = coalesce(n.requirement, '1-2周');

// 关系更新
MATCH (from) WHERE from.name = '人睡困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '每周至少出现3次'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少出现3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '疲劳'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续出现'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '情绪低落'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续出现'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续出现'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠卫生教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:16
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为入睡困难、睡眠维持困难或睡眠质量不佳'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '睡前很难入睡，常需较长时间才能进入睡眠状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '在夜间多次觉醒，并且难以再次入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠质量不佳'})
SET 
    n.description = coalesce(n.description, '睡眠不够深，常感到疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:DrugTreatment {name: '右美托咪定'})
SET 
    n.description = coalesce(n.description, '一种α2肾上腺素能受体激动剂，能显著改善睡眠效率'),
    n.dosage = coalesce(n.dosage, '根据医师指示'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '根据病情'),
    n.route = coalesce(n.route, '静脉输注'),
    n.contraindication = coalesce(n.contraindication, '麻醉科医师评估');

MERGE (n:DrugTreatment {name: '异丙酚'})
SET 
    n.description = coalesce(n.description, '通过增强GABA功能来调节睡眠平衡，改善抑郁'),
    n.dosage = coalesce(n.dosage, '根据医师指示'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '根据病情'),
    n.route = coalesce(n.route, '静脉输注'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:NonDrugTreatment {name: '认知行为治疗（CBT-I）'})
SET 
    n.description = coalesce(n.description, '一种心理干预方法，通过改变患者信念系统来改善睡眠'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.frequency = coalesce(n.frequency, '通常为6-8次治疗'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '光照治疗'})
SET 
    n.description = coalesce(n.description, '通过调节松果体褪黑素分泌改善睡眠质量'),
    n.duration = coalesce(n.duration, '持续30分钟至2小时'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '光敏性患者需谨慎'),
    n.equipment = coalesce(n.equipment, '光疗仪');

MERGE (n:NonDrugTreatment {name: '声音治疗'})
SET 
    n.description = coalesce(n.description, '通过音乐或噪声影响脑波频率改善睡眠质量'),
    n.duration = coalesce(n.duration, '不限'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '对声音敏感者需谨慎'),
    n.equipment = coalesce(n.equipment, '音乐装置');

MERGE (n:RiskFactor {name: '年龄因素'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '年龄增长与睡眠质量下降相关'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:RiskFactor {name: '心理因素'})
SET 
    n.type = coalesce(n.type, '现病史'),
    n.description = coalesce(n.description, '焦虑和抑郁等心理状态可能导致失眠'),
    n.impact_level = coalesce(n.impact_level, '重');

MERGE (n:Examination {name: '睡眠监测'})
SET 
    n.description = coalesce(n.description, '通过多导睡眠图检查评估睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠质量不佳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '右美托咪定'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '重症失眠治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '异丙酚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知行为治疗（CBT-I）'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '光照治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '声音治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '年龄因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, 'B级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '心理因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '重'),
    r.evidence_level = coalesce(r.evidence_level, 'A级');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #3
   Timestamp: 2024-12-27 20:08:24
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '一种睡眠中呼吸反复暂停的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '在快速眼动睡眠期表现出的异常行为症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '在静止时感到不适，伴随迫使移腿的感觉'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '一种影响情绪的严重精神障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '一种以焦虑和过度担心为特征的精神障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.description = coalesce(n.description, '一种逐渐加重的肺部疾病，影响呼吸'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '脑血管疾病'})
SET 
    n.description = coalesce(n.description, '影响脑血液供应的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠片段化'})
SET 
    n.description = coalesce(n.description, '睡眠中频繁醒来或短暂觉醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间功能损害'})
SET 
    n.description = coalesce(n.description, '白天因缺乏睡眠导致的功能受损'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠症状'})
SET 
    n.description = coalesce(n.description, '夜间入睡困难或睡眠维持困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '过度的担心和不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落或缺乏兴趣'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '缺乏能量和精力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '在睡眠中或日间感到呼吸困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间腿痉挛'})
SET 
    n.description = coalesce(n.description, '夜间腿部肌肉突然收缩造成痛感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠片段化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '日间功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '抑郁症'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '抑郁症'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

