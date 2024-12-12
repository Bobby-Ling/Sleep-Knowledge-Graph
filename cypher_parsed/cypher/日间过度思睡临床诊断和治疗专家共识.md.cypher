// File: 日间过度思睡临床诊断和治疗专家共识.md
// Processed at: 2024-12-12 01:31:01
// Total pairs: 23

/* Response #1
   Timestamp: 2024-12-12 01:30:08
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '个体在白天无法保持应有的清醒和警觉，出现过度的睡眠需求或不自主入睡'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '过度睡眠需求'})
SET 
    n.description = coalesce(n.description, '个体在白天需要更多的睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '不自主入睡'})
SET 
    n.description = coalesce(n.description, '在不适当的情况下入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '过度睡眠需求'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '不自主入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:30:08
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:30:10
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.short_name = coalesce(n.short_name, 'EDS'),
    n.description = coalesce(n.description, '指在一天需要保持清醒的时间段内无法维持清醒和警觉，出现不能抑制的睡眠需求，甚至不由自主地进入睡眠，伴随注意力和记忆力减退'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠增多'})
SET 
    n.short_name = coalesce(n.short_name, 'hypersomnolence'),
    n.description = coalesce(n.description, '描述困倦、昏昏欲睡的主观感受，总睡眠量增多，客观上无法让患者保持长时间清醒的症状，以及睡眠无修复感的状态'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠发作'})
SET 
    n.short_name = coalesce(n.short_name, 'sleep attack'),
    n.description = coalesce(n.description, '在安静、久坐、单调枯燥的场景下，患者在入睡前能意识到自己的困倦，但有的患者在没有任何预警的情况下会突然睡着'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '疲劳'})
SET 
    n.short_name = coalesce(n.short_name, 'fatigue'),
    n.description = coalesce(n.description, '主观感觉体力和精力的缺乏，难以启动活动，或维持日常需求的活动困难'),
    n.category = coalesce(n.category, '症状'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:30:18
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在应当维持清醒的时间段无法保持清醒和警觉，主要表现为过度困倦、无法抑制的睡眠等'),
    n.severity = coalesce(n.severity, '多样'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '过度困倦'})
SET 
    n.description = coalesce(n.description, '在不经意之间入睡，无法抵抗的困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '无法抑制的睡眠'})
SET 
    n.description = coalesce(n.description, '无法控制的睡眠状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '频繁小睡'})
SET 
    n.description = coalesce(n.description, '白天频繁小睡'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '醉酒样睡眠'})
SET 
    n.description = coalesce(n.description, '由睡眠转换到清醒时的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '难以集中注意力'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '情绪不稳定'})
SET 
    n.description = coalesce(n.description, '情绪波动较大'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '时常');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '过度困倦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '无法抑制的睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '频繁小睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '醉酒样睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '注意力不集中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '情绪不稳定'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '轻度');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:30:18
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '一种表现为日间过度想睡的症状和状态'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '中央性嗜睡'})
SET 
    n.description = coalesce(n.description, '一种以白天过度睡眠为特征的疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种反复出现的睡眠发作的疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '特发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '一种无法找到明显病因的过度嗜睡情况'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '复发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '一种表现为周期性嗜睡发作的疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '包括多种类型的睡眠相关的呼吸问题'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠时呼吸由于气道阻塞而反复停顿的情况'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '一种以入睡或维持睡眠困难为主的疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠不足综合征'})
SET 
    n.description = coalesce(n.description, '因睡眠时间不足而导致的一系列健康问题'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '昼夜节律相关睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '一种由于生物钟失调导致的睡眠问题'),
    n.category = coalesce(n.category, '睡眠障碍');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '中央性嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '特发性嗜睡症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.78),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '复发性嗜睡症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.85),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '昼夜节律相关睡眠-觉醒障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '中期');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:30:21
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在清醒状态下经历异常的、周期性的强烈嗜睡，通常会影响日常活动'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Scale {name: '嗜睡量表'})
SET 
    n.description = coalesce(n.description, '用于评估患者日间嗜睡程度的量表'),
    n.score_range = coalesce(n.score_range, '0-24'),
    n.interpretation = coalesce(n.interpretation, '评分越高，嗜睡程度越严重');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '嗜睡量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:30:23
*/
// 节点更新
MERGE (n:Disease {name: '过度嗜睡症'})
SET 
    n.code = coalesce(n.code, 'EDS'),
    n.description = coalesce(n.description, '一种表现为日间过度嗜睡的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到异常困倦'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Complication {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '一种严重的情感障碍'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '一种情绪障碍，表现为严重的焦虑'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Treatment {name: '行为疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过行为调整来改善日间嗜睡'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '对严重精神疾病患者不适用');

MERGE (n:Examination {name: '睡眠障碍问卷'})
SET 
    n.description = coalesce(n.description, '评估睡眠障碍的标准问卷'),
    n.method = coalesce(n.method, '自填'),
    n.requirement = coalesce(n.requirement, '患者需真实填写');

// 关系更新
MATCH (from) WHERE from.name = '过度嗜睡症'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '过度嗜睡症'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '过度嗜睡症'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '过度嗜睡症'
MATCH (to) WHERE to.name = '行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '过度嗜睡症'
MATCH (to) WHERE to.name = '睡眠障碍问卷'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:30:26
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '以白天过度嗜睡为主要特征的临床综合症');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种由于下丘脑食欲素神经元选择性缺失或功能障碍所导致的中枢性嗜睡疾病');

MERGE (n:Disease {name: '特发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '由于原因不明的中枢性嗜睡疾病');

MERGE (n:Disease {name: '复发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '表现为反复发作的嗜睡症状');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '包括各种导致睡眠中呼吸中断或不足的疾病');

MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '表现为睡眠质量差或睡眠不足的症状');

MERGE (n:Disease {name: '睡眠不足综合征'})
SET 
    n.description = coalesce(n.description, '因睡眠不足引发的多种健康问题');

MERGE (n:Disease {name: '昼夜节律相关睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '表现为由于昼夜节律紊乱导致的睡眠障碍');

MERGE (n:Disease {name: '内科疾病'})
SET 
    n.description = coalesce(n.description, '包括多种影响身体系统的疾病');

MERGE (n:Disease {name: '神经系统疾病'})
SET 
    n.description = coalesce(n.description, '影响神经系统的各类疾病');

MERGE (n:Disease {name: '精神障碍'})
SET 
    n.description = coalesce(n.description, '各种影响情感、思维和行为的精神健康问题');

MERGE (n:Disease {name: '药物或物质所致嗜睡症'})
SET 
    n.description = coalesce(n.description, '由药物或其他物质引起的嗜睡症状');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '特发性嗜睡症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '复发性嗜睡症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '昼夜节律相关睡眠-觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '内科疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '神经系统疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '药物或物质所致嗜睡症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:30:27
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'EDS'),
    n.description = coalesce(n.description, '一种导致在白天不可控制的过度嗜睡的状况'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '在白天出现过度的嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '日常');

MERGE (n:Disease {name: '失眠症'})
SET 
    n.code = coalesce(n.code, 'ICD-I47'),
    n.description = coalesce(n.description, '难以入睡或维持睡眠的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.code = coalesce(n.code, 'ICD-G47'),
    n.description = coalesce(n.description, '夜间呼吸异常，导致嗜睡的状态'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'ICD-G47.4'),
    n.description = coalesce(n.description, '一种短暂的不可抗拒的睡眠发作'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重');

// 关系更新
MATCH (from) WHERE from.name = '嗜睡'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '重');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:30:29
*/
// 节点更新
MERGE (n:Disease {name: '特发性嗜睡症'})
SET 
    n.code = coalesce(n.code, 'ICD-10 G47.1'),
    n.description = coalesce(n.description, '一种慢性中枢性嗜睡疾病'),
    n.category = coalesce(n.category, '嗜睡症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '复发性嗜睡症'})
SET 
    n.code = coalesce(n.code, 'ICD-10 G47.2'),
    n.description = coalesce(n.description, '又名克莱恩-莱文综合征'),
    n.category = coalesce(n.category, '嗜睡症'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Symptom {name: '过度日间嗜睡'})
SET 
    n.description = coalesce(n.description, '在白天感到异常疲倦并且难以维持觉醒'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '言语、阅读、记忆困难，时间、空间定向障碍'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情感淡漠'})
SET 
    n.description = coalesce(n.description, '对所有活动均缺乏动力'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '现实感丧失'})
SET 
    n.description = coalesce(n.description, '非真实感，环境感知异常'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '其他症状'})
SET 
    n.description = coalesce(n.description, '包括贪食、性欲亢进，情绪紊乱等'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '特发性嗜睡症'
MATCH (to) WHERE to.name = '过度日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '复发性嗜睡症'
MATCH (to) WHERE to.name = '过度日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '发作期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '复发性嗜睡症'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '发作期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '复发性嗜睡症'
MATCH (to) WHERE to.name = '情感淡漠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '发作期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '复发性嗜睡症'
MATCH (to) WHERE to.name = '现实感丧失'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '复发性嗜睡症'
MATCH (to) WHERE to.name = '其他症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:30:31
*/
// 节点更新
MERGE (n:Scale {name: '牛津睡眠抵抗测验'})
SET 
    n.description = coalesce(n.description, '是MWT的简化版，也间接量化EDS的客观评估工具');

MERGE (n:Scale {name: '精神行为警觉测验'})
SET 
    n.description = coalesce(n.description, '基于对视觉刺激的反应来测量警觉性');

MERGE (n:Scale {name: '驾车试验'})
SET 
    n.description = coalesce(n.description, '常用于警觉性评估');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:30:32
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '一种以白天过度嗜睡为主要表现的疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物来改善EDS症状');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过非药物手段来改善EDS症状');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:30:35
*/
// 节点更新


// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:30:35
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '睡眠呼吸障碍的一种，患者在睡眠中反复出现呼吸暂停或通气不足'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'CSA'),
    n.description = coalesce(n.description, '由中枢神经系统引起的睡眠呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OBS'),
    n.description = coalesce(n.description, '由于肥胖导致的通气不足'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '失眠症'})
SET 
    n.code = coalesce(n.code, 'INS'),
    n.description = coalesce(n.description, '持续的入睡困难、睡眠维持困难或早醒现象'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到中等');

MERGE (n:Disease {name: '睡眠不足综合征'})
SET 
    n.code = coalesce(n.code, 'SDS'),
    n.description = coalesce(n.description, '个体无法获得所需睡眠量而导致的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '昼夜节律相关睡眠-觉醒障碍'})
SET 
    n.code = coalesce(n.code, 'DRD'),
    n.description = coalesce(n.description, '内部时钟与外在环境不协调导致的睡眠问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: 'BMI过高'})
SET 
    n.description = coalesce(n.description, '体重指数过高，可能导致阻塞性睡眠呼吸暂停'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '肥胖（颈围增粗）'})
SET 
    n.description = coalesce(n.description, '颈围增粗与阻塞性睡眠呼吸暂停相关'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '扁桃体肥大可能导致呼吸道阻塞'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '咽喉气道狭窄'})
SET 
    n.description = coalesce(n.description, '咽喉气道狭窄是阻塞性睡眠呼吸暂停的风险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦的状态'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '几乎每天');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或睡眠维持困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '缺乏能量，活动量减少'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '几乎每天');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠不足综合征'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:30:35
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以过度 daytime 睡眠为特征的睡眠障碍');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天表现出过度的嗜睡');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '突发的意识丧失');

MERGE (n:Treatment {name: '下丘脑分泌素-1检测'})
SET 
    n.type = coalesce(n.type, '检查'),
    n.description = coalesce(n.description, '通过检测脑脊液中的下丘脑分泌素-1来帮助明确诊断'),
    n.requirement = coalesce(n.requirement, '脑脊液下丘脑分泌素-1浓度 ≤ 110 pg/ml');

MERGE (n:Treatment {name: '基因检测'})
SET 
    n.type = coalesce(n.type, '检查'),
    n.description = coalesce(n.description, '检测HLA DQB1等位基因与发作性睡病的相关性'),
    n.requirement = coalesce(n.requirement, '与猝倒及怀疑发作性睡病患者相关');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '下丘脑分泌素-1检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '基因检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:30:36
*/
// 节点更新
MERGE (n:Scale {name: 'ESS'})
SET 
    n.description = coalesce(n.description, '评估日间思睡的严重程度'),
    n.score_range = coalesce(n.score_range, '0~3'),
    n.interpretation = coalesce(n.interpretation, '1分视为过度思睡, ≥16分提示有严重思睡');

MERGE (n:Scale {name: 'SSS'})
SET 
    n.description = coalesce(n.description, '测试受试者的主观倦意'),
    n.score_range = coalesce(n.score_range, '1~7'),
    n.interpretation = coalesce(n.interpretation, '选择第4~7项提示可能过度思睡');

MERGE (n:Scale {name: 'KSS'})
SET 
    n.description = coalesce(n.description, '测量个体主观思睡和警觉性'),
    n.score_range = coalesce(n.score_range, '1~10'),
    n.interpretation = coalesce(n.interpretation, '分数越高表示清醒程度越低');

MERGE (n:Scale {name: 'PDSS'})
SET 
    n.description = coalesce(n.description, '评估青少年思睡的主观感受'),
    n.score_range = coalesce(n.score_range, '0~4'),
    n.interpretation = coalesce(n.interpretation, '高分提示日间思睡明显, 18/19分作为发作性睡病的筛查界值');

MERGE (n:Scale {name: 'UNS'})
SET 
    n.description = coalesce(n.description, '评估发作性睡病的思睡、猝倒症状和夜间睡眠潜伏时间'),
    n.score_range = coalesce(n.score_range, '0~4'),
    n.interpretation = coalesce(n.interpretation, '总分≥14分用于发作性睡病筛查, 对1型发作性睡病有助于排除该诊断');

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '日间过度思睡'});

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'UNS'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, '高');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = 'ESS'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '高');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = 'SSS'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.75),
    r.recommendation_level = coalesce(r.recommendation_level, '中');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = 'KSS'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '中');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = 'PDSS'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.7),
    r.recommendation_level = coalesce(r.recommendation_level, '低');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:30:36
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'EDS'),
    n.description = coalesce(n.description, '由于其他睡眠障碍引起的日间过度思睡'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '药物引起的日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'EDS-MED'),
    n.description = coalesce(n.description, '药物引起的日间过度思睡'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '物质滥用引起的日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'EDS-SUB'),
    n.description = coalesce(n.description, '物质滥用引起的日间过度思睡'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '兴奋性物质撤除或戒断引起的思睡'})
SET 
    n.code = coalesce(n.code, 'EDS-WITHDRAWAL'),
    n.description = coalesce(n.description, '兴奋性物质撤除或戒断引起的思睡'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '镇静药物'})
