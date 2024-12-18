// File: 卒中相关睡眠障碍评估与管理中国专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:08:19
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '卒中后常见症状，临床多见却易被忽视'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入眠或维持睡眠的症状'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '日间感到过度困倦或无法保持清醒'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠过程中发生的呼吸问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '快速眼动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '在REM睡眠时出现不自主的行为'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '在休息状态下出现的下肢强烈活动欲望'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '睡眠中周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '睡眠期间出现的周期性肢体运动'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠障碍的检测方法'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '适用于所有睡眠障碍患者');

MERGE (n:NonDrugTreatment {name: '睡眠卫生与健康教育'})
SET 
    n.description = coalesce(n.description, '鼓励患者进行健康的生活习惯'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '根据患者需求'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '苯二氮草类药物'})
SET 
    n.description = coalesce(n.description, '用于短期治疗失眠和焦虑症状'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度呼吸衰竭');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.87),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '快速眼动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.86),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠中周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.82),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠卫生与健康教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '快速眼动睡眠期行为障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.58),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠中周期性肢体运动'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.63),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:22
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'});

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'PLMS');

MERGE (n:Disease {name: '凌晨潮红'});

MERGE (n:Symptom {name: '腿部不舒服'})
SET 
    n.description = coalesce(n.description, '腿部不适感'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '睡眠时间不足导致的症状'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '情绪低落的一种精神状态'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '不良的睡眠习惯'})
SET 
    n.description = coalesce(n.description, '不良的作息和睡眠方式'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠-觉醒节律失调'})
SET 
    n.description = coalesce(n.description, '生物钟失调造成的睡眠问题'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '腿部不舒服'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠剥夺'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不良的睡眠习惯'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠-觉醒节律失调'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

