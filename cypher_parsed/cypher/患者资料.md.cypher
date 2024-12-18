// File: 患者资料.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 64

/* Response #1
   Timestamp: 2024-12-19 00:08:20
*/
// 节点更新
MERGE (n:Disease {name: '抑郁状态'});

MERGE (n:Disease {name: '焦虑状态'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '血管支架植入术后状态'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '慢性胃炎'});

// 关系更新
MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '冠状动脉粥样硬化性心脏病'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:20
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '焦虑抑郁状态'});

MERGE (n:Disease {name: '后循环缺血'});

MERGE (n:Symptom {name: '脑鸣'})
SET 
    n.description = coalesce(n.description, '脑内有电流声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '行走不稳, 视物旋转'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '明显');

MERGE (n:Symptom {name: '胸闷'})
SET 
    n.description = coalesce(n.description, '不适感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '感觉恶心'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '脑鸣'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '胸闷'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '脑鸣'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #3
   Timestamp: 2024-12-19 00:08:21
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '左肺上叶肺动脉栓塞'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '抑郁症'});

MERGE (n:Disease {name: '高血压'});

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '渐起记忆力下降10年余，加重2月余'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '大小便失禁'})
SET 
    n.description = coalesce(n.description, '患者出现大小便失禁现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '幻听'})
SET 
    n.description = coalesce(n.description, '有时有幻听，听到声音'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '食纳可'})
SET 
    n.description = coalesce(n.description, '患者食物摄入情况良好'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '精神一般'})
SET 
    n.description = coalesce(n.description, '患者精神状态一般'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '大小便失禁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '幻听'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '抑郁症'
MATCH (to) WHERE to.name = '精神一般'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '左肺上叶肺动脉栓塞'
MATCH (to) WHERE to.name = '大小便失禁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #4
   Timestamp: 2024-12-19 00:08:26
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '夜间憋气'})
SET 
    n.description = coalesce(n.description, '夜间入睡后内出现憋闷'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '憋醒'})
SET 
    n.description = coalesce(n.description, '夜间憋醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天瞌睡'})
SET 
    n.description = coalesce(n.description, '白天经常感到困倦'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '夜间憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '憋醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '白天瞌睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #5
   Timestamp: 2024-12-19 00:08:27
*/
// 节点更新
MERGE (n:Disease {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '记忆力下降，从而影响日常生活的能力'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: '肝功能不全'})
SET 
    n.description = coalesce(n.description, '肝脏无法正常工作，清除体内毒素'),
    n.category = coalesce(n.category, '肝脏疾病');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '患者的记忆力逐渐减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '计算力下降'})
SET 
    n.description = coalesce(n.description, '患者的计算能力减弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '计算力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '肝功能不全'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #6
   Timestamp: 2024-12-19 00:08:30
*/
// 节点更新
MERGE (n:Disease {name: '抑郁状态'});

MERGE (n:Disease {name: '焦虑状态'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '周期性肢体运动障碍PLMD'});

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '情绪状态低落'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '紧张不安'})
SET 
    n.description = coalesce(n.description, '精神状态紧张和不安'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '夜间多汗'})
SET 
    n.description = coalesce(n.description, '晚上睡觉时大量出汗'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '白天精神差'})
SET 
    n.description = coalesce(n.description, '白天感到精神不振'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力减退'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '情绪低落'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '紧张不安'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #7
   Timestamp: 2024-12-19 00:08:30
*/
// 节点更新
MERGE (n:Disease {name: '抑郁状态'});

MERGE (n:Disease {name: '强迫性障碍'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '焦虑状态'});

// 关系更新
MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '强迫性障碍'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑状态'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #8
   Timestamp: 2024-12-19 00:08:31
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '夜间重度低氧血症'});

MERGE (n:Disease {name: '甲状腺功能减退症'});

MERGE (n:Symptom {name: '进行性记忆力下降'})
SET 
    n.description = coalesce(n.description, '5年来记忆力下降，容易丢三落四，转身忘事'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '性格改变'})
SET 
    n.description = coalesce(n.description, '性格有改变，生活逐渐不能自理'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '渐进');

MERGE (n:Symptom {name: '言语减少'})
SET 
    n.description = coalesce(n.description, '逐渐言语减少，无法沟通及交流'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '二便不自知'})
SET 
    n.description = coalesce(n.description, '二便不自知的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '日间精神状态差'})
SET 
    n.description = coalesce(n.description, '白天没精神'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '睡眠监测异常'})
SET 
    n.description = coalesce(n.description, '重度睡眠呼吸暂停AHI45.8，最低氧74%'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '复查MRI等检查'})
SET 
    n.description = coalesce(n.description, '动态复查头颅MRI等相关辅助检查'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '暂时');