SET 
    n.description = coalesce(n.description, '用于引起镇静的药物'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '抗精神病药物'})
SET 
    n.description = coalesce(n.description, '用于治疗精神疾病的药物'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '抗组胺药'})
SET 
    n.description = coalesce(n.description, '用于治疗过敏与感冒症状的药物'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '多巴胺受体激动剂'})
SET 
    n.description = coalesce(n.description, '用于治疗帕金森病的药物'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '抗癫痫药'})
SET 
    n.description = coalesce(n.description, '用于治疗癫痫的药物'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '某些抗生素'})
SET 
    n.description = coalesce(n.description, '用于治疗感染的药物'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '酒精'})
SET 
    n.description = coalesce(n.description, '一种抑制中枢神经系统的物质'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '阿片类'})
SET 
    n.description = coalesce(n.description, '强效镇痛药物'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '大麻'})
SET 
    n.description = coalesce(n.description, '一种精神活性物质'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '可卡因'})
SET 
    n.description = coalesce(n.description, '一种强烈刺激精神的物质'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '苯丙胺'})
SET 
    n.description = coalesce(n.description, '一种强效兴奋剂'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '咖啡因'})
SET 
    n.description = coalesce(n.description, '一种轻微兴奋剂'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '不定期');

// 关系更新
MATCH (from) WHERE from.name = '镇静药物'
MATCH (to) WHERE to.name = '药物引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '抗精神病药物'
MATCH (to) WHERE to.name = '药物引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '抗组胺药'
MATCH (to) WHERE to.name = '药物引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多巴胺受体激动剂'
MATCH (to) WHERE to.name = '药物引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '抗癫痫药'
MATCH (to) WHERE to.name = '药物引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '某些抗生素'
MATCH (to) WHERE to.name = '药物引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '酒精'
MATCH (to) WHERE to.name = '物质滥用引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阿片类'
MATCH (to) WHERE to.name = '物质滥用引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '大麻'
MATCH (to) WHERE to.name = '物质滥用引起的日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '可卡因'
MATCH (to) WHERE to.name = '兴奋性物质撤除或戒断引起的思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '苯丙胺'
MATCH (to) WHERE to.name = '兴奋性物质撤除或戒断引起的思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '咖啡因'
MATCH (to) WHERE to.name = '兴奋性物质撤除或戒断引起的思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '低');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:30:36
*/
// 节点更新


// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:30:41
*/
// 节点更新
MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '有助于评估夜间睡眠状况、发现夜间睡眠伴随的事件，具有重要价值。'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '当怀疑有OSA、周期性肢体运动障碍、发作性睡病、其他中枢性嗜睡或睡眠期癫痫发作时，或根据病史和体格检查未能明确思睡原因时');

MERGE (n:Examination {name: 'MSLT'})
SET 
    n.description = coalesce(n.description, '目前被认为是可客观量化思睡的一种标准测量方法，是发作性睡病的重要诊断依据，也有助于评估特发性嗜睡症。'),
    n.method = coalesce(n.method, '多次入睡潜伏期测试'),
    n.requirement = coalesce(n.requirement, '疑似发作性睡病或特发性嗜睡症，不适用于OSA、失眠症、昼夜节律相关睡眠-觉醒障碍及神经系统疾病的常规评估');

MERGE (n:Examination {name: '清醒维持测验 (MWT)'})
SET 
    n.description = coalesce(n.description, '用于评估受试者在日间安静环境中保持清醒的能力。'),
    n.method = coalesce(n.method, '日间清醒维持测试'),
    n.requirement = coalesce(n.requirement, '当发作性睡病、OSA、倒班工作等疾病或状态可能影响日间觉醒能力时，避免从事危险性职业，并可作为药物改善觉醒能力的评价指标');

