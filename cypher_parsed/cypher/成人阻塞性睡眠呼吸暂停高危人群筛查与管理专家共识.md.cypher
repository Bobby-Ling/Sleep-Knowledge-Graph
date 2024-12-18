// File: 成人阻塞性睡眠呼吸暂停高危人群筛查与管理专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:56:10
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸疾病'),
    n.category = coalesce(n.category, '呼吸系统'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中短暂的呼吸停止'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出的响声'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天容易感到困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '日间');

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'HTN'),
    n.description = coalesce(n.description, '一种高血压症状'),
    n.category = coalesce(n.category, '心血管'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '冠心病'})
SET 
    n.code = coalesce(n.code, 'CAD'),
    n.description = coalesce(n.description, '冠状动脉病变造成的心脏疾病'),
    n.category = coalesce(n.category, '心血管'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '糖尿病'})
SET 
    n.code = coalesce(n.code, 'DM'),
    n.description = coalesce(n.description, '血糖控制不良的代谢疾病'),
    n.category = coalesce(n.category, '内分泌'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重超出正常范围'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '男性'})
SET 
    n.description = coalesce(n.description, '男性可能更容易患病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '年龄增加'})
SET 
    n.description = coalesce(n.description, '随年龄增长风险增加'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠呼吸暂停的检查方法'),
    n.method = coalesce(n.method, '监测睡眠状态'),
    n.requirement = coalesce(n.requirement, '需要在医院进行');

MERGE (n:Examination {name: '家庭睡眠呼吸暂停监测'})
SET 
    n.description = coalesce(n.description, '便携式设备监测睡眠呼吸状态'),
    n.method = coalesce(n.method, '家中测试'),
    n.requirement = coalesce(n.requirement, '需医生开具');

MERGE (n:NonDrugTreatment {name: '生活方式干预'})
SET 
    n.description = coalesce(n.description, '改善生活习惯以降低疾病风险'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '气道正压通气'})
SET 
    n.description = coalesce(n.description, '治疗阻塞性睡眠呼吸暂停的一线治疗'),
    n.dosage = coalesce(n.dosage, '根据个体化需要'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '经鼻通气'),
    n.contraindication = coalesce(n.contraindication, '对面罩过敏');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '慢性');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '慢性');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '慢性');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '男性'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '年龄增加'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '家庭睡眠呼吸暂停监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '生活方式干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '气道正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '确诊后');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 16:48:13
*/
// 节点更新


// =====================================

