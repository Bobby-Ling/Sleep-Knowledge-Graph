// File: 特发性过度睡眠：一类不容忽视的睡眠障碍.md
// Processed at: 2024-12-12 01:33:10
// Total pairs: 12

/* Response #1
   Timestamp: 2024-12-12 01:32:23
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:32:27
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.code = coalesce(n.code, 'IH'),
    n.description = coalesce(n.description, '一种睡眠障碍，其诊断需要详细的临床问诊和客观的睡眠监测进行综合评估'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '猝倒发作'})
SET 
    n.code = coalesce(n.code, 'Syndrome'),
    n.description = coalesce(n.description, '突发的短暂意识丧失'),
    n.category = coalesce(n.category, '症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '发作性睡病1型'})
SET 
    n.code = coalesce(n.code, 'Narcolepsy Type 1'),
    n.description = coalesce(n.description, '发作性睡病的亚型，伴有猝倒发作'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '发作性睡病2型'})
SET 
    n.code = coalesce(n.code, 'Narcolepsy Type 2'),
    n.description = coalesce(n.description, '不伴有猝倒发作的发作性睡病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠不足综合征'})
SET 
    n.code = coalesce(n.code, 'Sleep Deprivation Syndrome'),
    n.description = coalesce(n.description, '由于长时间睡眠不足，导致的综合症'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '难以控制的困倦欲睡'})
SET 
    n.description = coalesce(n.description, '患者频繁感到无法控制的困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '非预期性入睡'})
SET 
    n.description = coalesce(n.description, '患者在不适当的时间或场合下入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '白天出现强烈的睡意'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每日');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '猝倒发作'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '难以控制的困倦欲睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '非预期性入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '发作性睡病1型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '发作性睡病2型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:32:32
*/
// 节点更新
MERGE (n:Treatment {name: '健康教育'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '涉及疾病症状、严重程度、病程和转归的认识');

MERGE (n:Treatment {name: '规律小睡'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '如果醒后有恢复感');

MERGE (n:Treatment {name: '良好睡眠卫生'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '维持良好的睡眠环境和习惯');

MERGE (n:Treatment {name: '认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括避免过度黑暗环境，晨起独特唤醒策略，增加警觉性方案');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:32:34
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.code = coalesce(n.code, 'IH'),
    n.description = coalesce(n.description, '一种慢性中枢性嗜睡疾病，主要表现为尽管睡眠时间正常或延长，但白天仍会出现过度嗜睡。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天出现过度嗜睡'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Treatment {name: '特发性过度睡眠治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对特发性过度睡眠进行的综合治疗措施'),
    n.dosage = coalesce(n.dosage, '根据个体情况而定'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '对药物敏感者');

MERGE (n:Complication {name: '生活质量下降'})
SET 
    n.description = coalesce(n.description, '因特发性过度睡眠引起的生活质量下降'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '多认知域功能受损'})
SET 
    n.description = coalesce(n.description, '认知功能受损导致的生活挑战'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '特发性过度睡眠治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '生活质量下降'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '多认知域功能受损'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:32:37
*/
// 节点更新


// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:32:39
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.description = coalesce(n.description, '一种不容忽视的睡眠障碍');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种中枢性过度睡眠疾病');

MERGE (n:Disease {name: '中枢性过度睡眠疾病'})
SET 
    n.description = coalesce(n.description, '包括多种过度睡眠相关疾病');

MERGE (n:Symptom {name: '平均睡眠潜伏期'})
SET 
    n.description = coalesce(n.description, '患者在MSLT中的平均睡眠潜伏时间'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: 'SOREMP'})
SET 
    n.description = coalesce(n.description, '睡眠中快速眼动期'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: 'REM睡眠潜伏期'})
SET 
    n.description = coalesce(n.description, '进入REM睡眠的时间'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: 'REM睡眠时长'})
SET 
    n.description = coalesce(n.description, 'REM睡眠的持续时间'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '低');

MERGE (n:Symptom {name: '睡眠分期转换'})
SET 
    n.description = coalesce(n.description, '睡眠各阶段的转换情况'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '低');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '平均睡眠潜伏期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = 'SOREMP'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = 'REM睡眠潜伏期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = 'REM睡眠时长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠分期转换'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '诊断');

MATCH (from) WHERE from.name = '中枢性过度睡眠疾病'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:32:40
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，表现为夜间睡眠时间延长，日间小睡时间长，醒后无恢复感等'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '夜间睡眠时间延长'})
SET 
    n.description = coalesce(n.description, '成人患者典型睡眠时间超过10小时，儿童患者多于其正常年龄段睡眠2小时以上'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间小睡时间长'})
SET 
    n.description = coalesce(n.description, '通常1小时以上且醒后无恢复感'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠惯性'})
SET 
    n.description = coalesce(n.description, '难以从整夜睡眠或日间小睡后快速醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '相对常见');

MERGE (n:Symptom {name: '昏昏欲睡感'})
SET 
    n.description = coalesce(n.description, '虽然晨起睡眠惰性消失后能保持清醒，但仍感到疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '脑雾'})
SET 
    n.description = coalesce(n.description, '表现为记忆力减退，注意力不集中，常忘记事情等'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '自动行为'})
SET 
    n.description = coalesce(n.description, '睡眠发作时常有自动行为/不恰当行为'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '较少');

MERGE (n:Symptom {name: '抑郁症状'})
SET 
    n.description = coalesce(n.description, 'IH患者可能伴随抑郁症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较少');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '可能为偏头痛和紧张型头痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较少');

MERGE (n:Symptom {name: '自主神经功能紊乱症状'})
SET 
    n.description = coalesce(n.description, '如心悸、直立性低血压、四肢末端发冷等'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较少');

// 关系更新
MATCH (from) WHERE from.name = '夜间睡眠时间延长'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.78),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '日间小睡时间长'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠惯性'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.78),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '昏昏欲睡感'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑雾'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '自动行为'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '抑郁症状'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.55),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '自主神经功能紊乱症状'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:32:42
*/
// 节点更新


// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:32:43
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.description = coalesce(n.description, '一种不容忽视的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '白天过度睡眠'})
SET 
    n.description = coalesce(n.description, '患者白天表现出异常的嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '长睡眠时间'})
SET 
    n.description = coalesce(n.description, '患者夜间睡眠时长明显增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠惰性'})
SET 
    n.description = coalesce(n.description, '患者在醒来后感到极度疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Treatment {name: '低羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗特发性过度睡眠的药物'),
    n.dosage = coalesce(n.dosage, '具体剂量待定'),
    n.duration = coalesce(n.duration, '待定'),
    n.contraindication = coalesce(n.contraindication, '未明确');

MERGE (n:Scale {name: '特发性过度睡眠严重程度量表'})
SET 
    n.description = coalesce(n.description, '用于评估特发性过度睡眠的量表'),
    n.score_range = coalesce(n.score_range, '待定'),
    n.interpretation = coalesce(n.interpretation, '结果解释待定');

// 关系更新
MATCH (from) WHERE from.name = '白天过度睡眠'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '长睡眠时间'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠惰性'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '特发性过度睡眠严重程度量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.95),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '低羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:32:43
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.description = coalesce(n.description, '一类不容忽视的睡眠障碍');

MERGE (n:Treatment {name: '莫达非尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '推荐的一线治疗药物');

MERGE (n:Treatment {name: '哌甲酯'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '强推荐药物');

MERGE (n:Treatment {name: '安非他明'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '强推荐药物');

MERGE (n:Treatment {name: '克拉霉素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '强推荐药物');

MERGE (n:Treatment {name: '氟马西尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '强推荐药物');

MERGE (n:Treatment {name: '马吲哚'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '强推荐药物');

MERGE (n:Treatment {name: '替洛利生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '强推荐药物');

MERGE (n:Treatment {name: '低钠羟丁酸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'FDA批准用于7岁及以上发作性睡病患者');

MERGE (n:Treatment {name: '兴奋类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '需谨慎使用的药物');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '哌甲酯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '安非他明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '克拉霉素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '氟马西尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '马吲哚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '低钠羟丁酸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '兴奋类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:32:44
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.description = coalesce(n.description, '一类不容忽视的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '中枢性思睡类疾病'})
SET 
    n.description = coalesce(n.description, '该类疾病可能与特发性过度睡眠相混淆'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种典型的睡眠障碍，可能表现为日间过度思睡'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠不足综合征'})
SET 
    n.description = coalesce(n.description, '因睡眠不足导致的相关症状'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠觉醒时相延迟障碍'})
SET 
    n.description = coalesce(n.description, '由于生物钟错位造成的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '非快速眼动异态睡眠'})
SET 
    n.description = coalesce(n.description, '非快速眼动阶段的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.severity = coalesce(r.severity, '中等'),
    r.frequency = coalesce(r.frequency, '经常');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.severity = coalesce(r.severity, '中等'),
    r.frequency = coalesce(r.frequency, '间歇性');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.severity = coalesce(r.severity, '中等'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '非快速眼动异态睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.severity = coalesce(r.severity, '中等'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '中枢性思睡类疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.severity = coalesce(r.severity, '高'),
    r.frequency = coalesce(r.frequency, '持续');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:32:47
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，主要表现为日间过度思睡，影响正常生活和日常功能');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '日间感觉困倦和无力的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠惰性'})
SET 
    n.description = coalesce(n.description, '醒来后感觉困倦且难以清醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '思维能力下降和无法集中注意力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间睡眠时间过长'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时间超过正常范围'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物来改善日间的警觉性和功能'),
    n.dosage = coalesce(n.dosage, '根据医生指导'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '思睡患者有其他病史时需谨慎');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括行为疗法和生活方式的调整'),
    n.dosage = coalesce(n.dosage, '无需剂量'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无特殊禁忌');

MERGE (n:Complication {name: '驾驶安全风险'})
SET 
    n.description = coalesce(n.description, '由日间思睡引起的交通事故风险'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '注意力和认知功能下降'})
SET 
    n.description = coalesce(n.description, '思睡导致的学习和工作表现下降'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠惰性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '夜间睡眠时间过长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '驾驶安全风险'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '即刻');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '注意力和认知功能下降'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