// 关系更新
MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '进行性记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '性格改变'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '言语减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '二便不自知'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '日间精神状态差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠监测异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '高血压病'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '低');



// =====================================

/* Response #9
   Timestamp: 2024-12-19 00:08:31
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '由于气道阻塞导致的呼吸不畅和低氧血症'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '不可遏制的短期睡眠发作'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感觉到的眩晕或失去平衡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间做梦较多，影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间说梦话'})
SET 
    n.description = coalesce(n.description, '在睡眠中无意识地说话'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现无意识的肢体动作'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '开车时无法专注'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间说梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '拳打脚踢'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '注意力不集中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #10
   Timestamp: 2024-12-19 00:08:32
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '不安腿综合征'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '焦虑抑郁状态'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '渐起行动迟缓伴肢体僵硬'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '肢体僵硬'})
SET 
    n.description = coalesce(n.description, '持续的肢体僵硬'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.description = coalesce(n.description, '排便困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '嗅觉减退'})
SET 
    n.description = coalesce(n.description, '嗅觉能力下降'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间翻身困难'})
SET 
    n.description = coalesce(n.description, '夜间翻身时存在困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出呼吸声'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '晚上容易醒来'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜尿增多'})
SET 
    n.description = coalesce(n.description, '夜间频繁排尿'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间大汗'})
SET 
    n.description = coalesce(n.description, '夜间出汗明显'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '紧张'})
SET 
    n.description = coalesce(n.description, '紧张情绪'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '焦虑情绪'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肢体僵硬'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '便秘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '嗅觉减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜间翻身困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜尿增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜间大汗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '紧张'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #11
   Timestamp: 2024-12-19 00:08:32
*/
// 节点更新
MERGE (n:Disease {name: '血管性痴呆'});

MERGE (n:Disease {name: '脑梗死'});

MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '酒精性脑病'});

MERGE (n:Symptom {name: '渐起记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力逐渐下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '反应迟钝'})
SET 
    n.description = coalesce(n.description, '患者反应能力下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '言语不清'})
SET 
    n.description = coalesce(n.description, '言语表达不流畅'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '口角右歪'})
SET 
    n.description = coalesce(n.description, '面部表情不对称'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '性格改变'})
SET 
    n.description = coalesce(n.description, '性格变得孤僻少语'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '记忆下降'})
SET 
    n.description = coalesce(n.description, '近记忆力差'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '肢体无力'})
SET 
    n.description = coalesce(n.description, '右上肢无力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '跌倒经历'})
SET 
    n.description = coalesce(n.description, '患者有跌倒情况'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '渐起记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '反应迟钝'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '言语不清'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '口角右歪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '性格改变'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '记忆下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '肢体无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '跌倒经历'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '逐渐');

MATCH (from) WHERE from.name = '酒精性脑病'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '逐渐');



// =====================================

/* Response #12
   Timestamp: 2024-12-19 00:08:33
*/
// 节点更新
MERGE (n:Disease {name: '快动眼期睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，表现为在快动眼期睡眠中出现异常行为，如肢体运动和说梦话'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '由于小血管供血不足而导致的脑组织缺血性病变'),
    n.category = coalesce(n.category, '脑血管疾病');

MERGE (n:Disease {name: '脑栓塞'})
SET 
    n.description = coalesce(n.description, '由于血栓或栓子导致的脑血管突然阻塞'),
    n.category = coalesce(n.category, '脑血管疾病');

// 关系更新
MATCH (from) WHERE from.name = '快动眼期睡眠行为障碍'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼期睡眠行为障碍'
MATCH (to) WHERE to.name = '脑栓塞'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #13
   Timestamp: 2024-12-19 00:08:36
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠40余年，行走倾斜1月，跌倒1天'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '焦虑抑郁状态'})
SET 
    n.description = coalesce(n.description, '患者老年男性，因焦虑、抑郁症状入院'),
    n.category = coalesce(n.category, '心理状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '查颅脑MRI示腔隙性脑梗死'),
    n.category = coalesce(n.category, '神经系统'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '前列腺增生'})
SET 
    n.description = coalesce(n.description, '前列腺增生诊断'),
    n.category = coalesce(n.category, '泌尿系统'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '患者有入睡困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '患者夜间易醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '患者夜间多梦情况'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '晨起乏力'})
