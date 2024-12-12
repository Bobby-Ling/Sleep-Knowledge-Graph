// File: 女性阻塞性睡眠呼吸暂停诊治专家共识.md
// Processed at: 2024-12-12 01:58:37
// Total pairs: 23

/* Response #1
   Timestamp: 2024-12-12 01:57:33
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '女性阻塞性睡眠呼吸暂停存在性别差异，不同生命阶段女性OSA各具特征'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '妊娠期OSA相关问题'})
SET 
    n.description = coalesce(n.description, '妊娠期女性阻塞性睡眠呼吸暂停的相关问题'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期OSA相关问题'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '在妊娠期间');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:57:35
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OsA');

MERGE (n:Complication {name: '妊娠期间阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '阻塞性睡眠呼吸暂停在妊娠期间的特点'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期间阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '妊娠期');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:57:39
*/
// 节点更新
MERGE (n:Disease {name: '绝经'})
SET 
    n.description = coalesce(n.description, '女性在60岁及以上常见的生理状态，导致女性雌激素水平显著下降');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA'),
    n.description = coalesce(n.description, '一种睡眠障碍，表现为多次呼吸中断或减少');

MERGE (n:Disease {name: '鼾症'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，多由上气道阻塞引起');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '绝经'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '鼾症'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经'
MATCH (to) WHERE to.name = '鼾症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:57:40
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '缺乏典型症状'})
SET 
    n.description = coalesce(n.description, '女性OSA往往缺乏典型症状'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '不定');

