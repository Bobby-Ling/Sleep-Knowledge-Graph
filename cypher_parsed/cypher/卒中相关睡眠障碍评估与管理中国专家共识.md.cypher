// File: 卒中相关睡眠障碍评估与管理中国专家共识.md
// Processed at: 2024-12-12 01:56:49
// Total pairs: 28

/* Response #1
   Timestamp: 2024-12-12 01:55:58
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:56:01
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与卒中相关的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '通过多个通道监测睡眠状态的检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '需在医疗机构进行');

MERGE (n:Examination {name: '睡眠问卷调查'})
SET 
    n.description = coalesce(n.description, '通过问卷评估患者睡眠状态的检查'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '患者自评');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠问卷调查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:56:05
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '卒中后常见症状，临床多见却易被忽视。合并睡眠障碍会影响预后。');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或睡眠不深，影响休息和生活质量。');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天过度嗜睡，影响日常活动。');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠中呼吸不规律，可以导致缺氧。');

MERGE (n:Symptom {name: '快速眼动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '在快速眼动睡眠阶段表现出梦中行为。');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '静止状态下有无法抑制的腿部不适感。');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '睡眠中出现周期性运动的现象。');

MERGE (n:Symptom {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.description = coalesce(n.description, '睡眠和觉醒的周期与正常节律失调。');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '快速眼动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '不太常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:56:07
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '卒中后首次出现或卒中前已有的睡眠障碍在卒中后持续存在或加重，并达到睡眠障碍诊断标准的一组临床综合征');

MERGE (n:Disease {name: '短暂性脑缺血发作'})
SET 
    n.short_name = coalesce(n.short_name, 'TIA');

MERGE (n:Disease {name: '脑梗死'});

MERGE (n:Disease {name: '脑出血'});

MERGE (n:Symptom {name: '失眠'});

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, 'excessive daytime sleepiness'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, 'sleep disordered breathing');

MERGE (n:Symptom {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '中枢性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'CSA');

MERGE (n:Symptom {name: '混合性睡眠呼吸暂停'});

MERGE (n:Symptom {name: '快速眼动睡眠期行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '睡眠中周期性肢体运动'})
SET 
    n.short_name = coalesce(n.short_name, 'PLMS');

MERGE (n:Symptom {name: '昼夜节律失调性睡眠-觉醒障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'CRSWDs');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '比较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '混合性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '快速眼动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '比较少见'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠中周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '较少见'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠-觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '较少见'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '短暂性脑缺血发作'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '脑出血'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:56:07
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'SSD');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或保持睡眠的状态');

MERGE (n:Symptom {name: '过度日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦的状态');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸反复暂停的状态');

MERGE (n:Symptom {name: '快速眼动睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, '在快速眼动睡眠阶段表现出异常的体动作');

MERGE (n:Symptom {name: '不安腿综合症/周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '在静止状态时出现腿部不适和运动的症状');

MERGE (n:Symptom {name: '昼夜节律睡眠觉醒障碍'})
SET 
    n.description = coalesce(n.description, '生理节律与睡眠模式不协调的状态');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '过度日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '不安腿综合症/周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '昼夜节律睡眠觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:56:08
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.code = coalesce(n.code, 'SSD');

MERGE (n:Disease {name: '卒中'})
SET 
    n.code = coalesce(n.code, 'CVA');

MERGE (n:RiskFactor {name: '高血压'})
SET 
    n.description = coalesce(n.description, '一种常见的慢性疾病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '一种影响身体处理血糖的疾病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '饮酒'})
SET 
    n.description = coalesce(n.description, '过量饮酒可能导致多种健康问题'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '习惯性打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时反复发出打鼾声，可能与睡眠质量相关'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '皮质型卒中'})
SET 
    n.description = coalesce(n.description, '由脑皮质病变引起的卒中类型'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '重要'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '重要'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '饮酒'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '习惯性打鼾'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '皮质型卒中'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '重要'),
    r.evidence_level = coalesce(r.evidence_level, '高');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:56:10
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与卒中相关的睡眠障碍，包括失眠、RLS/PLMS、EDS等'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: 'RLS/PLMS'})
SET 
    n.description = coalesce(n.description, '静止时腿部不适和周期性肢体运动综合症'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '过度白天嗜睡的状态'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '卒中'})
SET 
    n.description = coalesce(n.description, '脑部血液供应受阻导致的疾病'),
    n.category = coalesce(n.category, '脑血管疾病');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = 'RLS/PLMS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '可能'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '卒中相关睡眠障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:56:11
*/
// 节点更新
MERGE (n:Disease {name: '缺血性卒中'});