SET 
    n.description = coalesce(n.description, '晨起乏力症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '情绪紧张'})
SET 
    n.description = coalesce(n.description, '因担心病情出现情绪紧张'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '近期');

MERGE (n:Symptom {name: '尿频'})
SET 
    n.description = coalesce(n.description, '夜间尿频2-5次'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '晨起乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '情绪紧张'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '近期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #14
   Timestamp: 2024-12-19 00:08:37
*/
// 节点更新
MERGE (n:Disease {name: '脑血管病后遗症'});

MERGE (n:Disease {name: '细菌性肺炎'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '大脑中动脉闭塞'});

MERGE (n:Disease {name: '心房颤动'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

// 关系更新
MATCH (from) WHERE from.name = '脑血管病后遗症'
MATCH (to) WHERE to.name = '高血压病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '冠状动脉粥样硬化性心脏病'
MATCH (to) WHERE to.name = '高血压病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '大脑中动脉闭塞'
MATCH (to) WHERE to.name = '脑血管病后遗症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '心房颤动'
MATCH (to) WHERE to.name = '脑血管病后遗症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #15
   Timestamp: 2024-12-19 00:08:37
*/
// 节点更新
MERGE (n:Disease {name: '血管性痴呆'});

MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Disease {name: '心房颤动'});

MERGE (n:Disease {name: '心功能不全'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '器质性精神障碍'});

MERGE (n:Disease {name: '贫血'});

MERGE (n:Disease {name: '营养不良'});

MERGE (n:Disease {name: '肺部感染'});

MERGE (n:Disease {name: '脑梗死后遗症'});

// 关系更新
MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '心房颤动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '心功能不全'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '冠状动脉粥样硬化性心脏病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '贫血'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '营养不良'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '肺部感染'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '脑梗死后遗症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #16
   Timestamp: 2024-12-19 00:08:39
*/
// 节点更新
MERGE (n:Disease {name: '路易体痴呆'});

MERGE (n:Disease {name: '阿尔茨海默症'});

MERGE (n:Disease {name: '血管性痴呆'});

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '渐起记忆力下降伴行动迟缓'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '伴随患者反应迟钝'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行为紊乱'})
SET 
    n.description = coalesce(n.description, '患者经历行为异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '头昏眼花'})
SET 
    n.description = coalesce(n.description, '患者描述的症状'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '间歇');

// 关系更新
MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '头昏眼花'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阿尔茨海默症'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #17
   Timestamp: 2024-12-19 00:08:42
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '2型糖尿病'});

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '2型糖尿病'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '最低');



// =====================================

/* Response #18
   Timestamp: 2024-12-19 00:08:43
*/
// 节点更新
MERGE (n:Disease {name: '后循环缺血'});

MERGE (n:Disease {name: '缺血性脑血管病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Symptom {name: '耳鸣'})
SET 
    n.description = coalesce(n.description, '持续的耳内鸣响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '发作性头晕'})
SET 
    n.description = coalesce(n.description, '间歇性头晕'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '发生频率较高');

MERGE (n:Symptom {name: '听力下降'})
SET 
    n.description = coalesce(n.description, '听力逐渐降低'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续性');

// 关系更新
MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '发作性头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '耳鸣'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '听力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续性'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '缺血性脑血管病'
MATCH (to) WHERE to.name = '后循环缺血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #19
   Timestamp: 2024-12-19 00:08:43
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '颅内动脉瘤栓塞术后'});

MERGE (n:Disease {name: '胸主动脉夹层术后'});

MERGE (n:Symptom {name: '记忆力减退'})
SET 
    n.description = coalesce(n.description, '渐起记忆力减退伴行为异常'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '有时无故发脾气'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '呼吸睡眠暂停'})
SET 
    n.description = coalesce(n.description, '存在呼吸睡眠暂停症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '饮食不规律'})
SET 
    n.description = coalesce(n.description, '饮食不规律，吃过饭不记得'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '记忆力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '行为异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '呼吸睡眠暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '饮食不规律'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '颅内动脉瘤栓塞术后'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '胸主动脉夹层术后'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.2),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #20
   Timestamp: 2024-12-19 00:08:45
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '一种在快动眼睡眠期表现出的异常行为症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间手舞足蹈'})
SET 
    n.description = coalesce(n.description, '反复在夜间出现手舞足蹈的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '做噩梦'})
SET 
    n.description = coalesce(n.description, '夜间出现噩梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '几乎每天');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话的表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: 'MRI'})
SET 
    n.description = coalesce(n.description, '核磁共振成像，用于排查神经系统问题'),
    n.method = coalesce(n.method, '核磁共振扫描'),
    n.requirement = coalesce(n.requirement, '在扫描前保持放松');

// 关系更新
MATCH (from) WHERE from.name = '夜间手舞足蹈'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '做噩梦'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '几乎每天'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '梦话'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = 'MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #21
   Timestamp: 2024-12-19 00:08:46
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '自发性过度嗜眠症'});

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '自发性过度嗜眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #22
   Timestamp: 2024-12-19 00:08:47
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #23
   Timestamp: 2024-12-19 00:08:50
*/
// 节点更新
MERGE (n:Disease {name: '焦虑抑郁状态'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '患者因情绪波动及环境改变导致夜间入睡困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡意差'})
SET 
    n.description = coalesce(n.description, '患者白天无思睡，精力下降，伴有情绪低落'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '夜间多梦'})
SET 
    n.description = coalesce(n.description, '患者在夜间频繁做梦，影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '患者醒后无法再次入睡，对日常生活产生严重影响'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '患者情绪低落，伴有焦虑着急的表现'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '夜间多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #24
   Timestamp: 2024-12-19 00:08:50
*/
// 节点更新
MERGE (n:Disease {name: '不安腿综合征'});

MERGE (n:Symptom {name: '夜间腿部不适'})
SET 
    n.description = coalesce(n.description, '患者在夜间感到腿部不适的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '主观性失眠'})
SET 
    n.description = coalesce(n.description, '患者主观感觉睡眠时间与实际不符'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '夜间腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '主观性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #25
   Timestamp: 2024-12-19 00:08:51
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到异常困倦，无法自控'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续一年');

MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '夜间无法移动身体的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠瘫痪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #26
   Timestamp: 2024-12-19 00:08:52
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '夜间憋气'})
SET 
    n.description = coalesce(n.description, '夜间憋气现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '憋醒'})
SET 
    n.description = coalesce(n.description, '夜间憋醒伴有窒息感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间明显的打鼾声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '憋醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '夜间憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #27
   Timestamp: 2024-12-19 00:08:54
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.category = coalesce(n.category, '高血压');

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '患者逐渐出现的行动迟缓，肢体连带动作减少'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '饮水异物感'})
SET 
    n.description = coalesce(n.description, '患者有异物感'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '嗅觉丧失'})
