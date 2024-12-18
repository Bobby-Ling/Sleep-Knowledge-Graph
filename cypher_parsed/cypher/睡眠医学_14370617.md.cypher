// File: 睡眠医学_14370617.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 52

/* Response #1
   Timestamp: 2024-12-18 09:55:35
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停综合征'});

MERGE (n:Disease {name: '心理障碍'});

MERGE (n:Disease {name: '胃食管反流'});

MERGE (n:Disease {name: '贫血'});

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '心理障碍'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '贫血'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 09:55:36
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'});

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到疲倦或困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '对睡眠时间及质量的不满足'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '身体和精神上的疲乏感'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:NonDrugTreatment {name: '多次睡眠潜伏期试验'})
SET 
    n.description = coalesce(n.description, '评估日间思睡程度的客观标准方法'),
    n.duration = coalesce(n.duration, '各小睡间隔'),
    n.frequency = coalesce(n.frequency, '4~5次'),
    n.contraindication = coalesce(n.contraindication, '不适用于常规评估失眠');

MERGE (n:Complication {name: '日间功能障碍'})
SET 
    n.description = coalesce(n.description, '日间活动影响'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:RiskFactor {name: '情绪因素'})
SET 
    n.description = coalesce(n.description, '抑郁和焦虑情绪'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '药物因素'})
SET 
    n.description = coalesce(n.description, '兴奋剂滥用'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '多次睡眠潜伏期试验'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '诊断与评估');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多次睡眠潜伏期试验'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '确诊与治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间功能障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间功能障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '情绪因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '药物因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '支持');



// =====================================

/* Response #3
   Timestamp: 2024-12-18 09:55:37
*/
// 节点更新
MERGE (n:Disease {name: '睡眠发育特征'});

MERGE (n:Symptom {name: '不典型电活动状态'});

MERGE (n:Symptom {name: '高幅慢波的脑电活动'});

MERGE (n:Symptom {name: 'REM睡眠'});

MERGE (n:Symptom {name: 'NREM睡眠'});

MERGE (n:Symptom {name: '做梦'});

MERGE (n:Symptom {name: '睡眠相关性勃起'});

MERGE (n:Disease {name: '健康老年人'});

MERGE (n:Disease {name: '新生儿'});

MERGE (n:Disease {name: '幼儿'});

MERGE (n:Disease {name: '儿童'});

MERGE (n:Disease {name: '男性'});

MERGE (n:Disease {name: '女性'});

MERGE (n:Disease {name: '发作性睡病'});

// 关系更新
MATCH (from) WHERE from.name = '新生儿'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '发育期');

MATCH (from) WHERE from.name = '幼儿'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '发育期');

MATCH (from) WHERE from.name = '儿童'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '发育期');

MATCH (from) WHERE from.name = '健康老年人'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '老年');

MATCH (from) WHERE from.name = '男性'
MATCH (to) WHERE to.name = '睡眠相关性勃起'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '生理状态');

MATCH (from) WHERE from.name = '女性'
MATCH (to) WHERE to.name = '睡眠相关性勃起'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '生理状态');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '疾病状态');

MATCH (from) WHERE from.name = '不典型电活动状态'
MATCH (to) WHERE to.name = '新生儿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '高幅慢波的脑电活动'
MATCH (to) WHERE to.name = '幼儿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = 'REM睡眠'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '做梦'
MATCH (to) WHERE to.name = '睡眠发育特征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #4
   Timestamp: 2024-12-18 09:55:37
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种导致患者有强烈的对运动的迫切感并伴随不适感的病症。');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种影响运动控制的神经系统疾病，主要特征包括颤抖、僵硬、运动缓慢和不稳定的姿势。');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '一种令人不适的感觉，常在胃部。');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '胃内容物通过口腔排出体外的动作。');

MERGE (n:Symptom {name: '直立性低血压'})
SET 
    n.description = coalesce(n.description, '由体位变化引起的血压暂时降低。');

MERGE (n:Symptom {name: '运动功能障碍'})
SET 
    n.description = coalesce(n.description, '影响个人进行日常活动的运动能力。');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.description = coalesce(n.description, '治疗帕金森病及不宁腿综合征的药物，属于多巴胺受体激动剂。');

MERGE (n:Treatment {name: '罗替戈汀'})
SET 
    n.description = coalesce(n.description, '透皮药物，用于治疗帕金森病和不宁腿综合征。');

MERGE (n:Complication {name: '多巴胺过量'})
SET 
    n.description = coalesce(n.description, '由于多巴胺剂量过高引起的副作用，可能出现幻觉和其他症状。');

MERGE (n:RiskFactor {name: '铁缺乏'})
SET 
    n.description = coalesce(n.description, '不宁腿综合征的病理生理机制之一，缺乏铁可能加重症状。');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '直立性低血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '运动功能障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '罗替戈汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '全部');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '多巴胺过量'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '随治疗进展');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '铁缺乏'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '临床支持');



// =====================================

/* Response #5
   Timestamp: 2024-12-18 09:55:38
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '腿部不适感和不自主运动，导致夜间睡眠中断'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '睡眠期间呼吸反复暂停'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.code = coalesce(n.code, 'PLMD'),
    n.description = coalesce(n.description, '周期性腿部或手臂运动，常干扰睡眠'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Gene {name: 'Per2'})
SET 
    n.description = coalesce(n.description, '与昼夜节律相关的基因，突变影响生物钟');

MERGE (n:Gene {name: 'hDEC2-P385R'})
SET 
    n.description = coalesce(n.description, '影响睡眠觉醒周期的基因突变');

MERGE (n:Gene {name: 'Clock'})
SET 
    n.description = coalesce(n.description, '核心昼夜节律基因，突变可导致觉醒周期异常');

MERGE (n:Gene {name: 'CK1e'})
SET 
    n.description = coalesce(n.description, '与昼夜节律调控相关的基因');

MERGE (n:Gene {name: 'NPAS2'})
SET 
    n.description = coalesce(n.description, '影响昼夜节律的特定基因');

MERGE (n:Gene {name: 'Acads'})
SET 
    n.description = coalesce(n.description, '与睡眠EEG的遗传性相关的基因');

MERGE (n:Gene {name: 'hypocretin/orexin'})
SET 
    n.description = coalesce(n.description, '与发作性睡病相关的神经肽系统');

MERGE (n:Gene {name: 'HDC'})
SET 
    n.description = coalesce(n.description, '与觉醒相关的组胺脱羧酶基因');

MERGE (n:Gene {name: '5-羟色胺受体'})
SET 
    n.description = coalesce(n.description, '与觉醒和睡眠相关的重要受体');

MERGE (n:Gene {name: 'GABA_A受体'})
SET 
    n.description = coalesce(n.description, '促进睡眠的重要信号');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'Per2'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'hDEC2-P385R'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = 'Clock'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'Per2'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = 'hDEC2-P385R'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = 'Clock'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '紧急'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = 'CK1e'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = 'NPAS2'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '观察');

MATCH (from) WHERE from.name = 'Acads'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '研究');

MATCH (from) WHERE from.name = 'hypocretin/orexin'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = 'HDC'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = '5-羟色胺受体'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '观察');

MATCH (from) WHERE from.name = 'GABA_A受体'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '紧急'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #6
   Timestamp: 2024-12-18 09:55:38
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.code = coalesce(n.code, 'SDB'),
    n.description = coalesce(n.description, '以睡眠期呼吸节律异常和通气异常为主要特征的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '睡眠时上气道反复塌陷、阻塞引起呼吸暂停和低通气'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'CSAS'),
    n.description = coalesce(n.description, '一种神经基础的睡眠期呼吸暂停'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '睡眠相关的低通气症'})
SET 
    n.code = coalesce(n.code, 'SPLD'),
    n.description = coalesce(n.description, '睡眠期通气不足引起的症状'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '睡眠相关的低氧血症'})
SET 
    n.code = coalesce(n.code, 'SRH'),
    n.description = coalesce(n.description, '睡眠期间由于呼吸异常导致的低氧症状'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '原发性鼾症'})
SET 
    n.code = coalesce(n.code, 'PS'),
    n.description = coalesce(n.description, '一种非器质性的打鼾症状'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '夜间呻吟'})
SET 
    n.code = coalesce(n.code, 'NS'),
    n.description = coalesce(n.description, '睡眠中发生的呻吟声'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Symptom {name: '打鼾'});

MERGE (n:Symptom {name: '日间思睡'});

MERGE (n:Symptom {name: '注意力不集中'});

MERGE (n:Symptom {name: '情绪障碍'});

MERGE (n:Symptom {name: '低氧血症'});

MERGE (n:Symptom {name: '焦虑'});

MERGE (n:Symptom {name: '睡眠结构紊乱'});

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '诊断睡眠呼吸障碍的金标准'),
    n.method = coalesce(n.method, '多导睡眠图'),
    n.requirement = coalesce(n.requirement, '需要医院进行');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠相关的低通气症'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠相关的低氧血症'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '夜间呻吟'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.severity = coalesce(r.severity, '重'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.severity = coalesce(r.severity, '重'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '注意力不集中'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.severity = coalesce(r.severity, '重'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '情绪障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.severity = coalesce(r.severity, '中'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '低氧血症'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.severity = coalesce(r.severity, '重'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.severity = coalesce(r.severity, '中'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '睡眠结构紊乱'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.severity = coalesce(r.severity, '中'),
    r.frequency = coalesce(r.frequency, '常见');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #7
   Timestamp: 2024-12-18 09:55:38
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, 'CPAP治疗能够有效减少睡眠呼吸暂停及低通气事件的发生'),
    n.category = coalesce(n.category, '呼吸疾病'),
    n.severity = coalesce(n.severity, '中重度');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间出现呼吸中断'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '多次');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天发困，常常想要睡觉'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '思维能力、记忆力减退'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '高血压'})
SET 
    n.description = coalesce(n.description, '血压高于正常参考范围'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Complication {name: '脑卒中'})
SET 
    n.description = coalesce(n.description, '大脑供血不足导致的神经功能障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Complication {name: '冠心病'})
SET 
    n.description = coalesce(n.description, '冠状动脉供血不足导致的心脏疾病'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Complication {name: '心律失常'})
SET 
    n.description = coalesce(n.description, '心脏跳动不规律'),
    n.severity = coalesce(n.severity, '重');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '心律失常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '认知障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '高血压'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');



// =====================================

/* Response #8
   Timestamp: 2024-12-18 09:55:38
*/
// 节点更新
MERGE (n:Disease {name: 'NREM睡眠'})
SET 
    n.description = coalesce(n.description, '非快速眼动睡眠，主要包括不同的睡眠阶段'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: 'REM睡眠'})
SET 
    n.description = coalesce(n.description, '快速眼动睡眠，伴随快速眼球运动和梦境'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '致死性家族失眠症'})
SET 
    n.description = coalesce(n.description, '罕见的遗传性睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '由于多种原因，个体未能获得足够的睡眠'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: 'REM睡眠减少'})
SET 
    n.description = coalesce(n.description, 'REM睡眠阶段的减少，可能影响记忆和情绪'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Treatment {name: '催眠药物'})
SET 
    n.description = coalesce(n.description, '用于促进睡眠的药物'),
    n.effectiveness = coalesce(n.effectiveness, '0.7'),
    n.priority = coalesce(n.priority, '高');

MERGE (n:Treatment {name: '认知行为疗法'})
SET 
    n.description = coalesce(n.description, '心理治疗方法，用于改善睡眠质量'),
    n.effectiveness = coalesce(n.effectiveness, '0.75'),
    n.priority = coalesce(n.priority, '中');

MERGE (n:Complication {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与睡眠不足或质量下降相关的并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '情绪紊乱'})
SET 
    n.description = coalesce(n.description, '由于睡眠质量差引起的情绪问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '记录睡眠期间生理数据的检查'),
    n.method = coalesce(n.method, '多导电极监测'),
    n.requirement = coalesce(n.requirement, '无特殊要求');

MERGE (n:Examination {name: '脑电图'})
SET 
    n.description = coalesce(n.description, '记录脑电活动，评估睡眠阶段'),
    n.method = coalesce(n.method, '使用电极记录脑电'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '睡眠剥夺'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM睡眠'
MATCH (to) WHERE to.name = 'REM睡眠减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '催眠药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高');

MATCH (from) WHERE from.name = 'REM睡眠'
MATCH (to) WHERE to.name = '认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '情绪紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = 'REM睡眠'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = 'REM睡眠'
MATCH (to) WHERE to.name = '脑电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #9
   Timestamp: 2024-12-18 09:55:39
*/
// 节点更新
MERGE (n:Disease {name: '短期失眠障碍'})
SET 
    n.code = coalesce(n.code, 'STID'),
    n.description = coalesce(n.description, '短期睡眠起始和维持困难，并导致睡眠不满足感'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '人睡困难'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '夜间醒来后再人睡困难'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '日间功能损害'})
SET 
    n.description = coalesce(n.description, '睡眠紊乱和相关的日间功能损害症状'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Complication {name: '精神疾病'})
SET 
    n.description = coalesce(n.description, '可能与精神、内科疾病或物质使用等共病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '部分患者可能逐步发展为慢性的失眠形式，最终演变为CID'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '疲劳或全身不适感'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '注意力损害'})
SET 
    n.description = coalesce(n.description, '注意力不集中或记忆障碍'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '情绪紊乱'})
SET 
    n.description = coalesce(n.description, '情绪紊乱、烦躁'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '日间瞌睡'})
SET 
    n.description = coalesce(n.description, '显著日间瞌睡'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Disease {name: '失眠合并抑郁障碍'})
SET 
    n.code = coalesce(n.code, 'CID'),
    n.description = coalesce(n.description, '失眠可能与抑郁障碍有关'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '抑郁障碍'})