MERGE (n:Disease {name: '脑梗死'});

MERGE (n:Disease {name: '短暂性脑缺血发作'});

MERGE (n:Disease {name: '脑出血'});

MERGE (n:Symptom {name: '睡眠障碍'});

MERGE (n:Symptom {name: '失眠'});

MERGE (n:Symptom {name: '睡眠增多'});

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '周期性肢体运动'});

MERGE (n:Symptom {name: '异态睡眠'});

MERGE (n:Symptom {name: '快速眼动期睡眠行为异常'});

MERGE (n:Symptom {name: '快速眼动期睡眠行为障碍'});

// 关系更新
MATCH (from) WHERE from.name = '缺血性卒中'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '缺血性卒中'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '缺血性卒中'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '缺血性卒中'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '缺血性卒中'
MATCH (to) WHERE to.name = '睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '脑梗死'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.83),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '短暂性脑缺血发作'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '脑出血'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:56:11
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关失眠'})
SET 
    n.description = coalesce(n.description, '与卒中相关的睡眠障碍');

MERGE (n:Treatment {name: '百乐眠胶囊'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种中成药物，针对卒中急性期失眠有效'),
    n.dosage = coalesce(n.dosage, '每次4粒, 2次/天'),
    n.duration = coalesce(n.duration, '根据需求'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '针灸治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对卒中相关失眠的针灸疗法'),
    n.dosage = coalesce(n.dosage, '根据需求'),
    n.duration = coalesce(n.duration, '根据需求'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '经颅磁刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于治疗卒中相关失眠的经颅磁刺激疗法'),
    n.dosage = coalesce(n.dosage, '根据需求'),
    n.duration = coalesce(n.duration, '根据需求'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '百乐眠胶囊'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '针灸治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性期');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:56:14
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种在睡眠过程中反复出现呼吸暂停或呼吸减弱的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '卒中'})
SET 
    n.code = coalesce(n.code, 'STROKE'),
    n.description = coalesce(n.description, '脑部血液供应中断导致的功能障碍'),
    n.category = coalesce(n.category, '脑血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Examination {name: '便携式睡眠呼吸监测装置'})
SET 
    n.description = coalesce(n.description, '用于评估患者睡眠过程中的呼吸情况'),
    n.method = coalesce(n.method, '便携式监测'),
    n.requirement = coalesce(n.requirement, '适用于高危OSA患者');

MERGE (n:Examination {name: 'SDB问卷'})
SET 
    n.description = coalesce(n.description, '通过问卷调查评估患者睡眠呼吸情况'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '自填问卷');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于检测睡眠过程中的生理参数'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '临床监测');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '便携式睡眠呼吸监测装置'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'SDB问卷'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:56:15
*/
// 节点更新
MERGE (n:Disease {name: '卒中'})
SET 
    n.code = coalesce(n.code, 'Stroke');

MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Symptom {name: '复杂运动行为'})
SET 
    n.description = coalesce(n.description, '卒中患者睡眠中出现复杂运动行为'),
    n.severity = coalesce(n.severity, '不明确'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '卒中严重程度'})
SET 
    n.description = coalesce(n.description, '卒中的严重程度对诊断有影响'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '不定期');

// 关系更新
MATCH (from) WHERE from.name = '复杂运动行为'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '复杂运动行为'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '卒中严重程度'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:56:18
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关失眠'})
SET 
    n.short_name = coalesce(n.short_name, '卒中失眠');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难，无法入睡或维持睡眠的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '通过药物改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '根据病情而定'),
    n.contraindication = coalesce(n.contraindication, '对药物成分过敏');