SET 
    n.description = coalesce(n.description, '患者出现的嗅觉减退'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '后颈部僵硬'})
SET 
    n.description = coalesce(n.description, '颈部感觉僵硬'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '强迫后仰'})
SET 
    n.description = coalesce(n.description, '患者行走时头部会向后倒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.description = coalesce(n.description, '患者有便秘症状'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '眠浅易醒'})
SET 
    n.description = coalesce(n.description, '患者夜间睡眠质量差，易醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '梦话多'})
SET 
    n.description = coalesce(n.description, '夜间说梦话现象'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '间歇');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '后颈部僵硬'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '饮水异物感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '嗅觉丧失'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '强迫后仰'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '便秘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '眠浅易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '梦话多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #28
   Timestamp: 2024-12-19 00:08:54
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '患者因失眠1年入院'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '谵妄'})
SET 
    n.description = coalesce(n.description, '患者因行为异常1月入院，夜间存在异常行为'),
    n.category = coalesce(n.category, '精神障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '脾气暴躁'})
SET 
    n.description = coalesce(n.description, '患者近半年脾气暴躁，性格变得固执'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '白天对前一晚发生的事没有记忆'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.description = coalesce(n.description, '患者长期便秘'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '夜间小便解在身上而不自知'})
SET 
    n.description = coalesce(n.description, '2-3天前夜间小便解在身上而不自知'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '脾气暴躁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '便秘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '夜间小便解在身上而不自知'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '谵妄'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #29
   Timestamp: 2024-12-19 00:08:55
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '高尿酸血症'});

MERGE (n:Disease {name: '肾功能不全'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Symptom {name: '夜间多梦'})
SET 
    n.description = coalesce(n.description, '夜间频繁做梦的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日发作');

MERGE (n:Symptom {name: '大喊大叫'})
SET 
    n.description = coalesce(n.description, '夜间发出大声叫喊'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日发作');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.description = coalesce(n.description, '在梦中或睡眠中出现打击行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日发作');

// 关系更新
MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '几乎每日发作'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '大喊大叫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '几乎每日发作'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '拳打脚踢'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '几乎每日发作'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #30
   Timestamp: 2024-12-19 00:08:56
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '血管性帕金森综合征'});

MERGE (n:Symptom {name: '右下肢僵硬'})
SET 
    n.description = coalesce(n.description, '右下肢出现僵硬感，行走慢，起步困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '抖动'})
SET 
    n.description = coalesce(n.description, '右下肢抖动'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '静止性震颤'})
SET 
    n.description = coalesce(n.description, '在静止时出现的震颤'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '嗅觉减退'})
SET 
    n.description = coalesce(n.description, '嗅觉能力下降'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '梦魇'})
SET 
    n.description = coalesce(n.description, '做噩梦的经历'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '睡眠差'})
SET 
    n.description = coalesce(n.description, '睡眠质量不好，易醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '右下肢僵硬'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '抖动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '静止性震颤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '嗅觉减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '梦魇'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '睡眠差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '右下肢僵硬'
MATCH (to) WHERE to.name = '血管性帕金森综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #31
   Timestamp: 2024-12-19 00:08:58
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '抑郁状态'});