SET 
    n.description = coalesce(n.description, '失眠与抑郁障碍相关'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '精神疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '持续时间不定');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '时间不定');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '睡眠起始困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '日间功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '注意力损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '情绪紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '日间瞌睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '抑郁障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠合并抑郁障碍'
MATCH (to) WHERE to.name = '短期失眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #10
   Timestamp: 2024-12-18 09:55:39
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种导致患者在静止时感到不适的疾病，通常会伴随腿部的强烈冲动，使他们要移动腿部。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻至中');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'Narcolepsia'),
    n.description = coalesce(n.description, '一种发生在白天的睡眠失调，会导致患者不由自主地入睡。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中至重');

MERGE (n:Disease {name: '猝倒症'})
SET 
    n.code = coalesce(n.code, 'Cataplexy'),
    n.description = coalesce(n.description, '一种突发的肌肉无力，可以导致患者完全失去意识。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见的睡眠障碍，特点是反复的呼吸暂停。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中至重');

MERGE (n:Disease {name: 'Pickwick综合征'})
SET 
    n.code = coalesce(n.code, 'Pickwick Syndrome'),
    n.description = coalesce(n.description, '由过度肥胖和睡眠呼吸暂停引起的疾病，通常伴有日间思睡。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中至重');

MERGE (n:Disease {name: '快速眼球运动睡眠期行为紊乱'})
SET 
    n.code = coalesce(n.code, 'RBD'),
    n.description = coalesce(n.description, '在REM睡眠期发生的异常行为，可能与神经变性疾病相关。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '神经系统变性疾病'})
SET 
    n.code = coalesce(n.code, 'Neurodegenerative Diseases'),
    n.description = coalesce(n.description, '一类导致神经细胞逐渐退化的疾病，如帕金森病和阿尔茨海默病。'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'Insomnia'),
    n.description = coalesce(n.description, '一种影响睡眠质量和数量的状况，能够导致日间疲劳。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻至重');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '白天过度嗜睡，患者在不适当的场合会入睡。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '过度肥胖'})
SET 
    n.description = coalesce(n.description, '体重显著超出标准范围，通常伴随着健康问题。'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '红细胞增多'})
SET 
    n.description = coalesce(n.description, '血液中红细胞数量增加，可能导致血栓形成风险。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '肺泡通气不足'})
SET 
    n.description = coalesce(n.description, '肺泡无法进行有效的气体交换，造成缺氧。'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:DrugTreatment {name: '水合氯醛'})
SET 
    n.description = coalesce(n.description, '一种早期催眠药物，用于治疗失眠。'),
    n.dosage = coalesce(n.dosage, '剂量因人而异'),
    n.frequency = coalesce(n.frequency, '依需求'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对催眠药过敏');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '过度肥胖'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = 'Pickwick综合征'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '红细胞增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '肺泡通气不足'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '水合氯醛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '水合氯醛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '神经系统变性疾病'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '中期');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'Pickwick综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #11
   Timestamp: 2024-12-18 09:55:41
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠障碍'})
SET 
    n.description = coalesce(n.description, '指频繁而持续的睡眠起始和维持困难, 导致个体对于睡眠时间或质量不满足, 并存在白天觉醒期间的功能受损'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '入睡困难'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '夜间醒来再难入睡'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比期望时间过早醒来'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间功能损害'})
SET 
    n.description = coalesce(n.description, '日间的疲劳、注意力不集中'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间瞌睡'})
SET 
    n.description = coalesce(n.description, '白天过度嗜睡'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '心理压力'})
SET 
    n.description = coalesce(n.description, '受压力的情绪波动'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Examination {name: '夜间多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '评估睡眠潜伏期和觉醒时间'),
    n.method = coalesce(n.method, '记录睡眠状态'),
    n.requirement = coalesce(n.requirement, '需在特定环境中进行');

MERGE (n:Complication {name: '伴随抑郁症状'})
SET 
    n.description = coalesce(n.description, '可能出现抑郁与焦虑症状'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '睡眠起始困难'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠维持困难'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间功能损害'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间瞌睡'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '心理压力'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '夜间多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '伴随抑郁症状'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #12
   Timestamp: 2024-12-18 09:55:41
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '肥胖等因素导致的睡眠时呼吸暂停或低通气，伴随多系统损害的疾病。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.code = coalesce(n.code, 'Obesity'),
    n.description = coalesce(n.description, '体重过重，BMI超出正常范围的状态。'),
    n.category = coalesce(n.category, '代谢疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:RiskFactor {name: '超重'})
SET 
    n.description = coalesce(n.description, '体重超出正常范围的状态，增大OSAHS患病风险。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '性别因素'})
SET 
    n.description = coalesce(n.description, '男性较女性容易患上OSAHS。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '年龄因素'})
SET 
    n.description = coalesce(n.description, '年龄增长使得呼吸道结构和功能发生改变，影响OSAHS的发生。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '体位因素'})
SET 
    n.description = coalesce(n.description, '睡眠时体位影响上呼吸道的结构，影响气道阻力与塌陷性。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '鼻腔阻力'})
SET 
    n.description = coalesce(n.description, '鼻腔阻力增高可导致呼吸困难与咽腔塌陷。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '酗酒'})
SET 
    n.description = coalesce(n.description, '酒精抑制中枢神经系统，可能加重OSAHS。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '吸烟'})
SET 
    n.description = coalesce(n.description, '吸烟可影响气道健康，增加OSAHS的风险。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠期间发生的呼吸中断或低通气现象。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠中发出的呼噜声，常伴随OSAHS。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '评估睡眠质量及呼吸状况的检查。'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '需在睡眠中心进行');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '与OSAHS相关的常见并发症之一。'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '心脏病'})
SET 
    n.description = coalesce(n.description, 'OSAHS患者常伴发心血管疾病。'),
    n.severity = coalesce(n.severity, '重度');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '超重'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '性别因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '年龄因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '体位因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '鼻腔阻力'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '酗酒'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '低');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '心脏病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #13
   Timestamp: 2024-12-18 09:55:41
*/
// 节点更新
MERGE (n:Disease {name: '全睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '指连续数天睡眠的剥夺状态，造成多种精神和生理影响。');

MERGE (n:Disease {name: '部分睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '特异性减少整个睡眠期某段时间的睡眠量，分为急性和慢性部分睡眠剥夺。');

MERGE (n:Disease {name: '选择性睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '选择性剥夺一个或多个睡眠时相，旨在了解各睡眠结构的功能。');

MERGE (n:Symptom {name: '困意'})
SET 
    n.description = coalesce(n.description, '感觉到强烈的疲倦和想睡觉的状态。');

MERGE (n:Symptom {name: '疲惫'})
SET 
    n.description = coalesce(n.description, '身体极度虚弱与缺乏能量的表现。');

MERGE (n:Symptom {name: '易激怒'})
SET 
    n.description = coalesce(n.description, '容易对小事感到愤怒或不安的情绪。');

MERGE (n:Symptom {name: '情绪不稳定'})
SET 
    n.description = coalesce(n.description, '情绪的波动性大，难以控制。');

MERGE (n:Symptom {name: '定向力障碍'})
SET 
    n.description = coalesce(n.description, '对空间和时间的认知出现混乱。');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '感知到不存在的事物，常与精神分裂症患者的症状不同。');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '在不适当的时间产生强烈的睡意。');

MERGE (n:Symptom {name: '指尖震颤'})
SET 
    n.description = coalesce(n.description, '手指发生不自主的快速抖动。');

MERGE (n:Symptom {name: '眼球震颤'})
SET 
    n.description = coalesce(n.description, '眼球出现不自主的快速运动。');

MERGE (n:Symptom {name: '上眼睑下垂'})
SET 
    n.description = coalesce(n.description, '上眼睑无力，无法正常开启。');

MERGE (n:Symptom {name: '神经性兴奋'})
SET 
    n.description = coalesce(n.description, '神经系统兴奋，人表现为烦躁或激越的状态。');

// 关系更新
MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '困意'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '疲惫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '易激怒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '情绪不稳定'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '定向力障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '指尖震颤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '眼球震颤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '上眼睑下垂'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '神经性兴奋'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '部分睡眠剥夺'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长时间剥夺');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '选择性睡眠剥夺'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长时间剥夺');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '困意'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '疲惫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '易激怒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '选择性睡眠剥夺'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '选择性睡眠剥夺'
MATCH (to) WHERE to.name = '神经性兴奋'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #14
   Timestamp: 2024-12-18 09:55:41
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种以睡眠时反复出现的完全或部分上气道阻塞引起的呼吸暂停为特征的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '上气道阻塞'})
SET 
    n.description = coalesce(n.description, '上气道在睡眠时反复的完全或部分阻塞'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: 'H-UPPP手术'})
SET 
    n.description = coalesce(n.description, '以软前移和硬截短结合的手术治疗方案'),
    n.duration = coalesce(n.duration, '不明'),
    n.frequency = coalesce(n.frequency, '一次'),
    n.contraindication = coalesce(n.contraindication, '无特殊禁忌证'),
    n.equipment = coalesce(n.equipment, '手术器械');

MERGE (n:Complication {name: '出血'})
SET 
    n.description = coalesce(n.description, '术中或术后可能发生的出血并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重过重增加OSAHS发生的风险'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Examination {name: '纤维鼻咽镜检查'})
SET 
    n.description = coalesce(n.description, '用于观察咽部狭窄程度的检查'),
    n.method = coalesce(n.method, '纤维内镜'),
    n.requirement = coalesce(n.requirement, '专科医生操作');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '上气道阻塞'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'H-UPPP手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '手术阶段');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '术中或术后');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '纤维鼻咽镜检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #15
   Timestamp: 2024-12-18 09:55:41
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '苯二氮草类药物'});

MERGE (n:Disease {name: '阻塞型睡眠呼吸暂停'});

MERGE (n:Symptom {name: '思睡'});

MERGE (n:Symptom {name: '头晕'});

MERGE (n:Symptom {name: '头痛'});

MERGE (n:Symptom {name: '共济失调'});

MERGE (n:Symptom {name: '逆行性遗忘'});

MERGE (n:Examination {name: '睡眠脑电图'})
SET 
    n.description = coalesce(n.description, '监测睡眠阶段和脑部活性'),
    n.method = coalesce(n.method, '脑电图技术'),
    n.requirement = coalesce(n.requirement, '需要患者在实验室过夜');

MERGE (n:DrugTreatment {name: '艾司唑仑'})
SET 
    n.description = coalesce(n.description, '苯二氮草类催眠药'),
    n.dosage = coalesce(n.dosage, '根据患者需要'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '孕妇和哺乳期女性');

MERGE (n:DrugTreatment {name: '三唑仑'})
SET 
    n.description = coalesce(n.description, '具有快速起效的药物，滥用风险较高'),
    n.dosage = coalesce(n.dosage, '根据患者需要'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '孕妇和哺乳期女性');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '可促使患者达到主观睡眠感的药物'),
    n.dosage = coalesce(n.dosage, '根据患者需要'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对敏感的患者');

MERGE (n:DrugTreatment {name: '右佐匹克隆'})
SET 
    n.description = coalesce(n.description, '唯一没有使用时间限制的BZRAs，改善睡眠的客观指标'),
    n.dosage = coalesce(n.dosage, '根据患者需要'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '孕妇和哺乳期女性');

MERGE (n:DrugTreatment {name: '雷美替胺'})
SET 
    n.description = coalesce(n.description, '选择性激动MT1和MT2受体'),
    n.dosage = coalesce(n.dosage, '8mg'),
    n.frequency = coalesce(n.frequency, '就寝前30分钟服用'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '严重肝脏疾病患者');

MERGE (n:DrugTreatment {name: 'suvorexant'})
SET 
    n.description = coalesce(n.description, 'OX1R和OX2R双受体拮抗剂，用于治疗失眠'),
    n.dosage = coalesce(n.dosage, '10mg'),
    n.frequency = coalesce(n.frequency, '就寝前30分钟'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '与强抑制剂合用时');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '艾司唑仑'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '三唑仑'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '右佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '雷美替胺'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'suvorexant'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '思睡'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '头晕'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '共济失调'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '逆行性遗忘'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠脑电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '苯二氮草类药物'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞型睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #16
   Timestamp: 2024-12-18 09:55:41
*/
// 节点更新
MERGE (n:Examination {name: '睡眠呼吸监测'})
SET 
    n.description = coalesce(n.description, '监测睡眠时的呼吸情况'),
    n.method = coalesce(n.method, '包括呼吸气流、呼吸努力和动脉血氧饱和度'),
    n.requirement = coalesce(n.requirement, '在睡眠实验室进行或患者家中进行');

MERGE (n:Examination {name: '呼吸流速计'})
SET 
    n.description = coalesce(n.description, '用于测定呼吸气流的装置'),
    n.method = coalesce(n.method, '通过一个金属性滤网测定气流的变化'),
    n.requirement = coalesce(n.requirement, '需覆盖口鼻');

MERGE (n:Examination {name: '经鼻压力信号'})
SET 
    n.description = coalesce(n.description, '用于监测气道压变化'),
    n.method = coalesce(n.method, '通过小管插入鼻孔监测气流'),
    n.requirement = coalesce(n.requirement, '需患者鼻腔呼吸');

MERGE (n:Examination {name: '热敏换能器'})
SET 
    n.description = coalesce(n.description, '监测气流的装置'),
    n.method = coalesce(n.method, '通过探测气流流经传感器时引起的温度改变'),
    n.requirement = coalesce(n.requirement, '需不接触皮肤');

MERGE (n:Examination {name: '呼吸肌电活动测定'})
SET 
    n.description = coalesce(n.description, '监测食管内压变化'),
    n.method = coalesce(n.method, '监测与吸气相关的食管内压变化'),
    n.requirement = coalesce(n.requirement, '需放置气囊或充满液体的小导管');

MERGE (n:Examination {name: '脉搏测氧法'})
SET 
    n.description = coalesce(n.description, '测定血氧饱和度的非侵入性技术'),
    n.method = coalesce(n.method, '通过分光光电技术检测动脉血氧饱和度'),
    n.requirement = coalesce(n.requirement, '探头需放置在指端或耳垂');

MERGE (n:Examination {name: '经皮二氧化碳分压测定'})
SET 
    n.description = coalesce(n.description, '无创性连续监测二氧化碳分压的方法'),
    n.method = coalesce(n.method, '利用极化原理和传感器进行监测'),
    n.requirement = coalesce(n.requirement, '需扩张真皮浅层血管');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '睡眠期间发生呼吸暂停或低通气的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度到重度');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '低通气'})
SET 
    n.description = coalesce(n.description, '呼吸衰弱导致氧气供应不足'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天过度嗜睡'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '响亮的鼾声'})
SET 
    n.description = coalesce(n.description, '睡眠时发出的响声'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Complication {name: '心律失常'})
SET 
    n.description = coalesce(n.description, '呼吸暂停可能导致的心脏问题'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '持续的睡眠 apnea 可能导致高血压'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '心脏病'})
SET 
    n.description = coalesce(n.description, '睡眠疾病可能增加心脏病风险'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '低通气'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '响亮的鼾声'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠呼吸监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸流速计'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '经鼻压力信号'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '热敏换能器'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '呼吸肌电活动测定'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '脉搏测氧法'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '经皮二氧化碳分压测定'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心律失常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心脏病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #17
   Timestamp: 2024-12-18 09:55:42
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种因为上气道阻塞导致的睡眠呼吸障碍'),
    n.category = coalesce(n.category, '睡眠医学'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠时短暂呼吸停止'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出呼噜声'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '日间');

MERGE (n:Symptom {name: '夜间呛咳和窒息'})
SET 
    n.description = coalesce(n.description, '睡眠中发生呛咳或窒息感'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到头痛'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '难以集中注意力'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '记忆力减退'})
SET 
    n.description = coalesce(n.description, '记忆力下降'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '夜尿增多'})
SET 
    n.description = coalesce(n.description, '夜间排尿次数增多'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '易激惹'})
SET 
    n.description = coalesce(n.description, '容易感到烦躁'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '性功能减退'})
SET 
    n.description = coalesce(n.description, '性功能下降'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Examination {name: '头影测量分析'})
SET 
    n.description = coalesce(n.description, '通过X线头影测量获得颅面形态学特征'),
    n.method = coalesce(n.method, 'X线'),
    n.requirement = coalesce(n.requirement, '需定位患者头部');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '高血压作为阻塞性睡眠呼吸暂停的并发症'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '2型糖尿病'})
SET 
    n.description = coalesce(n.description, '2型糖尿病作为阻塞性睡眠呼吸暂停的并发症'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '肥胖是OSAHS的独立危险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '心力衰竭'})
SET 
    n.description = coalesce(n.description, '心力衰竭患者的OSAHS风险增加'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '日间'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间呛咳和窒息'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '注意力不集中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '记忆力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜尿增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '易激惹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '性功能减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '头影测量分析'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '中长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '中长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #18
   Timestamp: 2024-12-18 09:55:42
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '严重阻塞性睡眠呼吸障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS');

MERGE (n:Complication {name: '通气障碍'});

MERGE (n:Complication {name: '呼吸困难'});

MERGE (n:Complication {name: '室息'});

MERGE (n:Complication {name: '死亡'});

MERGE (n:Examination {name: '鼻咽纤维内镜检查'})
SET 
    n.description = coalesce(n.description, '用于评估上气道状况'),
    n.method = coalesce(n.method, '内窥镜检查'),
    n.requirement = coalesce(n.requirement, '需要专业医师操作');

MERGE (n:NonDrugTreatment {name: '正压通气治疗'})
SET 
    n.description = coalesce(n.description, '用于纠正睡眠低氧状态'),
    n.duration = coalesce(n.duration, '随时可用'),
    n.frequency = coalesce(n.frequency, '术前及术后'),
    n.contraindication = coalesce(n.contraindication, '对某些患者无效'),
    n.equipment = coalesce(n.equipment, '正压呼吸机');

MERGE (n:NonDrugTreatment {name: '气管切开术'})
SET 
    n.description = coalesce(n.description, '解决上气道梗阻的手术'),
    n.duration = coalesce(n.duration, '术中'),
    n.frequency = coalesce(n.frequency, '一次性'),
    n.contraindication = coalesce(n.contraindication, '非必要时不做'),
    n.equipment = coalesce(n.equipment, '气管切开器械');

MERGE (n:NonDrugTreatment {name: '软组织减容术'})
SET 
    n.description = coalesce(n.description, '针对上呼吸道肥大软组织的减容手术'),
    n.duration = coalesce(n.duration, '依情况而定'),
    n.frequency = coalesce(n.frequency, '单次手术'),
    n.contraindication = coalesce(n.contraindication, '解剖异常者'),
    n.equipment = coalesce(n.equipment, '手术器械');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '促成OSAHS发生的因素'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '通气障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '围术期');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '呼吸困难'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '围术期');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '室息'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '围术期');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '死亡'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.2),
    r.timeframe = coalesce(r.timeframe, '围术期');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '鼻咽纤维内镜检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '正压通气治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '术前及术后');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '气管切开术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '紧急');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '软组织减容术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '紧急');

MATCH (from) WHERE from.name = '严重阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '严重'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

/* Response #19
   Timestamp: 2024-12-18 09:55:42
*/
// 节点更新
MERGE (n:DrugTreatment {name: '三佐匹克隆'})
SET 
    n.description = coalesce(n.description, '佐匹克隆又称唑比酮、忆梦返，为环吡咯酮类。作用机制与唑吡坦相似,可能与GABA_A受体的相互作用有关。有镇静、抗焦虑、肌肉松弛和抗惊厥作用。其催眠作用迅速,可缩短睡眠潜伏期,减少中途觉醒次数和早醒次数,改善睡眠质量。适用于各种类型失眠。'),
    n.dosage = coalesce(n.dosage, '15~30分钟起效'),
    n.frequency = coalesce(n.frequency, '每日一次或按需'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对苯二氮草类药物敏感者');

MERGE (n:DrugTreatment {name: '右佐匹克隆'})
SET 
    n.description = coalesce(n.description, '右佐匹克隆是三佐匹克隆单纯右旋异构体,2014年12月被美国FDA批准用于治疗失眠。能够缩短人睡潜伏期,延长慢波睡眠时间和总睡眠时间,减少觉醒次数。'),
    n.dosage = coalesce(n.dosage, '约1小时后血药浓度达峰值'),
    n.frequency = coalesce(n.frequency, '睡前服用'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '不良反应轻微,如口苦和头晕,不需处理可自行消失');

MERGE (n:DrugTreatment {name: '雷美替胺'})
SET 
    n.description = coalesce(n.description, '雷美替胺是一种高选择性褪黑激素受体激动剂,对MT_1的选择性大于MT_2,参与昼夜节律的调节与维持。可改善时差变化引起的症状、睡眠时相延迟综合征和昼夜节律失调性睡眠障碍。'),
    n.dosage = coalesce(n.dosage, '0.75小时后达峰'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '短期用药'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '不宜用于严重肝损伤患者');

MERGE (n:DrugTreatment {name: '阿戈美拉汀'})
SET 
    n.description = coalesce(n.description, '阿戈美拉汀是褪黑激素受体激动剂和5-HT_2C受体拮抗剂。动物试验与临床研究表明该药有抗抑郁、抗焦虑、调整睡眠节律及调节生物钟作用。'),
    n.dosage = coalesce(n.dosage, '根据临床需要'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '未见撤药反应');

MERGE (n:DrugTreatment {name: '苯海拉明'})
SET 
    n.description = coalesce(n.description, '苯海拉明属第一代组胺H_1受体拮抗药,发挥抗组胺的作用,主要用于消除各种过敏症状。苯海拉明能通过血-脑脊液屏障,常作为失眠治疗的辅助药。'),
    n.dosage = coalesce(n.dosage, '15~60分钟起效'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '青光眼或老年患者应慎用');

MERGE (n:DrugTreatment {name: '多塞平'})
SET 
    n.description = coalesce(n.description, '多塞平是三环类抗抑郁药,可延长总睡眠时间、减少觉醒次数、促进睡眠。对成人原发性失眠患者的睡眠维持困难和早醒具有改善作用。'),
    n.dosage = coalesce(n.dosage, '根据临床需要'),
    n.frequency = coalesce(n.frequency, '按需'),
    n.duration = coalesce(n.duration, '长短期用药均可'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '禁止与单胺氧化酶抑制剂合用');

MERGE (n:DrugTreatment {name: 'suvorexant'})
SET 
    n.description = coalesce(n.description, 'suvorexant是首个被FDA批准用于治疗失眠的食欲肽受体拮抗剂,具备良好的安全性和效果。'),
    n.dosage = coalesce(n.dosage, '10~20mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '不良反应包括自杀意念或行为');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠是一种常见的睡眠障碍，以入睡困难、睡眠维持困难、过早觉醒等为特征。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '焦虑是一种常见的情绪障碍，可能引发或加重失眠情况。'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '抑郁是情绪上的病症，常与失眠交替发生。'),
    n.severity = coalesce(n.severity, '重');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '三佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '右佐匹克隆'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '雷美替胺'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阿戈美拉汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '苯海拉明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多塞平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'suvorexant'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #20
   Timestamp: 2024-12-18 09:55:43
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '儿童睡眠呼吸障碍，可能导致严重并发症'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'HTN'),
    n.description = coalesce(n.description, '血压升高'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '2型糖尿病'})
SET 
    n.code = coalesce(n.code, 'T2DM'),
    n.description = coalesce(n.description, '胰岛素抵抗引起的高血糖'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出的响声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感觉困倦'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中呼吸停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多动'})
SET 
    n.description = coalesce(n.description, '注意力不集中，表现异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Complication {name: '心源性肺病'})
SET 
    n.description = coalesce(n.description, '因心脏疾病引起的肺部问题'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '生长发育迟缓'})
SET 
    n.description = coalesce(n.description, '生长速度低于同期正常儿童'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '通过多导睡眠监测评估睡眠呼吸障碍类型和严重程度'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '医院');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '心源性肺病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '生长发育迟缓'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '持续');

MATCH (from) WHERE from.name = '高血压'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '2型糖尿病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #21
   Timestamp: 2024-12-18 09:55:45
*/
// 节点更新
MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.description = coalesce(n.description, '肥胖低通气综合征易合并OSAHS，出现更严重的夜间血氧饱和度下降，并伴高碳酸血症，长期CPAP治疗还可以降低日间CO2水平。');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS'),
    n.description = coalesce(n.description, '睡眠期间，上气道反复塌陷，导致呼吸暂停。');

MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.short_name = coalesce(n.short_name, 'COPD'),
    n.description = coalesce(n.description, '一种常见的肺病，导致气流受限，呼吸困难。');

MERGE (n:Treatment {name: 'BiPAP治疗'})
SET 
    n.description = coalesce(n.description, '持续气道正压防止气道塌陷，保持上气道开放，长时间应用可提高呼吸中枢对低氧及高CO2的敏感性。');

MERGE (n:Treatment {name: 'CPAP治疗'})
SET 
    n.description = coalesce(n.description, '通过持续气道正压，减少阻塞性呼吸暂停事件，改善夜间低氧血症。');

MERGE (n:Complication {name: '高碳酸血症'})
SET 
    n.description = coalesce(n.description, '由于呼吸障碍，体内二氧化碳水平过高的状态。'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '甲状腺功能减退引起的呼吸暂停'})
SET 
    n.description = coalesce(n.description, '由甲状腺功能不足引起的呼吸暂停。');

MERGE (n:Disease {name: '妊娠期OSAHS'})
SET 
    n.description = coalesce(n.description, '妊娠期间，由于生理变化导致的OSAHS风险增加。');

MERGE (n:RiskFactor {name: '过敏性鼻炎'})
SET 
    n.description = coalesce(n.description, '由过敏反应引起的鼻腔炎症，影响呼吸。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '慢性心力衰竭'})
SET 
    n.description = coalesce(n.description, '心脏无法有效泵血，可能与呼吸暂停相关。'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'CPAP治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = 'BiPAP治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高碳酸血症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '高碳酸血症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '妊娠期OSAHS'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '甲状腺功能减退引起的呼吸暂停'
MATCH (to) WHERE to.name = 'CPAP治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗前期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '过敏性鼻炎'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '慢性心力衰竭'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #22
   Timestamp: 2024-12-18 09:55:45
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS');

MERGE (n:Disease {name: '鼻中隔偏曲'});

MERGE (n:Disease {name: '鼻息肉'});

MERGE (n:Disease {name: '肥厚性鼻炎'});

MERGE (n:Disease {name: '鼻腔及鼻咽部肿瘤'});

MERGE (n:Disease {name: '变应性鼻炎'});

MERGE (n:Symptom {name: '鼻中隔偏曲症状'});

MERGE (n:Symptom {name: '鼻塞'});

MERGE (n:Symptom {name: '喷嚏'});

MERGE (n:Symptom {name: '打鼾'});

MERGE (n:Symptom {name: '鼻阻力增加'});

MERGE (n:Examination {name: '鼻腔检查'});

MERGE (n:Examination {name: '鼻窦内镜检查'});

MERGE (n:NonDrugTreatment {name: '鼻中隔矫正手术'})
SET 
    n.description = coalesce(n.description, '矫正鼻中隔畸形以扩大鼻腔气道'),
    n.duration = coalesce(n.duration, '术后恢复'),
    n.frequency = coalesce(n.frequency, '必要时');

MERGE (n:NonDrugTreatment {name: '鼻甲手术'})
SET 
    n.description = coalesce(n.description, '通过手术拓宽鼻腔通气截面积'),
    n.duration = coalesce(n.duration, '术后恢复'),
    n.frequency = coalesce(n.frequency, '必要时');

MERGE (n:NonDrugTreatment {name: '鼻阈扩大手术'})
SET 
    n.description = coalesce(n.description, '扩大鼻阈以改善鼻通气'),
    n.duration = coalesce(n.duration, '术后恢复'),
    n.frequency = coalesce(n.frequency, '必要时');

MERGE (n:NonDrugTreatment {name: '鼻窦内镜手术'})
SET 
    n.description = coalesce(n.description, '针对鼻窦炎患者的手术'),
    n.duration = coalesce(n.duration, '术后恢复'),
    n.frequency = coalesce(n.frequency, '必要时');

// 关系更新
MATCH (from) WHERE from.name = '鼻中隔偏曲症状'
MATCH (to) WHERE to.name = '鼻中隔偏曲'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '鼻息肉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '肥厚性鼻炎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '鼻腔及鼻咽部肿瘤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻腔检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻窦内镜检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻中隔矫正手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '恢复期');

MATCH (from) WHERE from.name = '鼻中隔偏曲'
MATCH (to) WHERE to.name = '鼻甲手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻阈扩大手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '恢复期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻窦内镜手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻中隔偏曲'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻息肉'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥厚性鼻炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '鼻腔及鼻咽部肿瘤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '变应性鼻炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #23
   Timestamp: 2024-12-18 09:55:46
*/
// 节点更新
MERGE (n:Disease {name: '慢性心力衰竭'})
SET 
    n.code = coalesce(n.code, 'CHF'),
    n.description = coalesce(n.description, '慢性充血性心力衰竭'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'CSA'),
    n.description = coalesce(n.description, '中枢性睡眠呼吸暂停伴陈-施呼吸'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '缺氧'})
SET 
    n.code = coalesce(n.code, 'Hypoxia'),
    n.description = coalesce(n.description, '血氧不足'),
    n.category = coalesce(n.category, '环境因素'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '脑卒中'})
SET 
    n.code = coalesce(n.code, 'Stroke'),
    n.description = coalesce(n.description, '脑卒中'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '白天过度思睡'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '夜间觉醒或睡眠干扰'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '夜间呼吸困难'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '尿失禁'})
