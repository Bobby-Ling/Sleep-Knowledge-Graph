// File: 多发性硬化合并睡眠障碍研究进展.md
// Processed at: 2024-12-12 01:28:34
// Total pairs: 9

/* Response #1
   Timestamp: 2024-12-12 01:27:13
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:27:19
*/
// 节点更新
MERGE (n:Disease {name: '多发性硬化'})
SET 
    n.code = coalesce(n.code, 'MS');

MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'Insomnia');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'Narcolepsy');

MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA');

MERGE (n:Disease {name: '中枢性肺泡换气不足'})
SET 
    n.code = coalesce(n.code, 'CSA');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '一种常见的症状，表现为精神和身体的极度疲惫'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '痉挛'})
SET 
    n.description = coalesce(n.description, '肌肉的非自愿收缩'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '致使');

MERGE (n:Symptom {name: '疼痛'})
SET 
    n.description = coalesce(n.description, '身体部位的不适感'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '间歇性');

// 关系更新
MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '所有'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '所有'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '痉挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '慢性');

MATCH (from) WHERE from.name = '中枢性肺泡换气不足'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:27:40
*/
// 节点更新
MERGE (n:Disease {name: '多发性硬化'})
SET 
    n.description = coalesce(n.description, '一种慢性中枢神经系统自身免疫性脱髓鞘疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: 'MS睡眠障碍'})
SET 
    n.description = coalesce(n.description, '多发性硬化患者常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量差'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠运动障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现的异常运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠相关呼吸异常'})
SET 
    n.description = coalesce(n.description, '睡眠中呼吸发生异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '突发周期性睡眠发作'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '快速眼动期睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, 'REM睡眠中的异常行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '异常睡眠-觉醒节律'})
SET 
    n.description = coalesce(n.description, '不规律的睡眠和觉醒模式'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天睡眠过多'})
SET 
    n.description = coalesce(n.description, '白天出现过度嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '睡眠运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '睡眠相关呼吸异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '快速眼动期睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '异常睡眠-觉醒节律'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '白天睡眠过多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:27:56
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '最常见的呼吸障碍，累及2%至4%的成人。');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'CSA'),
    n.description = coalesce(n.description, '患者清醒时呼吸正常，但在非REM期睡眠出现长程或持续通气不足，伴有血氧饱和度降低和高碳酸血症。');

MERGE (n:Disease {name: '多发性硬化症'})
SET 
    n.code = coalesce(n.code, 'MS'),
    n.description = coalesce(n.description, '一种中枢神经系统疾病，易患OSA。');

// 关系更新
MATCH (from) WHERE from.name = '多发性硬化症'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '8%'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.1),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:27:56
*/
// 节点更新
MERGE (n:Disease {name: '不安腿综合征'})
SET 
    n.description = coalesce(n.description, '一种累及感觉运动的疾病。');

MERGE (n:Symptom {name: '肢体运动的欲望'})
SET 
    n.description = coalesce(n.description, '常与肢体不适感有关。');

MERGE (n:Symptom {name: '活动肢体可缓解症状'})
SET 
    n.description = coalesce(n.description, '通过活动肢体可缓解症状。');

MERGE (n:Symptom {name: '休息时症状加重'})
SET 
    n.description = coalesce(n.description, '休息时症状加重。');

MERGE (n:Symptom {name: '夜间症状加重'})
SET 
    n.description = coalesce(n.description, '夜间症状加重。');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '影响睡眠，导致白天嗜睡。');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '影响睡眠，导致抑郁。');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '影响睡眠，导致失眠。');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '影响睡眠，导致疲劳。');

MERGE (n:Disease {name: '多发性硬化'})
SET 
    n.description = coalesce(n.description, '神经系统的慢性疾病。');

MERGE (n:RiskFactor {name: '高龄'})
SET 
    n.description = coalesce(n.description, 'MS易患RLS的危险因素。');

MERGE (n:RiskFactor {name: '较长的MS病程'})
SET 
    n.description = coalesce(n.description, 'MS易患RLS的危险因素。');

MERGE (n:RiskFactor {name: '原发性进行性MS'})
SET 
    n.description = coalesce(n.description, 'MS易患RLS的危险因素。');

MERGE (n:RiskFactor {name: '较重的锥体束征'})
SET 
    n.description = coalesce(n.description, 'MS易患RLS的危险因素。');

MERGE (n:RiskFactor {name: '感觉功能障碍'})
SET 
    n.description = coalesce(n.description, 'MS易患RLS的危险因素。');

MERGE (n:RiskFactor {name: '睡前腿部痉挛'})
SET 
    n.description = coalesce(n.description, 'MS易患RLS的危险因素。');

MERGE (n:Complication {name: '功能障碍'})
SET 
    n.description = coalesce(n.description, 'RLS可以加重MS的功能障碍。');

MERGE (n:Complication {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, 'RLS可以加重MS的睡眠障碍。');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '表现为刻板性、周期性肢体活动，常见于下肢，表现为大拇脚趾伸展、踝关节、膝关节和髋关节持续性屈曲。');