MERGE (n:Disease {name: '脑外伤后综合征'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '颅内动脉瘤栓塞术后'});

MERGE (n:Disease {name: '骨质疏松'});

MERGE (n:Disease {name: '溃疡性结肠炎'});

MERGE (n:Symptom {name: '夜间大喊大叫'})
SET 
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '嗅觉减退'})
SET 
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '饮水呛咳'})
SET 
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '渐进');

MERGE (n:Symptom {name: '小便失禁'})
SET 
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '睡眠差'})
SET 
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '长期');

// 关系更新
MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间大喊大叫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '拳打脚踢'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '嗅觉减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '便秘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '饮水呛咳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '渐进'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '小便失禁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #32
   Timestamp: 2024-12-19 00:09:00
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '特发性震颤'});

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力下降10年，加重1年余'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '肢体抖动'})
SET 
    n.description = coalesce(n.description, '伴随肢体抖动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '穿衣穿反'})
SET 
    n.description = coalesce(n.description, '穿衣方式错误'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '起床困难'})
SET 
    n.description = coalesce(n.description, '起床时感到困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '认知能力下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '神志尚清'})
SET 
    n.description = coalesce(n.description, '患者意识清晰'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '精神一般'})
SET 
    n.description = coalesce(n.description, '精神状态一般'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '对答尚切题'})
SET 
    n.description = coalesce(n.description, '对答与问题相关性良好'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '肢体抖动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '穿衣穿反'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '起床困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '特发性震颤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #33
   Timestamp: 2024-12-19 00:09:19
*/
// 节点更新
MERGE (n:Disease {name: '重度睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '严重的睡眠呼吸暂停导致的低通气状态'),
    n.category = coalesce(n.category, '睡眠疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.description = coalesce(n.description, '一种导致记忆力和认知能力下降的神经退行性疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '小动脉梗死导致的小面积脑组织缺血'),
    n.category = coalesce(n.category, '脑血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肺恶性肿瘤术后'})
SET 
    n.description = coalesce(n.description, '肺部恶性肿瘤手术后的状态'),
    n.category = coalesce(n.category, '肿瘤病'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '肺恶性肿瘤术后'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '慢性');



// =====================================

/* Response #34
   Timestamp: 2024-12-19 00:09:20
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时出现打鼾情况'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天嗜睡明显，开车或者坐着不动都会睡着'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #35
   Timestamp: 2024-12-19 00:09:23
*/
// 节点更新
MERGE (n:Disease {name: '急性脑梗死'})
SET 
    n.description = coalesce(n.description, '急性脑梗死'),
    n.category = coalesce(n.category, '脑血管病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '血管性认知功能障碍'})
SET 
    n.description = coalesce(n.description, '由于脑部血管问题导致的认知功能障碍'),
    n.category = coalesce(n.category, '认知障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '脑血管病后遗症'})
SET 
    n.description = coalesce(n.description, '脑血管病后遗症'),
    n.category = coalesce(n.category, '脑血管病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '器质性精神障碍'})
SET 
    n.description = coalesce(n.description, '由生理病理变化导致的精神障碍'),
    n.category = coalesce(n.category, '精神障碍'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '急性脑梗死'
MATCH (to) WHERE to.name = '血管性认知功能障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '急性脑梗死'
MATCH (to) WHERE to.name = '脑血管病后遗症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '急性脑梗死'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #36
   Timestamp: 2024-12-19 00:09:25
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '冠状动脉粥样硬化性心脏病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #37
   Timestamp: 2024-12-19 00:09:26
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '甲状腺功能减退症'});

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '冠状动脉粥样硬化性心脏病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '高血压病'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #38
   Timestamp: 2024-12-19 00:09:27
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出的呼噜声'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度的嗜睡状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '明显');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #39
   Timestamp: 2024-12-19 00:09:28
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '睡眠低通气综合征'});

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #40
   Timestamp: 2024-12-19 00:09:28
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '梦游'})
SET 
    n.description = coalesce(n.description, '夜间突然坐起凝视前方'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间多梦'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '夜间恶梦'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '说梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '分不清梦境与现实'})
SET 
    n.description = coalesce(n.description, '醒后有时可回忆梦境'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查'),
    n.method = coalesce(n.method, '通过视频和脑电监测'),
    n.requirement = coalesce(n.requirement, '患者需要睡眠状态下进行');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '梦游'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '说梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '分不清梦境与现实'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #41
   Timestamp: 2024-12-19 00:09:28
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '焦虑状态'});

MERGE (n:Symptom {name: '夜间入睡困难'});

MERGE (n:Symptom {name: '早醒'});

MERGE (n:Symptom {name: '情绪紧张'});

MERGE (n:Symptom {name: '反复觉醒'});

MERGE (n:Symptom {name: '白天精神差'});