MERGE (n:Treatment {name: 'OSA诊断与治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '提高对女性OSA的认识、早期诊断和治疗'),
    n.duration = coalesce(n.duration, '长期');

MERGE (n:Complication {name: '妊娠相关问题'})
SET 
    n.description = coalesce(n.description, '妊娠期OSA相关问题'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:RiskFactor {name: '女性生理和内分泌状态'})
SET 
    n.description = coalesce(n.description, '女性不同生命阶段的生理和内分泌状态'),
    n.impact_level = coalesce(n.impact_level, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '缺乏典型症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA诊断与治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠相关问题'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '妊娠期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '女性生理和内分泌状态'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '高');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:57:44
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '女性不同生命阶段的OSA患病率存在差异'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '鼾症'})
SET 
    n.description = coalesce(n.description, '睡眠时发出呼噜声'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:RiskFactor {name: '扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '扁桃体的异常增大'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:RiskFactor {name: '腺样体肥大'})
SET 
    n.description = coalesce(n.description, '腺样体的异常增大'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重超标，影响呼吸道'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, '甲状腺激素不足'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '肢端肥大症'})
SET 
    n.description = coalesce(n.description, '生长激素过多导致的疾病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '多囊卵巢综合征'})
SET 
    n.description = coalesce(n.description, '一种影响女性内分泌的疾病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Disease {name: '妊娠期阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'GOSA'),
    n.description = coalesce(n.description, '妊娠期OSA患病率上升，随妊娠周数增加而增加'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '围绝经期阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'P-OSA'),
    n.description = coalesce(n.description, '围绝经期女性OSA的患病率明显升高'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼾症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '可能'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '扁桃体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺功能减退症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肢端肥大症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多囊卵巢综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '妊娠期');

MATCH (from) WHERE from.name = '围绝经期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '围绝经期');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:57:51
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '子痫前期'})
SET 
    n.short_name = coalesce(n.short_name, 'Pre-eclampsia');

MERGE (n:Disease {name: '高血压疾病'})
SET 
    n.short_name = coalesce(n.short_name, 'HDP');

MERGE (n:Disease {name: '妊娠期糖尿病'})
SET 
    n.short_name = coalesce(n.short_name, 'GDM');

MERGE (n:Disease {name: '围产期心肌病'})
SET 
    n.short_name = coalesce(n.short_name, 'Peripartum cardiomyopathy');

MERGE (n:Disease {name: '充血性心力衰竭'})
SET 
    n.short_name = coalesce(n.short_name, 'Congestive heart failure');

MERGE (n:Disease {name: '肺水肿'})
SET 
    n.short_name = coalesce(n.short_name, 'Pulmonary edema');

MERGE (n:Disease {name: '胎盘组织缺氧'})
SET 
    n.short_name = coalesce(n.short_name, 'Placental hypoxia');

MERGE (n:Disease {name: '胎儿宫内生长受限'})
SET 
    n.short_name = coalesce(n.short_name, 'Fetal growth restriction');

MERGE (n:Disease {name: '死胎'})
SET 
    n.short_name = coalesce(n.short_name, 'Stillbirth');

MERGE (n:Disease {name: '早产'})
SET 
    n.short_name = coalesce(n.short_name, 'Preterm birth');

MERGE (n:Disease {name: '低出生体重'})
SET 
    n.short_name = coalesce(n.short_name, 'Low birth weight');

MERGE (n:Disease {name: '低Apgar评分'})
SET 
    n.short_name = coalesce(n.short_name, 'Low Apgar score');

MERGE (n:Disease {name: '新生儿室息'})
SET 
    n.short_name = coalesce(n.short_name, 'Neonatal respiratory depression');

MERGE (n:Disease {name: '新生儿入住监护病房'})
SET 
    n.short_name = coalesce(n.short_name, 'Neonatal ICU admission');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '子痫前期'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '围产期心肌病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 2.5),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '充血性心力衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 2.5),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肺水肿'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 6.35),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '胎盘组织缺氧'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '胎儿宫内生长受限'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '死胎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '早产'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '低出生体重'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '低Apgar评分'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '新生儿室息'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '新生儿入住监护病房'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, '高'),
    r.timeframe = coalesce(r.timeframe, '围产期');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:57:51
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.category = coalesce(n.category, '睡眠疾病');

MERGE (n:Disease {name: '高血压'})
SET 
    n.category = coalesce(n.category, '心血管疾病');

MERGE (n:Disease {name: '心脑血管疾病'})
SET 
    n.category = coalesce(n.category, '心血管疾病');

MERGE (n:Disease {name: '代谢性疾病'})
SET 
    n.category = coalesce(n.category, '代谢疾病');

MERGE (n:Disease {name: '情志与认知功能障碍'})
SET 
    n.category = coalesce(n.category, '心理疾病');

MERGE (n:Disease {name: '恶性肿瘤'})
SET 
    n.category = coalesce(n.category, '肿瘤');

MERGE (n:Disease {name: '妊娠期高血压综合症'})
SET 
    n.category = coalesce(n.category, '妊娠相关疾病');

MERGE (n:Disease {name: '妊娠期糖尿病'})
SET 
    n.category = coalesce(n.category, '妊娠相关疾病');

MERGE (n:Disease {name: '肺动脉高压'})
SET 
    n.category = coalesce(n.category, '心血管疾病');

MERGE (n:Disease {name: '缺血性卒中'})
SET 
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: '2型糖尿病'})
SET 
    n.category = coalesce(n.category, '代谢疾病');

MERGE (n:Disease {name: '多囊卵巢综合症'})
SET 
    n.category = coalesce(n.category, '内分泌疾病');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.category = coalesce(n.category, '心理疾病');

MERGE (n:Disease {name: '认知障碍/痴呆症'})
SET 
    n.category = coalesce(n.category, '心理疾病');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心脑血管疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '代谢性疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '情志与认知功能障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '恶性肿瘤'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期高血压综合症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '不良影响'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '不良影响'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肺动脉高压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '缺血性卒中'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '双向影响'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多囊卵巢综合症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '认知障碍/痴呆症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '独立危险因素'),
    r.evidence_level = coalesce(r.evidence_level, '高');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:57:52
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '主要高危因素，OSA高风险评分的相对危险度随着体重指数(BMI)增加而增加'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '内分泌疾病'})
SET 
    n.description = coalesce(n.description, 'PCOS、甲状腺功能减退症和肢端肥大症亦为女性OSA危险因素'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '吸烟'})
SET 
    n.description = coalesce(n.description, '与OSA相关的不良因素之一'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '乙醇摄入'})
SET 
    n.description = coalesce(n.description, '与OSA相关的不良因素之一'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '镇静催眠药物不当应用'})
SET 
    n.description = coalesce(n.description, '与OSA相关的不良因素之一'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '妊娠因素'})
