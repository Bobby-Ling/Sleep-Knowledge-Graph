// File: 睡眠医学_14370617.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 51

/* Response #1
   Timestamp: 2024-12-19 00:08:13
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: 'REM睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期的异常行为'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '深睡眠减少'})
SET 
    n.description = coalesce(n.description, '深睡眠比例下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: 'REM睡眠减少'})
SET 
    n.description = coalesce(n.description, 'REM睡眠时间逐渐减少'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '睡眠期间生理活动不稳定'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '梦境模糊'})
SET 
    n.description = coalesce(n.description, '梦境内容记忆模糊'),
    n.severity = coalesce(n.severity, '轻');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '深睡眠减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'REM睡眠减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'REM睡眠行为障碍'
MATCH (to) WHERE to.name = '梦境模糊'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'REM睡眠行为障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:08:14
*/
// 节点更新
MERGE (n:Disease {name: 'NREM睡眠'});

MERGE (n:Disease {name: 'REM睡眠'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Symptom {name: '睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '缺乏必要的睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比计划时间提前醒来'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠剥夺'
MATCH (to) WHERE to.name = 'NREM睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = 'REM睡眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'NREM睡眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #3
   Timestamp: 2024-12-19 00:08:19
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种感觉异常的疾病，患者感到下肢有不适'),
    n.category = coalesce(n.category, '睡眠疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '在睡眠中发生的呼吸暂停，导致觉醒和纷乱的睡眠'),
    n.category = coalesce(n.category, '睡眠疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.code = coalesce(n.code, 'PLMD'),
    n.description = coalesce(n.description, '一种在睡眠中，施加阵发性下肢运动的疾病'),
    n.category = coalesce(n.category, '睡眠疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '睡眠量差异'})
SET 
    n.description = coalesce(n.description, '个体间睡眠持续时间的变化'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠扰乱'})
SET 
    n.description = coalesce(n.description, '睡眠中断或不规律的状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '醒后困倦'})
SET 
    n.description = coalesce(n.description, '醒来后仍有困倦感'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Gene {name: 'Per2'})
SET 
    n.description = coalesce(n.description, '与昼夜节律有关的基因');

MERGE (n:Gene {name: 'hDEC2'})
SET 
    n.description = coalesce(n.description, '与睡眠调节相关的基因');

MERGE (n:Gene {name: 'Clock'})
SET 
    n.description = coalesce(n.description, '昼夜节律核心基因');

MERGE (n:Gene {name: 'NPAS2'})
SET 
    n.description = coalesce(n.description, '影响睡眠维持和觉醒周期的基因');

MERGE (n:Gene {name: 'DEC2-P385R'})
SET 
    n.description = coalesce(n.description, '突变基因，与睡眠觉醒周期相关');

// 关系更新
MATCH (from) WHERE from.name = '睡眠量差异'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠扰乱'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '醒后困倦'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'Per2'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'hDEC2'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = 'NPAS2'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #4
   Timestamp: 2024-12-19 00:08:20
*/
// 节点更新
MERGE (n:Disease {name: '全睡眠剥夺'});

MERGE (n:Disease {name: '部分睡眠剥夺'});

MERGE (n:Disease {name: '选择性睡眠剥夺'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Symptom {name: '困意'})
SET 
    n.description = coalesce(n.description, '强烈的困倦感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲惫'})
SET 
    n.description = coalesce(n.description, '身体和精神的极度疲劳'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易激怒'})
SET 
    n.description = coalesce(n.description, '情绪容易激动，暴躁'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪不稳定'})
SET 
    n.description = coalesce(n.description, '情绪波动大'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '感知到不存在的事物'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '定向力障碍'})
SET 
    n.description = coalesce(n.description, '失去对周围环境的正确判断能力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '思睡(昏昏欲睡)的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '瞌睡'})
SET 
    n.description = coalesce(n.description, '白天突然困倦并想打盹'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '乏力'})
SET 
    n.description = coalesce(n.description, '精神状态不佳，缺乏能量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '轻度抑郁'})
SET 
    n.description = coalesce(n.description, '轻度的抑郁情绪'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '激越'})
SET 
    n.description = coalesce(n.description, '情绪表现为极度激动或不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '困意'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '疲惫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '易激怒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '情绪不稳定'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '定向力障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '瞌睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '轻度抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '激越'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '选择性睡眠剥夺'
MATCH (to) WHERE to.name = '情绪不稳定'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '选择性睡眠剥夺'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '乏力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '全睡眠剥夺'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '部分睡眠剥夺'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #5
   Timestamp: 2024-12-19 00:08:21
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '患者经历强烈的移动感或不宁感，尤其是在休息时'),
    n.code = coalesce(n.code, 'RLS');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '表现为反复的白天嗜睡和突然的睡眠发作'),
    n.code = coalesce(n.code, 'Narcolepsy');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '在睡眠期间反复出现呼吸暂停或浅呼吸'),
    n.code = coalesce(n.code, 'OSA');

MERGE (n:Disease {name: 'Pickwick综合征'})
SET 
    n.description = coalesce(n.description, '与肥胖、日间嗜睡和夜间呼吸暂停相关联的群体症状'),
    n.code = coalesce(n.code, 'Pickwick syndrome');

MERGE (n:Disease {name: '快速眼球运动睡眠期行为紊乱'})
SET 
    n.description = coalesce(n.description, '患者在REM睡眠期间表现出不适当的行为的睡眠障碍'),
    n.code = coalesce(n.code, 'RBD');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种影响运动的慢性疾病，症状包括震颤、僵硬和失衡'),
    n.code = coalesce(n.code, 'PD');

MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.description = coalesce(n.description, '一种进展性神经退行性疾病，导致认知和运动障碍'),
    n.code = coalesce(n.code, 'DLB');

MERGE (n:Disease {name: '多系统萎缩'})
SET 
    n.description = coalesce(n.description, '一种影响多个系统的神经退行性疾病'),
    n.code = coalesce(n.code, 'MSA');

MERGE (n:Disease {name: '特发性RBD'})
SET 
    n.description = coalesce(n.description, '未能找出明确病因的快速眼球运动睡眠期行为紊乱'),
    n.code = coalesce(n.code, 'iRBD');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'Pickwick综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '程度不一');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '多系统萎缩'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'Pickwick综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '特发性RBD'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #6
   Timestamp: 2024-12-19 00:08:22
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠障碍的一种'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '夜间呼吸道阻塞导致的睡眠呼吸障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种以突然的睡眠发作为特征的病症'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.description = coalesce(n.description, '身体生物钟与环境因素不一致导致的睡眠问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '神经系统疾病相关的睡眠障碍'})
SET 
    n.description = coalesce(n.description, '由神经系统疾病引起的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '因失眠或其他情况导致的睡眠时间不足'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中发生短暂的呼吸停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '在不适当的时间过度睡眠'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '记录睡眠期间的脑电活动、呼吸等参数'),
    n.method = coalesce(n.method, '生理记录'),
    n.requirement = coalesce(n.requirement, '需要在睡眠实验室进行');

MERGE (n:Examination {name: '睡眠评估量表'})
SET 
    n.description = coalesce(n.description, '通过量表评估睡眠质量'),
    n.method = coalesce(n.method, '问卷'),
    n.requirement = coalesce(n.requirement, '主观评估');

MERGE (n:NonDrugTreatment {name: '心理和行为治疗'})
SET 
    n.description = coalesce(n.description, '通过心理干预改善睡眠'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '严重心理疾病'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '苯二氮草类'})
SET 
    n.description = coalesce(n.description, '用于治疗失眠的镇静药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度呼吸衰竭');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠剥夺'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠评估量表'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '心理和行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯二氮草类'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '神经系统疾病相关的睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #7
   Timestamp: 2024-12-19 00:08:24
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Disease {name: '帕金森病'});

MERGE (n:DrugTreatment {name: '罗匹尼罗'})
SET 
    n.description = coalesce(n.description, '用于治疗帕金森病及中度、重度不宁腿综合征'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '口服'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '与多巴胺受体拮抗剂合用时慎用');

MERGE (n:DrugTreatment {name: '罗替戈汀'})
SET 
    n.description = coalesce(n.description, '透皮贴剂治疗不宁腿综合征'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '透皮'),
    n.contraindication = coalesce(n.contraindication, '避免驾驶等危险性活动');

MERGE (n:DrugTreatment {name: '溴隐亭'})
SET 
    n.description = coalesce(n.description, '改善不宁腿综合征症状'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '夜间单次给药'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '直立性低血压患者需监测血压');

MERGE (n:DrugTreatment {name: '加巴喷丁'})
SET 
    n.description = coalesce(n.description, '用于减轻不宁腿综合征症状并提高睡眠质量'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '每日服用'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '抗酸药可减少吸收');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于睡眠疾病诊断'),
    n.method = coalesce(n.method, '多导同步记录'),
    n.requirement = coalesce(n.requirement, '需要临床监测');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗替戈汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长效治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '溴隐亭'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '主要治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #8
   Timestamp: 2024-12-19 00:08:26
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'CID'),
    n.description = coalesce(n.description, '频繁而持续的睡眠起始和维持困难，导致个体对于睡眠时间或质量不满足，并存在白天觉醒期间的功能受损'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '入睡困难，或在合适的作息时间点不愿上床'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '夜间醒来再难入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比期望的起床时间更早醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '日间功能损害'})
SET 
    n.description = coalesce(n.description, '疲劳，注意力不集中或记忆障碍'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '激惹或情绪低落'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠起始困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '日间功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '情绪低落'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #9
   Timestamp: 2024-12-19 00:08:27
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '特发性睡眠增多症'});

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天持续感到困倦，难以保持清醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠阶段判断错误'})
SET 
    n.description = coalesce(n.description, '无法准确判断是否处于睡眠状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '影响评估');

MERGE (n:Examination {name: '多次睡眠潜伏期试验'})
SET 
    n.description = coalesce(n.description, '用于评估患者的日间思睡程度'),
    n.method = coalesce(n.method, '客观检测'),
    n.requirement = coalesce(n.requirement, '需监测前夜至少6小时睡眠');

MERGE (n:Examination {name: '清醒维持试验'})
SET 
    n.description = coalesce(n.description, '用于评估患者维持清醒的能力'),
    n.method = coalesce(n.method, '客观检测'),
    n.requirement = coalesce(n.requirement, '禁忌剧烈活动');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠阶段判断错误'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '特发性睡眠增多症'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多次睡眠潜伏期试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '多次睡眠潜伏期试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '清醒维持试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #10
   Timestamp: 2024-12-19 00:08:27
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'});

MERGE (n:Disease {name: '低通气'});

MERGE (n:Disease {name: '胃食管反流'});

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '呼吸流的完全中断'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间睡眠期出现嘻呛'})
SET 
    n.description = coalesce(n.description, '在睡眠期间可能出现的窒息感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感觉困倦或昏昏欲睡'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '肋间肌肌电活动'})
SET 
    n.description = coalesce(n.description, '肋间肌肉的电活动监测'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '不常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '全面监测睡眠状态及呼吸情况的检查'),
    n.method = coalesce(n.method, '通过多种传感器监测'),
    n.requirement = coalesce(n.requirement, '睡眠状态下进行');

MERGE (n:Examination {name: '脉搏血氧饱和度仪'})
SET 
    n.description = coalesce(n.description, '监测血氧饱和度的非侵入性方法'),
    n.method = coalesce(n.method, '采用分光光电技术'),
    n.requirement = coalesce(n.requirement, '安装在指端或耳垂处');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间睡眠期出现嘻呛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '脉搏血氧饱和度仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '胃食管反流'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '睡眠期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肋间肌肌电活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #11
   Timestamp: 2024-12-19 00:08:35
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种睡眠时上气道反复塌陷、阻塞引起呼吸暂停和低通气的疾病'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '对自我睡眠能力的担忧与焦虑'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天困倦，注意力不集中'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠不足'})
SET 
    n.description = coalesce(n.description, '夜间觉醒与潛伏期延长'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '矛盾意念法'})
SET 
    n.description = coalesce(n.description, '通过患者在正常就寝时进行相反的意念控制，降低患者的担忧和焦虑，减少内源性唤醒'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '放松疗法'})