MERGE (n:Symptom {name: '头痛头晕'});

MERGE (n:Symptom {name: '烦躁'});

MERGE (n:Symptom {name: '乏力'});

// 关系更新
MATCH (from) WHERE from.name = '夜间入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '情绪紧张'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '反复觉醒'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '白天精神差'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '头痛头晕'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '烦躁'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '乏力'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #42
   Timestamp: 2024-12-19 00:09:29
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '不伴有精神病性症状的重度抑郁发作'});

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '不伴有精神病性症状的重度抑郁发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #43
   Timestamp: 2024-12-19 00:09:30
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '窦性心动过缓'});

MERGE (n:Disease {name: '睡眠低通气综合征'});

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天瞌睡或突然入睡的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '心率减慢'})
SET 
    n.description = coalesce(n.description, '心跳频率低于正常水平'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '发生');

// 关系更新
MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '睡眠低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '心率减慢'
MATCH (to) WHERE to.name = '窦性心动过缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '窦性心动过缓'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #44
   Timestamp: 2024-12-19 00:09:31
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响正常睡眠的状态，表现为过度嗜睡等症状');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天易入睡或无法保持清醒状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发作性');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '睡眠过程中说话的行为'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '手脚乱动'})
SET 
    n.description = coalesce(n.description, '睡眠或清醒状态下的身体无意识运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪激动时嘴巴张开'})
SET 
    n.description = coalesce(n.description, '情绪剧烈时嘴巴不自主张开的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '腿发软'})
SET 
    n.description = coalesce(n.description, '腿部无力的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '视频脑电图监测'})
SET 
    n.description = coalesce(n.description, '监测脑电活动的检查'),
    n.method = coalesce(n.method, '视频记录'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

MERGE (n:Examination {name: '头颅MRI'})
SET 
    n.description = coalesce(n.description, '检查脑部结构的磁共振成像'),
    n.method = coalesce(n.method, 'MRI成像'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠图，用于评估睡眠状态'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

MERGE (n:Examination {name: '小睡试验'})
SET 
    n.description = coalesce(n.description, '评估白天嗜睡程度的测试'),
    n.method = coalesce(n.method, '实验性测试'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

MERGE (n:Examination {name: '鼻咽部CT'})
SET 
    n.description = coalesce(n.description, '检查鼻咽部结构的CT扫描'),
    n.method = coalesce(n.method, 'CT成像'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '发作性'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '手脚乱动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '情绪激动时嘴巴张开'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '腿发软'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '视频脑电图监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '头颅MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '小睡试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '鼻咽部CT'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #45
   Timestamp: 2024-12-19 00:09:32
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '包括多种睡眠问题，如呼吸暂停等'),
    n.category = coalesce(n.category, '睡眠疾病');

MERGE (n:Disease {name: '重度睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '夜间严重呼吸停止和低通气，在睡眠时出现'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '脑部血管堵塞，造成的局部缺血'),
    n.category = coalesce(n.category, '脑血管疾病');

MERGE (n:Disease {name: '颈动脉硬化'})
SET 
    n.description = coalesce(n.description, '颈动脉壁增厚，导致血流受限'),
    n.category = coalesce(n.category, '心血管疾病');

MERGE (n:Disease {name: '腰椎间盘突出'})
SET 
    n.description = coalesce(n.description, '椎间盘向外突出，压迫神经'),
    n.category = coalesce(n.category, '脊柱疾病');

MERGE (n:Symptom {name: '白天思睡'})
SET 
    n.description = coalesce(n.description, '白天极度嗜睡的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打哈气'})
SET 
    n.description = coalesce(n.description, '频繁打哈欠的表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '困倦感'})
SET 
    n.description = coalesce(n.description, '有明显的疲倦感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感觉头部不适'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '眼皮发沉'})
SET 
    n.description = coalesce(n.description, '眼睑感觉沉重'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜眠好'})
SET 
    n.description = coalesce(n.description, '夜间睡眠质量良好'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '颈动脉斑块形成'})
SET 
    n.description = coalesce(n.description, '颈动脉内形成斑块'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '白天思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '白天思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜眠好'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '腰椎间盘突出'
MATCH (to) WHERE to.name = '白天思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #46
   Timestamp: 2024-12-19 00:09:32
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '血管性帕金森综合征'});

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '血管性帕金森综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #47
   Timestamp: 2024-12-19 00:09:33
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '睡眠低通气综合征'});

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '反复入睡困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '易醒'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '背部发痒'})
SET 
    n.description = coalesce(n.description, '背部发痒感'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '心烦'})
SET 
    n.description = coalesce(n.description, '时有心烦'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '情绪低'})
SET 
    n.description = coalesce(n.description, '情绪低'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间犯困'})
SET 
    n.description = coalesce(n.description, '日间犯困'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '近记忆力下降'})
SET 
    n.description = coalesce(n.description, '近记忆力下降'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '胃口不好'})