SET 
    n.description = coalesce(n.description, '清醒后有气短'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '思睡'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '呼吸困难'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '尿失禁'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性心力衰竭'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '缺氧'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #24
   Timestamp: 2024-12-18 09:55:46
*/
// 节点更新
MERGE (n:Disease {name: '正颌外科'})
SET 
    n.description = coalesce(n.description, '对牙颌面畸形患者采用正畸和外科手术的方法进行矫治'),
    n.category = coalesce(n.category, '外科'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '原发性鼾症'})
SET 
    n.description = coalesce(n.description, '以打鼾为主要表现的睡眠呼吸障碍'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: '阻塞性睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '睡眠中上呼吸道反复发生阻塞现象'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时患者反复出现鼾声'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸暂时停止'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '昼间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦和嗜睡'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Complication {name: '神经损伤'})
SET 
    n.description = coalesce(n.description, '造成感觉障碍或面神经损伤'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '咬合紊乱'})
SET 
    n.description = coalesce(n.description, '手术后可能出现的咬合不和谐'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Complication {name: '伤口感染'})
SET 
    n.description = coalesce(n.description, '术后伤口感染的可能性'),
    n.severity = coalesce(n.severity, '重度');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '昼间嗜睡'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '神经损伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '咬合紊乱'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '伤口感染'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '术后');