// 关系更新
MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '肢体运动的欲望'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '活动肢体可缓解症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '休息时症状加重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '夜间症状加重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '高龄'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '较长的MS病程'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '原发性进行性MS'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '较重的锥体束征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '感觉功能障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '睡前腿部痉挛'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '功能障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:28:01
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难的症状，包括初期失眠、中期失眠和终期失眠');

MERGE (n:Disease {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '心理状态，表现为过度担忧和不安');

MERGE (n:Disease {name: '疼痛/不适'})
SET 
    n.description = coalesce(n.description, '身体不适感，可能影响到睡眠质量');

MERGE (n:Disease {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪障碍，表现为持续的悲伤和失去兴趣');

MERGE (n:Disease {name: '日间疲劳'})
SET 
    n.description = coalesce(n.description, '日间的极度疲惫，可能导致睡眠问题');

MERGE (n:Disease {name: '夜尿增多'})
SET 
    n.description = coalesce(n.description, '夜间排尿频率增加，可能影响睡眠维持');

MERGE (n:Symptom {name: '初期失眠'})
SET 
    n.description = coalesce(n.description, '人睡困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '中期失眠'})
SET 
    n.description = coalesce(n.description, '睡眠维持困难'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '终期失眠'})
SET 
    n.description = coalesce(n.description, '早醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Disease {name: '普通人群'})
SET 
    n.description = coalesce(n.description, '非特定人群');

MERGE (n:Disease {name: 'MS患者'})
SET 
    n.description = coalesce(n.description, '多发性硬化患者');

MERGE (n:Symptom {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '情感障碍，表现为持续的悲伤'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '中');

MERGE (n:Symptom {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '过度担忧和不安'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中');

// 关系更新
MATCH (from) WHERE from.name = '初期失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.42),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '中期失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.53),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '终期失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.58),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '疼痛/不适'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '日间疲劳'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '夜尿增多'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '普通人群'
MATCH (to) WHERE to.name = '初期失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.15),
    r.recommendation_level = coalesce(r.recommendation_level, '中');

MATCH (from) WHERE from.name = 'MS患者'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.54),
    r.recommendation_level = coalesce(r.recommendation_level, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:28:14
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以过度日间嗜睡为特征的慢性睡眠障碍，表现为白天发作性人睡、REM期睡眠异常等'),
    n.category = coalesce(n.category, '原发性睡眠障碍');

MERGE (n:Disease {name: '多发性硬化症'})
SET 
    n.short_name = coalesce(n.short_name, 'MS'),
    n.description = coalesce(n.description, '一种影响中枢神经系统的自身免疫性疾病');

MERGE (n:Symptom {name: '过度日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度嗜睡，无法保持清醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '突发性失去肌肉力量'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '睡眠麻痹'})
SET 
    n.description = coalesce(n.description, '入睡或清醒时暂时无法移动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '夜眠不实'})
SET 
    n.description = coalesce(n.description, '夜间睡眠不连续，难以保持良好睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '过度日间嗜睡'
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
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠麻痹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '夜眠不实'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多发性硬化症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:28:30
*/
// 节点更新
MERGE (n:Disease {name: 'REM期睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '以REM睡眠期肌肉弛缓现象消失并出现与梦境相关的异常运动行为为特征的发作性疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '多发性硬化'})
SET 
    n.code = coalesce(n.code, 'MS'),
    n.description = coalesce(n.description, '一种影响中枢神经系统的疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种神经系统退行性疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '多系统萎缩'})
SET 
    n.description = coalesce(n.description, '一种罕见的神经退行性疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.description = coalesce(n.description, '一种以认知衰退和运动障碍为特征的神经退行性疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '进行性核上性眼肌麻痹'})
SET 
    n.description = coalesce(n.description, '一种影响眼肌运动的神经系统疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '脑干血管病'})
SET 
    n.description = coalesce(n.description, '脑干的血管疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '脑干肿瘤'})
SET 
    n.description = coalesce(n.description, '位于脑干的肿瘤'),
    n.category = coalesce(n.category, '肿瘤'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '多发性硬化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '多系统萎缩'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '进行性核上性眼肌麻痹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '脑干血管病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = 'REM期睡眠行为障碍'
MATCH (to) WHERE to.name = '脑干肿瘤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:28:34
*/
// 节点更新
MERGE (n:Disease {name: '多发性硬化症'})
SET 
    n.code = coalesce(n.code, 'MS'),
    n.description = coalesce(n.description, '一种影响中枢神经系统的自身免疫疾病，常表现为疲劳和运动协调障碍'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '患者表现出的身体和精神的极度疲惫状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '白天睡眠过多'})
SET 
    n.description = coalesce(n.description, '患者在白天感到异常的嗜睡或昏睡的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '多发性硬化症'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多发性硬化症'
MATCH (to) WHERE to.name = '白天睡眠过多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.068),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

