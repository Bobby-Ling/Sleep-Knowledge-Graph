// File: 中国儿童阻塞性睡眠呼吸暂停诊断与治疗指南（2020）.md
// Processed at: 2024-12-12 01:33:57
// Total pairs: 43

/* Response #1
   Timestamp: 2024-12-12 01:32:58
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:33:00
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:33:09
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.category = coalesce(n.category, '儿童'),
    n.description = coalesce(n.description, '与腺样体肥大、扁桃体肥大、肥胖相关的睡眠呼吸暂停');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停综合征'});

MERGE (n:Disease {name: '低通气综合征'});

MERGE (n:Disease {name: '唐氏综合征'});

MERGE (n:Disease {name: '严重颅面畸形'});

MERGE (n:Disease {name: '神经肌肉疾病'});

MERGE (n:Disease {name: '慢性肺部疾病'});

MERGE (n:Disease {name: '镰状细胞病'});

MERGE (n:Disease {name: '代谢性疾病'});

MERGE (n:Disease {name: '喉软化症'});

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '唐氏综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '严重颅面畸形'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '神经肌肉疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '慢性肺部疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '镰状细胞病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.45),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '代谢性疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '喉软化症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.35),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:33:13
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '儿童睡眠过程中频繁发生部分或完全上气道阻塞，干扰儿童的正常通气和睡眠结构而引起的一系列病理生理变化'),
    n.category = coalesce(n.category, '呼吸系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '颌面发育异常'})
SET 
    n.description = coalesce(n.description, '腺样体面容'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '行为表现的异常'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '学习障碍'})
SET 
    n.description = coalesce(n.description, '学习过程中出现的问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '生长发育落后'})
SET 
    n.description = coalesce(n.description, '儿童生长发育的滞后'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '神经认知损伤'})
SET 
    n.description = coalesce(n.description, '对神经认知功能的损伤'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '内分泌代谢失调'})
SET 
    n.description = coalesce(n.description, '内分泌和代谢过程的异常'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '血压持续升高的情况'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '肺动脉高压'})
SET 
    n.description = coalesce(n.description, '肺动脉压力升高'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '成年期心血管事件风险'})
SET 
    n.description = coalesce(n.description, '成年后心血管事件发生的风险增加'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '颌面发育异常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '行为异常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '学习障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '生长发育落后'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '神经认知损伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '内分泌代谢失调'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肺动脉高压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '成年期心血管事件风险'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:33:15
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '儿童OSA的诊断界值'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: 'OAHI'})
SET 
    n.description = coalesce(n.description, '呼吸暂停指数'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: 'OSA严重程度分级'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '基于PSG指标进行OSA严重程度分级'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '持续评估'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = 'OAHI'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '根据临床观察'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA严重程度分级'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '制定治疗方案');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OAHI'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, '弱推荐');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:33:15
*/
// 节点更新
MERGE (n:Disease {name: '阻塞型呼吸暂停事件'})
SET 
    n.description = coalesce(n.description, '口鼻气流下降 ≥ 90%，持续 ≥ 2 个呼吸周期，整个事件中存在胸腹运动');

MERGE (n:Disease {name: '中枢型呼吸暂停事件'})
SET 
    n.description = coalesce(n.description, '口鼻气流下降 ≥ 90%，持续 20s; 或 ≥ 2 个呼吸周期伴有事件相关觉醒或 ≥ 3% 的血氧饱和度下降; 或 ≥ 2 个呼吸周期伴有心率减低至 < 50 次/min 持续至少 5s，或心率 < 60 次/min 持续时间 15 s');

MERGE (n:Disease {name: '混合型呼吸暂停事件'})
SET 
    n.description = coalesce(n.description, '口鼻气流下降 ≥ 90%，持续 ≥ 2 个呼吸周期，整个事件中胸腹运动存在与缺失并存');

MERGE (n:Disease {name: '低通气'})
SET 
    n.description = coalesce(n.description, '口鼻气流较基线下降 ≥ 30%，持续时间 ≥ 2 个呼吸周期且伴有事件相关觉醒或 ≥ 3% 的血氧饱和度下降');

