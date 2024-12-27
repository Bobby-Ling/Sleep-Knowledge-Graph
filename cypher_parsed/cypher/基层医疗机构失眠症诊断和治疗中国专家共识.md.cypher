// File: 基层医疗机构失眠症诊断和治疗中国专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:14
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '一种影响睡眠的常见障碍，表现为入睡困难、维持睡眠困难或早醒'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '夜间醒来'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来，难以再次入睡的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起疲劳'})
SET 
    n.description = coalesce(n.description, '早上醒来后感觉疲惫不堪'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦，难以集中注意力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以在晚上及时入睡的情况'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断失眠症及其他睡眠障碍的标准检查'),
    n.method = coalesce(n.method, '记录睡眠状态和行为'),
    n.requirement = coalesce(n.requirement, '患者需在医院进行');

MERGE (n:Examination {name: '心理评估量表'})
SET 
    n.description = coalesce(n.description, '使用多种量表评估患者的睡眠情况'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '患者需如实回答');

MERGE (n:NonDrugTreatment {name: '光照疗法'})
SET 
    n.description = coalesce(n.description, '通过晨间光照改善失眠情况'),
    n.duration = coalesce(n.duration, '10分钟'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '光照设备');

MERGE (n:NonDrugTreatment {name: '重复经颅磁刺激'})
SET 
    n.description = coalesce(n.description, '使用磁场刺激以改善失眠和焦虑状态'),
    n.duration = coalesce(n.duration, '30分钟'),
    n.frequency = coalesce(n.frequency, '每周'),
    n.contraindication = coalesce(n.contraindication, '有癫痫病史'),
    n.equipment = coalesce(n.equipment, 'rTMS设备');

MERGE (n:NonDrugTreatment {name: '生物反馈疗法'})
SET 
    n.description = coalesce(n.description, '通过反馈信息帮助患者调整睡眠状态'),
    n.duration = coalesce(n.duration, '30分钟'),
    n.frequency = coalesce(n.frequency, '每周'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '生物反馈设备');

MERGE (n:Complication {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '常与失眠症并存的精神障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '长时间失眠可导致或加重抑郁症状'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '夜间醒来'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '晨起疲劳'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '白天嗜睡'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '心理评估量表'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '光照疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '综合治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '重复经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '对症治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '生物反馈疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:17
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '最常见的睡眠障碍，导致个体社会功能受损'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '在适当的时间点不肯上床睡觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '维持睡眠困难'})
SET 
    n.description = coalesce(n.description, '睡眠维持困难，容易醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比期望的起床时间醒来早'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天困倦'})
SET 
    n.description = coalesce(n.description, '日间感到强烈的困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪不稳'})
SET 
    n.description = coalesce(n.description, '情绪不稳或易激惹'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠质量的技术'),
    n.method = coalesce(n.method, '睡眠实验室'),
    n.requirement = coalesce(n.requirement, '需要专业技术人员');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '患者记录睡眠情况以评估睡眠节律'),
    n.method = coalesce(n.method, '自我记录'),
    n.requirement = coalesce(n.requirement, '无特别要求');

MERGE (n:NonDrugTreatment {name: '认知行为疗法'})
SET 
    n.description = coalesce(n.description, '针对失眠的心理治疗方法'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '放松训练'})
SET 
    n.description = coalesce(n.description, '减轻焦虑以改善睡眠'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '失眠可能会导致抑郁症的发生'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '失眠与焦虑症常常相关联'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '年龄'})
SET 
    n.type = coalesce(n.type, '家族史'),
    n.description = coalesce(n.description, '年龄增长是失眠的高危因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '性别'})
SET 
    n.type = coalesce(n.type, '其他风险'),
    n.description = coalesce(n.description, '女性比男性更易出现失眠'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '维持睡眠困难'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '白天困倦'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '情绪不稳'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '放松训练'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '年龄'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '性别'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '低');



// =====================================