SET 
    n.description = coalesce(n.description, '胃口不好'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '胸闷不适'})
SET 
    n.description = coalesce(n.description, '胸闷不适'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '双手指尖发麻'})
SET 
    n.description = coalesce(n.description, '双手指尖发麻'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '背部发痒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '心烦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '情绪低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '日间犯困'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '近记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '胃口不好'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '胸闷不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '双手指尖发麻'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠低通气综合征'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #48
   Timestamp: 2024-12-19 00:09:33
*/
// 节点更新
MERGE (n:Disease {name: '路易体痴呆'});

MERGE (n:Disease {name: '阿尔茨海默症'});

MERGE (n:Disease {name: '血管性痴呆'});

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '渐起记忆力下降伴行动迟缓'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '逐渐进展');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '病人的活动不便'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行为紊乱'})
SET 
    n.description = coalesce(n.description, '最近的行为表现异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '突发');

MERGE (n:Symptom {name: '头昏眼花'})
SET 
    n.description = coalesce(n.description, '有头昏眼花的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '认知下降'})
SET 
    n.description = coalesce(n.description, '近记忆力差、计算力差，时间定向力、空间定向力较差'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '头昏眼花'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '认知下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #49
   Timestamp: 2024-12-19 00:09:35
*/
// 节点更新
MERGE (n:Disease {name: '重度睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '夜间重度低氧血症'});

// 关系更新
MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间重度低氧血症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #50
   Timestamp: 2024-12-19 00:09:35
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '焦虑抑郁状态'});

MERGE (n:Disease {name: '强迫状态'});

MERGE (n:Disease {name: '复视'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '焦虑抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '强迫状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '高血压病'
MATCH (to) WHERE to.name = '高血压病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '复视'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #51
   Timestamp: 2024-12-19 00:09:35
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '认知障碍'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '器质性精神障碍'});

MERGE (n:Symptom {name: '运动迟缓'})
SET 
    n.description = coalesce(n.description, '逐渐加重的运动速度减缓'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '肢体僵硬'})
SET 
    n.description = coalesce(n.description, '肢体感觉紧绷和不灵活'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '出现不真实的感知'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '难以记住最近的事件'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '情绪不稳'})
SET 
    n.description = coalesce(n.description, '情绪波动较大'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '说梦话'})
SET 
    n.description = coalesce(n.description, '在睡眠中说话的现象'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '运动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肢体僵硬'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '显著');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '情绪不稳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #52
   Timestamp: 2024-12-19 00:09:36
*/
// 节点更新
MERGE (n:Disease {name: '路易体痴呆'});

MERGE (n:Disease {name: '快动眼睡眠行为障碍'});

MERGE (n:Disease {name: '器质性精神障碍'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.code = coalesce(n.code, 'I10'),
    n.description = coalesce(n.description, '高血压'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '患者逐渐出现的记忆力减退'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '夜间做噩梦，手舞足蹈'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '出现阵发性幻觉，看见陌生人'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Symptom {name: '冲动行为'})
SET 
    n.description = coalesce(n.description, '患者出现冲动行为，时有吵闹'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇性');

// 关系更新
MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '冲动行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '高血压病'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATED_BY]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #53
   Timestamp: 2024-12-19 00:09:36
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '特征是过度的日间困倦、猝倒、睡瘫症以及睡眠相关的幻觉，伴有失眠主诉'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '反复嗜睡现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '多次');

MERGE (n:Symptom {name: '夜间睡眠不受影响'})
SET 
    n.description = coalesce(n.description, '夜间入睡不受影响'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '入睡快'})
SET 
    n.description = coalesce(n.description, '入睡及时的现象'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '睡眠中多梦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起梦话'})
SET 
    n.description = coalesce(n.description, '晨起时梦话连篇'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头昏'})
SET 
    n.description = coalesce(n.description, '白天头昏的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每天');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '夜间睡眠不受影响'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '入睡快'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '晨起梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '头昏'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '每天'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #54
   Timestamp: 2024-12-19 00:09:37
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.category = coalesce(n.category, '高血压'),
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '脑出血后遗症'})
SET 
    n.description = coalesce(n.description, '脑出血后的残余症状');

MERGE (n:Symptom {name: '夜间憋气'})
SET 
    n.description = coalesce(n.description, '夜间入睡后出现憋气现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '头昏'})
SET 
    n.description = coalesce(n.description, '白天感到头晕'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '反应慢'})
