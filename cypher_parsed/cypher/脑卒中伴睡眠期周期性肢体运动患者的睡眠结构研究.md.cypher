// File: 脑卒中伴睡眠期周期性肢体运动患者的睡眠结构研究.md
// Processed at: 2024-12-12 01:27:26
// Total pairs: 7

/* Response #1
   Timestamp: 2024-12-12 01:26:34
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'})
SET 
    n.code = coalesce(n.code, 'I63'),
    n.description = coalesce(n.description, '脑血管意外'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.code = coalesce(n.code, 'G47.61'),
    n.description = coalesce(n.description, '在睡眠期间出现的周期性肢体运动'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '非快速动眼睡眠期间的重复性肢体运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '短暂、刻板');

MERGE (n:Symptom {name: '功能障碍'})
SET 
    n.description = coalesce(n.description, '脑卒中患者的功能受损'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:RiskFactor {name: 'PLMS'})
SET 
    n.description = coalesce(n.description, '睡眠期周期性肢体运动的表现'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'PLMS'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = 'PLMS'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '功能障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:26:37
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '脑卒中是常见的神经系统疾病，常伴随睡眠障碍'),
    n.category = coalesce(n.category, '神经病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '周期性肢体运动综合症'})
SET 
    n.short_name = coalesce(n.short_name, 'PLMS'),
    n.description = coalesce(n.description, '因反复刻板性动作引起的睡眠障碍，可能与多巴胺能系统受损有关'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '心脑血管疾病'})
SET 
    n.description = coalesce(n.description, '与脑卒中相关的危险疾病'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '心脑血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.543),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '周期性肢体运动综合症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.828),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '周期性肢体运动综合症'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:26:39
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'})
SET 
    n.type = coalesce(n.type, '神经系统疾病');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现周期性肢体运动'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '清醒期PLMI'})
SET 
    n.description = coalesce(n.description, '清醒期的腿动指数'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '觉醒指数'})
SET 
    n.description = coalesce(n.description, '觉醒的频率'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: 'N1期睡眠占比'})
SET 
    n.description = coalesce(n.description, 'N1期睡眠占总睡眠时间的比例'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: 'N2期睡眠占比'})
SET 
    n.description = coalesce(n.description, 'N2期睡眠占总睡眠时间的比例'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: '睡眠效率'})
SET 
    n.description = coalesce(n.description, '有效睡眠的比例'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: 'N3期睡眠占比'})
SET 
    n.description = coalesce(n.description, 'N3期睡眠占总睡眠时间的比例'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: 'REM期睡眠占比'})
SET 
    n.description = coalesce(n.description, 'REM期睡眠占总睡眠时间的比例'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: 'AHI'})
SET 
    n.description = coalesce(n.description, '睡眠呼吸暂停指数'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: '睡眠潜伏期'})
SET 
    n.description = coalesce(n.description, '入睡所需时间'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '低');

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '清醒期PLMI'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '觉醒指数'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'N1期睡眠占比'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'N2期睡眠占比'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠效率'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'N3期睡眠占比'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'REM期睡眠占比'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.55),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'AHI'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠潜伏期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:26:50
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '脑卒中常见的并发症，临床表现多样。');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '睡眠障碍为脑卒中常见的并发症，临床表现多样。');

MERGE (n:Symptom {name: '睡眠期周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '以睡眠期间反复刻板的肢体运动称为睡眠期周期性肢体运动(PLMS)。'),
    n.severity = coalesce(n.severity, '多样'),
    n.frequency = coalesce(n.frequency, '周期性');

MERGE (n:Symptom {name: '清醒期PLMI'})
SET 
    n.description = coalesce(n.description, '觉醒期间的周期性肢体运动指数。');

MERGE (n:Symptom {name: '睡眠效率'})
SET 
    n.description = coalesce(n.description, '从睡眠开始到完全醒来的比例。');

MERGE (n:Symptom {name: 'N1期睡眠占总睡眠时间比例'})
SET 
    n.description = coalesce(n.description, 'N1期睡眠的占比。');

MERGE (n:Symptom {name: 'N2期睡眠占总睡眠时间比例'})
SET 
    n.description = coalesce(n.description, 'N2期睡眠的占比。');

MERGE (n:Symptom {name: 'N3期睡眠占总睡眠时间比例'})
SET 
    n.description = coalesce(n.description, 'N3期睡眠的占比。');

MERGE (n:Symptom {name: 'REM期睡眠占总睡眠时间比例'})
SET 
    n.description = coalesce(n.description, 'REM期睡眠的占比。');

MERGE (n:Symptom {name: '睡眠呼吸暂停低通气指数'})
SET 
    n.description = coalesce(n.description, '反映睡眠呼吸状态的指数。');

MERGE (n:Symptom {name: '睡眠潜伏期'})
SET 
    n.description = coalesce(n.description, '从入睡到深睡状态的时长。');

MERGE (n:Symptom {name: '觉醒指数'})
SET 
    n.description = coalesce(n.description, '反映觉醒情况的指数。');

MERGE (n:Symptom {name: '周期性肢体运动觉醒指数'})
SET 
    n.description = coalesce(n.description, '与周期性肢体运动相关的觉醒情况的指数。');

MERGE (n:Complication {name: '睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '伴PLMS的脑卒中患者客观存在睡眠紊乱。'),
    n.severity = coalesce(n.severity, '低');

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠期周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '清醒期PLMI'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠效率'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'N1期睡眠占总睡眠时间比例'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'N2期睡眠占总睡眠时间比例'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'N3期睡眠占总睡眠时间比例'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = 'REM期睡眠占总睡眠时间比例'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气指数'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠潜伏期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '觉醒指数'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '周期性肢体运动觉醒指数'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:26:51
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'});

MERGE (n:Disease {name: '脑卒中'});

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现的周期性肢体运动'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠碎片化'})
SET 
    n.description = coalesce(n.description, '睡眠期间的中断或碎片化现象'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可减少PLMS而不影响觉醒频率'),
    n.dosage = coalesce(n.dosage, '依医嘱'),
    n.duration = coalesce(n.duration, '依医嘱'),
    n.contraindication = coalesce(n.contraindication, '对患者个体情况需要评估');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可减少睡眠觉醒但对PLMS无影响'),
    n.dosage = coalesce(n.dosage, '依医嘱'),
    n.duration = coalesce(n.duration, '依医嘱'),
    n.contraindication = coalesce(n.contraindication, '对患者个体情况需要评估');

// 关系更新
MATCH (from) WHERE from.name = '周期性肢体运动'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠碎片化'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:26:52
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'})
SET 
    n.code = coalesce(n.code, 'I63'),
    n.description = coalesce(n.description, '脑卒中是一种急性脑血流中断的状态。'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '腿动症'})
SET 
    n.code = coalesce(n.code, 'G25.81'),
    n.description = coalesce(n.description, '腿动症是一种在睡眠中表现为周期性腿部运动的障碍。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '患者在睡眠中表现出持续的睡眠质量下降。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '清醒期PLMI'})
SET 
    n.description = coalesce(n.description, '清醒期周期性腿部运动指数。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '睡眠效率'})
SET 
    n.description = coalesce(n.description, '在监测时间内，实际睡眠时间与监测时间的比例。'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '睡眠呼吸暂停低通气指数(AHI)'})
SET 
    n.description = coalesce(n.description, '每小时发生的睡眠呼吸暂停及低通气事件的数量。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '可变');

MERGE (n:Symptom {name: '睡眠潜伏期'})
SET 
    n.description = coalesce(n.description, '从入睡开始到睡眠的开始之间的时间间隔。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '觉醒指数'})
SET 
    n.description = coalesce(n.description, '一个表示夜间觉醒次数的指标。'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '周期性肢体运动觉醒指数'})
SET 
    n.description = coalesce(n.description, '夜间周期性肢体运动造成的觉醒次数的指标。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '腿动症'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '清醒期PLMI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠效率'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '腿动症'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气指数(AHI)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠潜伏期'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '稳定');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '觉醒指数'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中等'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '周期性肢体运动觉醒指数'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:26:57
*/
// 节点更新
MERGE (n:Disease {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '脑卒中是由于脑部血液供应受阻，导致脑细胞损伤的一种疾病。'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '周期性肢体运动睡眠障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'PLMS'),
    n.description = coalesce(n.description, '周期性肢体运动睡眠障碍是一种在睡眠中出现周期性肢体运动的疾病，影响睡眠质量。'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '根据患者的临床需求选择合适的药物以改善睡眠状况。'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '有潜在副作用');

MERGE (n:Complication {name: '睡眠结构紊乱'})
SET 
    n.description = coalesce(n.description, '睡眠结构紊乱是指睡眠周期和阶段的异常，可能影响睡眠质量和健康。'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '周期性肢体运动睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '周期性肢体运动睡眠障碍'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '睡眠结构紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '周期性肢体运动睡眠障碍'
MATCH (to) WHERE to.name = '睡眠结构紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