MATCH (from) WHERE from.name = '正颌外科'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '正颌外科'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '手术');



// =====================================

/* Response #25
   Timestamp: 2024-12-18 09:55:47
*/
// 节点更新
MERGE (n:Disease {name: '复杂性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '复杂性睡眠呼吸暂停指初始诊断为OSAHS的患者应用无后备频率的PAP治疗,消除阻塞性呼吸事件后出现中枢睡眠呼吸暂停或低通气事件'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '阻塞性睡眠呼吸综合征'})
SET 
    n.description = coalesce(n.description, 'OSAHS是一种常见的睡眠呼吸障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.description = coalesce(n.description, '肥胖低通气综合征以肥胖和日间高碳酸血症为特征,睡眠期通气不足'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '先天性中枢性低通气综合征'})
SET 
    n.description = coalesce(n.description, '一种由PHOX2B基因突变引起的神经功能紊乱性疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '迟发型中枢性低通气伴下丘脑功能失调'})
SET 
    n.description = coalesce(n.description, '与下丘脑功能障碍相关的慢性低通气疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸综合征'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '持续性');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '可合并');

MATCH (from) WHERE from.name = '先天性中枢性低通气综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '先天性中枢性低通气综合征'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '迟发型中枢性低通气伴下丘脑功能失调'
MATCH (to) WHERE to.name = '先天性中枢性低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '较低');



// =====================================

/* Response #26
   Timestamp: 2024-12-18 09:55:48
*/
// 节点更新
MERGE (n:Disease {name: '中枢性肺泡低通气综合征'})
SET 
    n.code = coalesce(n.code, 'ICHS'),
    n.description = coalesce(n.description, '存在肺泡通气减少导致睡眠相关性低氧血症与高碳酸血症'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OHS'),
    n.description = coalesce(n.description, '迟发型中枢性低通气伴下丘脑功能失调'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠相关低氧血症'})
SET 
    n.code = coalesce(n.code, 'SLO'),
    n.description = coalesce(n.description, '以睡眠期持续存在显著血氧饱和度减少为特征'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '神经肌肉疾病'})
SET 
    n.code = coalesce(n.code, 'NMD'),
    n.description = coalesce(n.description, '导致睡眠相关通气障碍和呼吸衰竭的病症'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '夜间低氧血症'})
SET 
    n.description = coalesce(n.description, '睡眠期间血氧饱和度显著下降'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早晨醒来时有头痛症状'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '疲乏'})
SET 
    n.description = coalesce(n.description, '日间感到极度疲劳'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸变浅'})
SET 
    n.description = coalesce(n.description, '夜间呼吸时气量明显减少'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '反复出现');

// 关系更新
MATCH (from) WHERE from.name = '夜间低氧血症'
MATCH (to) WHERE to.name = '中枢性肺泡低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '晨起头痛'
MATCH (to) WHERE to.name = '中枢性肺泡低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '疲乏'
MATCH (to) WHERE to.name = '中枢性肺泡低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '呼吸变浅'
MATCH (to) WHERE to.name = '中枢性肺泡低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '反复出现'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = '神经肌肉疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '慢性');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '中枢性肺泡低通气综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '睡眠相关低氧血症'
MATCH (to) WHERE to.name = '神经肌肉疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '慢性');



// =====================================

/* Response #27
   Timestamp: 2024-12-18 09:55:48
*/
// 节点更新
MERGE (n:Disease {name: '口腔正畸学'})
SET 
    n.description = coalesce(n.description, '研究错畸形病因机制、诊断、预防和治疗的学科'),
    n.category = coalesce(n.category, '口腔医学');

MERGE (n:Disease {name: '阻塞性睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '由于骨骼结构畸形导致的睡眠呼吸问题');

MERGE (n:Disease {name: '颅缝早闭相关综合征'})
SET 
    n.description = coalesce(n.description, '颅缝早闭影响颅腔体积的增长');

MERGE (n:Disease {name: '腺样体面容'})
SET 
    n.description = coalesce(n.description, '因为腺样体肥大引起的面部畸形');

MERGE (n:Disease {name: '巨舌症'})
SET 
    n.description = coalesce(n.description, '先天性舌肌过长，舌体呈均质性增大');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '由于咽部阻塞等原因导致患者主要通过口腔呼吸'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '舌体肥大'})
SET 
    n.description = coalesce(n.description, '舌体难以回纳，可能造成呼吸、语言、吞咽障碍'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '颅内高压'})
SET 
    n.description = coalesce(n.description, '由于颅缝早闭导致的高内压'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:NonDrugTreatment {name: '闭口呼吸训练'})
SET 
    n.description = coalesce(n.description, '让儿童白天有意识的闭嘴呼吸'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '唇肌功能训练'})
SET 
    n.description = coalesce(n.description, '提高口轮匝肌的功能'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '1/2口罩使用'})
SET 
    n.description = coalesce(n.description, '特制口罩以助于纠正张口呼吸'),
    n.duration = coalesce(n.duration, '适应期'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '严重窒息'),
    n.equipment = coalesce(n.equipment, '口罩');

MERGE (n:NonDrugTreatment {name: '功能性扩展矫正'})
SET 
    n.description = coalesce(n.description, '通过调节肌力实现颌部矫治'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '功能矫治器');

// 关系更新
MATCH (from) WHERE from.name = '口腔正畸学'
MATCH (to) WHERE to.name = '闭口呼吸训练'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '口腔正畸学'
MATCH (to) WHERE to.name = '唇肌功能训练'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '口腔正畸学'
MATCH (to) WHERE to.name = '1/2口罩使用'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '适应期');

