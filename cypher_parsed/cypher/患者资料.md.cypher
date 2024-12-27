// File: 患者资料.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 64

/* Response #1
   Timestamp: 2024-12-27 20:07:55
*/
// 节点更新
MERGE (n:Disease {name: '焦虑抑郁状态'})
SET 
    n.description = coalesce(n.description, '一种情绪障碍，表现为持续的焦虑和抑郁情绪'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '一种影响睡眠质量的病症，常表现为失眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '后循环缺血'})
SET 
    n.description = coalesce(n.description, '由于血流不足导致的脑部供血不足'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '夜间无法正常入睡或维持睡眠状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '脑鸣'})
SET 
    n.description = coalesce(n.description, '耳内感到类似电流的声音'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感到头部轻飘飘或失去平衡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '胸闷'})
SET 
    n.description = coalesce(n.description, '胸部紧绷或压力感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '感觉到想呕吐但未实际呕吐'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '心慌'})
SET 
    n.description = coalesce(n.description, '感到心跳加速或不规律的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '脑鸣'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '胸闷'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '心慌'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:07:55
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '患者在夜间憋气与憋醒的症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间憋气'})
SET 
    n.description = coalesce(n.description, '夜间出现憋气的感觉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天瞌睡'})
SET 
    n.description = coalesce(n.description, '白天感到困倦，容易入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '憋醒'})
SET 
    n.description = coalesce(n.description, '夜间憋醒后的窒息感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于监测患者的睡眠状况，包括夜间睡眠和多次小睡'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '夜间憋气'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '白天瞌睡'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '憋醒'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #3
   Timestamp: 2024-12-27 20:07:56
*/
// 节点更新
MERGE (n:Disease {name: '抑郁状态'});

MERGE (n:Disease {name: '焦虑状态'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '情绪状态持续低落'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡时间延长或无法入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间多汗'})
SET 
    n.description = coalesce(n.description, '夜间睡觉时出现出汗现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '烦躁'})
SET 
    n.description = coalesce(n.description, '情绪烦躁不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天精神差'})
SET 
    n.description = coalesce(n.description, '白天精神状态不佳'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '体验到的头部疼痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '情绪低落'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '夜间多汗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '烦躁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '白天精神差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #4
   Timestamp: 2024-12-27 20:07:56
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.description = coalesce(n.description, '一种导致记忆力逐渐下降的神经退行性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '左肺上叶肺动脉栓塞'})
SET 
    n.description = coalesce(n.description, '肺动脉分支被栓塞导致的肺部血液循环障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '一种小血管性脑卒中，通常是由小血栓引起的'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '一种情绪障碍，表现为长期的悲伤或失去兴趣'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压'})
SET 
    n.description = coalesce(n.description, '一种动脉血压持续升高的疾病'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆能力逐渐减少的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '幻听'})
SET 
    n.description = coalesce(n.description, '听到不存在的声音，如敲门声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '大小便失禁'})
SET 
    n.description = coalesce(n.description, '无法控制排便与排尿的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '食纳可'})
SET 
    n.description = coalesce(n.description, '饮食摄入情况良好'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠一般'})
SET 
    n.description = coalesce(n.description, '睡眠质量较普通'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '幻听'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '大小便失禁'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #5
   Timestamp: 2024-12-27 20:07:57
*/
// 节点更新
MERGE (n:Disease {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '一种表现为记忆力下降和其他认知功能损害的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肝功能不全'})
SET 
    n.description = coalesce(n.description, '肝脏无法正常执行其功能'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '短期或长期记忆能力减弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '与人交流减少'})
SET 
    n.description = coalesce(n.description, '不喜欢与人进行互动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '自言自语'})
SET 
    n.description = coalesce(n.description, '常常对自己说话'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '冷热感知障碍'})
SET 
    n.description = coalesce(n.description, '无法区分冷热'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '近记忆一般'})
SET 
    n.description = coalesce(n.description, '近期记忆能力减弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '计算力下降'})
SET 
    n.description = coalesce(n.description, '进行简单计算的能力减弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Examination {name: '海马MRI'})
SET 
    n.description = coalesce(n.description, '用于评估海马区域的结构和功能'),
    n.method = coalesce(n.method, '核磁共振成像'),
    n.requirement = coalesce(n.requirement, '患者需保持静止');

MERGE (n:Examination {name: '头颅MR'})
SET 
    n.description = coalesce(n.description, '用于获取脑部结构影像'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '患者需保持放松');

// 关系更新
MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '与人交流减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '自言自语'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '冷热感知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '近记忆一般'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '计算力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '海马MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '头颅MR'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #6
   Timestamp: 2024-12-27 20:07:58
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '反复出现头晕的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间多梦'})
SET 
    n.description = coalesce(n.description, '夜间频繁做梦的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '说梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话的表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现不自主的拳打脚踢行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '开车时无法集中注意力，想睡觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Disease {name: '高血压病'})
SET 
    n.description = coalesce(n.description, '一种常见的心血管疾病，患者血压异常升高'),
    n.severity = coalesce(n.severity, '高风险');

// 关系更新
MATCH (from) WHERE from.name = '头晕'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间多梦'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '说梦话'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '拳打脚踢'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '注意力不集中'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '严重'),
    r.evidence_level = coalesce(r.evidence_level, '高');



// =====================================

/* Response #7
   Timestamp: 2024-12-27 20:07:59
*/
// 节点更新
MERGE (n:Disease {name: '抑郁状态'})
SET 
    n.description = coalesce(n.description, '情绪低落伴紧张不安'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '焦虑状态'})
SET 
    n.description = coalesce(n.description, '伴随情绪不安'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '脑部小血管病变引起的缺血性脑卒中'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'})
SET 
    n.description = coalesce(n.description, '因冠状动脉粥样硬化导致的心脏病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '导致无法入睡的状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '慢性胃炎'})
SET 
    n.description = coalesce(n.description, '胃粘膜慢性炎症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '血管支架植入术后状态'})
SET 
    n.description = coalesce(n.description, '冠脉支架术后恢复状态'),
    n.severity = coalesce(n.severity, '轻微');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '长期感到沮丧和消沉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '紧张不安'})
SET 
    n.description = coalesce(n.description, '心理紧张和不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间多汗'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时出汗'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '头部疼痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '认知能力减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '情绪低落'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '紧张不安'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间多汗'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #8
   Timestamp: 2024-12-27 20:07:59
*/
// 节点更新
MERGE (n:Disease {name: '焦虑抑郁状态'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '前列腺增生'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '长达40余年的失眠症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行走倾斜'})
SET 
    n.description = coalesce(n.description, '行走时身体向左倾斜'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '1个月');

MERGE (n:Symptom {name: '跌倒'})
SET 
    n.description = coalesce(n.description, '近期出现跌倒事件'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '1天');

MERGE (n:Symptom {name: '晨起乏力'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到精力不足'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头胀'})
SET 
    n.description = coalesce(n.description, '感觉头部胀满'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '尿频'})
SET 
    n.description = coalesce(n.description, '夜间出现频繁排尿现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '2-5次');

MERGE (n:Symptom {name: '尿急'})
SET 
    n.description = coalesce(n.description, '急迫感，需立即排尿'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '患者情绪紧张、焦虑'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '患者出现抑郁情绪'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间频繁做梦的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '晨起乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '腔隙性脑梗死'
MATCH (to) WHERE to.name = '行走倾斜'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #9
   Timestamp: 2024-12-27 20:08:00
*/
// 节点更新
MERGE (n:Disease {name: '血管性痴呆'})
SET 
    n.description = coalesce(n.description, '由于脑血管病变引起的认知功能下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '脑梗死'})
SET 
    n.description = coalesce(n.description, '由于脑部血流供应受阻导致的神经损伤'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '渐进性记忆丧失'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '渐进');

MERGE (n:Symptom {name: '反应迟钝'})
SET 
    n.description = coalesce(n.description, '对刺激反应减缓'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '言语不流利'})
SET 
    n.description = coalesce(n.description, '表达困难，言辞不清'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '口角右歪'})
SET 
    n.description = coalesce(n.description, '口角偏向一侧的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '右上肢无力'})
SET 
    n.description = coalesce(n.description, '右上肢力量减弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '性格改变'})
SET 
    n.description = coalesce(n.description, '个性变得孤僻少语'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '渐进');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '渐进'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '反应迟钝'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '言语不流利'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '口角右歪'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '右上肢无力'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '性格改变'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '渐进'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '曾出现'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '言语不流利'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '曾出现'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '渐进'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '右上肢无力'
MATCH (to) WHERE to.name = '脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #10
   Timestamp: 2024-12-27 20:08:00
*/
// 节点更新
MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.description = coalesce(n.description, '一种神经系统变性疾病，表现为记忆力下降和行动迟缓'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '渐起的记忆力下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '活动不便，行动缓慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行为紊乱'})
SET 
    n.description = coalesce(n.description, '在外表现出异常的行为，难以解释'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '头昏眼花'})
SET 
    n.description = coalesce(n.description, '出现头昏和视物模糊的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Examination {name: '头颅MRI'})
SET 
    n.description = coalesce(n.description, '用于诊断脑萎缩的影像学检查'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '保持静止');

// 关系更新
MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '头昏眼花'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '头颅MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #11
   Timestamp: 2024-12-27 20:08:01
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以白天思睡为主要症状，可能伴随夜间睡眠异常的病症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '白天思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦，需要打盹的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '夜间睡眠腿动'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时腿部不自主运动的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于评估睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: 'MSLT实验'})
SET 
    n.description = coalesce(n.description, '睡眠潜伏期测试，用于评估嗜睡症状'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '在专业医疗环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '白天思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间睡眠腿动'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'MSLT实验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #12
   Timestamp: 2024-12-27 20:08:01
*/
// 节点更新
MERGE (n:Disease {name: '脑梗死'})
SET 
    n.description = coalesce(n.description, '脑部血流供应不足导致的神经功能缺损'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '细菌性肺炎'})
SET 
    n.description = coalesce(n.description, '由细菌感染引起的肺部炎症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'})
SET 
    n.description = coalesce(n.description, '冠状动脉因粥样硬化而导致的心脏病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '心房颤动'})
SET 
    n.description = coalesce(n.description, '一种不规律的心脏节律，可能引发血栓'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压病3级'})
SET 
    n.description = coalesce(n.description, '严重的高血压状态，增加心血管疾病风险'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '左侧肢体无力'})
SET 
    n.description = coalesce(n.description, '患者左侧肢体感到无力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '跌倒'})
SET 
    n.description = coalesce(n.description, '由于身体不稳而跌倒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发生过');

// 关系更新
MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '左侧肢体无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '反复'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '跌倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '发生过'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #13
   Timestamp: 2024-12-27 20:08:01
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '在快动眼睡眠期表现出的异常行为症状，包括夜间手舞足蹈和梦话'),
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
    n.severity = coalesce(n.severity, '中等'),
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
    r.severity = coalesce(r.severity, '中等');

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

/* Response #14
   Timestamp: 2024-12-27 20:08:01
*/
// 节点更新
MERGE (n:Disease {name: '后循环缺血'})
SET 
    n.description = coalesce(n.description, '由颈椎病或其他原因引起脑供血不足造成的缺血性疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '缺血性脑血管病'})
SET 
    n.description = coalesce(n.description, '脑部血液供应不足导致的各种病变'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '由于小动脉病变引起的局灶性缺血性损伤'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '发作性头晕'})
SET 
    n.description = coalesce(n.description, '间歇性头晕的表现，通常持续几分钟'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '耳鸣'})
SET 
    n.description = coalesce(n.description, '感知到的声音来源于自身，而非外部环境'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '听力下降'})
SET 
    n.description = coalesce(n.description, '听力感知能力的减弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '夜间睡眠差'})
SET 
    n.description = coalesce(n.description, '夜间睡眠质量低下'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '梦多'})
SET 
    n.description = coalesce(n.description, '夜间做梦频繁的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '说梦话'})
SET 
    n.description = coalesce(n.description, '在梦中与人交谈的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶见');

// 关系更新
MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '发作性头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '耳鸣'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '听力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '夜间睡眠差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '梦多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '后循环缺血'
MATCH (to) WHERE to.name = '说梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #15
   Timestamp: 2024-12-27 20:08:01
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '颅内动脉瘤栓塞术后'});

MERGE (n:Disease {name: '胸主动脉夹层术后'});

MERGE (n:Symptom {name: '记忆力减退'})
SET 
    n.description = coalesce(n.description, '渐起的记忆力减退'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '伴随的行为异常'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '饮食不规律'})
SET 
    n.description = coalesce(n.description, '饮食习惯不规律，忘记吃饭'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天无精神'})
SET 
    n.description = coalesce(n.description, '白天感到精神不济'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '认知功能评估'})
SET 
    n.description = coalesce(n.description, '用于评估患者的认知能力'),
    n.method = coalesce(n.method, '标准化测试'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '记忆力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '行为异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '饮食不规律'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '白天无精神'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '认知功能评估'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #16
   Timestamp: 2024-12-27 20:08:02
*/
// 节点更新
MERGE (n:Disease {name: '抑郁状态'});

MERGE (n:Disease {name: '强迫性障碍'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '焦虑状态'});

MERGE (n:Symptom {name: '睡眠差'})
SET 
    n.description = coalesce(n.description, '入睡困难和整夜不能入睡的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '情绪波动'})
SET 
    n.description = coalesce(n.description, '情绪不稳定，时常出现低落'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Symptom {name: '紧张焦虑'})
SET 
    n.description = coalesce(n.description, '伴随强迫思维而产生的紧张不安'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间经常做梦的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '精力下降'})
SET 
    n.description = coalesce(n.description, '感到疲惫和精力不足'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力变差的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '睡眠差'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '紧张焦虑'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '情绪波动'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '紧张焦虑'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多梦'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '精力下降'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #17
   Timestamp: 2024-12-27 20:08:02
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出的声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '憋闷'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时感到呼吸困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '滨死感'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时感觉窒息或快要窒息'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '鼻咽部磁共振'})
SET 
    n.description = coalesce(n.description, '用于评估鼻咽部结构的磁共振成像'),
    n.method = coalesce(n.method, '磁共振扫描'),
    n.requirement = coalesce(n.requirement, '在扫描前保持放松');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，为不同睡眠障碍提供诊断依据'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '憋闷'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '滨死感'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻咽部磁共振'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #18
   Timestamp: 2024-12-27 20:08:02
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种神经系统变性疾病，主要表现为肢体抖动和行动迟缓'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '肢体抖动'})
SET 
    n.description = coalesce(n.description, '不自主的肢体抖动，影响行动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '渐起');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '动作缓慢，运动困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '双下肢无力'})
SET 
    n.description = coalesce(n.description, '双腿感到无力，影响行走'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '突发');

MERGE (n:Symptom {name: '头晕不适'})
SET 
    n.description = coalesce(n.description, '感到眩晕和不舒服'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '乏力'})
SET 
    n.description = coalesce(n.description, '感到精疲力竭，缺乏能量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '一种小血管病，每个病变小于1.5cm'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '2型糖尿病'})
SET 
    n.description = coalesce(n.description, '一种代谢性疾病，导致高血糖'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肢体抖动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '渐起'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '双下肢无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '突发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '头晕不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '高');



// =====================================

/* Response #19
   Timestamp: 2024-12-27 20:08:04
*/
// 节点更新
MERGE (n:Disease {name: '不安腿综合征'})
SET 
    n.description = coalesce(n.description, '一种患者在夜间感到腿部不适的疾病，通常伴随有睡眠质量下降'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间腿部不适'})
SET 
    n.description = coalesce(n.description, '夜间感到腿部不适的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '无法入睡'})
SET 
    n.description = coalesce(n.description, '整夜无法入睡的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '严重时');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于评估睡眠障碍'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: '血液学检查'})
SET 
    n.description = coalesce(n.description, '用于检测各种血液指标的检查'),
    n.method = coalesce(n.method, '血样分析'),
    n.requirement = coalesce(n.requirement, '需空腹');

// 关系更新
MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '夜间腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '无法入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '严重时'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不安腿综合征'
MATCH (to) WHERE to.name = '血液学检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #20
   Timestamp: 2024-12-27 20:08:04
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '夜间憋气'})
SET 
    n.description = coalesce(n.description, '夜间入睡后出现憋闷，憋醒的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时明显打鼾的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '夜间憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '提醒确认'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #21
   Timestamp: 2024-12-27 20:08:04
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '一种在快动眼睡眠期表现出的异常行为症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间多梦'})
SET 
    n.description = coalesce(n.description, '夜间反复做梦，内容可能导致患者惊醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日');

MERGE (n:Symptom {name: '大喊大叫'})
SET 
    n.description = coalesce(n.description, '睡眠中发出响亮的喊叫声'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.description = coalesce(n.description, '夜间表现出攻击性行为，可能伤害自己或他人'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日');

MERGE (n:Symptom {name: '做梦时回忆梦境'})
SET 
    n.description = coalesce(n.description, '能在睡眠中回忆起梦境内容'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于监测睡眠状态及相关行为的检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '需要患者在监测设备下过夜');

// 关系更新
MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '几乎每日'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '大喊大叫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '几乎每日'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '拳打脚踢'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '几乎每日'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '做梦时回忆梦境'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #22
   Timestamp: 2024-12-27 20:08:04
*/
// 节点更新
MERGE (n:Disease {name: '快动眼期睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '一种在快动眼睡眠中表现出的异常行为症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '反复夜间手舞足蹈'})
SET 
    n.description = coalesce(n.description, '夜间手舞足蹈的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '做噩梦'})
SET 
    n.description = coalesce(n.description, '夜间出现噩梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '神经影像学检查'})
SET 
    n.description = coalesce(n.description, '用于评估脑部状况的检查'),
    n.method = coalesce(n.method, 'MRI或CT'),
    n.requirement = coalesce(n.requirement, '根据医生建议进行');

MERGE (n:NonDrugTreatment {name: '对症支持治疗'})
SET 
    n.description = coalesce(n.description, '通过改善多梦等症状来支持患者'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '多发性小的脑梗死，通常与其它疾病相关'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '反复夜间手舞足蹈'
MATCH (to) WHERE to.name = '快动眼期睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '几乎每日'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '梦话'
MATCH (to) WHERE to.name = '快动眼期睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '做噩梦'
MATCH (to) WHERE to.name = '快动眼期睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快动眼期睡眠行为障碍'
MATCH (to) WHERE to.name = '神经影像学检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '快动眼期睡眠行为障碍'
MATCH (to) WHERE to.name = '对症支持治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '对症支持治疗');

MATCH (from) WHERE from.name = '快动眼期睡眠行为障碍'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

/* Response #23
   Timestamp: 2024-12-27 20:08:04
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '一种影响正常入睡和保持睡眠的状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '焦虑抑郁状态'})
SET 
    n.description = coalesce(n.description, '一种情绪障碍，伴随持续的焦虑和抑郁症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以迅速入睡的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间频繁做梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '易早醒'})
SET 
    n.description = coalesce(n.description, '早晨过早醒来并无法再次入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪波动'})
SET 
    n.description = coalesce(n.description, '情绪起伏不定的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力减退的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '感到过度担忧和紧张的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于监测睡眠结构和质量的检查'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '患者需在监测室内过夜');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '易早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '情绪波动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #24
   Timestamp: 2024-12-27 20:08:04
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.description = coalesce(n.description, '一种进行性神经退行性疾病，主要表现为逐渐加重的记忆力下降和认知功能障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '小血管病导致的小型脑梗死，可引起神经功能缺损'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压病'})
SET 
    n.description = coalesce(n.description, '长时间高血压可能导致多种并发症，包括心脏病和脑卒中'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '夜间反复发生呼吸暂停，导致睡眠质量降低和日间嗜睡'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '夜间重度低氧血症'})
SET 
    n.description = coalesce(n.description, '夜间氧气低于正常水平，可能导致多种健康问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, '甲状腺分泌的激素不足，导致新陈代谢减慢'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '进行性记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力逐渐下降，容易忘事'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '性格改变'})
SET 
    n.description = coalesce(n.description, '患者性格发生变化，表现为生活能力下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '进行中');

MERGE (n:Symptom {name: '生活不能自理'})
SET 
    n.description = coalesce(n.description, '患者逐渐无法独立完成日常生活'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '言语减少'})
SET 
    n.description = coalesce(n.description, '患者表达能力下降，交流困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '进行中');

MERGE (n:Symptom {name: '二便不自知'})
SET 
    n.description = coalesce(n.description, '患者失去对排便的控制'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '白天没精神'})
SET 
    n.description = coalesce(n.description, '日常活动中感觉极度疲乏，无精打采'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '进行性记忆力下降'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '性格改变'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '进行中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '生活不能自理'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '言语减少'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '进行中'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '二便不自知'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '白天没精神'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #25
   Timestamp: 2024-12-27 20:08:05
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种白天出现反复嗜睡的病症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦，无法控制'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '睡眠中无法移动的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'MRI检查'})
SET 
    n.description = coalesce(n.description, '磁共振成像，用于排查神经系统问题'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '在扫描前保持放松');

MERGE (n:Examination {name: '多导睡眠监测PSG'})
SET 
    n.description = coalesce(n.description, '用于监测睡眠过程中各种生理参数'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: '口服觉醒试验MLST'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠发作性疾病'),
    n.method = coalesce(n.method, '通过监测入睡时间等指标'),
    n.requirement = coalesce(n.requirement, '需在入院期间进行');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠瘫痪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'MRI检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多导睡眠监测PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '口服觉醒试验MLST'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #26
   Timestamp: 2024-12-27 20:08:05
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '鼻咽部磁共振'})
SET 
    n.description = coalesce(n.description, '用于评估鼻咽部结构'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '无特殊要求');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻咽部磁共振'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #27
   Timestamp: 2024-12-27 20:08:06
*/
// 节点更新
MERGE (n:Disease {name: '重度阻塞性睡眠呼吸暂停综合征'});

MERGE (n:Disease {name: '阿尔茨海默病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '肺恶性肿瘤术后'});

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '表现为近事记忆力下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '渐进');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '长期');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '渐进'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '重度阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #28
   Timestamp: 2024-12-27 20:08:06
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '以各种形式影响患者的睡眠质量和功能的综合症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '梦游'})
SET 
    n.description = coalesce(n.description, '夜间突然坐起凝视前方的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间频繁做梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '夜间常出现的噩梦现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '在睡眠中说话的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于评估睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '住院观察');

// 关系更新
MATCH (from) WHERE from.name = '梦游'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多梦'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '噩梦'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '梦话'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #29
   Timestamp: 2024-12-27 20:08:06
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种影响运动协调的神经退行性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '右下肢僵硬'})
SET 
    n.description = coalesce(n.description, '右下肢出现僵硬感，行走缓慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '抖动'})
SET 
    n.description = coalesce(n.description, '右下肢出现不自主的抖动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '静止性震颤'})
SET 
    n.description = coalesce(n.description, '静止时出现的震颤症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '嗅觉减退'})
SET 
    n.description = coalesce(n.description, '对气味的感知减弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '梦魇'})
SET 
    n.description = coalesce(n.description, '夜间出现恐怖梦境，影响睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '无梦多'})
SET 
    n.description = coalesce(n.description, '夜间睡眠中几乎没有梦境'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '异动症'})
SET 
    n.description = coalesce(n.description, '服药后出现的不自主运动症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '头颅MRI'})
SET 
    n.description = coalesce(n.description, '用于明确脑结构状况的成像检查'),
    n.method = coalesce(n.method, 'MRI扫描'),
    n.requirement = coalesce(n.requirement, '患者需保持静止');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '右下肢僵硬'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '抖动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '静止性震颤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '嗅觉减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '梦魇'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '无梦多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '异动症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '头颅MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #30
   Timestamp: 2024-12-27 20:08:07
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '患者整体睡眠状况不佳'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '患者逐渐出现行动迟缓的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '梦话多'})
SET 
    n.description = coalesce(n.description, '夜间频繁说梦话'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '饮水异物感'})
SET 
    n.description = coalesce(n.description, '患者在饮水时有异物感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '嗅觉丧失'})
SET 
    n.description = coalesce(n.description, '患者嗅觉能力逐渐丧失'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '感后颈部僵硬'})
SET 
    n.description = coalesce(n.description, '患者颈部感到有僵硬感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '强迫后仰位'})
SET 
    n.description = coalesce(n.description, '患者行走时呈强迫后仰的姿势'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.description = coalesce(n.description, '患者有排便困难的症状'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠差'})
SET 
    n.description = coalesce(n.description, '患者整体睡眠质量不佳'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '辅助检查'})
SET 
    n.description = coalesce(n.description, '进一步完善相关辅助检查以评估病情'),
    n.method = coalesce(n.method, '多种检查'),
    n.requirement = coalesce(n.requirement, '根据医生指示');

// 关系更新
MATCH (from) WHERE from.name = '行动迟缓'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '梦话多'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '饮水异物感'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '嗅觉丧失'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '感后颈部僵硬'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '强迫后仰位'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '便秘'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠差'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '辅助检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #31
   Timestamp: 2024-12-27 20:08:07
*/
// 节点更新
MERGE (n:Disease {name: '血管性痴呆'})
SET 
    n.description = coalesce(n.description, '因脑供血不足导致的认知功能障碍，表现为记忆力减退及行为异常'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '2型糖尿病'});

MERGE (n:Disease {name: '心房颤动'})
SET 
    n.description = coalesce(n.description, '心脏电活动异常，导致心房不规则收缩'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '心功能不全'})
SET 
    n.description = coalesce(n.description, '心脏不能有效泵血以满足身体需求'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'})
SET 
    n.description = coalesce(n.description, '冠状动脉内膜变厚，形成动脉粥样斑块'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '器质性精神障碍'});

MERGE (n:Disease {name: '贫血'});

MERGE (n:Disease {name: '营养不良'});

MERGE (n:Disease {name: '肺部感染'});

MERGE (n:Disease {name: '脑梗死后遗症'})
SET 
    n.description = coalesce(n.description, '脑梗死后遗留下来的行为和认知障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力的逐渐减退'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '半年');

MERGE (n:Symptom {name: '行为紊乱'})
SET 
    n.description = coalesce(n.description, '行为表现异常，不听家人照顾'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '近期');

MERGE (n:Symptom {name: '大小便失禁'})
SET 
    n.description = coalesce(n.description, '无法控制大小便的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '易冲动'})
SET 
    n.description = coalesce(n.description, '在夜间容易产生冲动行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '烦躁'})
SET 
    n.description = coalesce(n.description, '情绪烦躁不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '近期');

MERGE (n:Examination {name: 'MRI'})
SET 
    n.description = coalesce(n.description, '磁共振成像，用于检查脑部的结构和功能'),
    n.method = coalesce(n.method, '医学成像'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '半年'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '行为紊乱'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '近期'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '大小便失禁'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '易冲动'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '烦躁'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '近期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = 'MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #32
   Timestamp: 2024-12-27 20:08:08
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '一种以发作性日间嗜睡为主要特征的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '发作性日间嗜睡'})
SET 
    n.description = coalesce(n.description, '整天频繁嗜睡且无法控制'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话的表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '手脚乱动'})
SET 
    n.description = coalesce(n.description, '夜间无意识地手脚乱动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '情绪激动时嘴巴张开'})
SET 
    n.description = coalesce(n.description, '情绪激动时嘴巴自动张开的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '腿发软'})
SET 
    n.description = coalesce(n.description, '突发情况下腿部无力的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于监测睡眠状态'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '住院观察');

MERGE (n:Examination {name: '小睡试验'})
SET 
    n.description = coalesce(n.description, '评估发作性日间嗜睡的试验'),
    n.method = coalesce(n.method, '通过短时间睡眠观察'),
    n.requirement = coalesce(n.requirement, '安静环境中进行');

MERGE (n:Examination {name: '鼻咽部CT'})
SET 
    n.description = coalesce(n.description, '用于检查鼻咽部结构'),
    n.method = coalesce(n.method, '计算机断层扫描'),
    n.requirement = coalesce(n.requirement, '保持静止');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '发作性日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '手脚乱动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '情绪激动时嘴巴张开'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '腿发软'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

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
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '鼻咽部CT'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #33
   Timestamp: 2024-12-27 20:08:10
*/
// 节点更新
MERGE (n:Disease {name: '急性脑梗死'})
SET 
    n.description = coalesce(n.description, '由于血管阻塞，导致脑部血液供应减少，从而引发的一系列症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '血管性认知功能障碍'})
SET 
    n.description = coalesce(n.description, '由于脑部血管问题导致的认知能力障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '脑血管病后遗症'})
SET 
    n.description = coalesce(n.description, '由脑血管疾病引起的长期后遗症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '器质性精神障碍'})
SET 
    n.description = coalesce(n.description, '由于生理病理因素导致的精神功能障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '急起认知障碍'})
SET 
    n.description = coalesce(n.description, '指突然出现的认知能力下降现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪激动'})
SET 
    n.description = coalesce(n.description, '情绪过度激动的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '性格改变'})
SET 
    n.description = coalesce(n.description, '个性或行为的显著变化'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '纳差'})
SET 
    n.description = coalesce(n.description, '食欲不振的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易激惹'})
SET 
    n.description = coalesce(n.description, '容易受到刺激而生气的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感觉头部不适或失去平衡的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '视幻觉'})
SET 
    n.description = coalesce(n.description, '看到不存在物体的感觉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '急性脑梗死'
MATCH (to) WHERE to.name = '急起认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '血管性认知功能障碍'
MATCH (to) WHERE to.name = '急起认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性认知功能障碍'
MATCH (to) WHERE to.name = '情绪激动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性认知功能障碍'
MATCH (to) WHERE to.name = '性格改变'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性认知功能障碍'
MATCH (to) WHERE to.name = '纳差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性认知功能障碍'
MATCH (to) WHERE to.name = '易激惹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性认知功能障碍'
MATCH (to) WHERE to.name = '头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血管性认知功能障碍'
MATCH (to) WHERE to.name = '视幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #34
   Timestamp: 2024-12-27 20:08:12
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '反复入睡困难的现象'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'})
SET 
    n.description = coalesce(n.description, '一种由于动脉粥样硬化影响冠状动脉，引发心脏病的情况'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常困倦，影响日常生活'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于评估睡眠相关的呼吸障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '住院监测');

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '冠状动脉粥样硬化性心脏病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '较强');

MATCH (from) WHERE from.name = '冠状动脉粥样硬化性心脏病'
MATCH (to) WHERE to.name = '白天过度嗜睡'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #35
   Timestamp: 2024-12-27 20:08:12
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种以日间过度嗜睡为主要特征的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不伴有精神病性症状的重度抑郁发作'})
SET 
    n.description = coalesce(n.description, '一种重度抑郁表现但不伴有精神病症状的状态'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '在白天感到过度困倦，无法保持清醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '感到持续的悲伤和沮丧'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '胸闷不适'})
SET 
    n.description = coalesce(n.description, '胸部感到紧绷或疼痛的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Symptom {name: '乏力感'})
SET 
    n.description = coalesce(n.description, '感到持久的疲劳和无力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '在入睡时遇到困难，需较长时间才能入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: 'MSLT检查'})
SET 
    n.description = coalesce(n.description, '多次睡眠潜伏期测试，评估嗜睡情况'),
    n.method = coalesce(n.method, '睡眠潜伏期测试'),
    n.requirement = coalesce(n.requirement, '安静和舒适的环境');

// 关系更新
MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '情绪低落'
MATCH (to) WHERE to.name = '不伴有精神病性症状的重度抑郁发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '胸闷不适'
MATCH (to) WHERE to.name = '不伴有精神病性症状的重度抑郁发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '乏力感'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'MSLT检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #36
   Timestamp: 2024-12-27 20:08:14
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'});

MERGE (n:Disease {name: '脑外伤后综合征'});

MERGE (n:Disease {name: '抑郁症'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.description = coalesce(n.description, '一种以动脉血压持续升高为特征的疾病'),
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '颅内动脉瘤栓塞术后'});

MERGE (n:Disease {name: '骨质疏松'});

MERGE (n:Disease {name: '溃疡性结肠炎'});

MERGE (n:Symptom {name: '夜间大喊大叫'})
SET 
    n.description = coalesce(n.description, '夜间异常大声呼喊的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.description = coalesce(n.description, '夜间出现肢体打斗的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间常常做梦的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '做噩梦'})
SET 
    n.description = coalesce(n.description, '经常做噩梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '嗅觉减退'})
SET 
    n.description = coalesce(n.description, '嗅觉能力下降的状态'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '脑功能衰退导致的记忆力减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '小便失禁'})
SET 
    n.description = coalesce(n.description, '无法控制小便的状况'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '饮水呛咳'})
SET 
    n.description = coalesce(n.description, '饮水时发生呛咳的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '感到恶心的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '吐出胃内容物的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '睡眠差'})
SET 
    n.description = coalesce(n.description, '难以入睡或睡眠质量差'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡难度增大的情况'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '颅脑MRI'})
SET 
    n.description = coalesce(n.description, '磁共振成像检查，用于观察脑部状况'),
    n.method = coalesce(n.method, 'MRI扫描'),
    n.requirement = coalesce(n.requirement, '患者需保持安静');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，评估睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠检测'),
    n.requirement = coalesce(n.requirement, '需在舒适环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间大喊大叫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '拳打脚踢'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '做噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '嗅觉减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '脑外伤后综合征'
MATCH (to) WHERE to.name = '记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '小便失禁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '饮水呛咳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '脑外伤后综合征'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑外伤后综合征'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '脑外伤后综合征'
MATCH (to) WHERE to.name = '颅脑MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #37
   Timestamp: 2024-12-27 20:08:15
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '患者反复入睡困难的症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '夜间难以入睡的表现'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '眠浅'})
SET 
    n.description = coalesce(n.description, '睡眠期间容易醒来的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '头部部位的疼痛'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '不常见');

MERGE (n:Symptom {name: '胸闷'})
SET 
    n.description = coalesce(n.description, '感觉胸部有压迫感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '眠浅'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '胸闷'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #38
   Timestamp: 2024-12-27 20:08:15
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '患者因失眠一年入院，表现为每晚没有睡意'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '夜间谵妄'})
SET 
    n.description = coalesce(n.description, '因夜间存在异常行为而待查的状态'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '行为变得固执，夜间糊涂'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天记忆缺失'})
SET 
    n.description = coalesce(n.description, '白天对前一晚发生的事没有记忆'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间小便失禁'})
SET 
    n.description = coalesce(n.description, '夜间小便解在身上而不自知'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '脾气暴躁'})
SET 
    n.description = coalesce(n.description, '性格变得固执，脾气暴躁'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.description = coalesce(n.description, '长期便秘的症状'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '行为异常'
MATCH (to) WHERE to.name = '夜间谵妄'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '白天记忆缺失'
MATCH (to) WHERE to.name = '夜间谵妄'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间小便失禁'
MATCH (to) WHERE to.name = '夜间谵妄'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '行为异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #39
   Timestamp: 2024-12-27 20:08:15
*/
// 节点更新
MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.description = coalesce(n.description, '一种常见的神经系统退行性变疾病，以记忆力减退为主要表现'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'})
SET 
    n.description = coalesce(n.description, '心脏冠状动脉的脂肪沉积导致的心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压病'})
SET 
    n.description = coalesce(n.description, '血压持续升高的疾病，可能导致多种并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '特发性震颤'})
SET 
    n.description = coalesce(n.description, '一种以肢体不自主颤动为主要表现的疾病'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力减退，容易忘记刚刚发生的事情'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '肢体抖动'})
SET 
    n.description = coalesce(n.description, '肢体的不自主抖动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '穿衣穿反'})
SET 
    n.description = coalesce(n.description, '穿衣服时出现错误的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '起床困难'})
SET 
    n.description = coalesce(n.description, '起床时的困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '定向力差'})
SET 
    n.description = coalesce(n.description, '对时间和空间的定位能力差'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '精神一般'})
SET 
    n.description = coalesce(n.description, '整体精神状态不佳'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '言语增多'})
SET 
    n.description = coalesce(n.description, '表达的言语数量增加'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'MRI检查'})
SET 
    n.description = coalesce(n.description, '核磁共振成像，用于评估脑部结构与功能'),
    n.method = coalesce(n.method, '核磁共振扫描'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '肢体抖动'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '穿衣穿反'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '起床困难'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '定向力差'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神一般'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '言语增多'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = 'MRI检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #40
   Timestamp: 2024-12-27 20:08:20
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种慢性神经变性疾病，主要表现为行动迟缓和肢体僵硬'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不安腿综合征'})
SET 
    n.description = coalesce(n.description, '一种导致患者在晚上感到腿部不适的疾病，可能影响睡眠'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响正常睡眠的各种状况，包括入睡困难和夜间觉醒'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '焦虑抑郁状态'})
SET 
    n.description = coalesce(n.description, '心理健康问题，表现为情绪低落和焦虑'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '由小动脉病变引起的局部缺血，可能影响神经功能'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '患者的动作变得缓慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '肢体僵硬'})
SET 
    n.description = coalesce(n.description, '肢体的抗阻力增加，导致活动受限'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.description = coalesce(n.description, '排便困难，频率减少'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '嗅觉减退'})
SET 
    n.description = coalesce(n.description, '嗅觉灵敏度降低，影响嗅觉感知'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '尿频'})
SET 
    n.description = coalesce(n.description, '夜间需要频繁排尿'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间翻身困难'})
SET 
    n.description = coalesce(n.description, '晚上翻身时感到困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '夜间睡觉容易被打扰，醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜尿增多'})
SET 
    n.description = coalesce(n.description, '夜间排尿次数增多'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '紧张'})
SET 
    n.description = coalesce(n.description, '常常感到紧张和焦虑'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '对于日常生活感到不安和担忧'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Examination {name: '颅脑MRI'})
SET 
    n.description = coalesce(n.description, '脑部影像检查'),
    n.method = coalesce(n.method, '核磁共振成像'),
    n.requirement = coalesce(n.requirement, '通常在无金属物体情况下进行');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测'),
    n.method = coalesce(n.method, '监测睡眠状态'),
    n.requirement = coalesce(n.requirement, '住院进行以获得准确结果');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肢体僵硬'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '便秘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '嗅觉减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '尿频'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜间翻身困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜尿增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '紧张'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑抑郁状态'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '颅脑MRI'
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



// =====================================

/* Response #41
   Timestamp: 2024-12-27 20:08:36
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种以日间嗜睡为主要特征的慢性睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '在白天感到过度困倦，无法保持清醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '头昏沉'})
SET 
    n.description = coalesce(n.description, '感到头部沉重或不舒服的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '住院观察');

MERGE (n:Examination {name: '心电图'})
SET 
    n.description = coalesce(n.description, '用于监测心脏活动'),
    n.method = coalesce(n.method, '心率监测'),
    n.requirement = coalesce(n.requirement, '静息状态');

MERGE (n:Examination {name: '颅脑MRI'})
SET 
    n.description = coalesce(n.description, '磁共振成像检查，用于排查脑部异常'),
    n.method = coalesce(n.method, '影像学检查'),
    n.requirement = coalesce(n.requirement, '需要保持安静');

// 关系更新
MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '头昏沉'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '心电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '颅脑MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #42
   Timestamp: 2024-12-27 20:08:36
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '反复入睡困难的情况'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '冠状动脉粥样硬化性心脏病'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.description = coalesce(n.description, '长期高血压'),
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, '甲状腺激素分泌不足'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '反复出现入睡困难的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天疲乏'})
SET 
    n.description = coalesce(n.description, '白天感到疲乏的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感觉到的头部轻微不适或虚弱感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '尿失禁'})
SET 
    n.description = coalesce(n.description, '术后偶有排尿失控的情况'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '白天疲乏'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头晕'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #43
   Timestamp: 2024-12-27 20:08:38
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '憋闷'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时感到空气不足'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '滨死感'})
SET 
    n.description = coalesce(n.description, '夜间憋醒时出现的窒息感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '憋闷'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '滨死感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #44
   Timestamp: 2024-12-27 20:08:39
*/
// 节点更新
MERGE (n:Disease {name: '重度睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '白天思睡'})
SET 
    n.description = coalesce(n.description, '白天感到困倦、想睡觉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '打哈气'})
SET 
    n.description = coalesce(n.description, '频繁打哈欠的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感到头部晕眩的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '头脑不清醒'})
SET 
    n.description = coalesce(n.description, '思维不清晰的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于确认睡眠呼吸暂停'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '颈动脉硬化'});

MERGE (n:Disease {name: '腰椎间盘突出'});

// 关系更新
MATCH (from) WHERE from.name = '白天思睡'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '打哈气'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头晕'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头脑不清醒'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '颈动脉硬化'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '重度睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '腰椎间盘突出'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '轻微'),
    r.evidence_level = coalesce(r.evidence_level, '弱');



// =====================================

/* Response #45
   Timestamp: 2024-12-27 20:08:46
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '指患者在入睡过程中或睡眠维持方面出现问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '焦虑状态'})
SET 
    n.description = coalesce(n.description, '一种常见的情绪障碍，表现为情绪紧张、不安'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '夜间入睡困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间反复觉醒'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪紧张'})
SET 
    n.description = coalesce(n.description, '长期感到紧张不安的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '白天精神差'})
SET 
    n.description = coalesce(n.description, '白天感到疲倦，缺乏精力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '感到头部疼痛的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '乏力'})
SET 
    n.description = coalesce(n.description, '身体疲惫，力气不足'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '住院观察');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '夜间反复觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑状态'
MATCH (to) WHERE to.name = '情绪紧张'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '白天精神差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #46
   Timestamp: 2024-12-27 20:08:48
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '在快动眼睡眠期表现出的异常行为症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间手舞足蹈'})
SET 
    n.description = coalesce(n.description, '反复在夜间出现手舞足蹈的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '几乎每日');

MERGE (n:Symptom {name: '做噩梦'})
SET 
    n.description = coalesce(n.description, '夜间出现噩梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话的表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '脑电图'})
SET 
    n.description = coalesce(n.description, '监测脑电活动以排除夜间癫痫'),
    n.method = coalesce(n.method, '脑电监测'),
    n.requirement = coalesce(n.requirement, '在睡眠状态下进行');

// 关系更新
MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间手舞足蹈'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '几乎每日'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '做噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '脑电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #47
   Timestamp: 2024-12-27 20:08:48
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '由于各种原因导致的入睡困难'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '反复入睡困难的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间犯困'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '患者情绪表现为低落'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '近记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力有所下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '胸闷不适'})
SET 
    n.description = coalesce(n.description, '患者胸部感觉不适'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '双手指尖发麻'})
SET 
    n.description = coalesce(n.description, '双手指尖感觉麻木'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '住院观察');

MERGE (n:Examination {name: '脑MRI'})
SET 
    n.description = coalesce(n.description, '核磁共振成像，用于评估脑部状况'),
    n.method = coalesce(n.method, '核磁共振扫描'),
    n.requirement = coalesce(n.requirement, '保持放松');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '日间犯困'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '情绪低落'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '近记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '胸闷不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '双手指尖发麻'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '脑MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #48
   Timestamp: 2024-12-27 20:08:49
*/
// 节点更新
MERGE (n:Disease {name: '重度睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '夜间重度低氧血症'});

MERGE (n:Symptom {name: '白天睡眠增多'})
SET 
    n.description = coalesce(n.description, '白天感觉困倦，睡眠时间增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续一年');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '明显');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '在睡眠中说话'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间起夜'})
SET 
    n.description = coalesce(n.description, '夜间频繁起床上厕所'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '7-8次/晚');

// 关系更新
MATCH (from) WHERE from.name = '白天睡眠增多'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续一年'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '明显'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '梦话'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '夜间起夜'
MATCH (to) WHERE to.name = '重度睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #49
   Timestamp: 2024-12-27 20:08:50
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种通过运动迟缓和不自主抖动等表现的神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '肢体抖动'})
SET 
    n.description = coalesce(n.description, '不自主抖动的表现，常见于帕金森病患者'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '患者在日常活动中表现出的动作缓慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '起步困难'})
SET 
    n.description = coalesce(n.description, '在行动开始时遇到困难的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '走路前冲步态'})
SET 
    n.description = coalesce(n.description, '走路时前倾身体，步伐变小的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '转身不灵活'})
SET 
    n.description = coalesce(n.description, '转身时的运动不协调和缓慢'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '下肢乏力'})
SET 
    n.description = coalesce(n.description, '下肢肌肉力量不足或疲劳的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '加重中');

MERGE (n:Symptom {name: '睡眠差'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，无法保持深度睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '容易被惊扰而醒来的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间梦多'})
SET 
    n.description = coalesce(n.description, '睡眠过程中出现多梦的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '头颅MRI'})
SET 
    n.description = coalesce(n.description, '进行头颅磁共振成像，用于检测脑部病变'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '患者需保持静止');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肢体抖动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '起步困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '走路前冲步态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '转身不灵活'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '下肢乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '加重中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '睡眠差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜间梦多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '头颅MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #50
   Timestamp: 2024-12-27 20:08:50
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '特征是过度的日间困倦、猝倒、睡瘫症以及睡眠相关的幻觉。'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '一种睡眠过程中出现的呼吸问题，导致夜间睡眠质量下降和白天过度嗜睡。'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '反复嗜睡'})
SET 
    n.description = coalesce(n.description, '在没有明显诱因的情况下，反复出现的白天困倦状态。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间入睡后经历的频繁梦境，通常伴随快速醒来。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起梦话'})
SET 
    n.description = coalesce(n.description, '早晨醒来时不断进行说梦话的行为。'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '快速入睡'})
SET 
    n.description = coalesce(n.description, '在安静环境中迅速进入睡眠状态。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间头昏'})
SET 
    n.description = coalesce(n.description, '白天感觉头昏，精神状态不佳。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每天');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于评估睡眠呼吸和睡眠结构'),
    n.method = coalesce(n.method, '监测睡眠'),
    n.requirement = coalesce(n.requirement, '在医院进行');

MERGE (n:Examination {name: 'MSLT'})
SET 
    n.description = coalesce(n.description, '多相维持测试，用于评估白天嗜睡程度'),
    n.method = coalesce(n.method, '测试日间嗜睡'),
    n.requirement = coalesce(n.requirement, '在医院进行');

MERGE (n:Examination {name: '脑电图'})
SET 
    n.description = coalesce(n.description, '通过记录大脑电活动来评估脑功能'),
    n.method = coalesce(n.method, '电生理监测'),
    n.requirement = coalesce(n.requirement, '在医院进行');

MERGE (n:Examination {name: '心电图'})
SET 
    n.description = coalesce(n.description, '用于评估心脏健康状态的检查'),
    n.method = coalesce(n.method, '心功能监测'),
    n.requirement = coalesce(n.requirement, '在医院进行');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '反复嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '晨起梦话'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '快速入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间头昏'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每天'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '反复嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
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

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '脑电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '心电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #51
   Timestamp: 2024-12-27 20:08:55
*/
// 节点更新
MERGE (n:Disease {name: '轻度认知障碍'})
SET 
    n.description = coalesce(n.description, '轻度认知功能障碍，表现为近期记忆力下降'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '由小血管病变引起的脑部病变，常导致认知障碍和其他神经功能紊乱'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '患者在近期记忆力方面表现出下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '夜间睡眠差'})
SET 
    n.description = coalesce(n.description, '患者在夜间睡眠质量差，时常惊醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '坐起'})
SET 
    n.description = coalesce(n.description, '患者在夜间惊醒后坐起'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '海马MRI检查'})
SET 
    n.description = coalesce(n.description, '用于评估脑萎缩情况的影像学检查'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '患者需要保持静息状态');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于分析睡眠质量和呼吸状况'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '在医院进行');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '轻度认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间睡眠差'
MATCH (to) WHERE to.name = '轻度认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间睡眠差'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = '海马MRI检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #52
   Timestamp: 2024-12-27 20:08:55
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种神经系统退行性疾病，主要表现为肢体抖动及运动迟缓'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '复发性抑郁障碍'})
SET 
    n.description = coalesce(n.description, '一种情感障碍，以反复出现的情绪低落为特征'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '肢体抖动'})
SET 
    n.description = coalesce(n.description, '不自主的肢体运动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '行动的速度明显减慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '夜间梦多'})
SET 
    n.description = coalesce(n.description, '睡眠时频繁做梦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '下肢乏力'})
SET 
    n.description = coalesce(n.description, '下肢力量不足，感到疲劳'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '小碎步'})
SET 
    n.description = coalesce(n.description, '走路步态小且不灵活'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '肢体抖动'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '行动迟缓'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间梦多'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '下肢乏力'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '小碎步'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #53
   Timestamp: 2024-12-27 20:08:56
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种主要特征为运动迟缓、震颤和肌肉僵硬的神经退行性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '双下肢无力'})
SET 
    n.description = coalesce(n.description, '感觉双下肢力量不足，影响行走'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行走拖步'})
SET 
    n.description = coalesce(n.description, '行走时脚步不稳，行动缓慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '整体活动减慢，完成日常工作变得困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '右侧肢体静止性震颤'})
SET 
    n.description = coalesce(n.description, '右侧肢体在静止时出现抖动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '肌张力齿轮样增高'})
SET 
    n.description = coalesce(n.description, '在活动时肌肉出现异常的僵硬感觉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '双下肢无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行走拖步'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '行动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '右侧肢体静止性震颤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '肌张力齿轮样增高'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #54
   Timestamp: 2024-12-27 20:08:56
*/
// 节点更新
MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.description = coalesce(n.description, '一种与大脑神经变性相关的痴呆类型，通常表现为记忆力下降和行动迟缓'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '阿尔茨海默症'})
SET 
    n.description = coalesce(n.description, '一种神经退行性疾病，表现为进行性记忆丧失和认知能力下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '涉及逐渐减弱的记忆能力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行动迟缓'})
SET 
    n.description = coalesce(n.description, '活动能力减退，导致动作迟缓'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行为紊乱'})
SET 
    n.description = coalesce(n.description, '包括无法理解的行为模式与动机'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '近记忆力差'})
SET 
    n.description = coalesce(n.description, '难以记住刚刚发生的事情'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Examination {name: '头颅MRI'})
SET 
    n.description = coalesce(n.description, '用于检测脑部结构及病变'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '需保持静止');

MERGE (n:Examination {name: '胸部CT'})
SET 
    n.description = coalesce(n.description, '用于评估肺部及相关结构'),
    n.method = coalesce(n.method, '计算机断层扫描'),
    n.requirement = coalesce(n.requirement, '需平躺并保持静止');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '行动迟缓'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '行为紊乱'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '近记忆力差'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '阿尔茨海默症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '行动迟缓'
MATCH (to) WHERE to.name = '阿尔茨海默症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '头颅MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阿尔茨海默症'
MATCH (to) WHERE to.name = '胸部CT'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #55
   Timestamp: 2024-12-27 20:08:58
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '认知障碍'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '器质性精神障碍'});

MERGE (n:Symptom {name: '渐起运动迟缓'})
SET 
    n.description = coalesce(n.description, '运动逐渐变慢'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '肢体僵硬'})
SET 
    n.description = coalesce(n.description, '肢体感觉僵硬'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '感知到不存在的事物'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '对刚刚做过的事情容易忘记'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '情绪不稳'})
SET 
    n.description = coalesce(n.description, '情绪波动大'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '出现异常行为，如乱找东西'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '呛咳'})
SET 
    n.description = coalesce(n.description, '饮水或进食时出现呛咳'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '夜间翻身困难'})
SET 
    n.description = coalesce(n.description, '夜间无法顺利翻身'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '说梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Examination {name: 'MRI'})
SET 
    n.description = coalesce(n.description, '头颅磁共振成像，评估神经系统状况'),
    n.method = coalesce(n.method, '核磁共振影像'),
    n.requirement = coalesce(n.requirement, '需保持静止');

MERGE (n:Examination {name: '血管检查'})
SET 
    n.description = coalesce(n.description, '颈部血管状况检查'),
    n.method = coalesce(n.method, '超声波检查'),
    n.requirement = coalesce(n.requirement, '需保持安静');

// 关系更新
MATCH (from) WHERE from.name = '渐起运动迟缓'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '肢体僵硬'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '幻觉'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '情绪不稳'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '行为异常'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '呛咳'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '夜间翻身困难'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '说梦话'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = 'MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '血管检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #56
   Timestamp: 2024-12-27 20:08:58
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '腔隙性脑梗死'});

MERGE (n:Disease {name: '轻度认知障碍'});

MERGE (n:Disease {name: '焦虑抑郁状态'});

MERGE (n:Symptom {name: '头晕脑鸣'})
SET 
    n.description = coalesce(n.description, '反复感到头晕和耳鸣'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力逐渐减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '感到焦虑烦躁'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡的情况'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间做较多的梦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '情绪评估'})
SET 
    n.description = coalesce(n.description, '对患者情绪状态进行评估'),
    n.method = coalesce(n.method, '问卷评估'),
    n.requirement = coalesce(n.requirement, '患者需保持放松');

// 关系更新
MATCH (from) WHERE from.name = '头晕脑鸣'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '轻度认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '焦虑抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多梦'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '情绪评估'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #57
   Timestamp: 2024-12-27 20:09:00
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '因心理或生理因素导致的睡眠时间缩短、质量下降等问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间易醒'})
SET 
    n.description = coalesce(n.description, '夜间经常醒来，难以再次入睡的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠缩短'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时间减少，通常为3-4小时'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '情绪波动伴失眠'})
SET 
    n.description = coalesce(n.description, '情绪不稳定，同时出现失眠情况'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '夜间出现恐怖梦境，影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '复视'})
SET 
    n.description = coalesce(n.description, '视觉上出现重影的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '手背脚背发麻'})
SET 
    n.description = coalesce(n.description, '肢体出现麻木感'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '肌肉紧张'})
SET 
    n.description = coalesce(n.description, '肌肉处于紧绷状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑抑郁状态'})
SET 
    n.description = coalesce(n.description, '心理状态不佳，容易焦虑和抑郁'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '高血压'})
SET 
    n.description = coalesce(n.description, '血压水平高于正常值'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断和评估睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在医院进行，需准备好医疗监测设备');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '夜间易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠缩短'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '情绪波动伴失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '复视'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '手背脚背发麻'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '肌肉紧张'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '焦虑抑郁状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #58
   Timestamp: 2024-12-27 20:09:00
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Symptom {name: '夜间憋气'})
SET 
    n.description = coalesce(n.description, '夜间睡觉时感到憋气'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间头昏'})
SET 
    n.description = coalesce(n.description, '白天感到头昏脑胀的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '反应迟钝'})
SET 
    n.description = coalesce(n.description, '思维和反应速度减慢'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '睡眠呼吸监测'})
SET 
    n.description = coalesce(n.description, '监测睡眠时的呼吸暂停现象'),
    n.method = coalesce(n.method, '多导睡眠呼吸监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Disease {name: '高血压病'})
SET 
    n.code = coalesce(n.code, 'I10'),
    n.description = coalesce(n.description, '一种持续性高血压状态'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '脑出血后遗症'})
SET 
    n.description = coalesce(n.description, '脑出血后遗留的症状和体征'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间憋气'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间头昏'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '反应迟钝'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠呼吸监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '严重'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '脑出血后遗症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #59
   Timestamp: 2024-12-27 20:09:01
*/
// 节点更新
MERGE (n:Disease {name: '抑郁状态'})
SET 
    n.description = coalesce(n.description, '一种以情绪低落为特征的心理状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '焦虑状态'})
SET 
    n.description = coalesce(n.description, '一种过度担忧和紧张的情绪状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，影响生活和健康的状况'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难，难以入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '情绪持续性低落，影响日常生活'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '紧张不安'})
SET 
    n.description = coalesce(n.description, '情绪紧张，心情焦虑'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '梦多'})
SET 
    n.description = coalesce(n.description, '睡眠中梦境数量多，影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易出汗'})
SET 
    n.description = coalesce(n.description, '在睡眠或休息时易出汗'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '监测期间需保持安静');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '抑郁状态'
MATCH (to) WHERE to.name = '情绪低落'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '焦虑状态'
MATCH (to) WHERE to.name = '紧张不安'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '梦多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '易出汗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '焦虑状态'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #60
   Timestamp: 2024-12-27 20:09:02
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '患者因入睡困难而引起的睡眠问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '在晚上难以进入睡眠状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续1年');

MERGE (n:Symptom {name: '情绪紧张不安'})
SET 
    n.description = coalesce(n.description, '患者情绪焦虑，难以放松'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '夜间频繁醒来，无法维持睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '心慌'})
SET 
    n.description = coalesce(n.description, '心跳加速或不规律的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '胸闷不适'})
SET 
    n.description = coalesce(n.description, '胸口感到压迫或不适的感觉'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '出汗多'})
SET 
    n.description = coalesce(n.description, '夜间出现异常出汗的现象'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Examination {name: '睡眠研究'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠障碍的综合检查'),
    n.method = coalesce(n.method, '多导睡眠图检查'),
    n.requirement = coalesce(n.requirement, '在专用设施中进行');

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续1年'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '情绪紧张不安'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '易醒'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '心慌'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胸闷不适'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '出汗多'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠研究'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #61
   Timestamp: 2024-12-27 20:09:04
*/
// 节点更新
MERGE (n:Disease {name: '快动眼睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '一种在快动眼睡眠期表现出的异常行为症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '腔隙性脑梗死'})
SET 
    n.description = coalesce(n.description, '在脑内产生小的缺血性损伤'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '房性期前收缩'})
SET 
    n.description = coalesce(n.description, '心脏提前收缩的一种情况'),
    n.severity = coalesce(n.severity, '轻微');

MERGE (n:Symptom {name: '夜间噩梦'})
SET 
    n.description = coalesce(n.description, '夜间经历恐怖梦境'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '喊叫'})
SET 
    n.description = coalesce(n.description, '在睡眠中大声叫喊的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '拳打脚踢'})
SET 
    n.description = coalesce(n.description, '在睡眠中无意识地进行攻击性动作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '嗅觉减退'})
SET 
    n.description = coalesce(n.description, '对气味的感觉减弱'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '便秘'})
SET 
    n.description = coalesce(n.description, '排便困难'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '快速的失去平衡感或感觉头部空虚'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '视物模糊'})
SET 
    n.description = coalesce(n.description, '看不清楚物体的清晰度'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '对近期事件的记忆减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '夜间噩梦'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '喊叫'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '拳打脚踢'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '腔隙性脑梗死'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '快动眼睡眠行为障碍'
MATCH (to) WHERE to.name = '房性期前收缩'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '轻微'),
    r.evidence_level = coalesce(r.evidence_level, '低');



// =====================================

/* Response #62
   Timestamp: 2024-12-27 20:09:06
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '因入睡困难和多梦导致的睡眠问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '焦虑状态'})
SET 
    n.description = coalesce(n.description, '患者情绪紧张、担忧和焦虑的状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '夜间频繁梦境的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '感觉头部不适或晕眩'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '头部疼痛的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '夜惊'})
SET 
    n.description = coalesce(n.description, '夜间恐慌和惊吓的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '喊叫'})
SET 
    n.description = coalesce(n.description, '无意识地在夜间大声喊叫'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '出汗'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现异常出汗现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'PSG睡眠量表评估'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测用于评估睡眠障碍'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '在医院观察');

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多梦'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头晕'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '焦虑状态'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜惊'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '喊叫'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '出汗'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = 'PSG睡眠量表评估'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #63
   Timestamp: 2024-12-27 20:09:06
*/
// 节点更新
MERGE (n:Disease {name: '路易体痴呆'});

MERGE (n:Disease {name: '快动眼睡眠行为障碍'});

MERGE (n:Disease {name: '高血压病'})
SET 
    n.description = coalesce(n.description, '高血压病3级（极高危）'),
    n.severity = coalesce(n.severity, '极高危');

MERGE (n:Disease {name: '器质性精神障碍'});

MERGE (n:Symptom {name: '记忆力减退'})
SET 
    n.description = coalesce(n.description, '患者渐起记忆力下降，刚说过的话转身就忘'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '渐进');

MERGE (n:Symptom {name: '夜间大喊大叫'})
SET 
    n.description = coalesce(n.description, '夜间睡眠中大喊大叫的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '做噩梦'})
SET 
    n.description = coalesce(n.description, '夜间出现噩梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '说梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话的表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '手舞足蹈'})
SET 
    n.description = coalesce(n.description, '夜间手舞足蹈的行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '阵发性幻觉'})
SET 
    n.description = coalesce(n.description, '看见陌生人在家里走动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时有');

MERGE (n:Symptom {name: '下肢乏力'})
SET 
    n.description = coalesce(n.description, '下肢感到无力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '烦躁不安'})
SET 
    n.description = coalesce(n.description, '表现为时有吵闹和烦躁'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '记忆力减退'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '渐进'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间大喊大叫'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '做噩梦'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '说梦话'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '手舞足蹈'
MATCH (to) WHERE to.name = '快动眼睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阵发性幻觉'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '下肢乏力'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '烦躁不安'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #64
   Timestamp: 2024-12-27 20:09:07
*/
// 节点更新
MERGE (n:Disease {name: '脑血管病恢复期'})
SET 
    n.description = coalesce(n.description, '脑梗死后的恢复期'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '影响记忆和思考的能力'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '偏侧肢体无力'})
SET 
    n.description = coalesce(n.description, '一侧肢体无力的症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '器质性精神障碍'})
SET 
    n.description = coalesce(n.description, '由生理因素引起的精神症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '2型糖尿病'})
SET 
    n.description = coalesce(n.description, '一种常见的代谢性疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响正常睡眠的症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '记忆力下降'})
SET 
    n.description = coalesce(n.description, '记忆力减退的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '左侧肢体活动无力'})
SET 
    n.description = coalesce(n.description, '左侧肢体无力的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '口齿欠清'})
SET 
    n.description = coalesce(n.description, '说话不清晰的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '夜间吵闹'})
SET 
    n.description = coalesce(n.description, '夜间出现吵闹的行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '行为乱'})
SET 
    n.description = coalesce(n.description, '表现出混乱的行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '头部疼痛的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '记忆力下降'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '左侧肢体活动无力'
MATCH (to) WHERE to.name = '偏侧肢体无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '口齿欠清'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间吵闹'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '行为乱'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '器质性精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