MERGE (n:Treatment {name: '认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过心理干预改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '不适用'),
    n.duration = coalesce(n.duration, '根据治疗方案而定'),
    n.contraindication = coalesce(n.contraindication, '对心理治疗有禁忌');

MERGE (n:Treatment {name: '睡眠健康教育'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '提供睡眠卫生与健康教育'),
    n.dosage = coalesce(n.dosage, '不适用'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Scale {name: '匹兹堡睡眠质量指数'})
SET 
    n.description = coalesce(n.description, '评估患者睡眠质量的量表'),
    n.score_range = coalesce(n.score_range, '0-21'),
    n.interpretation = coalesce(n.interpretation, '分数越高，睡眠质量越差');

MERGE (n:Complication {name: '药物依赖'})
SET 
    n.description = coalesce(n.description, '因长期使用药物导致的依赖性'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '卒中相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '所有阶段');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗中');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '睡眠健康教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '预防');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '匹兹堡睡眠质量指数'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '强烈推荐');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '药物依赖'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:56:21
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.short_name = coalesce(n.short_name, '卒中睡眠障碍');

MERGE (n:Disease {name: '阻塞性睡眠 apnea'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '轻-中度阻塞性睡眠 apnea'})
SET 
    n.short_name = coalesce(n.short_name, '轻-中度OSA');

MERGE (n:Disease {name: '体位性阻塞性睡眠 apnea'})
SET 
    n.short_name = coalesce(n.short_name, '体位性OSA');

MERGE (n:Treatment {name: '体位干预治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过改变体位来改善睡眠呼吸障碍'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '持续正压通气治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用CPAP设备维持呼吸道开放'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠过程中出现的短暂呼吸中断'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测以评估睡眠质量'),
    n.method = coalesce(n.method, '多导睡眠记录'),
    n.requirement = coalesce(n.requirement, '在睡眠中心进行');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠 apnea'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '轻-中度阻塞性睡眠 apnea'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '体位性阻塞性睡眠 apnea'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '持续正压通气治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '体位干预治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '恢复');

MATCH (from) WHERE from.name = '阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.75),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '体位性阻塞性睡眠 apnea'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:56:21
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关过度嗜睡症'})
SET 
    n.short_name = coalesce(n.short_name, 'EDS');

MERGE (n:Examination {name: 'Epworth Sleepiness Scale'})
SET 
    n.short_name = coalesce(n.short_name, 'ESS');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.short_name = coalesce(n.short_name, 'PSG');

MERGE (n:Examination {name: '维持觉醒时间试验'})
SET 
    n.short_name = coalesce(n.short_name, 'MSLT');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关过度嗜睡症'
MATCH (to) WHERE to.name = 'Epworth Sleepiness Scale'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中相关过度嗜睡症'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中相关过度嗜睡症'
MATCH (to) WHERE to.name = '维持觉醒时间试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:56:21
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关RBD'})
SET 
    n.description = coalesce(n.description, '卒中相关快速眼动睡眠行为障碍');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '治疗RBD的有效药物'),
    n.dosage = coalesce(n.dosage, '睡前服用'),
    n.contraindication = coalesce(n.contraindication, '对氯硝西泮不能耐受或禁忌的患者');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '对痴呆或步态异常患者的安全替代药');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括优化卧室环境、减少伤害风险');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关RBD'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '标准治疗');

MATCH (from) WHERE from.name = '卒中相关RBD'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '标准治疗');

MATCH (from) WHERE from.name = '卒中相关RBD'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '标准治疗');

MATCH (from) WHERE from.name = '卒中相关RBD'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:56:24
*/
// 节点更新
MERGE (n:Disease {name: '卒中'})
SET 
    n.code = coalesce(n.code, 'I63');

MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'G47.0');

MERGE (n:Symptom {name: '入睡困难'});

MERGE (n:Symptom {name: '睡眠维持困难'});

MERGE (n:Symptom {name: '疲劳或缺乏精力'});

MERGE (n:Symptom {name: '注意力下降'});

MERGE (n:Symptom {name: '情绪易烦躁'});

MERGE (n:Symptom {name: '日间思睡'});

MERGE (n:Symptom {name: '行为问题'});

MERGE (n:Symptom {name: '对睡眠质量感到忧虑'});

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '睡眠维持困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '疲劳或缺乏精力'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '注意力下降'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '情绪易烦躁'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '行为问题'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '对睡眠质量感到忧虑'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0);

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:56:29
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '卒中相关快速眼动行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Treatment {name: 'CPAP'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '持续气道正压通气');