SET 
    n.description = coalesce(n.description, '妊娠期女性OSA的重要危险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Complication {name: '多囊卵巢综合征'})
SET 
    n.description = coalesce(n.description, '育龄期女性常见的内分泌疾病，患病率10%~13%'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, 'OSA患病率约74%'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '肢端肥大症'})
SET 
    n.description = coalesce(n.description, 'OSA患者中20%~80%发生睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '内分泌疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '乙醇摄入'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '镇静催眠药物不当应用'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多囊卵巢综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.35),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺功能减退症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.74),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肢端肥大症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:58:01
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '激素替代疗法'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于提高女性性激素水平，进而降低阻塞性睡眠呼吸暂停的发生风险'),
    n.dosage = coalesce(n.dosage, '根据个体化方案'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '妊娠、阴道出血、乳腺癌等');

MERGE (n:Treatment {name: '无创正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '一种常见的OSA治疗方法'),
    n.dosage = coalesce(n.dosage, '根据个体化方案'),
    n.duration = coalesce(n.duration, '根据治疗需要'),
    n.contraindication = coalesce(n.contraindication, '无相关禁忌');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '激素替代疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '无创正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后期');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:58:02
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '多囊卵巢综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'PCOS');

MERGE (n:Disease {name: '甲状腺功能减退症'})
SET 
    n.short_name = coalesce(n.short_name, '甲减');

MERGE (n:Disease {name: '肢端肥大症'})
SET 
    n.short_name = coalesce(n.short_name, '肢端肥大症');

MERGE (n:Disease {name: '妊娠期高血压'})
SET 
    n.short_name = coalesce(n.short_name, 'HDP');

MERGE (n:Disease {name: '妊娠期糖尿病'})
SET 
    n.short_name = coalesce(n.short_name, 'GDM');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间打鼾的症状'),
    n.severity = coalesce(n.severity, '轻到重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早上醒来时感到头痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '睡眠质量差'})
SET 
    n.description = coalesce(n.description, '睡眠不够深, 质量低'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '多囊卵巢综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '肢端肥大症'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '妊娠期高血压'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '妊娠期糖尿病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '晨起头痛'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠质量差'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:58:04
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种常见的睡眠障碍，引起睡眠中出现呼吸暂停和低通气。'),
    n.category = coalesce(n.category, '睡眠相关疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到极度困倦。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '醒后乏力疲劳'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到疲劳和无力。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '出现入睡困难或夜间觉醒多次。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '夜间气喘'})
SET 
    n.description = coalesce(n.description, '夜间睡觉时出现喘息或呼吸困难。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '高血压'})
SET 
    n.description = coalesce(n.description, '一种常见的心血管疾病，可能与OSA相关。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠中发出鼾声，可能伴随呼吸中断。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'AHI测定'})
SET 
    n.description = coalesce(n.description, '通过睡眠监测确定每小时呼吸暂停次数。'),
    n.method = coalesce(n.method, '多导睡眠图(PSG)'),
    n.requirement = coalesce(n.requirement, '需要在医疗机构进行');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '醒后乏力疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间气喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'AHI测定'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:58:05
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: 'NPPV治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '非侵入性通气治疗');

MERGE (n:Treatment {name: '口腔矫治器治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用牙齿矫治器促进呼吸道通畅');

MERGE (n:Treatment {name: '手术治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对呼吸道进行外科手术');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'NPPV治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期管理');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治器治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期管理');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '手术治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期管理');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:58:06
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, '女性OSA');

MERGE (n:Symptom {name: '夜间打鼾'})
SET 
    n.description = coalesce(n.description, '患者在夜间发出的声音');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或保持睡眠');

MERGE (n:Symptom {name: '日间疲劳感'})
SET 
    n.description = coalesce(n.description, '白天感到疲倦或缺乏精力');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到头痛');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '情绪紧张或不安');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '晚上做出的恐怖梦境');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡的状态');

MERGE (n:Symptom {name: '睡眠维持障碍'})
SET 
    n.description = coalesce(n.description, '在夜间醒来并难以再次入睡');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天频繁感到困倦');

MERGE (n:Symptom {name: '被观察到的呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡觉时被他人观察到的呼吸停止');

MERGE (n:Symptom {name: '腿动'})
SET 
    n.description = coalesce(n.description, '在入睡或睡眠中腿部不适或频繁移动的症状');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '在安静时感到不适，需要移动腿部以缓解');

MERGE (n:Symptom {name: '较低AHI'})
SET 
    n.description = coalesce(n.description, '睡眠呼吸暂停指数相对较低');

MERGE (n:Symptom {name: '睡眠期觉醒'})
SET 
    n.description = coalesce(n.description, '在睡眠阶段中频繁醒来');

MERGE (n:Symptom {name: '睡眠潜伏期增加'})
SET 
    n.description = coalesce(n.description, '入睡所需的时间延长');

MERGE (n:Disease {name: '多囊卵巢综合症'})
SET 
    n.short_name = coalesce(n.short_name, 'PCOS');

MERGE (n:Disease {name: '甲状腺功能减退症'})
SET 
    n.short_name = coalesce(n.short_name, '甲减');

MERGE (n:Disease {name: '肢端肥大症'})
SET 
    n.short_name = coalesce(n.short_name, '肢端肥大');

MERGE (n:Disease {name: '女性OSA高危人群'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA高危');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间疲劳感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠维持障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '被观察到的呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腿动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '较低AHI'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠期觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠潜伏期增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '女性OSA高危人群'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多囊卵巢综合症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺功能减退症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肢端肥大症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:58:07
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '成人OSA、中央性睡眠呼吸暂停综合征和睡眠相关肺泡低通气疾病的主要治疗手段'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'CSAS'),
    n.description = coalesce(n.description, '一种由中枢神经系统导致的睡眠呼吸暂停现象'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '睡眠相关肺泡低通气疾病'})
SET 
    n.code = coalesce(n.code, 'SRV'),
    n.description = coalesce(n.description, '与睡眠相关的肺泡通气不足情况'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '妊娠期OSA'})
SET 
    n.code = coalesce(n.code, 'GOSA'),
    n.description = coalesce(n.description, '妊娠期间发生的阻塞性睡眠呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '心肌梗死'})
SET 
    n.code = coalesce(n.code, 'MI'),
    n.description = coalesce(n.description, '心脏供血不足导致的心肌损害'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '慢性肺泡低通气综合征'})
SET 
    n.code = coalesce(n.code, 'CPV'),
    n.description = coalesce(n.description, '与慢性呼吸疾病导致的通气不足'),
    n.category = coalesce(n.category, '呼吸系统疾病'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OVS'),
    n.description = coalesce(n.description, '肥胖引起的通气不足'),
    n.category = coalesce(n.category, '代谢疾病'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Treatment {name: 'NPPV治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过非侵入性通气帮助改善睡眠呼吸暂停症状'),
    n.contraindication = coalesce(n.contraindication, '气胸或纵隔气肿等');

MERGE (n:Treatment {name: 'CPAP模式'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '一种持续正压通气模式');

MERGE (n:Treatment {name: 'APAP模式'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '自动调整压力的治疗模式');

MERGE (n:Treatment {name: 'BPAP模式'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '双水平气道正压通气模式'),
    n.contraindication = coalesce(n.contraindication, '不耐受CPAP的患者');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'NPPV治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '基础阶段');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'CPAP模式'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '基础阶段');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'APAP模式'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助阶段');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'BPAP模式'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.78),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助阶段');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = 'NPPV治疗'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '必须'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠相关肺泡低通气疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.92),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:58:14
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种睡眠障碍，表现为呼吸暂停或呼吸减慢。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中重度');

MERGE (n:RisksFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重过重，增加患病风险。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RisksFactor {name: '甲状腺功能减退'})
SET 
    n.description = coalesce(n.description, '甲状腺激素不足，导致代谢减慢。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RisksFactor {name: '腺样体和扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '上呼吸道结构异常，影响正常呼吸。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RisksFactor {name: '多囊卵巢综合症'})
SET 
    n.description = coalesce(n.description, '内分泌失调，影响女性健康。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RisksFactor {name: '激素变化'})
SET 
    n.description = coalesce(n.description, '怀孕期间体内激素水平变化，增加风险。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RisksFactor {name: '年龄增加'})
SET 
    n.description = coalesce(n.description, '年龄增长与疾病风险增高相关。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RisksFactor {name: '内科合并症'})
SET 
    n.description = coalesce(n.description, '与其他疾病的结合增加风险。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出的呼噜声。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或睡眠质量差。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中');

MERGE (n:Symptom {name: '白天疲劳'})
SET 
    n.description = coalesce(n.description, '白天感到极度疲惫。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '晨头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时头痛。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '情绪不安，产生过多的担忧。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Treatment {name: '生活方式改变'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括减重、饮食控制、运动等。'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '持续气道正压通气（NPPV）'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于中重度OSA的治疗，改善生活质量。'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '重度共病患者');

MERGE (n:Treatment {name: '口腔矫治器'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过改变下颌位置来改善呼吸。'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '重度OSA患者');

MERGE (n:Treatment {name: '多学科合作治疗'})
SET 
    n.type = coalesce(n.type, '综合'),
    n.description = coalesce(n.description, '针对特殊需求制定个体化治疗方案。'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '心血管系统疾病，影响生命质量。'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, '包括心脏病、卒中等。'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '与新陈代谢紊乱相关的疾病。'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '思维、记忆等认知功能下降。'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺功能减退'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体和扁桃体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多囊卵巢综合症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '激素变化'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '年龄增加'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '内科合并症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '生活方式改变'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '持续气道正压通气（NPPV）'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首选');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治器'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '备选');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多学科合作治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '综合');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:58:15
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '减重'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '减轻症状、改善睡眠和生活质量');

MERGE (n:Treatment {name: '饮食控制'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '减轻症状、改善睡眠和生活质量');

MERGE (n:Treatment {name: '运动'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改善OSA严重度、改善睡眠质量，改善日间症状');

MERGE (n:Treatment {name: '体位治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '减少仰卧位睡眠时间，帮助改善OSA');

MERGE (n:Treatment {name: '减少乙醇摄入'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '减少OSA风险');

MERGE (n:Treatment {name: '慎用镇静催眠药物'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '避免抑制呼吸中枢，加重上气道塌陷');

MERGE (n:Treatment {name: '无创正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '与体位治疗联合治疗OSA');

MERGE (n:Treatment {name: '智能止鼾枕'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '帮助治疗轻-中度OSA');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, '女性OSA的合并症之一');

MERGE (n:Complication {name: '高脂血症'})
SET 
    n.description = coalesce(n.description, '女性OSA的合并症之一');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '女性OSA的合并症之一');

MERGE (n:Complication {name: '支气管哮喘'})
SET 
    n.description = coalesce(n.description, '女性OSA的合并症之一');

MERGE (n:Complication {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, '女性OSA的合并症之一');

MERGE (n:Complication {name: '骨关节病'})
SET 
    n.description = coalesce(n.description, '女性OSA的合并症之一');

MERGE (n:Complication {name: '反流性胃炎'})
SET 
    n.description = coalesce(n.description, '女性OSA的合并症之一');

// 关系更新
MATCH (from) WHERE from.name = '减重'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '饮食控制'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '运动'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '体位治疗'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '减少乙醇摄入'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '慎用镇静催眠药物'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '无创正压通气'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '智能止鼾枕'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高脂血症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '支气管哮喘'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺功能减退症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '骨关节病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '反流性胃炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:58:16
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '行为干预'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '基于心理学理论的强化行为干预可显著提高依从性，放松疗法有利于改善失眠，提高女性OSA合并失眠患者的治疗依从性');

MERGE (n:Treatment {name: '面罩的选择'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '面罩的类型影响NPPV疗效和治疗依从性，应根据患者的实际情况选择，还有需考虑患者喜好');

MERGE (n:Treatment {name: '患者教育'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过OSA的书面知识教育和解读PSG及治疗跟踪记录卡进行患者教育，可增加就诊频次，提高长期治疗依从性');

MERGE (n:Treatment {name: '远程医疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '在NPPV治疗初始阶段使用远程监测指导，包括使用时间、残余AHI、漏气及治疗压力等');

MERGE (n:Treatment {name: '不良反应的处理'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '及时正确处理不良反应有利于提高依从性');

MERGE (n:Treatment {name: '口腔矫治器'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于不耐受CPAP治疗的轻-中度患者，建议使用定制的矫治器，而非预制的口腔矫治器');

MERGE (n:Treatment {name: '上气道手术'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通常不作首选治疗，适应证为解除上气道梗阻且无手术禁忌证的患者，成人常用术式包括上颌骨前移、咽部手术及多级分期手术等');

MERGE (n:Treatment {name: '舌下神经刺激治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '在OSA患者舌下植入电极刺激神经，可减少吸气时气道塌陷，对特定患者有效，耐受性良好，满足特定条件的患者适宜');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '行为干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '面罩的选择'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '患者教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '远程医疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '不良反应的处理'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治器'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '上气道手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '舌下神经刺激治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '治疗阶段');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:58:19
*/
// 节点更新


// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:58:19
*/
// 节点更新
MERGE (n:Disease {name: '女性阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, '女性OSA');

MERGE (n:Disease {name: '妊娠期阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, '妊娠OSA');

MERGE (n:Disease {name: '日间嗜睡'})
SET 
    n.short_name = coalesce(n.short_name, '日间嗜睡');

MERGE (n:Disease {name: '绝经期阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, '绝经期OSA');

MERGE (n:Treatment {name: '非侵入性正压通气'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'NPPV治疗仍为首选');

MERGE (n:Complication {name: '合并症'})
SET 
    n.description = coalesce(n.description, 'OSA与其他合并症的共同管理方式');

// 关系更新
MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '非侵入性正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '合并症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '绝经期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '女性阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '增加'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '女性阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '合并症'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:58:23
*/
// 节点更新
MERGE (n:Disease {name: '妊娠期阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '高血糖'})
SET 
    n.short_name = coalesce(n.short_name, 'GDM');

MERGE (n:Disease {name: '高血压'})
SET 
    n.short_name = coalesce(n.short_name, 'HDP');

MERGE (n:Complication {name: '肺动脉高压'})
SET 
    n.description = coalesce(n.description, '可能出现的并发症'),
    n.severity = coalesce(n.severity, '中度至重度');

MERGE (n:Treatment {name: 'NPPV治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '非侵入性通气治疗'),
    n.duration = coalesce(n.duration, '个体化'),
    n.contraindication = coalesce(n.contraindication, '对非侵入性通气耐受性差');

MERGE (n:Treatment {name: '口腔矫治器治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '适用于打鼾者及轻中度OSA患者'),
    n.duration = coalesce(n.duration, '根据患者情况'),
    n.contraindication = coalesce(n.contraindication, '不建议作为一线治疗方式');

// 关系更新
MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肺动脉高压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '妊娠期');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'NPPV治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '一线'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '高血糖'
MATCH (to) WHERE to.name = '妊娠期阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '高血压'
MATCH (to) WHERE to.name = '妊娠期阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '口腔矫治器治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '非一线'),
    r.stage = coalesce(r.stage, '辅助治疗');



// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:58:24
*/
// 节点更新
MERGE (n:Disease {name: '妊娠期阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '妊娠期中出现的阻塞性睡眠呼吸暂停情况'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出的鼾声'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠期憋醒'})
SET 
    n.description = coalesce(n.description, '在睡眠期间感到窒息而醒来'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '晨起头疼'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到头疼'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或保持睡眠'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '白天过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '持续感到疲倦无力'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重超过标准体重的20%或以上'),
    n.category = coalesce(n.category, '代谢疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '难治性高血压'})
SET 
    n.description = coalesce(n.description, '难以控制的高血压情况'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不明原因的心律失常'})
SET 
    n.description = coalesce(n.description, '原因不明确的心率异常'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '慢性充血性心力衰竭'})
SET 
    n.description = coalesce(n.description, '持续的心力衰竭状态'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '难治性糖尿病'})
SET 
    n.description = coalesce(n.description, '难以控制的糖尿病'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, '甲状腺激素不足引起的疾病'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '子痫前期'})
SET 
    n.description = coalesce(n.description, '妊娠期间高血压及蛋白尿表现'),
    n.category = coalesce(n.category, '妊娠相关'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '妊娠期糖尿病'})
SET 
    n.description = coalesce(n.description, '妊娠期间出现的糖尿病'),
    n.category = coalesce(n.category, '妊娠相关'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '胎儿宫内生长受限'})
SET 
    n.description = coalesce(n.description, '胎儿生长未达预期标准'),
    n.category = coalesce(n.category, '妊娠相关'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠期憋醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头疼'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '难治性高血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '不明原因的心律失常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '慢性充血性心力衰竭'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '难治性糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺功能减退症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '子痫前期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '胎儿宫内生长受限'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:58:33
*/
// 节点更新
MERGE (n:Disease {name: '妊娠期OSA'})
SET 
    n.description = coalesce(n.description, '妊娠期阻塞性睡眠呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或保持睡眠的状态'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '睡眠质量差'})
SET 
    n.description = coalesce(n.description, '睡眠不够舒适或恢复力差'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Treatment {name: 'APAP治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '自适应正压通气治疗');

MERGE (n:Treatment {name: '体重管理'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过控制体重来改善症状');

MERGE (n:Treatment {name: '体位治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '调整睡眠姿势以改善呼吸');

MERGE (n:Treatment {name: 'NPPV治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '无创通气支持');

MERGE (n:Treatment {name: '口腔矫治器'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用以改善上气道通气'),
    n.contraindication = coalesce(n.contraindication, '不适用于重度OSA患者');

MERGE (n:Complication {name: '合并症管理'})
SET 
    n.description = coalesce(n.description, '母婴合并症的管理'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = '睡眠质量差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = 'APAP治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = '体重管理'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '预防');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = '体位治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '预防');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = 'NPPV治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = '口腔矫治器'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = '妊娠期OSA'
MATCH (to) WHERE to.name = '合并症管理'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:58:37
*/
// 节点更新
MERGE (n:Disease {name: '妊娠期阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, '妊娠期OSA');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '女性OSA的主要症状'),
    n.severity = coalesce(n.severity, '典型'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头疼'})
SET 
    n.description = coalesce(n.description, '女性OSA的非典型症状'),
    n.severity = coalesce(n.severity, '非典型'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '伴随晨起头疼的非典型症状'),
    n.severity = coalesce(n.severity, '非典型'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '夜间呼吸暂停'})
SET 
    n.description = coalesce(n.description, '女性OSA的典型症状'),
    n.severity = coalesce(n.severity, '典型'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天疲劳嗜睡'})
SET 
    n.description = coalesce(n.description, '伴有夜间呼吸暂停的症状'),
    n.severity = coalesce(n.severity, '典型'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '妊娠期肥胖'})
SET 
    n.description = coalesce(n.description, '妊娠期OSA的重要预测指标'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '妊娠年龄'})
SET 
    n.description = coalesce(n.description, 'OSA的独立危险因素'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '上气道解剖结构异常'})
SET 
    n.description = coalesce(n.description, 'OSA筛查的推荐原因'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '内科疾病史'})
SET 
    n.description = coalesce(n.description, '与OSA相关的内科疾病'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:RiskFactor {name: '高血压病史'})
SET 
    n.description = coalesce(n.description, '高血压病史增加OSA风险'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '甲状腺疾病'})
SET 
    n.description = coalesce(n.description, '高危因素之一'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:Complication {name: '妊娠期高血压症'})
SET 
    n.description = coalesce(n.description, '与OSA相关的合并症'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '妊娠期糖尿病'})
SET 
    n.description = coalesce(n.description, '与OSA相关的合并症'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Examination {name: 'OSA筛查'})
SET 
    n.description = coalesce(n.description, '用于筛查OSA风险'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '孕妇需参与');

// 关系更新
MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头疼'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '非典型');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '非典型');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '典型');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天疲劳嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '典型');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期肥胖'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠年龄'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '上气道解剖结构异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '内科疾病史'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压病史'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '甲状腺疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期高血压症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '妊娠期');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '妊娠期糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.63),
    r.timeframe = coalesce(r.timeframe, '妊娠期');

MATCH (from) WHERE from.name = '妊娠期阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA筛查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

