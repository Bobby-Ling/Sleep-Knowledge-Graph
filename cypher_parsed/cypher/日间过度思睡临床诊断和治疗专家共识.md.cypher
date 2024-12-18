// File: 日间过度思睡临床诊断和治疗专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:55:50
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在一天需要保持清醒的时间段内无法维持清醒和警觉,出现不能抑制的睡眠需求,伴随注意力和记忆力减退'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '由于下丘脑食欲素神经元选择性缺失或功能障碍所导致的中枢性嗜睡疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '特发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '一种慢性中枢性嗜睡疾病,表现为EDS和难以从夜间睡眠或日间小睡中清醒'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '复发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '以反复发作的思睡伴认知、精神和行为异常为基本特征的疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '主要表现为夜间难以入睡或维持睡眠'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸反复暂停或低通气'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '过度困倦'})
SET 
    n.description = coalesce(n.description, '无法抑制的睡眠需求'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '注意力减退'})
SET 
    n.description = coalesce(n.description, '注意力和记忆力减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '主观感觉体力和精力的缺乏'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断EDS相关疾病的检查'),
    n.method = coalesce(n.method, '通过监测脑电活动等评估睡眠'),
    n.requirement = coalesce(n.requirement, '需要在实验室进行');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '记录患者的睡眠模式和日间行为'),
    n.method = coalesce(n.method, '自我报告'),
    n.requirement = coalesce(n.requirement, '需持续一周以上记录');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '过度困倦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '注意力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '特发性嗜睡症'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '复发性嗜睡症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:55:51
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到过度疲倦和睡意，影响日常生活和工作。'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种以极度嗜睡和猝倒为特征的神经系统疾病。'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠过程中反复发生上气道部分阻塞，导致呼吸暂停。'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '过度思睡'})
SET 
    n.description = coalesce(n.description, '在白天异常的嗜睡或疲倦。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '患者意识丧失并迅速入睡的现象。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '夜间睡眠障碍'})
SET 
    n.description = coalesce(n.description, '夜间的睡眠质量差或频繁醒来。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '有强烈的下肢不适感，导致脉动和不自主的晃动。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:NonDrugTreatment {name: '生活方式干预'})
SET 
    n.description = coalesce(n.description, '改善患者的生活习惯，以促进更好的睡眠质量。'),
    n.duration = coalesce(n.duration, '持续时间不定'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:DrugTreatment {name: '替洛利生'})
SET 
    n.description = coalesce(n.description, '用于治疗发作性睡病的促觉醒药物。'),
    n.dosage = coalesce(n.dosage, '根据患者需求'),
    n.frequency = coalesce(n.frequency, '根据医嘱'),
    n.duration = coalesce(n.duration, '长期');

MERGE (n:DrugTreatment {name: '莫达非尼'})
SET 
    n.description = coalesce(n.description, '一种用于改善日间警觉性的药物。'),
    n.dosage = coalesce(n.dosage, '根据患者需求'),
    n.frequency = coalesce(n.frequency, '根据医嘱'),
    n.duration = coalesce(n.duration, '长期');

MERGE (n:DrugTreatment {name: '褪黑素'})
SET 
    n.description = coalesce(n.description, '用于调整因昼夜节律紊乱引起的失眠。'),
    n.dosage = coalesce(n.dosage, '0.3-5.0 mg'),
    n.frequency = coalesce(n.frequency, '根据医嘱'),
    n.duration = coalesce(n.duration, '短期');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '有时'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '生活方式干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '短期治疗');



// =====================================