SET 
    n.description = coalesce(n.description, '通过不同形式的放松模式降低干扰睡眠的状态'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '认知治疗'})
SET 
    n.description = coalesce(n.description, '用正确的信念和态度取代错误认知，改善睡眠'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '矛盾意念法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '放松疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '认知治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '睡眠不足'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠不足'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #12
   Timestamp: 2024-12-19 00:08:36
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合症'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '因气道阻塞导致的睡眠呼吸暂停现象'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中出现呼吸停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '昼间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间呼吸发出喉音'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间觉醒'})
SET 
    n.description = coalesce(n.description, '在夜间多次醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Complication {name: '出血'})
SET 
    n.description = coalesce(n.description, '手术过程中的出血风险'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.code = coalesce(n.code, 'OB'),
    n.description = coalesce(n.description, '体重超标导致的疾病'),
    n.category = coalesce(n.category, '与OSAHS相关'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '昼间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '夜间觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.15),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

/* Response #13
   Timestamp: 2024-12-19 00:08:37
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合症'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为睡眠期间出现反复的呼吸暂停和低通气事件，导致缺氧和觉醒。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中到重度');

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'HT'),
    n.description = coalesce(n.description, '一种常见的心血管疾病，表现为血压持续升高。'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '糖尿病'})
SET 
    n.code = coalesce(n.code, 'DM'),
    n.description = coalesce(n.description, '一种内分泌疾病，表现为血糖水平异常。'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '心力衰竭'})
SET 
    n.code = coalesce(n.code, 'HF'),
    n.description = coalesce(n.description, '一种心脏疾病，表现为心脏无法有效泵血。'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在白天表现出极度困倦和嗜睡。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '患者表现出认知能力减退。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抑郁症状'})
SET 
    n.description = coalesce(n.description, '患者表现出情绪低落及抑郁情绪。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间微觉醒'})
SET 
    n.description = coalesce(n.description, '患者夜间频繁觉醒，影响睡眠质量。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: 'CPAP治疗'})
SET 
    n.description = coalesce(n.description, '通过呼吸机提供气道正压以维持上气道开放的治疗方法。'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每晚'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, 'CPAP呼吸机');

MERGE (n:Complication {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '脑血流减少导致的急性中枢神经系统损伤。'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Complication {name: '冠心病'})
SET 
    n.description = coalesce(n.description, '冠状动脉供血不足引起的心脏病。'),
    n.severity = coalesce(n.severity, '重度');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '抑郁症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '夜间微觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = 'CPAP治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '多项研究支持');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '基础研究支持');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '多项研究支持');



// =====================================

/* Response #14
   Timestamp: 2024-12-19 00:08:37
*/
// 节点更新
MERGE (n:Disease {name: '短期失眠障碍'})
SET 
    n.description = coalesce(n.description, 'STID的基本特征是短期睡眠起始和维持困难,并导致睡眠不满足感。');

MERGE (n:Disease {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '慢性失眠是一种持续的睡眠障碍,可能与短期失眠发展相关。');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '指人入睡困难的状态。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '指夜间醒来后再入睡困难的状态。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '指比期望的时间过早醒来。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '指因睡眠质量差而产生的疲惫感。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意力损害'})
SET 
    n.description = coalesce(n.description, '指注意力无法集中。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '记忆减退'})
SET 
    n.description = coalesce(n.description, '指记忆力减退的表现。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '激惹'})
SET 
    n.description = coalesce(n.description, '情绪易怒的状态。'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '对睡眠障碍的苦恼'})
SET 
    n.description = coalesce(n.description, '因睡眠差而形成的苦恼。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间打盹'})
SET 
    n.description = coalesce(n.description, '白天因为睡眠不足而产生打盹现象。'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间功能损害'})
SET 
    n.description = coalesce(n.description, '指影响到工作、学习等日常功能的状态。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '睡眠起始困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '注意力损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '记忆减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '激惹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '对睡眠障碍的苦恼'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '夜间打盹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '日间功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #15
   Timestamp: 2024-12-19 00:08:38
*/
// 节点更新
MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现的暂停呼吸现象。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '低氧睡眠'})
SET 
    n.description = coalesce(n.description, '在睡眠期间血氧水平不足的状态。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '上气道阻塞'})
SET 
    n.description = coalesce(n.description, '上气道部分或完全阻塞，导致呼吸不畅。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '呼吸时感到困难或不适。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '鼻咽纤维内镜检查'})
SET 
    n.description = coalesce(n.description, '通过鼻咽部的细小镜子检查上气道情况，以评估呼吸道阻塞的部位和程度。'),
    n.method = coalesce(n.method, '内窥镜'),
    n.requirement = coalesce(n.requirement, '患者需保持镇静，检查时尽量配合。');

MERGE (n:Examination {name: 'CT扫描'})
SET 
    n.description = coalesce(n.description, '通过计算机断层扫描检查上气道的结构及阻塞情况。'),
    n.method = coalesce(n.method, '成像检查'),
    n.requirement = coalesce(n.requirement, '患者需接受辐射，需空腹。');

MERGE (n:NonDrugTreatment {name: '正压通气治疗'})
SET 
    n.description = coalesce(n.description, '维持呼吸道通畅的一种方法，使用气压设备帮助患者呼吸。'),
    n.duration = coalesce(n.duration, '根据患者情况'),
    n.frequency = coalesce(n.frequency, '持续应用'),
    n.contraindication = coalesce(n.contraindication, '对镇静剂反应明显的患者'),
    n.equipment = coalesce(n.equipment, '呼吸机');

MERGE (n:NonDrugTreatment {name: '软组织减容术'})
SET 
    n.description = coalesce(n.description, '通过减少软组织体积以拓展上气道，改善呼吸状况。'),
    n.duration = coalesce(n.duration, '根据手术方案'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '先天性软腭功能不全患者'),
    n.equipment = coalesce(n.equipment, '手术器械');



// =====================================

/* Response #16
   Timestamp: 2024-12-19 00:08:40
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合症'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种睡眠期间反复呼吸暂停的病症，与肥胖等因素有关'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等到严重');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重超标的病例，常导致多种健康问题'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Disease {name: '超重'});

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中反复发生的呼吸暂停现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠图(PSG)'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠呼吸障碍的测试'),
    n.method = coalesce(n.method, '多导监测'),
    n.requirement = coalesce(n.requirement, '需要在睡眠实验室进行');

MERGE (n:NonDrugTreatment {name: '体重管理'})
SET 
    n.description = coalesce(n.description, '通过减重来改善睡眠呼吸暂停状况'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '睡眠体位调节'})
SET 
    n.description = coalesce(n.description, '通过改变睡眠体位来改善上气道通畅性'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '一种常见的并发症，导致心脏病和中风等健康问题'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '心力衰竭'})
SET 
    n.description = coalesce(n.description, '心脏无法有效泵血，导致全身乏力和呼吸困难'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '由于血流受阻或出血导致的脑部损伤'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:RiskFactor {name: '性别'})
SET 
    n.description = coalesce(n.description, '男性患OSAHS的风险高于女性'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '年龄'})
SET 
    n.description = coalesce(n.description, '随着年龄的增长，OSAHS的风险会增加'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '鼻腔阻力'})
SET 
    n.description = coalesce(n.description, '鼻腔阻力增高可导致咽腔负压增加'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '酗酒与吸烟'})
SET 
    n.description = coalesce(n.description, '吸烟与睡眠呼吸暂停有关，可能降低气道张力'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '药物的作用'})
SET 
    n.description = coalesce(n.description, '某些药物可能降低气道扩张肌的反应性，增大气道坍塌风险'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '内分泌系统疾病'})
SET 
    n.description = coalesce(n.description, '某些内分泌疾病会加重OSAHS'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '遗传综合征'})
SET 
    n.description = coalesce(n.description, '某些遗传疾病患者可能更易患OSAHS'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '充足');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '超重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '多导睡眠图(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '体重管理'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '主要治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '睡眠体位调节'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '性别'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '充足');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '年龄'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '充足');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '鼻腔阻力'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '适中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '酗酒与吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '适中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '药物的作用'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '适中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '内分泌系统疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '适中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '遗传综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '适中');



// =====================================

/* Response #17
   Timestamp: 2024-12-19 00:08:40
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:DrugTreatment {name: '佐匹克隆'})
SET 
    n.description = coalesce(n.description, '环吡咯酮类药物，具有镇静、抗焦虑、肌肉松弛和抗惊厥作用，适用于各种类型失眠'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度呼吸衰竭');

MERGE (n:DrugTreatment {name: '右佐匹克隆'})
SET 
    n.description = coalesce(n.description, '佐匹克隆的单纯右旋异构体，用于治疗失眠'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '雷美替胺'})
SET 
    n.description = coalesce(n.description, '高选择性褪黑激素受体激动剂，用于治疗失眠'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '每天一次'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '严重肝损伤');

MERGE (n:DrugTreatment {name: '阿戈美拉汀'})
SET 
    n.description = coalesce(n.description, '褪黑激素受体激动剂和5-HT2C受体拮抗剂，调整睡眠节律及调节生物钟作用'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '苯海拉明'})
SET 
    n.description = coalesce(n.description, '第一代组胺受体拮抗药，作为失眠治疗的辅助药'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '青光眼患者');

MERGE (n:DrugTreatment {name: '多塞平'})
SET 
    n.description = coalesce(n.description, '三环类抗抑郁药，对焦虑、抑郁性失眠疗效显著'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '与单胺氧化酶抑制剂合用');

MERGE (n:DrugTreatment {name: '水合氯醛'})
SET 
    n.description = coalesce(n.description, '用于顽固性失眠或对其他催眠药效果不佳的患者'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对严重心、肝、肾疾病患者禁用');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '右佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '雷美替胺'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.87),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阿戈美拉汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯海拉明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多塞平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '水合氯醛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助治疗');



// =====================================

/* Response #18
   Timestamp: 2024-12-19 00:08:40
*/
// 节点更新
MERGE (n:Disease {name: '腺样体肥大'});

MERGE (n:Disease {name: '扁桃体肥大'});

MERGE (n:Disease {name: 'OSAHS'})
SET 
    n.description = coalesce(n.description, '阻塞性睡眠呼吸障碍');

MERGE (n:Disease {name: '唐氏综合征'})
SET 
    n.description = coalesce(n.description, '一种先天性疾病，具有特征性面容及智力低下');

MERGE (n:Disease {name: '脐疝-巨舌-巨体综合征'})
SET 
    n.description = coalesce(n.description, '以脐膨出、巨舌和巨大特征为主的综合征');

MERGE (n:Disease {name: '巨舌症'})
SET 
    n.description = coalesce(n.description, '舌体均质性增大，原因不明');

MERGE (n:Disease {name: '小下颌畸形'})
SET 
    n.description = coalesce(n.description, '下颌发育不足');

MERGE (n:Disease {name: '第一鳃弓综合征'})
SET 
    n.description = coalesce(n.description, '面部及耳部发育异常的综合征');

MERGE (n:Disease {name: 'Treacher Collins 综合征'})
SET 
    n.description = coalesce(n.description, '面部结构发育不足的先天性疾病');

// 关系更新
MATCH (from) WHERE from.name = 'OSAHS'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = 'OSAHS'
MATCH (to) WHERE to.name = '扁桃体肥大'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '唐氏综合征'
MATCH (to) WHERE to.name = 'OSAHS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '脐疝-巨舌-巨体综合征'
MATCH (to) WHERE to.name = 'OSAHS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '巨舌症'
MATCH (to) WHERE to.name = 'OSAHS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '小下颌畸形'
MATCH (to) WHERE to.name = 'OSAHS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '第一鳃弓综合征'
MATCH (to) WHERE to.name = '小下颌畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = 'Treacher Collins 综合征'
MATCH (to) WHERE to.name = '小下颌畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '唐氏综合征'
MATCH (to) WHERE to.name = '巨舌症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '脐疝-巨舌-巨体综合征'
MATCH (to) WHERE to.name = '巨舌症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #19
   Timestamp: 2024-12-19 00:08:41
*/
// 节点更新
MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.description = coalesce(n.description, '肥胖低通气综合征易合并OSAHS,出现更严重的夜间血氧饱和度下降,并伴高碳酸血症'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS'),
    n.description = coalesce(n.description, '常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.short_name = coalesce(n.short_name, 'COPD'),
    n.description = coalesce(n.description, '一种导致气流阻塞的疾病'),
    n.category = coalesce(n.category, '肺部疾病');

MERGE (n:Disease {name: '甲状腺功能减退'})
SET 
    n.description = coalesce(n.description, '甲状腺功能不足导致的健康问题'),
    n.category = coalesce(n.category, '内分泌疾病');

MERGE (n:Disease {name: '急性呼吸衰竭'})
SET 
    n.description = coalesce(n.description, '严重的呼吸障碍状态'),
    n.category = coalesce(n.category, '呼吸系统疾病');

MERGE (n:Complication {name: '肺动脉高压'})
SET 
    n.description = coalesce(n.description, '肺动脉压力异常升高'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '过敏性鼻炎'})
SET 
    n.description = coalesce(n.description, '鼻部过敏导致的炎症'),
    n.category = coalesce(n.category, '过敏性疾病');

MERGE (n:Disease {name: '慢性心力衰竭'})
SET 
    n.description = coalesce(n.description, '心功能衰竭导致的健康问题'),
    n.category = coalesce(n.category, '心血管疾病');

// 关系更新
MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '发生率高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '甲状腺功能减退'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '阶段性');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '急性呼吸衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '急性');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '肺动脉高压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '过敏性鼻炎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '慢性心力衰竭'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #20
   Timestamp: 2024-12-19 00:08:42
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合症'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种以睡眠期间反复出现呼吸暂停或低通气为特征的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '鼻中隔偏曲'})
SET 
    n.description = coalesce(n.description, '鼻中隔的上下或前后径偏离矢状面, 引起鼻腔功能障碍'),
    n.category = coalesce(n.category, '鼻腔疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '鼻息肉'})
SET 
    n.description = coalesce(n.description, '由鼻黏膜长期炎性反应引起的组织水肿，常导致持续性鼻塞'),
    n.category = coalesce(n.category, '鼻腔疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '肥厚性鼻炎'})
SET 
    n.description = coalesce(n.description, '以鼻腔黏膜增生肥厚为特点的慢性鼻腔炎症'),
    n.category = coalesce(n.category, '鼻腔疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '鼻腔及鼻咽部肿瘤'})
SET 
    n.description = coalesce(n.description, '鼻咽部恶性肿瘤可能导致鼻塞'),
    n.category = coalesce(n.category, '鼻腔疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '变应性鼻炎'})
SET 
    n.description = coalesce(n.description, '发生在鼻黏膜的变态反应常见表现，可能与支气管哮喘共存'),
    n.category = coalesce(n.category, '鼻腔疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '鼻塞'})
SET 
    n.description = coalesce(n.description, '由于鼻腔、鼻窦疾病导致的通气障碍'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠期间发出的噪音，常因上气道阻塞导致'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时出现的短暂呼吸停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '喷嚏'})
SET 
    n.description = coalesce(n.description, '由于鼻腔炎症反应或过敏反应导致的打喷嚏'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '鼻塞'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '鼻中隔偏曲'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '鼻息肉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '肥厚性鼻炎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '鼻腔及鼻咽部肿瘤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合症'
MATCH (to) WHERE to.name = '变应性鼻炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #21
   Timestamp: 2024-12-19 00:08:42
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:DrugTreatment {name: '苯二氮草受体激动剂'})
SET 
    n.description = coalesce(n.description, '作用于GABA_A受体，具有镇静、抗焦虑、抗惊厥等作用'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '孕妇、哺乳期女性、严重肝肾功能损害');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'});

MERGE (n:DrugTreatment {name: '艾司唑仑'})
SET 
    n.description = coalesce(n.description, '苯二氮草类催眠药，治疗睡眠起始和维持困难'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '三唑仑'})
SET 
    n.description = coalesce(n.description, '起效快的苯二氮草类失眠药'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '易成瘾');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '可促进某些患者达到主观睡眠感'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对敏感患者可导致共济失调');

MERGE (n:DrugTreatment {name: '唑吡坦'})
SET 
    n.description = coalesce(n.description, '非苯二氮草类催眠药'),
    n.dosage = coalesce(n.dosage, '男性10mg、女性5mg'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:NonDrugTreatment {name: '睡眠卫生教育'})
SET 
    n.description = coalesce(n.description, '通过改善睡眠习惯来提高睡眠质量'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '次日宿醉效应'})
SET 
    n.description = coalesce(n.description, '服用催眠药后次日可能感到疲倦的现象'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:NonDrugTreatment {name: '刺激控制疗法'})
SET 
    n.description = coalesce(n.description, '改善患者对床和睡眠的条件反射'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '躁狂或癫痫史患者'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '睡眠限制疗法'})
SET 
    n.description = coalesce(n.description, '减少夜间觉醒时间，增加睡眠效率'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '不能适应的患者'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯二氮草受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '艾司唑仑'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '三唑仑'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '唑吡坦'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠卫生教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '次日宿醉效应'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '近期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '刺激控制疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '标准治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠限制疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '指导治疗');



// =====================================

/* Response #22
   Timestamp: 2024-12-19 00:08:43
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠时呼吸反复暂停或表面低通气的病症'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到极度困倦的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠中伴有明显的打鼾声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠片段化'})
SET 
    n.description = coalesce(n.description, '睡眠时频繁觉醒导致的睡眠质量下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠中反复的不完全或完全的呼吸暂停'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感觉头痛的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '记忆力减退'})
SET 
    n.description = coalesce(n.description, '患者在日常生活中的记忆力下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠片段化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '记忆力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '夜间呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #23
   Timestamp: 2024-12-19 00:08:44
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '特发性睡眠增多'});

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在白天应该保持清醒的主要时段不能保持清醒和警觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '血氧饱和度下降'})
SET 
    n.description = coalesce(n.description, '睡眠期可见血氧饱和度的下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '间歇');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '血氧饱和度下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.15),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '血氧饱和度下降'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #24
   Timestamp: 2024-12-19 00:08:46
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '由颅颌面畸形造成的睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '颅缝早闭相关综合征'})
SET 
    n.description = coalesce(n.description, '由于颅缝早闭导致的多种功能障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '巨舌症'})
SET 
    n.description = coalesce(n.description, '先天性舌肌过长，舌体均质性增大'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '小颌畸形'})
SET 
    n.description = coalesce(n.description, '颌骨发育不足造成的畸形'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '睡眠期间的呼吸问题'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '颅内高压'})
SET 
    n.description = coalesce(n.description, '颅内压力增高，可能影响大脑发育'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '呼吸障碍'})
SET 
    n.description = coalesce(n.description, '包括语言和吞咽障碍'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: '牙颌畸形'})
SET 
    n.description = coalesce(n.description, '由于上呼吸道阻塞造成的牙颌问题'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: '自我意识提高'})
SET 
    n.description = coalesce(n.description, '儿童自我形象和社会适应能力的变化'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '少见');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '颅缝早闭相关综合征'
MATCH (to) WHERE to.name = '颅内高压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '相对少见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '牙颌畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '颅缝早闭相关综合征'
MATCH (to) WHERE to.name = '牙颌畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '巨舌症'
MATCH (to) WHERE to.name = '呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '小颌畸形'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '重'),
    r.evidence_level = coalesce(r.evidence_level, '高');



// =====================================

/* Response #25
   Timestamp: 2024-12-19 00:08:46
*/
// 节点更新
MERGE (n:Disease {name: '中央性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '中枢性呼吸暂停伴陈-施呼吸'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '慢性充血性心力衰竭'})
SET 
    n.code = coalesce(n.code, 'CHF'),
    n.description = coalesce(n.description, '心功能不全的一种表现'),
    n.category = coalesce(n.category, '心血管疾病');

MERGE (n:Disease {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '脑血管疾病导致的功能损伤'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常困倦'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或保持睡眠状态'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '中央性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '中央性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '慢性充血性心力衰竭'
MATCH (to) WHERE to.name = '中央性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '中央性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '急性');



// =====================================

/* Response #26
   Timestamp: 2024-12-19 00:08:48
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, 'OSAHS'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '最常见的临床症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸努力增加'})
SET 
    n.description = coalesce(n.description, '绝大多数OSAHS患儿呼吸努力会增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠结构变化'})
SET 
    n.description = coalesce(n.description, '可能影响REM睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: '口呼吸'})
SET 
    n.description = coalesce(n.description, '64%至95%的OSAHS患儿可伴有口呼吸'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '约14%的患儿可出现日间思睡症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '出汗'})
SET 
    n.description = coalesce(n.description, '约50%的OSAHS患儿睡眠时大量出汗'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '遗尿'})
SET 
    n.description = coalesce(n.description, '在进行监测后发现部分患儿出现遗尿'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:NonDrugTreatment {name: '口咽部肌肉训练'})
SET 
    n.description = coalesce(n.description, '通过吹管乐器进行口咽部肌肉训练'),
    n.duration = coalesce(n.duration, '不定'),
    n.frequency = coalesce(n.frequency, '不定'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '吹管乐器');

MERGE (n:NonDrugTreatment {name: '舌下神经刺激'})
SET 
    n.description = coalesce(n.description, '进行上气道肌群训练'),
    n.duration = coalesce(n.duration, '不定'),
    n.frequency = coalesce(n.frequency, '不定'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '刺激装置');

MERGE (n:NonDrugTreatment {name: '经鼻呼气末气道正压通气'})
SET 
    n.description = coalesce(n.description, '能有效降低不同严重度OSAHS患者的AHI'),
    n.duration = coalesce(n.duration, '不定'),
    n.frequency = coalesce(n.frequency, '不定'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, 'nEPAP设备');

MERGE (n:Complication {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, 'OSAHS患者常见的并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '生长发育迟缓'})
SET 
    n.description = coalesce(n.description, 'OSAHS患者可能出现的重要并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '行为认知障碍'})
SET 
    n.description = coalesce(n.description, 'OSAHS儿童常见的症状与并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸努力增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠结构变化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '出汗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '遗尿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '口咽部肌肉训练'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '主要治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '舌下神经刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '经鼻呼气末气道正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '主要治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '生长发育迟缓'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '行为认知障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '肥胖'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '肥胖'
MATCH (to) WHERE to.name = '呼吸努力增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #27
   Timestamp: 2024-12-19 00:08:50
*/
// 节点更新
MERGE (n:Disease {name: '原发性鼾症'})
SET 
    n.description = coalesce(n.description, '以打鼾为主要表现的睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时反复出现鼾声'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '由于呼吸驱动缺乏或异常所致的通气功能障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '婴儿原发性中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '由脑干呼吸中枢发育不成熟引起的睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到异常困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间睡眠片段化'})
SET 
    n.description = coalesce(n.description, '夜间多次觉醒导致睡眠质量降低'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '婴儿原发性中枢性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '婴儿原发性中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '夜间睡眠片段化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #28
   Timestamp: 2024-12-19 00:08:51
*/
// 节点更新
MERGE (n:Disease {name: '复杂性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '初始诊断为OSAHS的患者应用无后备频率的PAP治疗后出现中枢睡眠呼吸暂停或低通气事件'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '睡眠相关低通气综合征'})
SET 
    n.description = coalesce(n.description, '睡眠过程中通气不足，导致睡眠期动脉二氧化碳分压升高'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.description = coalesce(n.description, '以肥胖和日间高碳酸血症为特征'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '先天性中枢性低通气综合征'})
SET 
    n.description = coalesce(n.description, '由于PHOX2B基因突变引起的以自主呼吸中枢调控紊乱为主的神经功能紊乱性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '在白天感到困倦和嗜睡'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡时间延长'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '睡眠过程中频繁觉醒'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡觉时伴随的喉音'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '气短'})
SET 
    n.description = coalesce(n.description, '呼吸急促或困难的感觉'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '轻度呼吸困难'})
SET 
    n.description = coalesce(n.description, '轻微的呼吸困难'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过于困倦'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '复杂性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '复杂性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '复杂性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '复杂性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '复杂性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '气短'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '轻度呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '先天性中枢性低通气综合征'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠相关低通气综合征'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠相关低通气综合征'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '先天性中枢性低通气综合征'
MATCH (to) WHERE to.name = '睡眠相关低通气综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #29
   Timestamp: 2024-12-19 00:08:51
*/
// 节点更新
MERGE (n:Disease {name: '倒班工作睡眠觉醒障碍'});

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '总睡眠时间缩短'})
SET 
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '频繁觉醒'})
SET 
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Examination {name: 'MEQ'})
SET 
    n.description = coalesce(n.description, '昼夜节律适应性评价工具'),
    n.method = coalesce(n.method, '自评问卷'),
    n.requirement = coalesce(n.requirement, '观察结果');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '记录睡眠状态的工具'),
    n.method = coalesce(n.method, '日常记录'),
    n.requirement = coalesce(n.requirement, '连续记录');

MERGE (n:Examination {name: '体动记录仪'})
SET 
    n.description = coalesce(n.description, '监测体动的设备'),
    n.method = coalesce(n.method, '设备监测'),
    n.requirement = coalesce(n.requirement, '佩戴');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测'),
    n.method = coalesce(n.method, '专业睡眠监测'),
    n.requirement = coalesce(n.requirement, '临床使用');

MERGE (n:Disease {name: '非快速眼球运动睡眠相关觉醒障碍'});

MERGE (n:Symptom {name: '意识模糊性觉醒'})
SET 
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡行症'})
SET 
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠潜伏期延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '总睡眠时间缩短'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '频繁觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '体动记录仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = 'MEQ'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '非快速眼球运动睡眠相关觉醒障碍'
MATCH (to) WHERE to.name = '意识模糊性觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '非快速眼球运动睡眠相关觉醒障碍'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '非快速眼球运动睡眠相关觉醒障碍'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '非快速眼球运动睡眠相关觉醒障碍'
MATCH (to) WHERE to.name = '意识模糊性觉醒'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '非快速眼球运动睡眠相关觉醒障碍'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #30
   Timestamp: 2024-12-19 00:08:51
*/
// 节点更新
MERGE (n:Disease {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.code = coalesce(n.code, 'CRSWD'),
    n.description = coalesce(n.description, '因昼夜时间维持与诱导系统变化或内源性昼夜节律与外部环境间不同步引起的睡眠觉醒障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠觉醒时相延迟障碍'})
SET 
    n.code = coalesce(n.code, 'DSWPD'),
    n.description = coalesce(n.description, '患者睡眠觉醒时间通常推迟大于等于2小时，表现为明显的晚上入睡和早上觉醒均延迟'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '非24小时睡眠觉醒节律障碍'})
SET 
    n.code = coalesce(n.code, 'N24SWD'),
    n.description = coalesce(n.description, '睡眠觉醒节律的变化不符合24小时周期'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '整体睡眠觉醒周期紊乱'})
SET 
    n.code = coalesce(n.code, 'ISWRD'),
    n.description = coalesce(n.description, '睡眠觉醒的时间和规律发生不规律'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠困难'})
SET 
    n.description = coalesce(n.description, '入睡困难及维持睡眠的困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间睡眠增多'})
SET 
    n.description = coalesce(n.description, '在白天感到困倦和需要睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '早上比期望时间早醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '日间睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '非24小时睡眠觉醒节律障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '在发病期间');



// =====================================

/* Response #31
   Timestamp: 2024-12-19 00:08:52
*/
// 节点更新
MERGE (n:Disease {name: '特发性睡眠增多'});

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '克莱恩-莱温综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'KLS');

MERGE (n:Disease {name: '睡眠不足综合征'});

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天无法抑制的睡意'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '每天');

MERGE (n:Symptom {name: '睡眠质量差'})
SET 
    n.description = coalesce(n.description, '夜间休息时睡眠不良'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '认知功能障碍'})
SET 
    n.description = coalesce(n.description, '思维、理解力出现问题'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '发作时');

MERGE (n:Symptom {name: '情绪波动'})
SET 
    n.description = coalesce(n.description, '在日间表现出情绪变化'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发作时');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '即使长时间睡眠后依然感到疲惫'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '每天');

MERGE (n:Symptom {name: '饮食异常'})
SET 
    n.description = coalesce(n.description, '过度饮食或食欲减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发作时');

// 关系更新
MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = '睡眠质量差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '克莱恩-莱温综合征'
MATCH (to) WHERE to.name = '认知功能障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '相对较少'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '克莱恩-莱温综合征'
MATCH (to) WHERE to.name = '情绪波动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '克莱恩-莱温综合征'
MATCH (to) WHERE to.name = '饮食异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '克莱恩-莱温综合征'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠不足综合征'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #32
   Timestamp: 2024-12-19 00:08:53
*/
// 节点更新
MERGE (n:Disease {name: '中枢性肺泡低通气综合征'});

MERGE (n:Disease {name: '肥胖低通气综合征'});

// 关系更新
MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '可能'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #33
   Timestamp: 2024-12-19 00:08:53
*/
// 节点更新
MERGE (n:Disease {name: '不规律睡眠觉醒节律障碍'});

MERGE (n:Disease {name: '时差变化睡眠障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'JLD');

MERGE (n:Disease {name: '倒班工作睡眠觉醒障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'SWSWD');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '晚上难以入睡或保持睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天过度犯困'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '夜间容易醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间褪黑激素分泌低'})
SET 
    n.description = coalesce(n.description, '夜间褪黑激素分泌不足，可能影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡时间比较长'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '夜间褪黑激素分泌低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #34
   Timestamp: 2024-12-19 00:08:59
*/
// 节点更新
MERGE (n:Disease {name: '睡眠觉醒时相延迟障碍'});

MERGE (n:Disease {name: '睡眠觉醒时相提前障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'ASWPD');

MERGE (n:Disease {name: '非24小时睡眠觉醒节律障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'N24SWD');

MERGE (n:Disease {name: '不规律睡眠觉醒节律障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'ISWRD');

MERGE (n:Symptom {name: '早醒型失眠'})
SET 
    n.description = coalesce(n.description, '患者主诉早醒，导致睡眠质量差'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '日间过度的嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '精神萎靡'})
SET 
    n.description = coalesce(n.description, '由于睡眠不足导致的精神状态不佳'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '不常见');

MERGE (n:Symptom {name: '下午及晚上思睡'})
SET 
    n.description = coalesce(n.description, '在日间感到困倦或嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '无法顺利入睡或维持睡眠的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间失眠'})
SET 
    n.description = coalesce(n.description, '夜间无法获得稳定的睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '早醒型失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '精神萎靡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠觉醒时相提前障碍'
MATCH (to) WHERE to.name = '下午及晚上思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠觉醒时相提前障碍'
MATCH (to) WHERE to.name = '夜间失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '非24小时睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '早醒型失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '非24小时睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #35
   Timestamp: 2024-12-19 00:09:07
*/
// 节点更新
MERGE (n:Disease {name: '特发性刺痛性头痛'})
SET 
    n.description = coalesce(n.description, '头侧部发生的短暂刺痛的良性综合征,发生于人睡时,但觉醒期间更常见');

MERGE (n:Disease {name: '霹雳头痛'})
SET 
    n.description = coalesce(n.description, '以蛛网膜下腔出血为特征的非常严重的突然发作的头痛,也可由其他原因引起。通常不在人睡时发生。');

MERGE (n:Disease {name: '睡眠性头痛综合征'})
SET 
    n.description = coalesce(n.description, '发生于经常入睡后 4~6 小时醒来的老人,持续30~60分钟,呈弥散性头痛,常伴有恶心,但无自主神经系统症状。');

MERGE (n:Disease {name: '睡眠相关性幻觉'})
SET 
    n.description = coalesce(n.description, '指人睡时或从睡眠中醒来时出现的幻觉体验。');

MERGE (n:Disease {name: '遗尿症'})
SET 
    n.description = coalesce(n.description, '指当生理发育已经超过了能够正常控制膀胱功能的年龄后,睡眠期间的复发性无意识排尿。');

// 关系更新
MATCH (from) WHERE from.name = '特发性刺痛性头痛'
MATCH (to) WHERE to.name = '睡眠性头痛综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '霹雳头痛'
MATCH (to) WHERE to.name = '特发性刺痛性头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '睡眠性头痛综合征'
MATCH (to) WHERE to.name = '遗尿症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关性幻觉'
MATCH (to) WHERE to.name = '遗尿症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '遗尿症'
MATCH (to) WHERE to.name = '睡眠相关性幻觉'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #36
   Timestamp: 2024-12-19 00:09:08
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '快速眼球运动睡眠期行为紊乱'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.short_name = coalesce(n.short_name, 'EDS');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #37
   Timestamp: 2024-12-19 00:09:10
*/
// 节点更新
MERGE (n:Disease {name: '酒精使用障碍'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '咖啡因相关性障碍'});

MERGE (n:Disease {name: '慢性阻塞性肺病'})
SET 
    n.short_name = coalesce(n.short_name, 'COPD');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

// 关系更新
MATCH (from) WHERE from.name = '酒精使用障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #38
   Timestamp: 2024-12-19 00:09:13
*/
// 节点更新
MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.description = coalesce(n.description, '周期性肢体运动障碍'),
    n.category = coalesce(n.category, '睡眠运动障碍');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '不宁腿综合征'),
    n.category = coalesce(n.category, '睡眠运动障碍');

MERGE (n:Symptom {name: '腿痉挛'})
SET 
    n.description = coalesce(n.description, '突发的下肢肌肉不自主强直收缩伴疼痛'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '腿疼挛'})
SET 
    n.description = coalesce(n.description, '腿部肌肉强烈不自主收缩'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '肌阵挛抽动'})
SET 
    n.description = coalesce(n.description, '运动障碍'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '根据需要');

// 关系更新
MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = '腿痉挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = '腿疼挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿疼挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = '肌阵挛抽动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #39
   Timestamp: 2024-12-19 00:09:14
*/
// 节点更新
MERGE (n:Disease {name: '偏头痛'});

MERGE (n:Disease {name: '丛集性头痛'});

MERGE (n:Disease {name: '慢性阵发性半侧头痛'});

MERGE (n:Disease {name: '睡眠性头痛'});

MERGE (n:Disease {name: '觉醒头痛'});

MERGE (n:Disease {name: '家族性致死性失眠症'})
SET 
    n.code = coalesce(n.code, 'FFI');

MERGE (n:Disease {name: '散发性致死性失眠症'})
SET 
    n.code = coalesce(n.code, 'SFI');

MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '头部疼痛，可能表现为脉搏般的疼痛'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或维持睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '丛集性头痛'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性阵发性半侧头痛'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠性头痛'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '觉醒头痛'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '家族性致死性失眠症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '散发性致死性失眠症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '家族性致死性失眠症'
MATCH (to) WHERE to.name = '丛集性头痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.99),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '散发性致死性失眠症'
MATCH (to) WHERE to.name = '觉醒头痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '家族性致死性失眠症'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '散发性致死性失眠症'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #40
   Timestamp: 2024-12-19 00:09:15
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, 'OSA'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, 'CSA'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '心力衰竭'})
SET 
    n.description = coalesce(n.description, '心脏无法有效地泵血的疾病'),
    n.category = coalesce(n.category, '心脏疾病');

MERGE (n:Symptom {name: '夜间端坐呼吸'})
SET 
    n.description = coalesce(n.description, '患者夜间需要坐起来才能呼吸'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '阵发性呼吸困难'})
SET 
    n.description = coalesce(n.description, '短时间内出现强烈的呼吸困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '咳粉红色泡沫样痰'})
SET 
    n.description = coalesce(n.description, '咳出带有气泡的粉色痰液'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '夜间容易醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '常常感到疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中反复的呼吸暂停'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '夜间端坐呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '阵发性呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '咳粉红色泡沫样痰'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '咳粉红色泡沫样痰'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

/* Response #41
   Timestamp: 2024-12-19 00:09:15
*/
// 节点更新
MERGE (n:Disease {name: '重性抑郁障碍'})
SET 
    n.code = coalesce(n.code, 'MDD'),
    n.description = coalesce(n.description, '重性抑郁障碍是一种常见的情绪障碍，主要表现为显著而持久的心境低落。'),
    n.category = coalesce(n.category, '抑郁障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠维持困难或入睡困难，可能伴随早醒或睡眠未恢复感觉。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠过多'})
SET 
    n.description = coalesce(n.description, '患者几乎每天的睡眠时间超过9小时，尽管夜间睡眠已达到标准，但白天仍会出现反复睡眠发作。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较常见');

MERGE (n:Symptom {name: '未恢复性睡眠'})
SET 
    n.description = coalesce(n.description, '即便睡眠时间充足，患者仍感到未能恢复精力。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多梦或噩梦'})
SET 
    n.description = coalesce(n.description, '患者经常梦到焦虑或不愉快的内容，可能伴随夜惊。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '评估睡眠结构以及睡眠潜伏期，旨在诊断各种睡眠障碍。'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在实验室环境下进行');

MERGE (n:NonDrugTreatment {name: '认知行为治疗'})
SET 
    n.description = coalesce(n.description, '通过改变负面思想和行为模式来改善睡眠和情绪。'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '睡眠卫生指导'})
SET 
    n.description = coalesce(n.description, '教育患者改善睡眠环境和生活习惯，以增加睡眠质量。'),
    n.duration = coalesce(n.duration, '持续'),
    n.frequency = coalesce(n.frequency, '定期'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Complication {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '可能与重性抑郁障碍并发，进一步影响患者的睡眠质量。'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '睡眠过多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '未恢复性睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '多梦或噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '睡眠卫生指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #42
   Timestamp: 2024-12-19 00:09:16
*/
// 节点更新
MERGE (n:Disease {name: '致死性失眠'});

MERGE (n:Disease {name: '广泛性焦虑障碍'});

MERGE (n:Disease {name: '惊恐障碍'});

MERGE (n:Disease {name: '社交焦虑障碍'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '人睡困难、夜间觉醒次数增多、深睡眠减少、早醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间惊恐发作'})
SET 
    n.description = coalesce(n.description, '突然惊醒并伴有强烈恐惧感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:DrugTreatment {name: '苯二氮草类药物'})
SET 
    n.description = coalesce(n.description, '常用的抗焦虑药物'),
    n.dosage = coalesce(n.dosage, '根据具体情况'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度呼吸衰竭');

MERGE (n:NonDrugTreatment {name: '认知行为治疗'})
SET 
    n.description = coalesce(n.description, '对广泛性焦虑障碍患者的失眠症状有显著疗效'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据病情需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '惊恐障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '社交焦虑障碍'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '非药物治疗');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '夜间惊恐发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #43
   Timestamp: 2024-12-19 00:09:18
*/
// 节点更新
MERGE (n:Disease {name: '卒中'})
SET 
    n.description = coalesce(n.description, '卒中的临床表现与病理机制'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA'),
    n.description = coalesce(n.description, '伴随睡眠呼吸障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Symptom {name: '习惯性打鼾'})
SET 
    n.description = coalesce(n.description, '几乎总是打鼾'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '慢性SDB和习惯性打鼾伴有高血压'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:NonDrugTreatment {name: 'CPAP治疗'})
SET 
    n.description = coalesce(n.description, '连续正压通气治疗'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或睡眠维持困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天睡觉过多，影响日常生活'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '体位干预治疗'})
SET 
    n.description = coalesce(n.description, '睡眠体位指导以减少OSA'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.description = coalesce(n.description, '一种神经变性病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '高');

// 关系更新
MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '习惯性打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'CPAP治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性治疗');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '体位干预治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

/* Response #44
   Timestamp: 2024-12-19 00:09:19
*/
// 节点更新
MERGE (n:Disease {name: '纤维肌痛'});

MERGE (n:Disease {name: '短睡眠者'});

MERGE (n:Disease {name: '长睡眠者'});

MERGE (n:Disease {name: '梦语症'});

MERGE (n:Disease {name: '睡眠惊跳'});

MERGE (n:Disease {name: '睡眠期交替性腿部肌肉运动'});

MERGE (n:Disease {name: '频繁局部肌阵挛'});

MERGE (n:Symptom {name: '慢性疼痛'})
SET 
    n.description = coalesce(n.description, '持续的疼痛状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '影响睡眠的各种表现'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '疲劳症状'})
SET 
    n.description = coalesce(n.description, '身体和心理上的疲劳'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '认知行为疗法'})
SET 
    n.description = coalesce(n.description, '通过改变思维和行为来改善睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '放松疗法'})
SET 
    n.description = coalesce(n.description, '帮助放松身体和心理以改善睡眠'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '物理治疗'})
SET 
    n.description = coalesce(n.description, '通过物理方法改善健康状况'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '慢性疼痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '疲劳症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '放松疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '物理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '短睡眠者'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '长睡眠者'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '梦语症'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠惊跳'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠期交替性腿部肌肉运动'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '频繁局部肌阵挛'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #45
   Timestamp: 2024-12-19 00:09:19
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '反复发作的睡眠相关的言语和复杂运动行为'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '孤立性睡瘫症'})
SET 
    n.description = coalesce(n.description, '意识的觉醒和肌肉失张力持续存在的一种状态'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '梦魔障碍'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期间的恐怖不安梦境体验'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '头部爆震声综合征'})
SET 
    n.description = coalesce(n.description, '夜间人睡或醒来时突然出现响亮声音或头部猛烈的爆炸感'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Symptom {name: '肌张力增高'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期肌肉未能正常弛缓'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '恐惧感'})
SET 
    n.description = coalesce(n.description, '发作过程中感到恐惧'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '意识模糊'})
SET 
    n.description = coalesce(n.description, '无法快速觉醒,意识处于模糊状态'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '声音感'})
SET 
    n.description = coalesce(n.description, '突然的响亮声音体验'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '不定');

// 关系更新
MATCH (from) WHERE from.name = '肌张力增高'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '恐惧感'
MATCH (to) WHERE to.name = '梦魔障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '意识模糊'
MATCH (to) WHERE to.name = '孤立性睡瘫症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '声音感'
MATCH (to) WHERE to.name = '头部爆震声综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '不定'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #46
   Timestamp: 2024-12-19 00:09:23
*/
// 节点更新
MERGE (n:Disease {name: '睡惊症'});

MERGE (n:Disease {name: '睡行症'});

MERGE (n:Disease {name: 'REM睡眠期行为紊乱'});

MERGE (n:Disease {name: '睡眠相关性癫痫'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'});

MERGE (n:Disease {name: '夜间进食障碍综合征'});

MERGE (n:Disease {name: '意识模糊性觉醒'});

MERGE (n:Symptom {name: '尖叫'});

MERGE (n:Symptom {name: '强烈恐惧'});

MERGE (n:Symptom {name: '极端焦虑'});

MERGE (n:Symptom {name: '明显自主神经症状'});

MERGE (n:Symptom {name: '肌张力弛缓状态消失'});

MERGE (n:Symptom {name: '梦境相关行为'});

MERGE (n:Symptom {name: '意识完全清醒'});

MERGE (n:Symptom {name: '意识障碍'});

MERGE (n:Symptom {name: '行为复杂'});

MERGE (n:Symptom {name: '暴力行为'});

// 关系更新
MATCH (from) WHERE from.name = '尖叫'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '强烈恐惧'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '极端焦虑'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '明显自主神经症状'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '肌张力弛缓状态消失'
MATCH (to) WHERE to.name = 'REM睡眠期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '梦境相关行为'
MATCH (to) WHERE to.name = 'REM睡眠期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '意识完全清醒'
MATCH (to) WHERE to.name = '夜间进食障碍综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '意识障碍'
MATCH (to) WHERE to.name = '睡眠相关性癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '行为复杂'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '暴力行为'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = 'REM睡眠期行为紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡行症'
MATCH (to) WHERE to.name = '睡眠相关性癫痫'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = 'REM睡眠期行为紊乱'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = '睡眠相关性癫痫'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡行症'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = 'REM睡眠期行为紊乱'
MATCH (to) WHERE to.name = '夜间进食障碍综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #47
   Timestamp: 2024-12-19 00:09:24
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Symptom {name: '腿部不适'});

MERGE (n:Symptom {name: '强烈想活动腿部'});

MERGE (n:Symptom {name: '睡眠障碍'});

MERGE (n:Symptom {name: '情绪低落'});

MERGE (n:Symptom {name: '担心'});

MERGE (n:Disease {name: '周期性肢体运动障碍'});

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '强烈想活动腿部'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '情绪低落'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '担心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #48
   Timestamp: 2024-12-19 00:09:26
*/
// 节点更新
MERGE (n:Disease {name: '精神分裂症'})
SET 
    n.description = coalesce(n.description, '一组病因未明的精神疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '精神分裂症相关性睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与精神分裂症相关的睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠时间延长，睡眠质量差'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠与觉醒颠倒'})
SET 
    n.description = coalesce(n.description, '白天睡觉，晚上失眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '片段睡眠'})
SET 
    n.description = coalesce(n.description, '夜间睡眠和觉醒频繁，无法维持睡眠连续性'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '精神分裂症相关性睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '睡眠与觉醒颠倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '片段睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '精神分裂症相关性睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #49
   Timestamp: 2024-12-19 00:09:31
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '癫痫'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA');

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '睡眠相关性头痛'});

MERGE (n:Symptom {name: '夜间觉醒'})
SET 
    n.description = coalesce(n.description, '患者在夜间频繁醒来'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天无法控制的困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠片段化'})
SET 
    n.description = coalesce(n.description, '由于频繁觉醒导致的睡眠不连续'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '发作后患者意识模糊'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶见');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '夜间觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠相关性头痛'
MATCH (to) WHERE to.name = '夜间觉醒'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '偶见');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠片段化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #50
   Timestamp: 2024-12-19 00:09:35
*/
// 节点更新
MERGE (n:Disease {name: '胃食管反流'})
SET 
    n.description = coalesce(n.description, '胃食管反流病是一种因胃内容物反流入食管而引起的一组临床症状。'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠是指睡眠时间不足或睡眠质量差，从而影响白天的功能和生活质量。'),
    n.severity = coalesce(n.severity, '轻到重');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, 'OSA是一种睡眠呼吸障碍，特征是睡眠时反复出现呼吸暂停。'),
    n.severity = coalesce(n.severity, '中到重');

MERGE (n:Symptom {name: '反复呕吐'})
SET 
    n.description = coalesce(n.description, '不明原因导致的频繁呕吐'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '咽下困难'})
SET 
    n.description = coalesce(n.description, '因反流引起的吞咽不适'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '慢性呼吸道感染'})
SET 
    n.description = coalesce(n.description, '呼吸道经常出现感染的状态'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '难治性哮喘'})
SET 
    n.description = coalesce(n.description, '对常规哮喘治疗反应不佳'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '生长发育迟缓'})
SET 
    n.description = coalesce(n.description, '生长速度未达预期'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '室息'})
SET 
    n.description = coalesce(n.description, '睡眠中出现的呼吸暂停现象'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多种类型的睡眠障碍'})
SET 
    n.description = coalesce(n.description, '多种不同的睡眠相关问题'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲乏无力'})
SET 
    n.description = coalesce(n.description, '缺乏精力和力量感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '焦虑易怒'})
SET 
    n.description = coalesce(n.description, '对环境的过度反应'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '影响正常睡眠的状态'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时伴随的异常呼吸声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '睡眠时产生频繁且生动的梦境'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '睡眠期周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '睡眠过程中出现的肢体不自主运动'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '反复呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '咽下困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '慢性呼吸道感染'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '难治性哮喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '生长发育迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '室息'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '多种类型的睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #51
   Timestamp: 2024-12-19 00:10:22
*/
// 节点更新
MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.code = coalesce(n.code, 'COPD'),
    n.description = coalesce(n.description, '一种以气流受限为特征的慢性肺部疾病'),
    n.category = coalesce(n.category, '呼吸系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '哮喘'})
SET 
    n.code = coalesce(n.code, 'AST'),
    n.description = coalesce(n.description, '气道的慢性炎性疾病，伴有气流受限'),
    n.category = coalesce(n.category, '呼吸系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '心力衰竭'})
SET 
    n.code = coalesce(n.code, 'HF'),
    n.description = coalesce(n.description, '心脏无法有效泵送血液的状态'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'INS'),
    n.description = coalesce(n.description, '一种常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '低氧血症'})
SET 
    n.description = coalesce(n.description, '血液中氧气水平低于正常范围'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来后感到头部异常疼痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '疲劳感'})
SET 
    n.description = coalesce(n.description, '一种常见的症状表现为精力不足'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '气短'})
SET 
    n.description = coalesce(n.description, '呼吸困难，感觉呼吸不够'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '胸闷'})
SET 
    n.description = coalesce(n.description, '感觉胸部有压力或紧迫感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '夜间咳嗽'})
SET 
    n.description = coalesce(n.description, '睡眠时出现的咳嗽'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '氧疗'})
SET 
    n.description = coalesce(n.description, '通过呼吸氧气改善低氧血症的治疗'),
    n.duration = coalesce(n.duration, '根据病情'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '高碳酸血症'),
    n.equipment = coalesce(n.equipment, '氧气设备');

MERGE (n:NonDrugTreatment {name: '呼吸肌锻炼'})
SET 
    n.description = coalesce(n.description, '增强呼吸肌肉的运动'),
    n.duration = coalesce(n.duration, '10周'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '抗胆碱能药物'})
SET 
    n.description = coalesce(n.description, '用于减轻气流阻塞的药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '4周'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '重度喘息');

MERGE (n:DrugTreatment {name: 'β-受体激动剂'})
SET 
    n.description = coalesce(n.description, '用于放松气道并改善气流的药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '按需使用'),
    n.route = coalesce(n.route, '吸入'),
    n.contraindication = coalesce(n.contraindication, '心律失常');

MERGE (n:DrugTreatment {name: '茶碱'})
SET 
    n.description = coalesce(n.description, '支气管扩张剂，改善呼吸功能'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '胃肠出血');

MERGE (n:Complication {name: '呼吸衰竭'})
SET 
    n.description = coalesce(n.description, '由于通气或氧合作用障碍导致的严重状态'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '心律失常'})
SET 
    n.description = coalesce(n.description, '心脏的节律、频率或传导的异常变化'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '低氧血症'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '晨起头痛'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '疲劳感'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '气短'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '胸闷'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间咳嗽'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '氧疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '呼吸肌锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '抗胆碱能药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = 'β-受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '茶碱'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '呼吸衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '哮喘'
MATCH (to) WHERE to.name = '心律失常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