MERGE (n:Examination {name: '体动仪'})
SET 
    n.description = coalesce(n.description, '可穿戴设备，通常置入加速计，可有效测量睡眠参数和平均运动时长，用于评估睡眠-觉醒周期。'),
    n.method = coalesce(n.method, '运动监测设备'),
    n.requirement = coalesce(n.requirement, '证实思睡患者的EDS严重程度，排除睡眠不足，尤其在MSLT检查前');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'Narcolepsy');

MERGE (n:RiskFactor {name: '周期性肢体运动障碍'})
SET 
    n.description = coalesce(n.description, '与发作性睡病有关的睡眠障碍'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '神经系统疾病'})
SET 
    n.description = coalesce(n.description, '可能影响睡眠的疾病'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'MSLT'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '清醒维持测验 (MWT)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '体动仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '体动仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '神经系统疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:30:46
*/
// 节点更新


// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:30:51
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天过度疲倦，无法保持清醒状态的表现。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '生活方式干预'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过改变不良生活方式和睡眠卫生习惯来改善EDS'),
    n.duration = coalesce(n.duration, '持续性'),
    n.contraindication = coalesce(n.contraindication, '无具体禁忌');

MERGE (n:Treatment {name: '调整入睡和起床时间'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '逐步调整患者的作息时间，以纠正睡眠卫生习惯'),
    n.duration = coalesce(n.duration, '持续性'),
    n.contraindication = coalesce(n.contraindication, '无具体禁忌');

MERGE (n:Treatment {name: '光照疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过光照调节昼夜节律，以改善EDS症状'),
    n.duration = coalesce(n.duration, '每日'),
    n.contraindication = coalesce(n.contraindication, '光照敏感者');

MERGE (n:Treatment {name: '无创正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '首选治疗OSA所致EDS的方案，需根据患者特点选择合适模式'),
    n.duration = coalesce(n.duration, '持续性'),
    n.contraindication = coalesce(n.contraindication, '无气道塌陷患者');

MERGE (n:Treatment {name: '认知行为疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改善睡眠质量的方法，对于失眠引起的EDS有效'),
    n.duration = coalesce(n.duration, '根据疗程'),
    n.contraindication = coalesce(n.contraindication, '无具体禁忌');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '生活方式干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '调整入睡和起床时间'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '光照疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '无创正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:30:53
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '由于多种原因导致的白天异常嗜睡现象，包括睡眠障碍、精神障碍及躯体疾病等'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠-觉醒时相延迟'})
SET 
    n.description = coalesce(n.description, '内部时钟延迟，导致睡眠时间不足及过度的睡眠惯性'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠-觉醒时相提前'})
SET 
    n.description = coalesce(n.description, '主要表现为睡眠维持困难及早醒'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '无规律性昼夜节律相关睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '在预定的睡眠时间内出现失眠症状，而在白天出现EDS'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '非24小时昼夜节律相关睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '内源性昼夜节律与外部24小时环境不一致'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '倒班与时差相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '工作或时区要求清醒的时间与通常或原有的睡眠时间重叠'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠相关运动障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.description = coalesce(n.description, '一种运动障碍，可导致睡眠问题'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠相关性胃食管反流'})
SET 
    n.description = coalesce(n.description, '影响夜间睡眠质量的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '重性抑郁症'})
SET 
    n.description = coalesce(n.description, '伴有EDS的精神障碍'),
    n.category = coalesce(n.category, '精神障碍');

MERGE (n:Disease {name: '季节性情感障碍'})
SET 
    n.description = coalesce(n.description, '伴有EDS的精神障碍'),
    n.category = coalesce(n.category, '精神障碍');

MERGE (n:Disease {name: '脑炎'})
SET 
    n.description = coalesce(n.description, '一种神经系统疾病，可导致EDS'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种神经退行性疾病，可导致EDS'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: '甲状腺功能减退'})
SET 
    n.description = coalesce(n.description, '内分泌疾病，可导致EDS'),
    n.category = coalesce(n.category, '内分泌疾病');

MERGE (n:Disease {name: '癌症'})
SET 
    n.description = coalesce(n.description, '全身性疾病之一，可导致EDS'),
    n.category = coalesce(n.category, '全身性疾病');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天异常嗜睡，影响正常活动'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '难以保持睡眠状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比预期早起'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '睡眠潜伏时间延长'})
SET 
    n.description = coalesce(n.description, '入睡所需时间增加'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '睡眠效率降低'})
SET 
    n.description = coalesce(n.description, '实际睡眠时间与总躺下时间的比例降低'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '每日');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '重性抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠维持困难'
MATCH (to) WHERE to.name = '睡眠-觉醒时相提前'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '睡眠-觉醒时相提前'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠潜伏时间延长'
MATCH (to) WHERE to.name = '重性抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠效率降低'
MATCH (to) WHERE to.name = '重性抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '无规律性昼夜节律相关睡眠-觉醒障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '非24小时昼夜节律相关睡眠-觉醒障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:30:57
*/
// 节点更新
MERGE (n:Treatment {name: '替洛利生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '主要用于1型发作性睡病的治疗');

MERGE (n:Treatment {name: '莫达非尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '首选药物，主要用于保持夜间警觉');

MERGE (n:Treatment {name: '阿莫达非尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '其他药物，主要用于保持夜间警觉');

MERGE (n:Treatment {name: '哌甲酯'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '主要用于帮助睡眠');

MERGE (n:Treatment {name: '索林非妥'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '其他药物，针对嗜睡的治疗');

MERGE (n:Treatment {name: '马吲哚'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '其他药物，用于改善症状');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '主要用于昼夜节律紊乱导致的EDS'),
    n.contraindication = coalesce(n.contraindication, '儿童青少年慎用大剂量');

MERGE (n:Treatment {name: '他司美琼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '褪黑素受体激动剂');

MERGE (n:Treatment {name: '雷美替胺'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '褪黑素受体激动剂');

MERGE (n:Treatment {name: '多巴胺受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '主要用于不宁腿综合征等');

MERGE (n:Treatment {name: '加巴喷丁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于不宁腿综合征的治疗');

MERGE (n:Treatment {name: '普瑞巴林'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于不宁腿综合征的治疗');

MERGE (n:Treatment {name: '阿片类'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于不宁腿综合征的治疗');

MERGE (n:Disease {name: '第一型发作性睡病'});

MERGE (n:Disease {name: '昼夜节律紊乱'});

MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Disease {name: '周期性肢体运动障碍'});

MERGE (n:Disease {name: '嗜睡综合症'});

// 关系更新
MATCH (from) WHERE from.name = '第一型发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '第一型发作性睡病'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '第一型发作性睡病'
MATCH (to) WHERE to.name = '阿莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '第一型发作性睡病'
MATCH (to) WHERE to.name = '哌甲酯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '第一型发作性睡病'
MATCH (to) WHERE to.name = '索林非妥'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '第一型发作性睡病'
MATCH (to) WHERE to.name = '马吲哚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '昼夜节律紊乱'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '昼夜节律紊乱'
MATCH (to) WHERE to.name = '他司美琼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '昼夜节律紊乱'
MATCH (to) WHERE to.name = '雷美替胺'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普瑞巴林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '阿片类'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