MATCH (from) WHERE from.name = '口腔正畸学'
MATCH (to) WHERE to.name = '功能性扩展矫正'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '舌体肥大'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '颅缝早闭相关综合征'
MATCH (to) WHERE to.name = '颅内高压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '腺样体面容'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '张口呼吸'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '舌体肥大'
MATCH (to) WHERE to.name = '巨舌症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');



// =====================================

/* Response #28
   Timestamp: 2024-12-18 09:55:49
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'Narcolepsy');

MERGE (n:Disease {name: '特发性睡眠增多'})
SET 
    n.code = coalesce(n.code, 'IH');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '指在白天应该维持清醒的主要时段不能保持清醒和警觉'),
    n.severity = coalesce(n.severity, '轻至重'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '无力发作，常因情绪刺激而诱发'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '睡瘫'})
SET 
    n.description = coalesce(n.description, '人醒来时发生一过性全身不能活动或不能讲话'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '夜间睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '表现为易醒、多梦，觉醒后困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '长期');

MERGE (n:Symptom {name: '睡前幻觉'})
SET 
    n.description = coalesce(n.description, '在觉醒和睡眠转换期产生的幻觉'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Complication {name: '社交恐惧症'})
SET 
    n.description = coalesce(n.description, '患者因发生猝倒等症状导致的社交障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '患者因日间过度思睡等症状导致的焦虑'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '睡瘫'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '夜间睡眠紊乱'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '夜间睡眠紊乱'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '长期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '社交恐惧症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #29
   Timestamp: 2024-12-18 09:55:50
*/
// 节点更新
MERGE (n:Disease {name: '腺样体肥大'})
SET 
    n.code = coalesce(n.code, '1'),
    n.description = coalesce(n.description, '腺样体肥大导致呼吸模式改变'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '扁桃体肥大'})
SET 
    n.code = coalesce(n.code, '2'),
    n.description = coalesce(n.description, '扁桃体肥大影响呼吸'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '颅缝早闭'})
SET 
    n.code = coalesce(n.code, '3'),
    n.description = coalesce(n.description, '颅缝早闭导致头颅畸形'),
    n.category = coalesce(n.category, '颅面障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '巨舌症'})
SET 
    n.code = coalesce(n.code, '4'),
    n.description = coalesce(n.description, '舌过长导致阻塞性睡眠呼吸障碍'),
    n.category = coalesce(n.category, '呼吸障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '小下颌畸形'})
SET 
    n.code = coalesce(n.code, '5'),
    n.description = coalesce(n.description, '下颌发育不足影响呼吸'),
    n.category = coalesce(n.category, '面部畸形'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '唐氏综合征'})
SET 
    n.code = coalesce(n.code, '6'),
    n.description = coalesce(n.description, '唐氏综合征伴随多种畸形及智力低下'),
    n.category = coalesce(n.category, '遗传性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '脐疝-巨舌-巨体综合征'})
SET 
    n.code = coalesce(n.code, '7'),
    n.description = coalesce(n.description, '新生儿特征性畸形综合征'),
    n.category = coalesce(n.category, '遗传性疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '呼吸系统并发症'})
SET 
    n.code = coalesce(n.code, '8'),
    n.description = coalesce(n.description, '术后发生的呼吸系统并发症'),
    n.category = coalesce(n.category, '并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间打鼾'})
SET 
    n.description = coalesce(n.description, '在睡眠中发出鼾声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '在休息及睡眠时使用口呼吸'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '呼吸时出现困难的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '在活动中缺乏注意力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '生长发育障碍'})
SET 
    n.description = coalesce(n.description, '身体发育低于正轨'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '喂养困难'})
SET 
    n.description = coalesce(n.description, '进食时出现困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '中的频率');

MERGE (n:Symptom {name: '颈部疼痛'})
SET 
    n.description = coalesce(n.description, '颈部的疼痛感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '腺样体肥大'
MATCH (to) WHERE to.name = '夜间打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '腺样体肥大'
MATCH (to) WHERE to.name = '张口呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '颅缝早闭'
MATCH (to) WHERE to.name = '呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '巨舌症'
MATCH (to) WHERE to.name = '喂养困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '小下颌畸形'
MATCH (to) WHERE to.name = '生长发育障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '唐氏综合征'
MATCH (to) WHERE to.name = '注意力不集中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '呼吸系统并发症'
MATCH (to) WHERE to.name = '颈部疼痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.15),
    r.timeframe = coalesce(r.timeframe, '术后恢复期间');

MATCH (from) WHERE from.name = '扁桃体肥大'
MATCH (to) WHERE to.name = '腺样体肥大'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '颅缝早闭'
MATCH (to) WHERE to.name = '颈部疼痛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '手术治疗');

MATCH (from) WHERE from.name = '小下颌畸形'
MATCH (to) WHERE to.name = '夜间打鼾'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '正畸治疗');



// =====================================

/* Response #30
   Timestamp: 2024-12-18 09:55:50
*/
// 节点更新
MERGE (n:Disease {name: '特发性刺痛性头痛'})
SET 
    n.description = coalesce(n.description, '头侧部发生的短暂刺痛的良性综合征, 发生于人睡时, 但觉醒期间更常见.');

MERGE (n:Disease {name: '霹雳头痛'})
SET 
    n.description = coalesce(n.description, '以蛛网膜下腔出血为特征的非常严重的突然发作的头痛, 也可由其他原因引起.');

MERGE (n:Disease {name: '睡眠性头痛综合征'})
SET 
    n.description = coalesce(n.description, '发生于经常入睡后4~6小时醒来的老人, 持续30~60分钟, 呈弥散性头痛, 常伴有恶心, 但无自主神经系统症状.');

MERGE (n:Disease {name: '睡眠相关性幻觉'})
SET 
    n.description = coalesce(n.description, '人睡时或从睡眠中醒来时出现的幻觉体验.');

MERGE (n:Disease {name: '遗尿症'})
SET 
    n.description = coalesce(n.description, '睡眠期间的复发性无意识排尿,且至少每周发生两次.');

// 关系更新
MATCH (from) WHERE from.name = '特发性刺痛性头痛'
MATCH (to) WHERE to.name = '睡眠相关性幻觉'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短暂');

MATCH (from) WHERE from.name = '霹雳头痛'
MATCH (to) WHERE to.name = '睡眠相关性幻觉'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短暂');

MATCH (from) WHERE from.name = '睡眠性头痛综合征'
MATCH (to) WHERE to.name = '睡眠相关性幻觉'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短暂');

MATCH (from) WHERE from.name = '遗尿症'
MATCH (to) WHERE to.name = '特发性刺痛性头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '遗尿症'
MATCH (to) WHERE to.name = '霹雳头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '遗尿症'
MATCH (to) WHERE to.name = '睡眠性头痛综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #31
   Timestamp: 2024-12-18 09:55:51
*/
// 节点更新
MERGE (n:Disease {name: '特发性睡眠增多'});

MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'});

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '克莱恩-莱文综合征'});

MERGE (n:Disease {name: '慢性疲劳综合征'});

MERGE (n:Disease {name: '药物或物质滥用所致过度思睡'});

MERGE (n:Disease {name: '睡眠不足综合征'});

MERGE (n:Symptom {name: '日间过度思睡'});

MERGE (n:Symptom {name: '难以抑制的思睡'});

MERGE (n:Symptom {name: '晨间或小睡后觉醒困难'});

MERGE (n:Symptom {name: '疲惫'});

MERGE (n:Symptom {name: '认知功能障碍'});

MERGE (n:Symptom {name: '感知变化'});

MERGE (n:Symptom {name: '饮食异常'});

MERGE (n:Symptom {name: '无节制行为'});

MERGE (n:Symptom {name: '情绪不稳定'});

MERGE (n:Symptom {name: '睡眠幻觉'});

MERGE (n:Symptom {name: '注意力涣散'});

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '难以抑制的思睡'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '晨间或小睡后觉醒困难'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '疲惫'
MATCH (to) WHERE to.name = '克莱恩-莱文综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '发作期间'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '认知功能障碍'
MATCH (to) WHERE to.name = '克莱恩-莱文综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '发作期间'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '感知变化'
MATCH (to) WHERE to.name = '克莱恩-莱文综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '发作期间'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '慢性疲劳综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '随年龄变化'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '情绪不稳定'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠幻觉'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '注意力涣散'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '克莱恩-莱文综合征'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '可反复');

MATCH (from) WHERE from.name = '药物或物质滥用所致过度思睡'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中度'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

/* Response #32
   Timestamp: 2024-12-18 09:55:51
*/
// 节点更新
MERGE (n:Disease {name: '睡行症'})
SET 
    n.description = coalesce(n.description, '从NREM睡眠期突然觉醒的睡眠障碍');

MERGE (n:Disease {name: '睡惊症'})
SET 
    n.description = coalesce(n.description, '突然从慢波睡眠中觉醒，伴随尖叫或呼喊、表情极度恐惧、自主神经系统兴奋性增加的行为表现');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '导致觉醒障碍和意识模糊等症状的睡眠障碍');

MERGE (n:Disease {name: '夜间进食障碍综合征'})
SET 
    n.description = coalesce(n.description, '在睡眠期的觉醒期间反复出现无意识的进食和饮水');

MERGE (n:Disease {name: '精神运动性发作'})
SET 
    n.description = coalesce(n.description, '可能引起复杂和时常剧烈的行为的异常电活动');

MERGE (n:Disease {name: '颞叶癫痫'})
SET 
    n.description = coalesce(n.description, '影响意识的癫痫性发作，可能引起剧烈行为');

MERGE (n:Symptom {name: '尖叫'})
SET 
    n.description = coalesce(n.description, '伴随睡惊症的表现'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '发生时');

MERGE (n:Symptom {name: '恐惧'})
SET 
    n.description = coalesce(n.description, '伴随睡惊症的表现'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '发生时');

MERGE (n:Symptom {name: '强烈焦虑'})
SET 
    n.description = coalesce(n.description, '伴随睡惊症的表现'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '发生时');