MERGE (n:Treatment {name: '睡眠体位指导'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '指导患者选择适合的睡眠姿势');

MERGE (n:Treatment {name: '有创辅助通气治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '临床情况需要的有创辅助通气');

MERGE (n:Treatment {name: '生活方式指导'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '减重、戒烟、戒酒等生活方式指导');

MERGE (n:Symptom {name: '缺氧'});

MERGE (n:Symptom {name: '频繁呼吸暂停'});

MERGE (n:Symptom {name: '睡眠相关发声'});

MERGE (n:Symptom {name: '复杂动作'});

MERGE (n:Symptom {name: 'REM睡眠期无肌张力缺失'});

// 关系更新
MATCH (from) WHERE from.name = '卒中相关阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'CPAP'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '卒中相关阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠体位指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '卒中相关阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '有创辅助通气治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '卒中相关阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '生活方式指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '恢复期');

MATCH (from) WHERE from.name = '缺氧'
MATCH (to) WHERE to.name = '卒中相关阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '频繁呼吸暂停'
MATCH (to) WHERE to.name = '卒中相关阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '睡眠相关发声'
MATCH (to) WHERE to.name = '卒中相关快速眼动行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '复杂动作'
MATCH (to) WHERE to.name = '卒中相关快速眼动行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = 'REM睡眠期无肌张力缺失'
MATCH (to) WHERE to.name = '卒中相关快速眼动行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:56:30
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关RBD'})
SET 
    n.description = coalesce(n.description, '与卒中患者相关的快速眼动期睡眠行为障碍');

MERGE (n:Disease {name: '卒中相关日间思睡'})
SET 
    n.description = coalesce(n.description, '卒中患者的日间过度嗜睡');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在白天感到极度困倦或不由自主地入睡');

MERGE (n:Symptom {name: '非预期的白天入睡'})
SET 
    n.description = coalesce(n.description, '在白天出现未预期的入睡情况');

MERGE (n:Symptom {name: '难以克制的困倦欲睡'})
SET 
    n.description = coalesce(n.description, '患者感到无法抵挡的睡意');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '安全的睡眠环境、规律作息时间、避免兴奋性药物');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可酌情选择治疗RBD的常用药物'),
    n.contraindication = coalesce(n.contraindication, '需权衡获益与风险');

// 关系更新
MATCH (from) WHERE from.name = '白天嗜睡'
MATCH (to) WHERE to.name = '卒中相关日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '非预期的白天入睡'
MATCH (to) WHERE to.name = '卒中相关日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '难以克制的困倦欲睡'
MATCH (to) WHERE to.name = '卒中相关日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关RBD'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首选');

MATCH (from) WHERE from.name = '卒中相关RBD'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '可选');

MATCH (from) WHERE from.name = '卒中相关日间思睡'
MATCH (to) WHERE to.name = '卒中相关RBD'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中相关日间思睡'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关日间思睡'
MATCH (to) WHERE to.name = '非预期的白天入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关日间思睡'
MATCH (to) WHERE to.name = '难以克制的困倦欲睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:56:30
*/
// 节点更新
MERGE (n:Disease {name: '卒中'})
SET 
    n.short_name = coalesce(n.short_name, 'Stroke');

MERGE (n:Symptom {name: '腿部不舒服'})
SET 
    n.description = coalesce(n.description, '患者在睡前感到的腿部不适'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: 'RLS'})
SET 
    n.description = coalesce(n.description, '静息时出现的腿部不适感'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: 'PLMS'})
SET 
    n.description = coalesce(n.description, '在睡眠过程中出现的腿部不自主运动'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Examination {name: 'RLS量表'})
SET 
    n.description = coalesce(n.description, '评估腿部不适的标准量表'),
    n.method = coalesce(n.method, '问卷'),
    n.requirement = coalesce(n.requirement, '患者需配合');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测法'),
    n.method = coalesce(n.method, '监测'),
    n.requirement = coalesce(n.requirement, '需要专业设备');

MERGE (n:Examination {name: '临床观察'})
SET 
    n.description = coalesce(n.description, '通过观察判断症状'),
    n.method = coalesce(n.method, '观察'),
    n.requirement = coalesce(n.requirement, '医务人员需专注');

// 关系更新
MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '腿部不舒服'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'RLS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'PLMS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'RLS量表'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '临床观察'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:56:32
*/
// 节点更新


// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:56:32
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '卒中相关不宁腿综合征'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中呼吸反复暂停或减弱'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '过度嗜睡综合征'})
SET 
    n.description = coalesce(n.description, '常表现为日间过度嗜睡'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Symptom {name: '强烈活动欲望'})
SET 
    n.description = coalesce(n.description, '有活动双下肢的强烈愿望，常伴随双下肢不适感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '不适感加重'})
SET 
    n.description = coalesce(n.description, '强烈的活动欲望及不适感在休息或不活动时加重'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '晚间加重'})
SET 
    n.description = coalesce(n.description, '强烈的活动欲望及不适感在傍晚或夜间加重'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '多巴胺类药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用多巴胺类药物可能获益'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '部分患者禁忌');