MERGE (n:Disease {name: '呼吸暂停低通气指数'})
SET 
    n.description = coalesce(n.description, '定义为每夜睡眠中平均每小时呼吸暂停与低通气的次数之和');

MERGE (n:Disease {name: '阻塞性呼吸暂停低通气指数'})
SET 
    n.description = coalesce(n.description, '定义为每夜睡眠中平均每小时发生阻塞型呼吸暂停事件、混合型呼吸暂停事件与阻塞型低通气的次数之和');

MERGE (n:Disease {name: '阻塞性呼吸暂停指数'})
SET 
    n.description = coalesce(n.description, '定义为每夜睡眠中平均每小时阻塞型呼吸暂停事件的次数');

MERGE (n:Disease {name: '氧减指数'})
SET 
    n.description = coalesce(n.description, '定义为平均每小时血氧饱和度下降 ≥ 3% 的次数');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:33:16
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠 apnea'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间打鼾的声音'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '≥3晚/周');

MERGE (n:Symptom {name: '睡眠憋气'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸中断的感觉'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意力缺陷'})
SET 
    n.description = coalesce(n.description, '注意力无法集中'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Complication {name: '扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '扁桃体肿胀导致气道受限'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '腺样体肥大'})
SET 
    n.description = coalesce(n.description, '腺样体增大导致呼吸道受限'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '腺样体面容'})
SET 
    n.description = coalesce(n.description, '由于腺样体肥大导致的面部特征变化'),
    n.severity = coalesce(n.severity, '轻');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '睡眠憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '注意力缺陷'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '扁桃体肥大'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '腺样体面容'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:33:19
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '儿童阻塞性睡眠呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '健康儿童'})
SET 
    n.code = coalesce(n.code, 'HealthyChild'),
    n.description = coalesce(n.description, '没有睡眠呼吸问题的儿童'),
    n.category = coalesce(n.category, '正常'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Symptom {name: '夜间打鼾'})
SET 
    n.description = coalesce(n.description, '在夜间睡眠时伴随的打鼾声音'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '日间行为异常'})
SET 
    n.description = coalesce(n.description, '白天表现出的异常行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '日间');

MERGE (n:Symptom {name: '夜间睡眠伴随症状'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时伴随的其他症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '睡眠障碍量表总评分'})
SET 
    n.description = coalesce(n.description, '量表用以评估睡眠障碍的结果'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '测试时');

MERGE (n:Symptom {name: '最低血氧饱和度'})
SET 
    n.description = coalesce(n.description, '在治疗期间最小的血氧饱和度'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '测试时');

// 关系更新
MATCH (from) WHERE from.name = '夜间打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '日间行为异常'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间睡眠伴随症状'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠障碍量表总评分'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '每次测试'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '最低血氧饱和度'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每次测试'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:33:20
*/
// 节点更新
MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出响亮的呼噜声'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠时通过嘴呼吸而非鼻子'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '反复觉醒'})
SET 
    n.description = coalesce(n.description, '睡眠中频繁醒来'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪行为异常'})
SET 
    n.description = coalesce(n.description, '情绪或行为的不稳定'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中呼吸的停止'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常困倦'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意缺陷多动障碍'})
SET 
    n.description = coalesce(n.description, '注意力集中困难和多动症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '学习困难'})
SET 
    n.description = coalesce(n.description, '在学习过程中遇到困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆能力的减弱'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '儿童在睡眠时出现呼吸暂停或呼吸不畅'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Examination {name: '多导睡眠图(PSG)'})
SET 
    n.description = coalesce(n.description, '用多导睡眠监测法评估睡眠状态'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '必要');

MERGE (n:Treatment {name: '儿童OSA的干预治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过设备、行为疗法等方法治疗儿童阻塞性睡眠呼吸暂停'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '持续评估'),
    n.contraindication = coalesce(n.contraindication, '有气道结构异常的儿童');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '反复觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '情绪行为异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '注意缺陷多动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '学习困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠图(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '儿童OSA的干预治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初诊');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:33:21
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '腺样体和扁桃体切除术'})
SET 
    n.type = coalesce(n.type, '手术'),
    n.description = coalesce(n.description, '针对腺样体和扁桃体肥大的OSA患儿进行的手术'),
    n.dosage = coalesce(n.dosage, 'N/A'),
    n.duration = coalesce(n.duration, 'N/A'),
    n.contraindication = coalesce(n.contraindication, 'N/A');

MERGE (n:Complication {name: '手术并发症'})
SET 
    n.description = coalesce(n.description, '与OSA手术相关的并发症'),
    n.severity = coalesce(n.severity, '可变');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体和扁桃体切除术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '手术');

MATCH (from) WHERE from.name = '腺样体和扁桃体切除术'
MATCH (to) WHERE to.name = '手术并发症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.1),
    r.timeframe = coalesce(r.timeframe, '术后');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:33:22
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种常见的睡眠障碍，特点是睡眠期间的反复呼吸暂停。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中反复出现的呼吸停止事件。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦，难以保持清醒状态。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '脉氧仪监测'})
SET 
    n.description = coalesce(n.description, '使用脉氧仪进行夜间氧饱和度监测以评估OSA。'),
    n.method = coalesce(n.method, '脉氧仪'),
    n.requirement = coalesce(n.requirement, '需在睡眠中使用');