MERGE (n:Symptom {name: '意识模糊性觉醒'})
SET 
    n.description = coalesce(n.description, '从NREM睡眠期间出现的不完全觉醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '发生时');

MERGE (n:Symptom {name: '梦境相关暴力行为'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期与梦境相关的肢体活动'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '偶尔发生');

// 关系更新
MATCH (from) WHERE from.name = '睡行症'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '夜间进食障碍综合征'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '尖叫'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '恐惧'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '强烈焦虑'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '意识模糊性觉醒'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '梦境相关暴力行为'
MATCH (to) WHERE to.name = '睡行症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #33
   Timestamp: 2024-12-18 09:55:52
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为紊乱'})
SET 
    n.code = coalesce(n.code, 'RBD'),
    n.description = coalesce(n.description, '发生在REM睡眠期的行为紊乱，伴随骨骼肌失弛缓现象。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠期癫痫'})
SET 
    n.code = coalesce(n.code, 'SE'),
    n.description = coalesce(n.description, '夜间PSG监测或睡眠EEG监测出现痫性放电的睡眠障碍。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '意识模糊性觉醒'})
SET 
    n.code = coalesce(n.code, 'FA'),
    n.description = coalesce(n.description, '从睡眠中觉醒时有一段较长的意识模糊期，没有暴力性运动。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '睡惊症'})
SET 
    n.code = coalesce(n.code, 'P'),
    n.description = coalesce(n.description, '睡眠中突然发生极度恐惧表现的障碍。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡行症'})
SET 
    n.code = coalesce(n.code, 'PS'),
    n.description = coalesce(n.description, '睡眠中起床行走的障碍，通常发生于儿童期。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '梦魔障碍'})
SET 
    n.code = coalesce(n.code, 'ND'),
    n.description = coalesce(n.description, '发生在REM睡眠期间以恐怖不安或焦虑为特征的梦境体验。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '反复发作的孤立性睡瘫症'})
SET 
    n.code = coalesce(n.code, 'RISP'),
    n.description = coalesce(n.description, '从REM睡眠期唤醒时出现意识的觉醒和肌肉失张力的状态。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '头部爆震声综合征'})
SET 
    n.code = coalesce(n.code, 'EHS'),
    n.description = coalesce(n.description, '夜间人睡或醒来时突然出现客观不存在的响亮声音或头部猛烈的爆炸感。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，可记录睡眠中的电生理特征。'),
    n.method = coalesce(n.method, '视频记录和肌电图监测'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Examination {name: '脑部CT'})
SET 
    n.description = coalesce(n.description, '用于明确某些脑器质性疾病的存在。'),
    n.method = coalesce(n.method, '计算机断层扫瞄'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Examination {name: '脑部MRI'})
SET 
    n.description = coalesce(n.description, '用于进一步评估脑部病变。'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Examination {name: '睡眠潜伏期试验'})
SET 
    n.description = coalesce(n.description, '用于评估发作性睡病的发作情况。'),
    n.method = coalesce(n.method, '多次测试'),
    n.requirement = coalesce(n.requirement, '需患者遵守测试程序');

MERGE (n:Symptom {name: '肌肉失弛缓'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期骨骼肌失去正常的松弛状态。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '可变');

MERGE (n:Symptom {name: '恐惧表现'})
SET 
    n.description = coalesce(n.description, '睡惊症患者发作时常表现出极度恐惧。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '可变');

MERGE (n:Symptom {name: '梦境焦虑'})
SET 
    n.description = coalesce(n.description, '梦魔患者在梦中感到极度不安和焦虑。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '头部爆震声综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '梦魔障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '梦魔障碍'
MATCH (to) WHERE to.name = '梦境焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '头部爆震声综合征'
MATCH (to) WHERE to.name = '意识模糊性觉醒'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '观察症状');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '睡惊症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '反复发作的孤立性睡瘫症'
MATCH (to) WHERE to.name = '肌肉失弛缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #34
   Timestamp: 2024-12-18 09:55:52
*/
// 节点更新
MERGE (n:Disease {name: '不规律睡眠觉醒节律障碍'});

MERGE (n:Disease {name: '时差变化睡眠障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'JLD');

MERGE (n:Disease {name: '倒班工作睡眠觉醒障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'SWSWD');

MERGE (n:Symptom {name: '睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '睡眠周期不规律'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天过度想睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '日间疲劳或思睡'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '详细记录睡眠模式'),
    n.method = coalesce(n.method, '日记'),
    n.requirement = coalesce(n.requirement, '连续记录');

MERGE (n:Examination {name: '体动记录仪'})
SET 
    n.description = coalesce(n.description, '监控身体活动及睡眠'),
    n.method = coalesce(n.method, '监测'),
    n.requirement = coalesce(n.requirement, '连续使用');

MERGE (n:NonDrugTreatment {name: '健康教育与行为指导'})
SET 
    n.description = coalesce(n.description, '指导患者调整作息'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '灵活'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '定时光照'})
SET 
    n.description = coalesce(n.description, '使用日间强光来调整作息'),
    n.duration = coalesce(n.duration, '4周'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '光照设备');

MERGE (n:DrugTreatment {name: '褪黑激素'})
SET 
    n.description = coalesce(n.description, '用于调整睡眠与觉醒'),
    n.dosage = coalesce(n.dosage, '0.5-5mg'),
    n.frequency = coalesce(n.frequency, '就寝前'),
    n.duration = coalesce(n.duration, '根据需求'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对褪黑激素过敏');

// 关系更新
MATCH (from) WHERE from.name = '睡眠紊乱'
MATCH (to) WHERE to.name = '不规律睡眠觉醒节律障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '不规律睡眠觉醒节律障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '时差变化睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '时差变化睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '疲劳'
MATCH (to) WHERE to.name = '时差变化睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '疲劳'
MATCH (to) WHERE to.name = '倒班工作睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '体动记录仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '体动记录仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '健康教育与行为指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '定时光照'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '褪黑激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '健康教育与行为指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');



// =====================================

/* Response #35
   Timestamp: 2024-12-18 09:55:54
*/
// 节点更新
MERGE (n:Disease {name: '睡眠觉醒时相延迟障碍'})
SET 
    n.code = coalesce(n.code, 'SWD'),
    n.description = coalesce(n.description, '患者的主要入睡与觉醒时间较传统或期望的作息时间持续提前至少2小时，患者主诉早醒型失眠及晚上思睡。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到重度');

MERGE (n:Disease {name: '睡眠觉醒时相提前障碍'})
SET 
    n.code = coalesce(n.code, 'ASWPD'),
    n.description = coalesce(n.description, '其基本特征是患者的主要入睡与觉醒时间较传统或期望的作息时间持续提前至少2小时，影响日间功能。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到重度');

MERGE (n:Disease {name: '非24小时睡眠觉醒节律障碍'})
SET 
    n.code = coalesce(n.code, 'N24SWD'),
    n.description = coalesce(n.description, '因内源性睡眠觉醒昼夜节律与外界24小时明暗循环周期不同步而产生失眠、日间思睡或两者均有。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到重度');

MERGE (n:Disease {name: '不规律睡眠觉醒节律障碍'})
SET 
    n.code = coalesce(n.code, 'ISWRD'),
    n.description = coalesce(n.description, '以相对缺乏明显的睡眠觉醒节律为基本特征，患者24小时内睡眠觉醒周期无规律。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到重度');

MERGE (n:Symptom {name: '早醒型失眠'})
SET 
    n.description = coalesce(n.description, '患者晚上思睡，早醒的症状表现。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '由于早睡早醒，患者主诉日间过度思睡。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '精神萎靡'})
SET 
    n.description = coalesce(n.description, '由于长期早晨早醒，患者的精神状态常常萎靡。'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '早醒型失眠'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神萎靡'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻度');



// =====================================

/* Response #36
   Timestamp: 2024-12-18 09:55:56
*/
// 节点更新
MERGE (n:Disease {name: '倒班工作睡眠觉醒障碍'})
SET 
    n.code = coalesce(n.code, 'SWD'),
    n.description = coalesce(n.description, '与倒班工作相关的睡眠觉醒状态不同步的障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '睡眠期间反复出现的呼吸暂停情况'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'NS'),
    n.description = coalesce(n.description, '表现为过度嗜睡和瞬间失去意识的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '过度思睡'})
SET 
    n.description = coalesce(n.description, '反复感到极度嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或者睡眠质量差'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '整体睡眠时间得到的质量降低'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.description = coalesce(n.description, '入睡所需时间延长'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '记录睡眠时间和质量的工具'),
    n.method = coalesce(n.method, '日记记录'),
    n.requirement = coalesce(n.requirement, '患者自我填写');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测'),
    n.method = coalesce(n.method, '多导电极监测'),
    n.requirement = coalesce(n.requirement, '医院检测');

MERGE (n:NonDrugTreatment {name: '健康教育与行为指导'})
SET 
    n.description = coalesce(n.description, '教育患者合理安排睡眠'),
    n.duration = coalesce(n.duration, '持续时间依据案例而定'),
    n.frequency = coalesce(n.frequency, '持续性'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '镇静催眠药'})
SET 
    n.description = coalesce(n.description, '帮助入睡的药物'),
    n.dosage = coalesce(n.dosage, '根据医嘱'),
    n.frequency = coalesce(n.frequency, '必要时使用'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '睡眠呼吸暂停涉及药物的使用');

MERGE (n:NonDrugTreatment {name: '光疗'})
SET 
    n.description = coalesce(n.description, '通过光照调整昼夜节律'),
    n.duration = coalesce(n.duration, '期间可持续'),
    n.frequency = coalesce(n.frequency, '根据工作安排'),
    n.contraindication = coalesce(n.contraindication, '光过敏'),
    n.equipment = coalesce(n.equipment, '光照设备');

// 关系更新
MATCH (from) WHERE from.name = '过度思睡'
MATCH (to) WHERE to.name = '倒班工作睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '倒班工作睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠质量下降'
MATCH (to) WHERE to.name = '倒班工作睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠潜伏期延长'
MATCH (to) WHERE to.name = '倒班工作睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = '倒班工作睡眠觉醒障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '倒班工作睡眠觉醒障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '健康教育与行为指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初步干预');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '镇静催眠药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后续治疗');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '光疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');



// =====================================

/* Response #37
   Timestamp: 2024-12-18 09:55:57
*/
// 节点更新
MERGE (n:Disease {name: '单纯性周期性肢体运动障碍'});

MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Disease {name: '睡眠相关性腿痉挛'});

MERGE (n:Disease {name: '睡眠相关性磨牙'});

MERGE (n:Disease {name: '睡眠相关节律性运动障碍'});

MERGE (n:Disease {name: '入睡期脊髓固有肌阵挛'});

MERGE (n:Disease {name: '婴儿良性睡眠肌阵挛'});

MERGE (n:Disease {name: '卒中相关性睡眠障碍'});

// 关系更新
MATCH (from) WHERE from.name = '单纯性周期性肢体运动障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '未知'),
    r.stage = coalesce(r.stage, '临床研究');

MATCH (from) WHERE from.name = '睡眠相关性腿痉挛'
MATCH (to) WHERE to.name = '睡眠相关节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关性磨牙'
MATCH (to) WHERE to.name = '入睡期脊髓固有肌阵挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '婴儿良性睡眠肌阵挛'
MATCH (to) WHERE to.name = '卒中相关性睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '睡眠中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠相关节律性运动障碍'
MATCH (to) WHERE to.name = '单纯性周期性肢体运动障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #38
   Timestamp: 2024-12-18 09:55:58
*/
// 节点更新
MERGE (n:Disease {name: '偏头痛'})
SET 
    n.severity = coalesce(n.severity, '中重度');

MERGE (n:Disease {name: '丛集性头痛'})
SET 
    n.severity = coalesce(n.severity, '剧烈');

MERGE (n:Disease {name: '慢性阵发性半侧头痛'})
SET 
    n.severity = coalesce(n.severity, '剧痛');

MERGE (n:Disease {name: '睡眠性头痛'})
SET 
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: '钟表半侧头痛'})
SET 
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: '觉醒头痛'})
SET 
    n.severity = coalesce(n.severity, '轻至中度');

MERGE (n:Disease {name: '失眠'})
SET 
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '脑肿瘤'})
SET 
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '高血压'})
SET 
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.severity = coalesce(n.severity, '中重度'),
    n.frequency = coalesce(n.frequency, '发生频率不一');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '每日');

// 关系更新
MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '偏头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '丛集性头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '剧烈');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '慢性阵发性半侧头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '剧痛');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '睡眠性头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '钟表半侧头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '觉醒头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻至中度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '脑肿瘤'
MATCH (to) WHERE to.name = '觉醒头痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '高血压'
MATCH (to) WHERE to.name = '觉醒头痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #39
   Timestamp: 2024-12-18 09:55:58
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种强烈想活动双腿的疾病，伴有腿部不适'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '腿部的不舒适感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '强烈想活动腿'})
SET 
    n.description = coalesce(n.description, '强烈想活动腿部的欲望'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡的困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '日间疲乏'})
SET 
    n.description = coalesce(n.description, '白天感到疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '日间');

MERGE (n:Examination {name: '电生理检查'})
SET 
    n.description = coalesce(n.description, '用于检测腿部运动症状的检查'),
    n.method = coalesce(n.method, '电生理检测'),
    n.requirement = coalesce(n.requirement, '无特殊要求');

MERGE (n:Complication {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '由于不宁腿综合征导致的睡眠问题'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '强烈想活动腿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '日间疲乏'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '电生理检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.85),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #40
   Timestamp: 2024-12-18 09:55:58
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.code = coalesce(n.code, 'PD'),
    n.description = coalesce(n.description, '一种神经系统疾病，主要特征为运动障碍'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠维持困难，夜间觉醒频繁'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '通常伴有下肢不适、痛感等症状，导致入睡困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者白天感到过度困倦，可能在不适合的情况下入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '快速眼球运动睡眠期行为紊乱'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期间的不正常行为，如运动异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Complication {name: '运动波动'})
SET 
    n.description = coalesce(n.description, '患者夜间运动波动，影响睡眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '患者可能在睡眠和清醒状态下出现幻觉'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '运动波动'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #41
   Timestamp: 2024-12-18 09:56:00
*/
// 节点更新
MERGE (n:Disease {name: '癫痫'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '原发性睡眠障碍'});

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Symptom {name: '夜间觉醒'});

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, 'excessive daytime sleepiness'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '癫痫发作'})
SET 
    n.description = coalesce(n.description, '癫痫引起的发作'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠片段化'})
SET 
    n.description = coalesce(n.description, '睡眠的片段化'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '记录多项生理指标的检查'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '晚上进行');

MERGE (n:Examination {name: '脑电图'})
SET 
    n.description = coalesce(n.description, '记录大脑神经元放电的检查'),
    n.method = coalesce(n.method, 'EEG'),
    n.requirement = coalesce(n.requirement, '必要');

MERGE (n:NonDrugTreatment {name: 'CPAP'})
SET 
    n.description = coalesce(n.description, '用于治疗OSA的持续气道正压通气仪'),
    n.duration = coalesce(n.duration, '持续使用'),
    n.frequency = coalesce(n.frequency, '根据需要');

MERGE (n:DrugTreatment {name: '苯二氮草类药物'})
SET 
    n.description = coalesce(n.description, '用于治疗失眠的药物'),
    n.dosage = coalesce(n.dosage, '遵医嘱'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '长期');

// 关系更新
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
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '癫痫发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '脑电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'CPAP'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '癫痫'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '睡眠片段化'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '维护');

MATCH (from) WHERE from.name = '夜间觉醒'
MATCH (to) WHERE to.name = '癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '高度');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '癫痫发作'
MATCH (to) WHERE to.name = '癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '极重');



// =====================================

/* Response #42
   Timestamp: 2024-12-18 09:56:01
*/
// 节点更新
MERGE (n:Disease {name: '致死性失眠'})
SET 
    n.description = coalesce(n.description, '目前尚无有效的治疗方法。不管药物还是非药物治疗,致死性失眠的疗效很不理想。');

MERGE (n:Disease {name: '广泛性焦虑障碍'})
SET 
    n.description = coalesce(n.description, '以持续的显著紧张不安、伴有自主神经功能兴奋和过分警觉为特征的一种慢性焦虑障碍。');

MERGE (n:Disease {name: '惊恐障碍'})
SET 
    n.description = coalesce(n.description, '主要特征是反复出现不可预测和突发的惊恐发作。');

MERGE (n:Disease {name: '社交焦虑障碍'})
SET 
    n.description = coalesce(n.description, '表现为对社交场合和人际接触的过分担心、紧张和害怕。');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难或无法维持睡眠。');

MERGE (n:Symptom {name: '夜间惊恐发作'})
SET 
    n.description = coalesce(n.description, '在睡眠中经历强烈恐惧和不适。');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '对日常生活的问题过分担心和烦恼。');