MERGE (n:Treatment {name: '高压氧治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '高压氧治疗可能获益'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '康复训练'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '康复训练可能获益'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关不宁腿综合征'
MATCH (to) WHERE to.name = '康复训练'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '过度嗜睡综合征'
MATCH (to) WHERE to.name = '多巴胺类药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '卒中相关不宁腿综合征'
MATCH (to) WHERE to.name = '强烈活动欲望'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关不宁腿综合征'
MATCH (to) WHERE to.name = '不适感加重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关不宁腿综合征'
MATCH (to) WHERE to.name = '晚间加重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关不宁腿综合征'
MATCH (to) WHERE to.name = '高压氧治疗'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:56:33
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关EDS'})
SET 
    n.description = coalesce(n.description, '卒中相关的 excessive daytime sleepiness (EDS)');

MERGE (n:Disease {name: '脑出血'});

MERGE (n:Disease {name: '双侧丘脑旁中央区梗死'});

MERGE (n:Disease {name: '肥胖'});

MERGE (n:Disease {name: '糖尿病'});

MERGE (n:Treatment {name: '多巴胺类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于改善精神状态及肢体运动功能'),
    n.dosage = coalesce(n.dosage, '依据具体病情'),
    n.duration = coalesce(n.duration, '持续疗程根据医嘱'),
    n.contraindication = coalesce(n.contraindication, '对多巴胺敏感者禁用');

MERGE (n:Treatment {name: '高压氧治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '提高血氧分压和氧含量以改善供氧'),
    n.dosage = coalesce(n.dosage, '依据具体情况'),
    n.duration = coalesce(n.duration, '依据治疗方案'),
    n.contraindication = coalesce(n.contraindication, '长期高压氧禁忌症');

MERGE (n:Treatment {name: '康复训练'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改善肢体运动功能的训练'),
    n.dosage = coalesce(n.dosage, '基于患者能力'),
    n.duration = coalesce(n.duration, '持续进行'),
    n.contraindication = coalesce(n.contraindication, '无特殊禁忌');

MERGE (n:Treatment {name: '莫达非尼治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于改善嗜睡现象'),
    n.dosage = coalesce(n.dosage, '依据具体病情'),
    n.duration = coalesce(n.duration, '依据医嘱调整'),
    n.contraindication = coalesce(n.contraindication, '对莫达非尼过敏者禁用');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '脑出血'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '双侧丘脑旁中央区梗死'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '多巴胺类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性期');

MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '高压氧治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '恢复期');

MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '康复训练'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '康复期');

MATCH (from) WHERE from.name = '卒中相关EDS'
MATCH (to) WHERE to.name = '莫达非尼治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '恢复期');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:56:33
*/
// 节点更新
MERGE (n:Disease {name: '欠稳定旺盛型腿部不宁症'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '新型非麦角类多巴胺受体激动剂'),
    n.dosage = coalesce(n.dosage, '按临床要求'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '高选择性非麦角类多巴胺受体激动剂'),
    n.dosage = coalesce(n.dosage, '按临床要求'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '作为辅助用药，睡前服用可减轻失眠'),
    n.dosage = coalesce(n.dosage, '按临床要求'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Disease {name: '卒中'})
SET 
    n.short_name = coalesce(n.short_name, 'Stroke');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '超重'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '吸烟'})
SET 
    n.description = coalesce(n.description, '吸食香烟'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '饮酒'})
SET 
    n.description = coalesce(n.description, '过量饮酒'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '高血压'})
SET 
    n.description = coalesce(n.description, '血压异常升高'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '血糖异常'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '高脂血症'})
SET 
    n.description = coalesce(n.description, '血脂异常'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '欠稳定旺盛型腿部不宁症'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床');

MATCH (from) WHERE from.name = '欠稳定旺盛型腿部不宁症'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床');

MATCH (from) WHERE from.name = '欠稳定旺盛型腿部不宁症'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '临床');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '较强');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '较强');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '饮酒'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '较强');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '较强');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '高脂血症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