MERGE (n:Examination {name: '便携式睡眠监测'})
SET 
    n.description = coalesce(n.description, '使用便携式设备进行睡眠状态监测。'),
    n.method = coalesce(n.method, '便携式设备'),
    n.requirement = coalesce(n.requirement, '需在家中使用');

MERGE (n:Treatment {name: '正压通气治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过持续气道正压治疗改善睡眠呼吸。'),
    n.dosage = coalesce(n.dosage, '持续'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '部分心脏病患者禁用');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, 'OSA可能导致的严重心血管并发症。'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '脉氧仪监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '便携式睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '正压通气治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '主动治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '数年内');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:33:22
*/
// 节点更新
MERGE (n:Disease {name: '肥胖儿童阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '肥胖儿童有无术后疾病持续存在的评估'),
    n.category = coalesce(n.category, '睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '哮喘'})
SET 
    n.description = coalesce(n.description, '一种常见的慢性呼吸系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '变应性鼻炎'})
SET 
    n.description = coalesce(n.description, '对某些过敏源的免疫反应'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Complication {name: '鼻窦炎'})
SET 
    n.description = coalesce(n.description, '鼻窦内膜的炎症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: 'OSA家族史'})
SET 
    n.description = coalesce(n.description, '家族中存在阻塞性睡眠呼吸暂停的病例'),
    n.category = coalesce(n.category, '遗传'),
    n.severity = coalesce(n.severity, '轻度');

// 关系更新
MATCH (from) WHERE from.name = '肥胖儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '肥胖儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '变应性鼻炎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '肥胖儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻窦炎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '肥胖儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA家族史'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '肥胖儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '术后关注');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:33:23
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA');

MERGE (n:Treatment {name: '扁桃体切除术'})
SET 
    n.type = coalesce(n.type, '手术'),
    n.description = coalesce(n.description, '通过外科手术切除扁桃体'),
    n.contraindication = coalesce(n.contraindication, '腺样体肥大');

MERGE (n:Treatment {name: '腺样体切除术'})
SET 
    n.type = coalesce(n.type, '手术'),
    n.description = coalesce(n.description, '通过外科手术切除腺样体'),
    n.contraindication = coalesce(n.contraindication, '扁桃体肥大');

MERGE (n:Complication {name: '麻醉并发症'})
SET 
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '术后呼吸衰竭'})
SET 
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '出血'})
SET 
    n.severity = coalesce(n.severity, '高');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '扁桃体切除术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体切除术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '麻醉并发症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '术后呼吸衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '术后');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:33:25
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '扁桃体大小与OSA严重程度的相关性'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '不确定');

MERGE (n:Symptom {name: '腺样体肥大'})
SET 
    n.description = coalesce(n.description, '腺样体肥大是普通体重学龄前儿童OSA的主要原因'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '不确定');

MERGE (n:Treatment {name: '推荐使用PSG进行儿童OSA诊断'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '便携或简易替代诊断工具的诊断价值');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '扁桃体肥大'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '不确定'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '不确定'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '推荐使用PSG进行儿童OSA诊断'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:33:26
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '睡眠打鼾'})
SET 
    n.description = coalesce(n.description, '夜间发出声音的现象'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '多动'})
