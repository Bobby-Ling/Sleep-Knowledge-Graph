// File: 儿童中枢性睡眠呼吸暂停56例临床分析.md
// Processed at: 2024-12-12 01:29:49
// Total pairs: 9

/* Response #1
   Timestamp: 2024-12-12 01:29:21
*/
// 节点更新
MERGE (n:Disease {name: '儿童中枢性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'C001'),
    n.description = coalesce(n.description, '儿童中枢性睡眠呼吸暂停的临床特征与影响'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:29:29
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:29:29
*/
// 节点更新
MERGE (n:Disease {name: '阻塞型呼吸暂停低通气'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, 'OAHI > 1 次/h 诊断为OSA'),
    n.severity = coalesce(n.severity, 'Moderate');

MERGE (n:Disease {name: '中枢型呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'CSA'),
    n.description = coalesce(n.description, 'CAI ≥ 5 次/h 且 CA 和/或 中枢型低通气数量 > 呼吸暂停低通气数量 50% 诊断为CSA'),
    n.severity = coalesce(n.severity, 'Severe');

MERGE (n:Symptom {name: '呼吸暂停指数'})
SET 
    n.description = coalesce(n.description, '与呼吸相关的睡眠暂停'),
    n.severity = coalesce(n.severity, 'Varies'),
    n.frequency = coalesce(n.frequency, 'Before diagnosis');

MERGE (n:Symptom {name: '低通气'})
SET 
    n.description = coalesce(n.description, '通气不足导致的血氧饱和度下降'),
    n.severity = coalesce(n.severity, 'Serious'),
    n.frequency = coalesce(n.frequency, 'Before diagnosis');

// 关系更新
MATCH (from) WHERE from.name = '阻塞型呼吸暂停低通气'
MATCH (to) WHERE to.name = '呼吸暂停指数'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, 'Often'),
    r.severity = coalesce(r.severity, 'Moderate');

MATCH (from) WHERE from.name = '中枢型呼吸暂停'
MATCH (to) WHERE to.name = '低通气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, 'Frequently'),
    r.severity = coalesce(r.severity, 'Severe');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:29:31
*/
// 节点更新


// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:29:38
*/
// 节点更新
MERGE (n:Disease {name: '合并性呼吸暂停'})
SET 
    n.description = coalesce(n.description, '包括中枢性和阻塞性呼吸暂停'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '由呼吸中枢功能障碍导致的呼吸暂停'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '由于气道阻塞导致的呼吸暂停'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '呼吸暂停事件'})
SET 
    n.description = coalesce(n.description, '睡眠中反复的呼吸停止'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '低氧'})
SET 
    n.description = coalesce(n.description, '血氧水平降低'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: 'CO2水平改变'})
SET 
    n.description = coalesce(n.description, '血中二氧化碳浓度变化'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '临床症状不显著'})
SET 
    n.description = coalesce(n.description, '在临床检查中未能明显观察到症状'),
    n.severity = coalesce(n.severity, '轻微');

MERGE (n:Symptom {name: '睡眠昏迷'})
SET 
    n.description = coalesce(n.description, '在睡眠中失去意识'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '呼吸心跳骤停'})
SET 
    n.description = coalesce(n.description, '睡眠中突然停止呼吸和心跳'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停事件'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '低氧'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'CO2水平改变'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '临床症状不显著'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:29:38
*/
// 节点更新
MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'CSA'),
    n.description = coalesce(n.description, '中枢性睡眠呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '阻塞性睡眠呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '呼吸紊乱'})
SET 
    n.description = coalesce(n.description, '夜间刚入睡及晨起时叹气样呼吸'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Symptom {name: '白天运动后长出气'})
SET 
    n.description = coalesce(n.description, '白天运动后感到呼吸急促'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: 'CAI'})
SET 
    n.description = coalesce(n.description, '中枢型呼吸暂停指数'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: 'OAHI'})
SET 
    n.description = coalesce(n.description, '阻塞型呼吸暂停低通气指数'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '频繁氧减'})
SET 
    n.description = coalesce(n.description, '血氧降低的情况'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '觉醒指数'})
SET 
    n.description = coalesce(n.description, '与呼吸事件相关的觉醒次数'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '间歇性');

// 关系更新
MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.673),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OAHI'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.673),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'CAI'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '保守治疗');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '频繁氧减'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '觉醒指数'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:29:44
*/
// 节点更新
MERGE (n:Disease {name: '儿童中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '由于中枢神经系统原因导致的睡眠呼吸暂停'),
    n.category = coalesce(n.category, '睡眠呼吸障碍');

MERGE (n:Disease {name: '延髓肿瘤'})
SET 
    n.description = coalesce(n.description, '肿瘤位于延髓部位，可能影响呼吸调节'),
    n.category = coalesce(n.category, '肿瘤');

MERGE (n:Disease {name: '肥胖症'})
SET 
    n.description = coalesce(n.description, '体重超标带来的健康问题'),
    n.category = coalesce(n.category, '代谢性疾病');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠过程中暂时停止呼吸'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '轻度打鼾'})
SET 
    n.description = coalesce(n.description, '轻微的鼾声'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '口唇发绀'})
SET 
    n.description = coalesce(n.description, '口唇变色，表明缺氧'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '脾气暴躁'})
SET 
    n.description = coalesce(n.description, '情绪波动大'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '呼吸不规律'})
SET 
    n.description = coalesce(n.description, '呼吸频率变化不定'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '睡眠中');

MERGE (n:Complication {name: '肺动脉高压'})
SET 
    n.description = coalesce(n.description, '由多种因素导致的肺动脉压力升高'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '轻度打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口唇发绀'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '脾气暴躁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸不规律'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '睡眠中'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肺动脉高压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '延髓肿瘤'
MATCH (to) WHERE to.name = '儿童中枢性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '术后');

MATCH (from) WHERE from.name = '肥胖症'
MATCH (to) WHERE to.name = '儿童中枢性睡眠呼吸暂停'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:29:44
*/
// 节点更新
MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '以呼吸驱动缺乏或异常导致的通气功能障碍为特征'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '低');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠过程中频繁发生部分或全部上气道阻塞'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时伴随的呼吸异常声响'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸暂时停止'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠时以口呼吸代替鼻呼吸'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.1),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:29:49
*/
// 节点更新
MERGE (n:Disease {name: '儿童中枢性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '因气道阻塞而出现持续的呼吸努力'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.Disease {name = coalesce(n.Disease {name, '阻塞性睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '中枢性呼吸暂停'})
SET 
    n.description = coalesce(n.description, '事件持续期间不存在呼吸努力'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '阻塞性呼吸暂停'})
SET 
    n.description = coalesce(n.description, '因气道阻塞而出现的呼吸努力'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '中枢性呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.66),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '中枢性呼吸暂停'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