MERGE (n:Treatment {name: '苯二氮草类药物'})
SET 
    n.description = coalesce(n.description, '最常用的抗焦虑药物，具有良好的抗焦虑作用。');

MERGE (n:Treatment {name: '认知行为治疗'})
SET 
    n.description = coalesce(n.description, '帮助患者找回安全感，减少害怕。');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.description = coalesce(n.description, '包括心理治疗和睡眠卫生指导等。');

MERGE (n:Treatment {name: '镇静催眠药物'})
SET 
    n.description = coalesce(n.description, '用于快速诱导和延长睡眠时间的药物。');

MERGE (n:Complication {name: '肺部感染'})
SET 
    n.description = coalesce(n.description, '常见死因，致死性失眠患者易感染。');

MERGE (n:Complication {name: '呼吸衰竭'})
SET 
    n.description = coalesce(n.description, '由于病理性的周期性呼吸导致。');

MERGE (n:Complication {name: '药物依赖'})
SET 
    n.description = coalesce(n.description, '长期使用苯二氮草类药物可能导致依赖问题。');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '致死性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间惊恐发作'
MATCH (to) WHERE to.name = '惊恐障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '广泛性焦虑障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '社交焦虑障碍'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '肺部感染'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 1.0),
    r.timeframe = coalesce(r.timeframe, '8-72个月内');

MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '呼吸衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '间接');

MATCH (from) WHERE from.name = '苯二氮草类药物'
MATCH (to) WHERE to.name = '药物依赖'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #43
   Timestamp: 2024-12-18 09:56:02
*/
// 节点更新
MERGE (n:Disease {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.code = coalesce(n.code, 'CRSWD'),
    n.description = coalesce(n.description, '因昼夜时间维持与诱导系统变化或内源性昼夜节律与外部环境间不同步所引起的各种睡眠觉醒障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '睡眠觉醒时相延迟障碍'})
SET 
    n.code = coalesce(n.code, 'DSWPD'),
    n.description = coalesce(n.description, '慢性睡眠紊乱, 患者睡眠觉醒时间通常推迟≥2小时'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '睡眠觉醒时相提前障碍'})
SET 
    n.code = coalesce(n.code, 'ASWPD'),
    n.description = coalesce(n.description, '睡眠觉醒时间较预期的时间显著提前'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '非24小时睡眠觉醒节律障碍'})
SET 
    n.code = coalesce(n.code, 'N24SWD'),
    n.description = coalesce(n.description, '昼夜节律时间与外部环境失调'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '不规律睡眠觉醒节律障碍'})
SET 
    n.code = coalesce(n.code, 'ISWRD'),
    n.description = coalesce(n.description, '睡眠觉醒节律无规律性变化'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '时差变化睡眠障碍'})
SET 
    n.code = coalesce(n.code, 'JLD'),
    n.description = coalesce(n.description, '因时差导致的睡眠困扰'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '倒班工作睡眠觉醒障碍'})
SET 
    n.code = coalesce(n.code, 'SWSWD'),
    n.description = coalesce(n.description, '因倒班工作导致的睡眠问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '非特殊昼夜节律性睡眠觉醒紊乱'})
SET 
    n.code = coalesce(n.code, 'NOS'),
    n.description = coalesce(n.description, '临床特征不符合任何一种类型分类定义的患者'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '患者难以在期望的时间入睡'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频发');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '患者在夜间醒来后难以再次入睡'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频发');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频发');

MERGE (n:Symptom {name: '晨醒困难'})
SET 
    n.description = coalesce(n.description, '患者早晨醒来时感到疲倦'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频发');

MERGE (n:Symptom {name: '情绪紊乱'})
SET 
    n.description = coalesce(n.description, '患者情绪状态不稳定，常有抑郁症状'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频发');

// 关系更新
MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.83),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.83),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.83),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '晨醒困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.83),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '情绪紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.83),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #44
   Timestamp: 2024-12-18 09:56:02
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种睡眠障碍表现为呼吸反复中断'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '卒中'})
SET 
    n.code = coalesce(n.code, 'Stroke'),
    n.description = coalesce(n.description, '脑部血液供应受阻'),
    n.category = coalesce(n.category, '脑血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '习惯性打鼾'})
SET 
    n.description = coalesce(n.description, '持续的睡眠中发出的声音'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠过程中呼吸暂时停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '不规律');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或夜间频繁觉醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '疲乏'})
SET 
    n.description = coalesce(n.description, '感到身体疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '头部疼痛'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '心悸'})
SET 
    n.description = coalesce(n.description, '心跳加速或不规律'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '血压持续升高'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '血糖异常'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '冠心病'})
SET 
    n.description = coalesce(n.description, '心脏病的一种，因冠状动脉狭窄引起'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '心力衰竭'})