SET 
    n.description = coalesce(n.description, '活动水平高于正常'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Treatment {name: '腺样体和扁桃体切除术'})
SET 
    n.type = coalesce(n.type, '手术'),
    n.description = coalesce(n.description, '移除腺样体和/或扁桃体以缓解上气道阻塞'),
    n.duration = coalesce(n.duration, '手术后康复期'),
    n.contraindication = coalesce(n.contraindication, '有手术禁忌的患者');

MERGE (n:Treatment {name: '其他方法治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对上气道的综合评估后选择的治疗方案');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体和扁桃体切除术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首选');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '其他方法治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '可选择');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:33:29
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '独立危险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Complication {name: '哮喘'})
SET 
    n.description = coalesce(n.description, '伴随疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '变应性鼻炎'})
SET 
    n.description = coalesce(n.description, '伴随疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Treatment {name: '鼻用糖皮质激素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善症状评分'),
    n.dosage = coalesce(n.dosage, '按需'),
    n.duration = coalesce(n.duration, '定期随诊'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '孟鲁司特钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '降低睡眠呼吸事件'),
    n.dosage = coalesce(n.dosage, '按需'),
    n.duration = coalesce(n.duration, '定期随诊'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Examination {name: '多导睡眠图(PSG)'})
SET 
    n.description = coalesce(n.description, '评估术后OSA状态'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '医院需具备');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '变应性鼻炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻用糖皮质激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '轻、中度');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '孟鲁司特钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '轻、中度');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠图(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:33:30
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估患者的睡眠状态情况'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '标准诊断方法');

MERGE (n:Examination {name: '脉氧仪监测'})
SET 
    n.description = coalesce(n.description, '便携式监测设备评估睡眠呼吸特点'),
    n.method = coalesce(n.method, '脉氧仪'),
    n.requirement = coalesce(n.requirement, '经过验证的设备');

MERGE (n:Scale {name: 'PSQ'})
SET 
    n.description = coalesce(n.description, '儿童阻塞性睡眠呼吸暂停问卷'),
    n.score_range = coalesce(n.score_range, 'N/A'),
    n.interpretation = coalesce(n.interpretation, '用于评估OSA风险');

MERGE (n:Scale {name: 'OSA-18'})
SET 
    n.description = coalesce(n.description, '专为儿童设计的OSA问卷'),
    n.score_range = coalesce(n.score_range, 'N/A'),
    n.interpretation = coalesce(n.interpretation, '用于评估OSA风险');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '脉氧仪监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSQ'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.77),
    r.recommendation_level = coalesce(r.recommendation_level, '弱推荐');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA-18'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.61),
    r.recommendation_level = coalesce(r.recommendation_level, '弱推荐');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:33:32
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '非侵入性正压通气(NPPV)'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于OSA患儿的气道综合评估和治疗');

MERGE (n:Treatment {name: '连续正压通气(CPAP)'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '儿童OSA的一种有效的替代治疗方法');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '连续正压通气(CPAP)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '围手术期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '非侵入性正压通气(NPPV)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '临床治疗');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:33:32
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '鼻用糖皮质激素'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于治疗儿童OSA的药物');

MERGE (n:Treatment {name: '口服孟鲁司特钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗儿童OSA的药物');

MERGE (n:Treatment {name: '糠酸莫米松鼻喷剂'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于治疗儿童OSA的药物');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻用糖皮质激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.11),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糠酸莫米松鼻喷剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.2),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口服孟鲁司特钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:33:34
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '无创通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '推荐NPPV作为有效治疗方法'),
    n.contraindication = coalesce(n.contraindication, '外科手术禁忌证');

MERGE (n:Treatment {name: '持续气道正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '并发使用以改善OSA症状'),
    n.duration = coalesce(n.duration, '3个月');

MERGE (n:Complication {name: '颅面发育异常'})
SET 
    n.description = coalesce(n.description, '长期使用可造成颅面发育异常'),
    n.severity = coalesce(n.severity, '轻微');

MERGE (n:Symptom {name: '鼻部症状'})
SET 
    n.description = coalesce(n.description, '轻微不良反应'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '眼睛刺激症状'})
SET 
    n.description = coalesce(n.description, '轻微不良反应'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '皮肤破损'})
SET 
    n.description = coalesce(n.description, '轻微不良反应'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '无创通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '强推荐'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '持续气道正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '适应症'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '颅面发育异常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.1),
    r.timeframe = coalesce(r.timeframe, '长期使用');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻部症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '眼睛刺激症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '皮肤破损'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:33:34
*/
// 节点更新


// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:33:36
*/
// 节点更新


// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:33:37
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:RiskFactor {name: '肥胖因素'})
SET 
    n.description = coalesce(n.description, '术前肥胖患儿发生术后OSA持续存在的风险是正常体重患儿的4.11倍'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '超重因素'})
SET 
    n.description = coalesce(n.description, '超重患儿与正常体重患儿相比，不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: '伴随疾病'})
SET 
    n.description = coalesce(n.description, '伴随哮喘和变应性鼻炎不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '无影响');

MERGE (n:RiskFactor {name: '疾病家族史'})
SET 
    n.description = coalesce(n.description, '有SDB、过敏和肥胖家族史均不增加术后OSA持续存在的风险'),
    n.impact_level = coalesce(n.impact_level, '无影响');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '超重因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '弱');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '伴随疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '无影响'),
    r.evidence_level = coalesce(r.evidence_level, '无证据');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '疾病家族史'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '无影响'),
    r.evidence_level = coalesce(r.evidence_level, '无证据');



// =====================================

/* Response #24
   Timestamp: 2024-12-12 01:33:39
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '口腔及颌面发育问题'})
SET 
    n.description = coalesce(n.description, '可能合并的特征');

MERGE (n:Treatment {name: '口腔评估'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '建议进行口腔评估');

MERGE (n:Treatment {name: '口腔矫治器治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对OSA患儿的口腔矫治方案');

MERGE (n:Treatment {name: '上颌扩弓治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对轻、中度OSA患儿的上颌扩弓治疗');

MERGE (n:Treatment {name: '下颌前导矫治'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '适用于轻度至重度OSA患儿的下颌前导矫治'),
    n.duration = coalesce(n.duration, '6个月及以上的长期治疗优于短期治疗');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔评估'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '必要'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治器治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '必要'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '上颌扩弓治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '建议'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '下颌前导矫治'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '强推荐'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '口腔及颌面发育问题'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '可能'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #25
   Timestamp: 2024-12-12 01:33:39
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '鼻用糖皮质激素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解鼻炎症状'),
    n.duration = coalesce(n.duration, '6周');

MERGE (n:Treatment {name: '孟鲁司特钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解OSA症状'),
    n.duration = coalesce(n.duration, '3个月');

MERGE (n:Complication {name: '腺样体肥大'})
SET 
    n.description = coalesce(n.description, '上气道梗阻情况'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '上气道梗阻情况'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻用糖皮质激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '孟鲁司特钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '足够');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '扁桃体肥大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '足够');



// =====================================

/* Response #26
   Timestamp: 2024-12-12 01:33:40
*/
// 节点更新


// =====================================

/* Response #27
   Timestamp: 2024-12-12 01:33:41
*/
// 节点更新


// =====================================

/* Response #28
   Timestamp: 2024-12-12 01:33:41
*/
// 节点更新


// =====================================

/* Response #29
   Timestamp: 2024-12-12 01:33:41
*/
// 节点更新


// =====================================

/* Response #30
   Timestamp: 2024-12-12 01:33:42
*/
// 节点更新


// =====================================

/* Response #31
   Timestamp: 2024-12-12 01:33:44
*/
// 节点更新


// =====================================

/* Response #32
   Timestamp: 2024-12-12 01:33:45
*/
// 节点更新


// =====================================

/* Response #33
   Timestamp: 2024-12-12 01:33:45
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '减重干预'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过减重来改善OSA');

MERGE (n:Treatment {name: '手术减重'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过手术减重改善OSA');

MERGE (n:Treatment {name: '行为减重'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '饮食限制、体育活动和心理支持的结合');

MERGE (n:Complication {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体质量指数(BMI)≥ 95th Percentile'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: 'AHI持续存在'})
SET 
    n.description = coalesce(n.description, 'AHI持续升高的状态'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '减重干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.62),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗前后对比');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '手术减重'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.87),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗后');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '行为减重'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.52),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '临床指导');

MATCH (from) WHERE from.name = '肥胖'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = 'AHI持续存在'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #34
   Timestamp: 2024-12-12 01:33:46
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '腺样体'});

MERGE (n:Disease {name: '扁桃体'});

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '腺样体'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '扁桃体'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');



// =====================================

/* Response #35
   Timestamp: 2024-12-12 01:33:46
*/
// 节点更新


// =====================================

/* Response #36
   Timestamp: 2024-12-12 01:33:48
*/
// 节点更新


// =====================================

/* Response #37
   Timestamp: 2024-12-12 01:33:48
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种主要表现为打鼾和睡眠呼吸暂停的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时呼吸发出的声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸短暂停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #38
   Timestamp: 2024-12-12 01:33:49
*/
// 节点更新


// =====================================

/* Response #39
   Timestamp: 2024-12-12 01:33:50
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '鼻用糖皮质激素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗儿童OSA的鼻用糖皮质激素'),
    n.dosage = coalesce(n.dosage, '适应症而定'),
    n.duration = coalesce(n.duration, '根据治疗方案'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '孟鲁司特钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗儿童OSA的口服药物'),
    n.dosage = coalesce(n.dosage, '适应症而定'),
    n.duration = coalesce(n.duration, '根据治疗方案'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠中发出的声音'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠时嘴部开放呼吸'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '觉醒指数'})
SET 
    n.description = coalesce(n.description, '表示夜间觉醒的频率'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '最低血氧饱和度'})
SET 
    n.description = coalesce(n.description, '最低血氧水平'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻用糖皮质激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, '-3.34'),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '孟鲁司特钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, '-0.99'),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '儿童阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '张口呼吸'
MATCH (to) WHERE to.name = '儿童阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '觉醒指数'
MATCH (to) WHERE to.name = '儿童阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '最低血氧饱和度'
MATCH (to) WHERE to.name = '儿童阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #40
   Timestamp: 2024-12-12 01:33:51
*/
// 节点更新


// =====================================

/* Response #41
   Timestamp: 2024-12-12 01:33:54
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '打鼾'});

MERGE (n:Symptom {name: '口呼吸'});

MERGE (n:Symptom {name: '鼻塞'});

MERGE (n:Symptom {name: '行为问题'});

MERGE (n:Symptom {name: '生活质量下降'});

MERGE (n:Treatment {name: '口腔矫治'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于治疗OSA的重要补充措施');

MERGE (n:Complication {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '与OSA相关联的并发症'),
    n.severity = coalesce(n.severity, '轻度');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '口呼吸'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '行为问题'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '生活质量下降'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #42
   Timestamp: 2024-12-12 01:33:55
*/
// 节点更新


// =====================================

/* Response #43
   Timestamp: 2024-12-12 01:33:55
*/
// 节点更新
MERGE (n:Disease {name: '儿童阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '鼻用糖皮质激素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解儿童OSA的鼻用药物'),
    n.dosage = coalesce(n.dosage, '依疗程而定'),
    n.duration = coalesce(n.duration, '6周'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '孟鲁司特钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗OSA的口服药物'),
    n.dosage = coalesce(n.dosage, '依疗程而定'),
    n.duration = coalesce(n.duration, '依疗程而定'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '鼻出血'})
SET 
    n.description = coalesce(n.description, '使用鼻用药物可能出现的轻微副作用'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Complication {name: '恶心'})
SET 
    n.description = coalesce(n.description, '使用药物可能导致的轻微副作用'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Complication {name: '头痛'})
SET 
    n.description = coalesce(n.description, '使用药物可能导致的轻微副作用'),
    n.severity = coalesce(n.severity, '轻');

// 关系更新
MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.05),
    r.timeframe = coalesce(r.timeframe, '治疗期间');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.03),
    r.timeframe = coalesce(r.timeframe, '治疗期间');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.02),
    r.timeframe = coalesce(r.timeframe, '治疗期间');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '鼻用糖皮质激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '儿童阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '孟鲁司特钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