SET 
    n.description = coalesce(n.description, '反应速度减缓'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '高血压病'
MATCH (to) WHERE to.name = '头昏'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑出血后遗症'
MATCH (to) WHERE to.name = '反应慢'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #55
   Timestamp: 2024-12-19 00:09:37
*/
// 节点更新
MERGE (n:Disease {name: '焦虑状态'});

MERGE (n:Disease {name: '睡眠障碍'});

// 关系更新
MATCH (from) WHERE from.name = '焦虑状态'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #56
   Timestamp: 2024-12-19 00:09:38
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '复发性抑郁障碍'});

MERGE (n:Disease {name: '腰椎骨折'});

MERGE (n:Disease {name: '髋关节置换术后'});

MERGE (n:Symptom {name: '肢体抖动'})
SET 
    n.description = coalesce(n.description, '不自主的肢体运动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '行动缓慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '下肢乏力'})
SET 
    n.description = coalesce(n.description, '下肢无力'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '加重');

MERGE (n:Symptom {name: '睡眠差'})
SET 
    n.description = coalesce(n.description, '睡眠质量差'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '夜间醒来次数多'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '夜间梦多'})
SET 
    n.description = coalesce(n.description, '晚上做梦频繁'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肢体抖动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '下肢乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '睡眠差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜间梦多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #57
   Timestamp: 2024-12-19 00:09:39
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '紧张'})
SET 
    n.description = coalesce(n.description, '情绪紧张'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '心慌'})
SET 
    n.description = coalesce(n.description, '心悸的感觉'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '胸闷'})
SET 
    n.description = coalesce(n.description, '胸部感到压迫或不适'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '早早醒来并无法再次入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '浑身不适'})
SET 
    n.description = coalesce(n.description, '全身感觉不适'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '情绪紧张不安'})
SET 
    n.description = coalesce(n.description, '情绪稳定性差'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '紧张'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '心慌'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '胸闷'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '浑身不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '情绪紧张不安'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #58
   Timestamp: 2024-12-19 00:09:40
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '轻度认知障碍'});

MERGE (n:Disease {name: '焦虑抑郁状态'});

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感到头部不适的状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '脑鸣'})
SET 
    n.description = coalesce(n.description, '耳中持续发出嗡嗡声'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '认知功能减退现象'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '情绪紧张不安的状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '脑鸣'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '可能'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #59
   Timestamp: 2024-12-19 00:09:41
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '抑郁状态'});

MERGE (n:Disease {name: '焦虑状态'});

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #60
   Timestamp: 2024-12-19 00:09:41
*/
// 节点更新
MERGE (n:Disease {name: '血管性痴呆'});

MERGE (n:Disease {name: '器质性精神障碍'});

MERGE (n:Disease {name: '脑梗死恢复期'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '2型糖尿病'});

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '脑梗死恢复期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '脑梗死恢复期'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '器质性精神障碍'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '2型糖尿病'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '明确');



// =====================================

/* Response #61
   Timestamp: 2024-12-19 00:09:41
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '心房颤动'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '心房颤动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '高血压病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '冠状动脉粥样硬化性心脏病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '低');



// =====================================

/* Response #62
   Timestamp: 2024-12-19 00:09:42
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'});

MERGE (n:Symptom {name: '夜间手舞足蹈'})
SET 
    n.description = coalesce(n.description, '患者在睡眠中反复出现手舞足蹈的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '患者在睡眠中说梦话'),
    n.severity = coalesce(n.severity, '较轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头昏'})
SET 
    n.description = coalesce(n.description, '患者在醒后有时感到头昏'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间手舞足蹈'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '头昏'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #63
   Timestamp: 2024-12-19 00:09:49
*/
// 节点更新
MERGE (n:Disease {name: '轻度认知障碍'})
SET 
    n.description = coalesce(n.description, '轻度认知功能障碍，表现为近期记忆力下降'),
    n.category = coalesce(n.category, '认知障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '与脑部血液供应减少相关的疾病，通常影响认知功能'),
    n.category = coalesce(n.category, '脑血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '患者表现为近期记忆力下降'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '渐进');

MERGE (n:Symptom {name: '夜间睡眠差'})
SET 
    n.description = coalesce(n.description, '患者夜间经常醒来，睡眠质量差'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '时常');

// 关系更新
MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = '夜间睡眠差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '轻度认知障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #64
   Timestamp: 2024-12-19 00:09:51
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '房性期前收缩'});

MERGE (n:Symptom {name: '夜间噩梦'})
SET 
    n.description = coalesce(n.description, '夜间梦境恐怖'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '喊叫'})
SET 
    n.description = coalesce(n.description, '睡眠中大声呼喊'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.description = coalesce(n.description, '睡眠中无意识的激烈肢体动作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '记忆力稍差'})
SET 
    n.description = coalesce(n.description, '近期记忆力减退'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '持久');

// 关系更新
MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '喊叫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '拳打脚踢'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '房性期前收缩'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.2),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