/* Response #24
   Timestamp: 2024-12-12 01:56:34
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'CRSWDs');

MERGE (n:Treatment {name: '抗组胺类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可延长睡眠时间和减少中途觉醒，缩短入睡潜伏期');

MERGE (n:Treatment {name: '褪黑素类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可调节睡眠-觉醒生物节律，减少睡眠潜伏期和觉醒频率');

MERGE (n:Symptom {name: '睡眠-觉醒节律颠倒现象'});

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '抗组胺类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '褪黑素类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠-觉醒节律颠倒现象'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #25
   Timestamp: 2024-12-12 01:56:35
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关失眠'})
SET 
    n.description = coalesce(n.description, '卒中后出现的失眠症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '卒中相关睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '卒中后出现的睡眠呼吸问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中出现的呼吸阻断现象'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '混合性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '综合性睡眠呼吸暂停症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '中央性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '大脑控制呼吸的功能障碍导致的睡眠呼吸问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '困倦'})
SET 
    n.description = coalesce(n.description, '长期感觉疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '非恢复性睡眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，醒后感到没有恢复'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '乏力'})
SET 
    n.description = coalesce(n.description, '缺乏能量和精力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或保持睡眠困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠中发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸中断'})
SET 
    n.description = coalesce(n.description, '睡眠中短暂停止呼吸'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Treatment {name: '睡眠卫生教育及认知行为疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过教育和行为调整改善睡眠'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '针灸治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针灸改善失眠症状'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '非苯二氮草类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善失眠的药物'),
    n.dosage = coalesce(n.dosage, '依医生建议'),
    n.duration = coalesce(n.duration, '依患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '中成药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '中药改善失眠及降低神经功能损害'),
    n.dosage = coalesce(n.dosage, '依医生建议'),
    n.duration = coalesce(n.duration, '视患者情况而定'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '神经功能损害'})
SET 
    n.description = coalesce(n.description, '卒中导致的神经系统功能障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '卒中复发'})
SET 
    n.description = coalesce(n.description, '卒中疾病重复发生'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '困倦'
MATCH (to) WHERE to.name = '卒中相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '非恢复性睡眠'
MATCH (to) WHERE to.name = '卒中相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '乏力'
MATCH (to) WHERE to.name = '卒中相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '卒中相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '卒中相关睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '呼吸中断'
MATCH (to) WHERE to.name = '卒中相关睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '睡眠卫生教育及认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '针灸治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '非苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '卒中相关失眠'
MATCH (to) WHERE to.name = '中成药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.87),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '卒中相关睡眠呼吸障碍'
MATCH (to) WHERE to.name = '神经功能损害'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '卒中相关睡眠呼吸障碍'
MATCH (to) WHERE to.name = '卒中复发'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #26
   Timestamp: 2024-12-12 01:56:35
*/
// 节点更新
MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '纠正不良睡眠行为, 调整作息时间');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '褪黑素及受体激动剂疗效尚不确切');

MERGE (n:Disease {name: '卒中相关睡眠障碍'});

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 'null'),
    r.priority = coalesce(r.priority, '适中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 'null'),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #27
   Timestamp: 2024-12-12 01:56:38
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关昼夜节律失调性睡眠-觉醒障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'CRSWDs');

MERGE (n:Disease {name: '高血压'});

MERGE (n:Disease {name: '糖尿病'});

MERGE (n:Disease {name: '高脂血症'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '睡眠呼吸障碍'});

MERGE (n:Disease {name: '癫痫'});

MERGE (n:Disease {name: '心力衰竭'});

MERGE (n:Disease {name: '感染'});

MERGE (n:Disease {name: '发热'});

MERGE (n:Treatment {name: '控制肥胖'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '控制体重以改善睡眠质量');

MERGE (n:Treatment {name: '遵循指南治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '根据临床指南治疗相关疾病');

MERGE (n:Treatment {name: '国际RLS治疗指南推荐药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '针对卒中相关RLS的药物治疗');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, 'IIb'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, 'IIb'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '高脂血症'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, 'IIb'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '反复发作'),
    r.severity = coalesce(r.severity, '临床意义的痛苦');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '可能伴有'),
    r.severity = coalesce(r.severity, '临床意义的痛苦');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '可能伴有'),
    r.severity = coalesce(r.severity, '临床意义的痛苦');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '可能伴有'),
    r.severity = coalesce(r.severity, '临床意义的痛苦');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '感染'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '可能伴有'),
    r.severity = coalesce(r.severity, '临床意义的痛苦');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '发热'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '可能伴有'),
    r.severity = coalesce(r.severity, '临床意义的痛苦');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '控制肥胖'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, 'IIb'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '遵循指南治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, 'IIb'),
    r.stage = coalesce(r.stage, '推荐治疗');

MATCH (from) WHERE from.name = '卒中相关昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '国际RLS治疗指南推荐药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, 'IIb'),
    r.stage = coalesce(r.stage, '推荐治疗');



// =====================================

/* Response #28
   Timestamp: 2024-12-12 01:56:45
*/
// 节点更新


// =====================================