SET 
    n.description = coalesce(n.description, '心脏无法有效泵血'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 50.0),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '习惯性打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '疲乏'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '心悸'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.55),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #45
   Timestamp: 2024-12-18 09:56:03
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种以阻塞上气道引起的睡眠呼吸暂停为特征的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '心力衰竭'})
SET 
    n.code = coalesce(n.code, 'CHF'),
    n.description = coalesce(n.description, '一种因心脏功能不足导致的全身性疾病'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '呼吸时感到困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '夜间端坐呼吸'})
SET 
    n.description = coalesce(n.description, '夜间坐起呼吸缓解的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '咳粉红色泡沫样痰'})
SET 
    n.description = coalesce(n.description, '含有血泡的痰'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到无力和困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '夜间端坐呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '咳粉红色泡沫样痰'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #46
   Timestamp: 2024-12-18 09:56:06
*/
// 节点更新
MERGE (n:Disease {name: '抑郁障碍'})
SET 
    n.code = coalesce(n.code, 'F32'),
    n.description = coalesce(n.description, '一大类抑郁性情绪障碍，包括重性抑郁障碍、持续抑郁障碍等。'),
    n.category = coalesce(n.category, '心理障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '重性抑郁障碍'})
SET 
    n.code = coalesce(n.code, 'F32.2'),
    n.description = coalesce(n.description, '其核心症状包括情绪低落、兴趣缺乏和快感缺失。'),
    n.category = coalesce(n.category, '心理障碍'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Disease {name: '抑郁相关性睡眠障碍'})
SET 
    n.code = coalesce(n.code, 'F34.0'),
    n.description = coalesce(n.description, '由重性抑郁障碍引起的睡眠紊乱。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难、睡眠维持困难、早醒或睡眠未恢复精神。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '过度睡眠'})
SET 
    n.description = coalesce(n.description, '几乎每天睡眠时间超过9小时。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '梦魔'})
SET 
    n.description = coalesce(n.description, '噩梦频发，伴有明显焦虑色彩。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '认知功能下降'})
SET 
    n.description = coalesce(n.description, '记忆力减退、注意力分散、思维缓慢。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '情绪状态的紧张和忧虑。'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Complication {name: '自杀企图'})
SET 
    n.description = coalesce(n.description, '表现为反复想到死。'),
    n.severity = coalesce(n.severity, '重度');

// 关系更新
MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '抑郁相关性睡眠障碍'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '梦魔'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '认知功能下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '抑郁相关性睡眠障碍'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '抑郁相关性睡眠障碍'
MATCH (to) WHERE to.name = '自杀企图'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '急性期');

MATCH (from) WHERE from.name = '重性抑郁障碍'
MATCH (to) WHERE to.name = '抑郁相关性睡眠障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '抑郁障碍'
MATCH (to) WHERE to.name = '重性抑郁障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');



// =====================================

/* Response #47
   Timestamp: 2024-12-18 09:56:06
*/
// 节点更新
MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.code = coalesce(n.code, 'COPD');

MERGE (n:Disease {name: '哮喘'})
SET 
    n.code = coalesce(n.code, 'Asthma');

MERGE (n:Disease {name: '心血管疾病'})
SET 
    n.code = coalesce(n.code, 'Cardiovascular Diseases');

MERGE (n:Symptom {name: '低氧血症'})
SET 
    n.description = coalesce(n.description, '血氧饱和度低于正常范围'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '感到气促或呼吸不畅'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量下降或难以入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '咳嗽'})
SET 
    n.description = coalesce(n.description, '反复咳嗽'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '气短'})
SET 
    n.description = coalesce(n.description, '感到呼吸急促'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '肺功能测定'})
SET 
    n.description = coalesce(n.description, '用于检查肺部功能'),
    n.method = coalesce(n.method, ' spirometry'),
    n.requirement = coalesce(n.requirement, '需要患者配合');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于分析睡眠周期及呼吸状态'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '需在监测中心检查');

MERGE (n:Complication {name: '呼吸衰竭'})
SET 
    n.description = coalesce(n.description, '因严重低氧导致的呼吸功能衰竭'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Complication {name: '心肌缺血'})
SET 
    n.description = coalesce(n.description, '心肌供血不足'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Complication {name: '心律失常'})
SET 
    n.description = coalesce(n.description, '心脏节律失常'),
    n.severity = coalesce(n.severity, '重度');

// 关系更新
MATCH (from) WHERE from.name = '低氧血症'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '反复'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '呼吸困难'
MATCH (to) WHERE to.name = '慢性阻塞性肺疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '咳嗽'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '反复'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '气短'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '肺功能测定'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '哮喘'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '呼吸衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '哮喘'
MATCH (to) WHERE to.name = '心肌缺血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '心血管疾病'
MATCH (to) WHERE to.name = '心律失常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '瞬时');



// =====================================

/* Response #48
   Timestamp: 2024-12-18 09:56:06
*/
// 节点更新
MERGE (n:Disease {name: '纤维肌痛'})
SET 
    n.description = coalesce(n.description, '一种以慢性疼痛和睡眠障碍为特征的疾病');

MERGE (n:Disease {name: '慢性疲劳综合征'})
SET 
    n.description = coalesce(n.description, '一种以持续疲劳为主要特征的疾病');

MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '一种睡眠时呼吸反复暂停的疾病');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种导致坐立不安、强烈的腿部运动需求的疾病');

MERGE (n:NonDrugTreatment {name: '非药物治疗'})
SET 
    n.description = coalesce(n.description, '促进患者良好睡眠的多种方法');

MERGE (n:DrugTreatment {name: '普瑞巴林'})
SET 
    n.description = coalesce(n.description, '用于缓解纤维肌痛患者疼痛和改善睡眠的药物');

MERGE (n:DrugTreatment {name: '度洛西汀'})
SET 
    n.description = coalesce(n.description, '用于改善疼痛和情绪的药物');

MERGE (n:DrugTreatment {name: '米那普仑'})
SET 
    n.description = coalesce(n.description, '用于缓解纤维肌痛患者疼痛和改善睡眠的药物');

MERGE (n:DrugTreatment {name: '阿米替林'})
SET 
    n.description = coalesce(n.description, '三环类抗抑郁药，可改善睡眠质量');

MERGE (n:DrugTreatment {name: '加巴喷丁'})
SET 
    n.description = coalesce(n.description, '抗癫痫药，改善疼痛和情绪症状');

MERGE (n:DrugTreatment {name: '羟丁酸钠'})
SET 
    n.description = coalesce(n.description, '可减少疼痛、缓解疲劳并改善睡眠质量的药物');

// 关系更新
MATCH (from) WHERE from.name = '非药物治疗'
MATCH (to) WHERE to.name = '纤维肌痛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '普瑞巴林'
MATCH (to) WHERE to.name = '纤维肌痛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '全程');

MATCH (from) WHERE from.name = '度洛西汀'
MATCH (to) WHERE to.name = '纤维肌痛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '短期');

MATCH (from) WHERE from.name = '米那普仑'
MATCH (to) WHERE to.name = '纤维肌痛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '全程');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '慢性疲劳综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '普瑞巴林'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '度洛西汀'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '米那普仑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '阿米替林'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '羟丁酸钠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '重度');



// =====================================

/* Response #49
   Timestamp: 2024-12-18 09:56:08
*/
// 节点更新
MERGE (n:Disease {name: '精神分裂症'})
SET 
    n.code = coalesce(n.code, 'SCZ'),
    n.description = coalesce(n.description, '一组病因未明的精神疾病，临床上可表现为思维、情感、行为等多方面的障碍以及精神活动的不协调。'),
    n.category = coalesce(n.category, '精神疾病'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '精神分裂症常见的临床症状，可能表现为失眠、睡眠与觉醒颠倒等。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '严重失眠'})
SET 
    n.description = coalesce(n.description, '在严重的精神病活动期，患者往往出现严重失眠或完全丧失睡眠。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.description = coalesce(n.description, '在精神激越症状减轻阶段，失眠特征表现为睡眠潜伏期延长。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '总睡眠时间减少'})
SET 
    n.description = coalesce(n.description, '患者在激越症状减轻阶段常常表现为总睡眠时间减少。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '片段睡眠'})
SET 
    n.description = coalesce(n.description, '由于反复觉醒而表现为片段睡眠。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '人睡前幻觉'})
SET 
    n.description = coalesce(n.description, '患者还可体验到明显的人睡前幻觉。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '做噩梦'})
SET 
    n.description = coalesce(n.description, '多数患者做噩梦。'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '主观睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '接受药物治疗且处于病情稳定期的患者，主观睡眠紊乱普遍。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'PSG'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查显示患者睡眠状况，通常显示卧床时间长但总睡眠时间短，总觉醒时间长。'),
    n.method = coalesce(n.method, '多导睡眠图监测'),
    n.requirement = coalesce(n.requirement, '专业设备');

MERGE (n:Treatment {name: '抗精神病治疗'})
SET 
    n.description = coalesce(n.description, '主要针对精神分裂症睡眠障碍治疗，使用抗精神病药物。'),
    n.effectiveness = coalesce(n.effectiveness, '0.9'),
    n.priority = coalesce(n.priority, '高'),
    n.stage = coalesce(n.stage, '急性期');

MERGE (n:Complication {name: '睡眠障碍")'})
SET 
    n.description = coalesce(n.description, '睡眠障碍对精神分裂症患者的影响。'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:RiskFactor {name: '年龄大'})
SET 
    n.description = coalesce(n.description, '与精神分裂症相关性睡眠障碍风险因素之一。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '发病晚'})
SET 
    n.description = coalesce(n.description, '较晚发病的个体更易出现睡眠障碍。'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '未用抗精神病药物治疗'})
SET 
    n.description = coalesce(n.description, '未接受抗精神病药物治疗的患者更易出现睡眠障碍。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '严重阳性症状'})
SET 
    n.description = coalesce(n.description, '存在严重阳性症状的患者，睡眠障碍风险较高。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '焦虑或抑郁症状'})
SET 
    n.description = coalesce(n.description, '合并焦虑或抑郁症状的患者，睡眠障碍更为常见。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '高频率使用苯二氮草类催眠药'})
SET 
    n.description = coalesce(n.description, '患者较高频率使用苯二氮草类催眠药的风险因素。'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '非常频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '严重失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '睡眠潜伏期延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '总睡眠时间减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '片段睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '人睡前幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '做噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '主观睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '抗精神病治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '睡眠障碍")'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '年龄大'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '发病晚'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '未用抗精神病药物治疗'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '严重阳性症状'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '焦虑或抑郁症状'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '精神分裂症'
MATCH (to) WHERE to.name = '高频率使用苯二氮草类催眠药'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

/* Response #50
   Timestamp: 2024-12-18 09:56:09
*/
// 节点更新
MERGE (n:Disease {name: '酒精使用障碍'})
SET 
    n.description = coalesce(n.description, '与酒精的使用、滥用相关的疾病'),
    n.category = coalesce(n.category, '精神疾病');

MERGE (n:Disease {name: '咖啡因相关性障碍'})
SET 
    n.description = coalesce(n.description, '与咖啡因滥用相关的疾病'),
    n.category = coalesce(n.category, '精神疾病');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠期间发生呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '慢性阻塞性肺疾病'})
SET 
    n.description = coalesce(n.description, '表现为持续的呼吸困难'),
    n.category = coalesce(n.category, '呼吸系统疾病');

MERGE (n:Symptom {name: '睡眠潜伏期缩短'})
SET 
    n.description = coalesce(n.description, '入睡所需的时间减少');

MERGE (n:Symptom {name: 'REM睡眠减少'})
SET 
    n.description = coalesce(n.description, '快速眼动睡眠的时间减少');

MERGE (n:Symptom {name: '睡眠表浅'})
SET 
    n.description = coalesce(n.description, '睡眠质量差');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到极度困倦');

MERGE (n:Symptom {name: '晚上觉醒'})
SET 
    n.description = coalesce(n.description, '夜间频繁醒来');

MERGE (n:Symptom {name: '睡眠困难'})
SET 
    n.description = coalesce(n.description, '入睡困难或维持睡眠困难');

MERGE (n:Complication {name: '心动过速'})
SET 
    n.description = coalesce(n.description, '心率异常增快'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '焦虑症状'})
SET 
    n.description = coalesce(n.description, '因酒精或咖啡因引起的焦虑'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '酒精摄入'})
SET 
    n.description = coalesce(n.description, '饮用酒精类饮品的习惯'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '咖啡因摄入'})
SET 
    n.description = coalesce(n.description, '饮用咖啡、茶等含咖啡因饮品的习惯'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '吸烟'})
SET 
    n.description = coalesce(n.description, '吸烟行为'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '睡眠潜伏期缩短'
MATCH (to) WHERE to.name = '酒精使用障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM睡眠减少'
MATCH (to) WHERE to.name = '酒精使用障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠表浅'
MATCH (to) WHERE to.name = '酒精使用障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '酒精使用障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '晚上觉醒'
MATCH (to) WHERE to.name = '酒精使用障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠困难'
MATCH (to) WHERE to.name = '酒精使用障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '酒精使用障碍'
MATCH (to) WHERE to.name = '心动过速'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长时间');

MATCH (from) WHERE from.name = '酒精使用障碍'
MATCH (to) WHERE to.name = '焦虑症状'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长时间');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '心动过速'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '中等');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '焦虑症状'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '中等');

MATCH (from) WHERE from.name = '酒精使用障碍'
MATCH (to) WHERE to.name = '酒精摄入'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '酒精使用障碍'
MATCH (to) WHERE to.name = '咖啡因摄入'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '酒精使用障碍'
MATCH (to) WHERE to.name = '吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '弱');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '咖啡因摄入'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '酒精摄入'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '慢性阻塞性肺疾病'
MATCH (to) WHERE to.name = '吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

/* Response #51
   Timestamp: 2024-12-18 09:56:14
*/
// 节点更新
MERGE (n:Disease {name: '胃食管反流病'});

MERGE (n:Symptom {name: '反复呕吐'});

MERGE (n:Symptom {name: '咽下困难'});

MERGE (n:Symptom {name: '慢性呼吸道感染'});

MERGE (n:Symptom {name: '难治性哮喘'});

MERGE (n:Symptom {name: '生长发育迟缓'});

MERGE (n:Symptom {name: '反复出现室息'});

MERGE (n:Symptom {name: '多种类型的睡眠障碍'});

MERGE (n:Symptom {name: '睡眠呼吸暂停'});

MERGE (n:DrugTreatment {name: 'H2受体阻断剂'})
SET 
    n.description = coalesce(n.description, '抑制胃酸分泌'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '根据医生处方'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:DrugTreatment {name: '质子泵抑制剂'})
SET 
    n.description = coalesce(n.description, '强效抑制胃酸分泌'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '根据医生处方'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:DrugTreatment {name: '促动力药'})
SET 
    n.description = coalesce(n.description, '改善胃肠动力'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '根据医生处方'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:DrugTreatment {name: '黏膜保护剂'})
SET 
    n.description = coalesce(n.description, '保护胃肠黏膜'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '根据医生处方'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Complication {name: '食管炎'})
SET 
    n.description = coalesce(n.description, '食管黏膜发炎'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '食管狭窄'})
SET 
    n.description = coalesce(n.description, '食管腔的狭窄'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '食管溃疡'})
SET 
    n.description = coalesce(n.description, '食管上皮破损'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重过重，增加反流风险'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '吸烟'})
SET 
    n.description = coalesce(n.description, '吸烟增加食管逆流'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '饮酒'})
SET 
    n.description = coalesce(n.description, '饮酒可导致反流'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:Disease {name: '糖尿病'});

MERGE (n:Symptom {name: '失眠'});

MERGE (n:Symptom {name: 'OSA'});

MERGE (n:Symptom {name: '周期性肢体运动障碍'});

MERGE (n:Disease {name: '甲状腺功能亢进症'});

MERGE (n:Symptom {name: '焦虑'});

MERGE (n:Symptom {name: '失眠'});

MERGE (n:Disease {name: '甲状腺功能减退症'});

MERGE (n:Symptom {name: '日间思睡'});

MERGE (n:Symptom {name: '低能量疲劳'});

// 关系更新
MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '反复呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '咽下困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '慢性呼吸道感染'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '难治性哮喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '生长发育迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '反复出现室息'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '多种类型的睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = 'H2受体阻断剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '质子泵抑制剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '促动力药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '黏膜保护剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '食管炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '食管狭窄'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '食管溃疡'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '适中');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '饮酒'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '适中');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = 'OSA'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '食管炎'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '食管狭窄'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.85),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '甲状腺功能亢进症'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '甲状腺功能亢进症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '低能量疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #52
   Timestamp: 2024-12-18 16:48:13
*/
// 节点更新


// =====================================

