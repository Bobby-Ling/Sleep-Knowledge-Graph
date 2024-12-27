// File: 睡眠医学_14370617.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 51

/* Response #1
   Timestamp: 2024-12-27 20:07:37
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '一种由于上气道反复阻塞引起的疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体内过多的脂肪储存'),
    n.severity = coalesce(n.severity, '中等');

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

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间呼吸暂时停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '梦话'})
SET 
    n.description = coalesce(n.description, '夜间说梦话的表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '肥胖症'})
SET 
    n.description = coalesce(n.description, '过度体重或肥胖的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断OSAHS'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '肥胖'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:07:38
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间气道部分或完全阻塞，导致呼吸暂停或低通气'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '低通气'})
SET 
    n.description = coalesce(n.description, '呼吸不足，导致血氧水平下降'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '响亮的鼾声'})
SET 
    n.description = coalesce(n.description, '睡眠时发出响亮的噪音'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到极度困倦和疲倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠中短暂停止呼吸的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '睡眠期间偶发觉醒'})
SET 
    n.description = coalesce(n.description, '因呼吸困难而醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '反复低氧事件'})
SET 
    n.description = coalesce(n.description, '睡眠中反复出现血氧饱和度下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠图监测，评估睡眠呼吸状态'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境进行');

// 关系更新
MATCH (from) WHERE from.name = '响亮的鼾声'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '呼吸暂停'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠期间偶发觉醒'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '反复低氧事件'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = '低通气'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #3
   Timestamp: 2024-12-27 20:07:38
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '一种因上气道阻塞引起的睡眠呼吸异常，伴随多次呼吸暂停和低通气事件'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中出现的呼吸停止现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦的状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时的异常声音'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '认知障碍'})
SET 
    n.description = coalesce(n.description, '记忆和注意力减退的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠障碍及呼吸暂停的能力'),
    n.method = coalesce(n.method, '监测脑电活动、氧饱和度等'),
    n.requirement = coalesce(n.requirement, '在实验室环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '夜间打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #4
   Timestamp: 2024-12-27 20:07:39
*/
// 节点更新
MERGE (n:Disease {name: '睡眠结构变化'})
SET 
    n.description = coalesce(n.description, '人类睡眠结构随年龄变化的特征'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: 'NREM睡眠'})
SET 
    n.description = coalesce(n.description, '非快速眼动睡眠, 包括多个阶段'),
    n.severity = coalesce(n.severity, '正常');

MERGE (n:Disease {name: 'REM睡眠'})
SET 
    n.description = coalesce(n.description, '快速眼动睡眠, 主要与梦有关'),
    n.severity = coalesce(n.severity, '正常');

MERGE (n:Symptom {name: '幼儿NREM睡眠阶段变化'})
SET 
    n.description = coalesce(n.description, '3~5岁时NREM睡眠的第3期、第4期成为主要睡眠表现'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '老年NREM睡眠减少'})
SET 
    n.description = coalesce(n.description, '60岁后NREM睡眠第4期减少'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '梦境发生频率'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期梦境发生频率高于NREM睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠老化现象'})
SET 
    n.description = coalesce(n.description, '睡眠老化症状早于其他衰老现象的出现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '觉醒状态下的精神活动'})
SET 
    n.description = coalesce(n.description, '觉醒时精神活动是意愿和环境交互的结果'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '肌肉活动减少'})
SET 
    n.description = coalesce(n.description, 'REM睡眠期间肌肉活动显著减少'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸幅度不规则'})
SET 
    n.description = coalesce(n.description, 'REM睡眠时呼吸幅度和频率的突然变化'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '睡眠结构变化'
MATCH (to) WHERE to.name = '幼儿NREM睡眠阶段变化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '老年NREM睡眠减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM睡眠'
MATCH (to) WHERE to.name = '梦境发生频率'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM睡眠'
MATCH (to) WHERE to.name = '睡眠老化现象'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #5
   Timestamp: 2024-12-27 20:07:39
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种表现为对腿部的无法控制的冲动，通常在静止状态下发生'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '描述为由突发的过度嗜睡或睡眠发作组成的疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '猝倒症'})
SET 
    n.description = coalesce(n.description, '与情感性肌无力相关的突发性肌肉无力现象'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '由上呼吸道阻塞导致的反复呼吸暂停'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: 'Pickwick综合征'})
SET 
    n.description = coalesce(n.description, '一种因肥胖导致的白天嗜睡和夜间打鼾的睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '响亮的鼾声'})
SET 
    n.description = coalesce(n.description, '夜间伴有显著的喉音'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到困倦，易打瞌睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情感性肌无力'})
SET 
    n.description = coalesce(n.description, '情绪波动引发的肌肉无力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '夜间多梦'})
SET 
    n.description = coalesce(n.description, '睡眠情况下频繁做梦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '响亮的鼾声'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '猝倒症'
MATCH (to) WHERE to.name = '情感性肌无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #6
   Timestamp: 2024-12-27 20:07:39
*/
// 节点更新
MERGE (n:Disease {name: 'NREM睡眠'})
SET 
    n.description = coalesce(n.description, '非快速眼动睡眠阶段，包含低代谢和大脑活动变化的睡眠状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '觉醒转向NREM睡眠'})
SET 
    n.description = coalesce(n.description, '从清醒状态转变到NREM睡眠的过程'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: 'NREM睡眠时间减少'})
SET 
    n.description = coalesce(n.description, 'NREM睡眠阶段的持续时间减少'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '8波减少'})
SET 
    n.description = coalesce(n.description, 'NREM睡眠中的8波活动减少'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: 'REM睡眠时间减少'})
SET 
    n.description = coalesce(n.description, '快速眼动睡眠阶段的时间减少'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'EEG监测'})
SET 
    n.description = coalesce(n.description, '脑电图监测，用于识别不同睡眠阶段'),
    n.method = coalesce(n.method, '电极记录脑电活动'),
    n.requirement = coalesce(n.requirement, '安静环境中进行');

MERGE (n:Examination {name: '多导睡眠图检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于评估整个睡眠过程'),
    n.method = coalesce(n.method, '监测生理信号'),
    n.requirement = coalesce(n.requirement, '在医院进行');

MERGE (n:Symptom {name: '睡眠周期紊乱'})
SET 
    n.description = coalesce(n.description, '睡眠和觉醒交替不规律，影响睡眠质量和时间'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '觉醒转向NREM睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = 'NREM睡眠时间减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '8波减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = 'REM睡眠时间减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = 'EEG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '多导睡眠图检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = 'NREM睡眠'
MATCH (to) WHERE to.name = '睡眠周期紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #7
   Timestamp: 2024-12-27 20:07:40
*/
// 节点更新
MERGE (n:Disease {name: '短期失眠障碍'})
SET 
    n.description = coalesce(n.description, '短期睡眠起始和维持困难导致的睡眠不满足感'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '入睡困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '夜间醒来后再次入睡困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '过早醒来'})
SET 
    n.description = coalesce(n.description, '比期望的时间早醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '白天疲劳'})
SET 
    n.description = coalesce(n.description, '日间感到疲倦和无精打采'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意力损害'})
SET 
    n.description = coalesce(n.description, '注意力集中困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '记忆减退'})
SET 
    n.description = coalesce(n.description, '记忆能力下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '激惹'})
SET 
    n.description = coalesce(n.description, '情绪波动和烦躁不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠结构和可能的睡眠障碍'),
    n.method = coalesce(n.method, '监测患者的睡眠波动'),
    n.requirement = coalesce(n.requirement, '在专用监测室进行');

// 关系更新
MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '睡眠起始困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '过早醒来'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '白天疲劳'
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
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '激惹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '短期失眠障碍'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #8
   Timestamp: 2024-12-27 20:07:40
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种影响睡眠的障碍，导致入睡困难、维持睡眠困难或早醒'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '镇静药物相关不良反应'})
SET 
    n.description = coalesce(n.description, '由于使用镇静性药物而导致的副作用'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '一种常见的情绪障碍，常伴随失眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '入睡困难的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '难以维持睡眠，频繁觉醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '逆行性遗忘'})
SET 
    n.description = coalesce(n.description, '对最近事件的记忆缺失'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '共济失调'})
SET 
    n.description = coalesce(n.description, '运动协调能力的下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '头晕'})
SET 
    n.description = coalesce(n.description, '一种常见的感知错误，可能影响站立和运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '持续的嗜睡感'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于监测睡眠结构与模式的检查'),
    n.method = coalesce(n.method, '多导监测'),
    n.requirement = coalesce(n.requirement, '住院观察');

MERGE (n:NonDrugTreatment {name: '非药物治疗'})
SET 
    n.description = coalesce(n.description, '不使用药物的多种治疗方法'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠起始困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.93),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '睡眠起始困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.87),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '镇静药物相关不良反应'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '镇静药物相关不良反应'
MATCH (to) WHERE to.name = '逆行性遗忘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '镇静药物相关不良反应'
MATCH (to) WHERE to.name = '共济失调'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '镇静药物相关不良反应'
MATCH (to) WHERE to.name = '头晕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '镇静药物相关不良反应'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #9
   Timestamp: 2024-12-27 20:07:40
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种导致患者出现难以抑制的腿部不适感并伴随强烈的运动需求的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '异态睡眠'})
SET 
    n.description = coalesce(n.description, '指患者的睡眠呈现出不同于正常的状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '睡眠中反复出现呼吸暂停或呼吸变 shallow 的疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.description = coalesce(n.description, '患者在睡眠中出现周期性的腿部运动'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠量变化'})
SET 
    n.description = coalesce(n.description, '不同个体的睡眠时长差异'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠扰乱'})
SET 
    n.description = coalesce(n.description, '患者经历的不适或干扰睡眠的因素'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到异常疲倦的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '基因检测'})
SET 
    n.description = coalesce(n.description, '分析与睡眠调节相关的基因'),
    n.method = coalesce(n.method, '基因编码分析'),
    n.requirement = coalesce(n.requirement, '需要抽血样本');

MERGE (n:Examination {name: '脑电图监测'})
SET 
    n.description = coalesce(n.description, '用于观察睡眠阶段的脑电活动'),
    n.method = coalesce(n.method, '脑波图监测'),
    n.requirement = coalesce(n.requirement, '需要安静环境');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠量变化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠扰乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '异态睡眠'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '周期性肢体运动障碍'
MATCH (to) WHERE to.name = '睡眠量变化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '基因检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '脑电图监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #10
   Timestamp: 2024-12-27 20:07:40
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠障碍'})
SET 
    n.description = coalesce(n.description, '频繁而持续的睡眠起始和维持困难，导致个体对于睡眠时间或质量不满足'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠起始困难'})
SET 
    n.description = coalesce(n.description, '入睡困难的主诉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '夜间醒来后再难入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比预期时间早醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间瞌睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '精力缺乏和希望减少'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意力下降'})
SET 
    n.description = coalesce(n.description, '注意力不集中或记忆障碍'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '情绪低落'})
SET 
    n.description = coalesce(n.description, '激惹或情绪低落'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于评估睡眠状态'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: 'MSLT检查'})
SET 
    n.description = coalesce(n.description, '多次睡眠潜伏期试验，用于评定日间思睡'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '睡眠起始困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '日间瞌睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '注意力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '情绪低落'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = 'MSLT检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #11
   Timestamp: 2024-12-27 20:07:41
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种长期或短期睡眠困难的情况'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.description = coalesce(n.description, '入睡所需的时间延长'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '中途觉醒'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '过早醒来后无法再次入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '感觉睡眠不充分'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:DrugTreatment {name: '佐匹克隆'})
SET 
    n.description = coalesce(n.description, '用于短期治疗失眠，能够缩短入睡时间，改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '7.5mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对该药成分过敏');

MERGE (n:DrugTreatment {name: '右佐匹克隆'})
SET 
    n.description = coalesce(n.description, '改善失眠，延长深度睡眠时间，减少醒来次数'),
    n.dosage = coalesce(n.dosage, '3mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对该药成分过敏');

MERGE (n:DrugTreatment {name: '雷美替胺'})
SET 
    n.description = coalesce(n.description, '褪黑激素受体激动剂，适用于治疗失眠'),
    n.dosage = coalesce(n.dosage, '8mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对该药成分过敏');

MERGE (n:DrugTreatment {name: '阿戈美拉汀'})
SET 
    n.description = coalesce(n.description, '褪黑激素受体激动剂及5-HT2C受体拮抗剂，有助于改善情绪和睡眠'),
    n.dosage = coalesce(n.dosage, '25mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '短期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对该药成分过敏');

MERGE (n:Complication {name: '药物依赖'})
SET 
    n.description = coalesce(n.description, '长期使用助眠药物可能导致依赖性'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '早醒'})
SET 
    n.description = coalesce(n.description, '药物对睡眠周期的影响可能导致早醒现象'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠潜伏期延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '中途觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.93),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

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
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '阿戈美拉汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '药物依赖'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期使用');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期使用');



// =====================================

/* Response #12
   Timestamp: 2024-12-27 20:07:42
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种导致患者夜间感到腿部不适并伴随强烈的运动欲望的疾病'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '夜间肢体不适'})
SET 
    n.description = coalesce(n.description, '患者在夜间经历腿部不适的感觉'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '周期性肢体运动障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠中不自主地周期性活动肢体'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '在用药过程中可能感到恶心'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '在接受治疗后可能感到嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较常见');

MERGE (n:DrugTreatment {name: '罗替戈汀'})
SET 
    n.description = coalesce(n.description, '通过透皮贴剂治疗不宁腿综合征'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.frequency = coalesce(n.frequency, '每天一次'),
    n.duration = coalesce(n.duration, '持续治疗，效果可持续6个月'),
    n.route = coalesce(n.route, '透皮给药'),
    n.contraindication = coalesce(n.contraindication, '在用药期间不要从事驾驶及危险性活动');

MERGE (n:DrugTreatment {name: '溴隐亭'})
SET 
    n.description = coalesce(n.description, '能兴奋锥体外系的多巴胺受体，改善不宁腿综合征的症状'),
    n.dosage = coalesce(n.dosage, '口服'),
    n.frequency = coalesce(n.frequency, '根据医生建议'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '与降血压药合用时注意监测血压');

MERGE (n:DrugTreatment {name: '加巴喷丁'})
SET 
    n.description = coalesce(n.description, '用于治疗癫痫，并改善不宁腿综合征的症状'),
    n.dosage = coalesce(n.dosage, '口服'),
    n.frequency = coalesce(n.frequency, '根据医生建议'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '抗酸药可减少吸收');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠相关疾病的核心技术'),
    n.method = coalesce(n.method, '多导生理记录'),
    n.requirement = coalesce(n.requirement, '患者需要住院观察');

MERGE (n:Examination {name: '移动式睡眠记录方法'})
SET 
    n.description = coalesce(n.description, '用于睡眠质量的监测'),
    n.method = coalesce(n.method, '便携式设备'),
    n.requirement = coalesce(n.requirement, '患者需佩戴设备');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '夜间肢体不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '周期性肢体运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗替戈汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '溴隐亭'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '对症治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.78),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助手段');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '移动式睡眠记录方法'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #13
   Timestamp: 2024-12-27 20:07:42
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸障碍(OSAHS)'})
SET 
    n.description = coalesce(n.description, '一种由于上气道阻塞导致的睡眠呼吸中断状况'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '咽平面狭窄'})
SET 
    n.description = coalesce(n.description, '咽部平面的狭窄导致上呼吸道阻塞'),
    n.severity = coalesce(n.severity, '中等');

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

MERGE (n:Symptom {name: '夜间呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间出现呼吸停止的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '口干'})
SET 
    n.description = coalesce(n.description, '睡眠期间口腔干燥'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早上醒来时出现头痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '纤维喉镜检查'})
SET 
    n.description = coalesce(n.description, '用于观察咽腔和上气道的检查'),
    n.method = coalesce(n.method, '内窥镜检查'),
    n.requirement = coalesce(n.requirement, '有经验的耳鼻喉科医生进行');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '住院观察');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = '夜间呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = '口干'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = '纤维喉镜检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍(OSAHS)'
MATCH (to) WHERE to.name = '咽平面狭窄'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #14
   Timestamp: 2024-12-27 20:07:42
*/
// 节点更新
MERGE (n:Disease {name: '全睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '连续数天睡眠剥夺后出现强烈的困意、疲惫、易激怒、情绪不稳定等症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '困意'})
SET 
    n.description = coalesce(n.description, '突然感到强烈的困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '疲惫'})
SET 
    n.description = coalesce(n.description, '感到极度疲倦和无力'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '易激怒'})
SET 
    n.description = coalesce(n.description, '在小事情上变得异常易怒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪不稳定'})
SET 
    n.description = coalesce(n.description, '情绪波动很大'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '定向力障碍'})
SET 
    n.description = coalesce(n.description, '对环境及时间的感知出现障碍'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '错觉'})
SET 
    n.description = coalesce(n.description, '感觉到并不存在的事物'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '感知到不存在的声音或影像'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'EEG检查'})
SET 
    n.description = coalesce(n.description, '通过脑电图检查检测睡眠状态'),
    n.method = coalesce(n.method, '脑电图监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Disease {name: '部分睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '特异性地减少整个睡眠期某段时间的睡眠量'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '工作效率下降'})
SET 
    n.description = coalesce(n.description, '工作表现明显下滑'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '显著');

MERGE (n:Symptom {name: '烦躁'})
SET 
    n.description = coalesce(n.description, '情绪烦躁，难以平静'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Disease {name: '选择性睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '选择性剥夺某些睡眠时相以研究其功能'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '本能行为亢进'})
SET 
    n.description = coalesce(n.description, '表现出如食欲和性欲等本能行为增强'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '困意'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '疲惫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '易激怒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '情绪不稳定'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '定向力障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '错觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '全睡眠剥夺'
MATCH (to) WHERE to.name = 'EEG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '工作效率下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '显著'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '部分睡眠剥夺'
MATCH (to) WHERE to.name = '烦躁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '选择性睡眠剥夺'
MATCH (to) WHERE to.name = '本能行为亢进'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #15
   Timestamp: 2024-12-27 20:07:43
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '一种因上气道反复部分或完全阻塞而引起的睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '鼻中隔偏曲'})
SET 
    n.description = coalesce(n.description, '鼻中隔的上下或前后径偏离矢状面，导致鼻腔阻力增加'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '鼻息肉'})
SET 
    n.description = coalesce(n.description, '由于鼻黏膜长期炎性反应引起的组织水肿，导致鼻塞和打鼾'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥厚性鼻炎'})
SET 
    n.description = coalesce(n.description, '慢性鼻腔炎症，导致黏膜增生和持续性鼻塞'),
    n.severity = coalesce(n.severity, '轻微');

MERGE (n:Disease {name: '鼻腔恶性肿瘤'})
SET 
    n.description = coalesce(n.description, '鼻腔内肿瘤，可能导致早期鼻塞'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '过敏性鼻炎'})
SET 
    n.description = coalesce(n.description, '鼻黏膜的变态反应，常与支气管哮喘同时存在'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '鼻塞'})
SET 
    n.description = coalesce(n.description, '鼻腔阻塞的表现'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '经过鼻呼气困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '在安静环境进行');

MERGE (n:Examination {name: '鼻内镜检查'})
SET 
    n.description = coalesce(n.description, '通过内镜直接观察鼻腔情况，评估解剖异常'),
    n.method = coalesce(n.method, '内镜检查'),
    n.requirement = coalesce(n.requirement, '局部麻醉');

MERGE (n:Examination {name: 'CT扫描'})
SET 
    n.description = coalesce(n.description, '用于评估鼻窦和鼻腔解剖结构'),
    n.method = coalesce(n.method, '计算机断层扫描'),
    n.requirement = coalesce(n.requirement, '无特殊要求');

// 关系更新
MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '鼻中隔偏曲'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '鼻息肉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '鼻塞'
MATCH (to) WHERE to.name = '肥厚性鼻炎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '鼻息肉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.78),
    r.frequency = coalesce(r.frequency, '时有'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '呼吸困难'
MATCH (to) WHERE to.name = '鼻中隔偏曲'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '鼻中隔偏曲'
MATCH (to) WHERE to.name = '鼻内镜检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '鼻息肉'
MATCH (to) WHERE to.name = 'CT扫描'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #16
   Timestamp: 2024-12-27 20:07:43
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'});

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '尽管有适当的睡眠机会和环境，对睡眠时间和质量感到不满足并影响日间功能'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦，可能导致注意力下降和反应迟缓'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间觉醒'})
SET 
    n.description = coalesce(n.description, '夜间频繁醒来，难以再次入睡的状况'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '体力和精神上的疲惫感，可能影响日间活动能力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠质量差'})
SET 
    n.description = coalesce(n.description, '表现为难以入睡或睡眠不安'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响，常见于呼吸道受阻的情况下'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '持续性焦虑'})
SET 
    n.description = coalesce(n.description, '对生活事件的持续担忧，对睡眠产生影响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Examination {name: '多次睡眠潜伏期试验'})
SET 
    n.description = coalesce(n.description, '用于评估日间思睡程度的实验方法'),
    n.method = coalesce(n.method, '以小睡的方式观察入睡时间及睡眠质量'),
    n.requirement = coalesce(n.requirement, '在安静的环境中进行');

MERGE (n:Examination {name: '清醒维持试验'})
SET 
    n.description = coalesce(n.description, '检测受试者维持清醒的能力'),
    n.method = coalesce(n.method, '定时监测觉醒状态'),
    n.requirement = coalesce(n.requirement, '在标准化环境下进行');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间觉醒'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '疲劳'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠质量差'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '持续性焦虑'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多次睡眠潜伏期试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '清醒维持试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '多次睡眠潜伏期试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #17
   Timestamp: 2024-12-27 20:07:46
*/
// 节点更新
MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.description = coalesce(n.description, '合并肥胖低通气综合征的OSAHS患者出现更严重的夜间血氧饱和度下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, 'OSAHS合并慢性阻塞性肺病的患者称为重叠综合征'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '中心性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '慢性心力衰竭合并的中枢性睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '甲状腺功能减退引起的呼吸暂停'})
SET 
    n.description = coalesce(n.description, '甲状腺功能减退可导致的呼吸暂停病症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间低氧血症'})
SET 
    n.description = coalesce(n.description, '在夜间出现的血氧水平显著下降'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠期间出现的呼吸暂停症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '气流阻塞'})
SET 
    n.description = coalesce(n.description, '气道中的气流受阻'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '体重增加'})
SET 
    n.description = coalesce(n.description, '体重增加对疾病的影响'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '渐增');

MERGE (n:Symptom {name: '醒后感不适'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到不适的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '慢性咳嗽'})
SET 
    n.description = coalesce(n.description, '长期持续的咳嗽症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测检查，用于评估睡眠呼吸障碍'),
    n.method = coalesce(n.method, '睡眠状态监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '夜间低氧血症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '中心性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '气流阻塞'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '间歇性'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '甲状腺功能减退引起的呼吸暂停'
MATCH (to) WHERE to.name = '体重增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '渐增'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '醒后感不适'
MATCH (to) WHERE to.name = '中心性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性咳嗽'
MATCH (to) WHERE to.name = '甲状腺功能减退引起的呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.78),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '中心性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '甲状腺功能减退引起的呼吸暂停'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #18
   Timestamp: 2024-12-27 20:07:46
*/
// 节点更新
MERGE (n:Disease {name: '慢性心力衰竭致中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '中枢性睡眠呼吸暂停伴陈-施呼吸，其主要表现为中枢型呼吸暂停/低通气事件，伴呼吸幅度渐强-渐弱交替变化的周期性呼吸模式'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或维持睡眠的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间呼吸困难'})
SET 
    n.description = coalesce(n.description, '夜间感觉呼吸困难或窒息感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于诊断中枢性睡眠呼吸暂停'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '慢性心力衰竭致中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性心力衰竭致中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性心力衰竭致中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性心力衰竭致中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #19
   Timestamp: 2024-12-27 20:07:46
*/
// 节点更新
MERGE (n:Disease {name: '错畸形'})
SET 
    n.description = coalesce(n.description, '牙齿、牙弓、颌骨和颅面间的关系不协调导致的一种疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '通过嘴巴呼吸的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '颌骨生长异常'})
SET 
    n.description = coalesce(n.description, '颌骨的发育不正常'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '牙齿排列不齐'})
SET 
    n.description = coalesce(n.description, '牙齿没有规则的排列'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '头影测量分析'})
SET 
    n.description = coalesce(n.description, '用于分析颌部和牙齿关系的测量'),
    n.method = coalesce(n.method, '影像测量'),
    n.requirement = coalesce(n.requirement, '患者需保持安静');

MERGE (n:Examination {name: '上下颌牙模分析'})
SET 
    n.description = coalesce(n.description, '通过分析牙模了解牙齿排列状态'),
    n.method = coalesce(n.method, '牙模观察'),
    n.requirement = coalesce(n.requirement, '患者需提供牙模');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '因颅面畸形引起的阻塞性睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '颅缝早闭相关综合征'})
SET 
    n.description = coalesce(n.description, '颅缝过早闭合导致的各种症状综合'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '颅内高压'})
SET 
    n.description = coalesce(n.description, '颅内压力异常增高'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '大脑发育问题'})
SET 
    n.description = coalesce(n.description, '大脑发育异常'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '张口呼吸'
MATCH (to) WHERE to.name = '错畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '颌骨生长异常'
MATCH (to) WHERE to.name = '错畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '牙齿排列不齐'
MATCH (to) WHERE to.name = '错畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '错畸形'
MATCH (to) WHERE to.name = '头影测量分析'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '错畸形'
MATCH (to) WHERE to.name = '上下颌牙模分析'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '错畸形'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '错畸形'
MATCH (to) WHERE to.name = '颅缝早闭相关综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.85),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '颅内高压'
MATCH (to) WHERE to.name = '颅缝早闭相关综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '大脑发育问题'
MATCH (to) WHERE to.name = '颅缝早闭相关综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #20
   Timestamp: 2024-12-27 20:07:47
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '一种睡眠期间反复发生的上气道阻塞，导致呼吸暂停或低通气'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: 'OSAHS'})
SET 
    n.description = coalesce(n.description, '儿童阻塞性睡眠呼吸暂停低通气综合征，是在同一病理基础上发展的不同疾病过程'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '呼吸努力增加'})
SET 
    n.description = coalesce(n.description, '绝大多数患者呼吸努力会增加，表现为肋间隙凹陷'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间出汗'})
SET 
    n.description = coalesce(n.description, '睡眠时大量出汗'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '遗尿'})
SET 
    n.description = coalesce(n.description, '临床上常见症状，部分患儿在夜间出现脍尿'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '行为异常'})
SET 
    n.description = coalesce(n.description, '以多动、注意力不集中、具攻击性等行为异常为主'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '金标准检测睡眠呼吸障碍'),
    n.method = coalesce(n.method, '整晚监测'),
    n.requirement = coalesce(n.requirement, '舒适的环境与患者配合');

MERGE (n:Examination {name: '血液检验'})
SET 
    n.description = coalesce(n.description, '用于评估微量矿物质和维生素水平'),
    n.method = coalesce(n.method, '抽血检测'),
    n.requirement = coalesce(n.requirement, '空腹条件下进行');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸努力增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '夜间出汗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '遗尿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '行为异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '血液检验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #21
   Timestamp: 2024-12-27 20:07:48
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以难以控制的思睡、发作性猝倒、睡瘫、人睡幻觉及夜间睡眠紊乱为主要临床特点'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '特发性睡眠增多'})
SET 
    n.description = coalesce(n.description, '主要以日间过度思睡但不伴猝倒发作为基本特征'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在白天应该维持清醒的主要时段不能保持清醒和警觉，出现难以抑制的困倦欲睡甚至突然入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '无力发作甚至猝倒，常出现在强烈情感刺激时'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡瘫'})
SET 
    n.description = coalesce(n.description, '人睡或起床时发生的一过性全身不能活动或不能讲话'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '睡眠幻觉'})
SET 
    n.description = coalesce(n.description, '在觉醒和睡眠转换期出现的幻觉'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '夜间睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '常无入睡困难，但易醒多梦，觉醒多发生在人睡后2-3小时'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨醒困难'})
SET 
    n.description = coalesce(n.description, '早晨或小睡后觉醒困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠疾病，包括发作性睡病和特发性睡眠增多'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡瘫'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠幻觉'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '夜间睡眠紊乱'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '晨醒困难'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #22
   Timestamp: 2024-12-27 20:07:49
*/
// 节点更新
MERGE (n:Disease {name: '原发性鼾症'})
SET 
    n.description = coalesce(n.description, '以打鼾为主要表现的睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出鼾声，可能影响他人睡眠'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '呼吸驱动缺乏或异常所致的通气功能障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '夜间呼吸不规律'})
SET 
    n.description = coalesce(n.description, '夜间呼吸减弱或停止'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '憋醒'})
SET 
    n.description = coalesce(n.description, '夜间时有憋醒现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠相关呼吸事件的检查'),
    n.method = coalesce(n.method, '监测睡眠阶段及呼吸变化'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间呼吸不规律'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '憋醒'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '中枢性睡眠呼吸暂停综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '原发性鼾症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '原发性鼾症'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #23
   Timestamp: 2024-12-27 20:07:50
*/
// 节点更新
MERGE (n:Disease {name: '睡惊症'})
SET 
    n.description = coalesce(n.description, '突然从慢波睡眠中觉醒并伴有尖叫或呼喊、表情极度恐惧、自主神经系统兴奋性增加等行为表现。'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '尖叫'})
SET 
    n.description = coalesce(n.description, '伴随强烈恐惧和焦虑的尖叫声'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '意识模糊'})
SET 
    n.description = coalesce(n.description, '发作时意识模糊，无法记忆发作过程'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '自主神经症状'})
SET 
    n.description = coalesce(n.description, '表现为心动过速、呼吸急促等自主神经症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '强烈恐惧感'})
SET 
    n.description = coalesce(n.description, '强烈的恐惧感伴随发作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '每次发作都会出现');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = '尖叫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = '意识模糊'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = '自主神经症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = '强烈恐惧感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每次发作都会出现'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #24
   Timestamp: 2024-12-27 20:07:50
*/
// 节点更新
MERGE (n:Disease {name: '腺样体或扁桃体肥大'})
SET 
    n.description = coalesce(n.description, '儿童OSAHS的主要原因，导致呼吸模式转化为口呼吸'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '颅缝早闭'})
SET 
    n.description = coalesce(n.description, '颅缝在出生后4-6个月内发生骨性融合，导致头颅畸形'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '巨舌症'})
SET 
    n.description = coalesce(n.description, '舌体过长，舌体肥大导致的呼吸道狭窄'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '小颌畸形'})
SET 
    n.description = coalesce(n.description, '上气道骨性空间的狭小，可能导致阻塞性睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '唐氏综合征'})
SET 
    n.description = coalesce(n.description, '一种先天性疾病，伴随智力低下和睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '脐疝-巨舌-巨体综合征'})
SET 
    n.description = coalesce(n.description, '以脐膨出、巨舌、半身肥大和新生儿低血糖为特征的综合征'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '第一、二鳃弓综合征'})
SET 
    n.description = coalesce(n.description, '面部发育不足畸形、耳部畸形与面裂'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '下颌发育不足畸形'})
SET 
    n.description = coalesce(n.description, '因多种因素导致的下颌骨的发育不足'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '张口呼吸'})
SET 
    n.description = coalesce(n.description, '睡眠时以口呼吸而非鼻呼吸'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间打鼾'})
SET 
    n.description = coalesce(n.description, '夜间发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '喘息'})
SET 
    n.description = coalesce(n.description, '喘息声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '白天注意力难以集中'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '生长发育障碍'})
SET 
    n.description = coalesce(n.description, '生长发育落后'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '盗汗'})
SET 
    n.description = coalesce(n.description, '夜间出汗'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '几乎每天');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断儿童OSAHS'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '张口呼吸'
MATCH (to) WHERE to.name = '腺样体或扁桃体肥大'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间打鼾'
MATCH (to) WHERE to.name = '颅缝早闭'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '喘息'
MATCH (to) WHERE to.name = '腺样体或扁桃体肥大'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '注意力不集中'
MATCH (to) WHERE to.name = '唐氏综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '生长发育障碍'
MATCH (to) WHERE to.name = '小颌畸形'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '盗汗'
MATCH (to) WHERE to.name = '腺样体或扁桃体肥大'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '几乎每天'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '嗜睡'
MATCH (to) WHERE to.name = '巨舌症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '腺样体或扁桃体肥大'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '颅缝早闭'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #25
   Timestamp: 2024-12-27 20:07:51
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '一种由于上气道阻塞导致的睡眠呼吸暂停和低通气的疾病'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '夜间呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠时反复呼吸暂停的现象'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

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

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早上醒来时头痛的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '在日间表现出来的注意力缺失'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断和评估睡眠呼吸障碍的检查'),
    n.method = coalesce(n.method, '对睡眠过程进行多通道监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '夜间呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '晨起头痛'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '注意力不集中'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #26
   Timestamp: 2024-12-27 20:07:51
*/
// 节点更新
MERGE (n:Disease {name: '倒班工作睡眠觉醒障碍'})
SET 
    n.description = coalesce(n.description, '与倒班工作相关的睡眠觉醒障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '睡眠的总体质量降低'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.description = coalesce(n.description, '入睡所需的时间增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '总睡眠时间缩短'})
SET 
    n.description = coalesce(n.description, '每天的睡眠时长减少'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '频繁觉醒'})
SET 
    n.description = coalesce(n.description, '在睡眠中频繁醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于评估睡眠质量'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠潜伏期延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '总睡眠时间缩短'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '频繁觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = '过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '倒班工作睡眠觉醒障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #27
   Timestamp: 2024-12-27 20:07:51
*/
// 节点更新
MERGE (n:Disease {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.description = coalesce(n.description, '因昼夜时间维持与诱导系统变化或内源性昼夜节律与外部环境不同步所引起的各种睡眠觉醒障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '出现困难入睡的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '在夜间持续睡眠困难的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间睡眠增多'})
SET 
    n.description = coalesce(n.description, '白天出现过度困倦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晚睡'})
SET 
    n.description = coalesce(n.description, '通常推迟两小时或更多的睡眠时间'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨醒困难'})
SET 
    n.description = coalesce(n.description, '早上觉醒非常困难的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '日间睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '晚睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠觉醒障碍'
MATCH (to) WHERE to.name = '晨醒困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #28
   Timestamp: 2024-12-27 20:07:51
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与多种疾病有密切联系的临床常见病和多发病'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '主要表现为睡眠质量差或睡眠时间短'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '夜间呼吸暂停或低通气现象'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.description = coalesce(n.description, '睡眠觉醒周期紊乱造成的功能障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以日间嗜睡和突然入睡为特征的疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '患者在静态时感到腿部不适，需活动改善'),
    n.severity = coalesce(n.severity, '轻微');

MERGE (n:Disease {name: '神经系统疾病相关性睡眠障碍'})
SET 
    n.description = coalesce(n.description, '由神经系统疾病引起的睡眠问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '包括多种类型的睡眠问题'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠症状'})
SET 
    n.description = coalesce(n.description, '入睡困难、维持睡眠困扰'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间呼吸暂停'})
SET 
    n.description = coalesce(n.description, '夜间呼吸暂停的现象'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '嗜睡症状'})
SET 
    n.description = coalesce(n.description, '突然或无法控制的日间嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠症状'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间呼吸暂停'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '嗜睡症状'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #29
   Timestamp: 2024-12-27 20:07:52
*/
// 节点更新
MERGE (n:Disease {name: '睡眠觉醒时相延迟障碍'})
SET 
    n.description = coalesce(n.description, '一种表现为主要入睡与觉醒时间较传统或期望的作息时间持续提前至少2小时的睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠觉醒时相提前障碍'})
SET 
    n.description = coalesce(n.description, '早醒型失眠，患者早晨过早觉醒，严重影响夜间活动安排'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '非24小时睡眠觉醒节律障碍'})
SET 
    n.description = coalesce(n.description, '患者因内源性睡眠觉醒昼夜节律与外界24小时明暗循环周期不同步而产生失眠或日间思睡'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不规律睡眠觉醒节律障碍'})
SET 
    n.description = coalesce(n.description, '患者的睡眠觉醒周期无规律，整天有多次睡眠发作'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或保持睡眠困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '早晨过早的觉醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '晚上思睡'})
SET 
    n.description = coalesce(n.description, '晚上无意识地感到困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '精神萎靡'})
SET 
    n.description = coalesce(n.description, '在白天感到疲倦和无精打采'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '记录睡眠模式和觉醒时间的工具'),
    n.method = coalesce(n.method, '日常记录'),
    n.requirement = coalesce(n.requirement, '至少连续记录7天');

MERGE (n:Examination {name: '体动记录仪'})
SET 
    n.description = coalesce(n.description, '跟踪身体活动与睡眠的设备'),
    n.method = coalesce(n.method, '监测'),
    n.requirement = coalesce(n.requirement, '至少连续记录7天');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '早醒'
MATCH (to) WHERE to.name = '睡眠觉醒时相延迟障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '晚上思睡'
MATCH (to) WHERE to.name = '睡眠觉醒时相提前障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神萎靡'
MATCH (to) WHERE to.name = '非24小时睡眠觉醒节律障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠觉醒时相延迟障碍'
MATCH (to) WHERE to.name = '体动记录仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #30
   Timestamp: 2024-12-27 20:07:53
*/
// 节点更新
MERGE (n:Disease {name: '复杂性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '应用无后备频率的PAP治疗消除阻塞性呼吸事件后出现的中枢睡眠呼吸暂停或低通气事件'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠相关低通气综合征'})
SET 
    n.description = coalesce(n.description, '睡眠期间通气不足导致动脉二氧化碳分压升高'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.description = coalesce(n.description, '肥胖和日间高碳酸血症为特征的综合征'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '先天性中枢性低通气综合征'})
SET 
    n.description = coalesce(n.description, '因PHOX2B基因突变引起的自主呼吸中枢调控紊乱的疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '在白天感到极度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡过程中的困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '频繁觉醒'})
SET 
    n.description = coalesce(n.description, '夜间常常醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出的大声呼噜声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '清醒后气短'})
SET 
    n.description = coalesce(n.description, '早晨醒来时感到呼吸困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '不恢复性睡眠'})
SET 
    n.description = coalesce(n.description, '即使睡眠时间足够，仍感到疲惫'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '潮气量下降'})
SET 
    n.description = coalesce(n.description, '呼吸过程中潮气量的减少'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '日间高二氧化碳分压'})
SET 
    n.description = coalesce(n.description, '白天的二氧化碳分压超过正常范围'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早上醒来时头痛的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '疲乏感'})
SET 
    n.description = coalesce(n.description, '持续的身体疲惫感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '低氧血症'})
SET 
    n.description = coalesce(n.description, '血氧浓度低于正常水平'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '高碳酸血症'})
SET 
    n.description = coalesce(n.description, '血液中的二氧化碳浓度过高'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '发细'})
SET 
    n.description = coalesce(n.description, '感觉到无力和虚弱'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠图'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: '血气分析'})
SET 
    n.description = coalesce(n.description, '用于测量血液气体成分'),
    n.method = coalesce(n.method, '动脉血气分析'),
    n.requirement = coalesce(n.requirement, '在实验室进行');

// 关系更新
MATCH (from) WHERE from.name = '思睡'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '频繁觉醒'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '清醒后气短'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不恢复性睡眠'
MATCH (to) WHERE to.name = '复杂性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '潮气量下降'
MATCH (to) WHERE to.name = '睡眠相关低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间高二氧化碳分压'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '晨起头痛'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '疲乏感'
MATCH (to) WHERE to.name = '肥胖低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '低氧血症'
MATCH (to) WHERE to.name = '先天性中枢性低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '高碳酸血症'
MATCH (to) WHERE to.name = '先天性中枢性低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发细'
MATCH (to) WHERE to.name = '先天性中枢性低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '复杂性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠相关低通气综合征'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '血气分析'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '先天性中枢性低通气综合征'
MATCH (to) WHERE to.name = '血气分析'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #31
   Timestamp: 2024-12-27 20:07:53
*/
// 节点更新
MERGE (n:Disease {name: '特发性睡眠增多'})
SET 
    n.description = coalesce(n.description, '患者主诉长时间小睡后仍难以恢复精力，晨间或小睡后觉醒困难'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天表现为难以抑制的思睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '晨间或小睡后觉醒困难'})
SET 
    n.description = coalesce(n.description, '早晨或小睡后难以醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断特发性睡眠增多的关键检查方法'),
    n.method = coalesce(n.method, '监测夜间睡眠结构'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: 'MSLT'})
SET 
    n.description = coalesce(n.description, '多次睡眠潜伏期测试，检测思睡情况'),
    n.method = coalesce(n.method, '评估白天的过度思睡'),
    n.requirement = coalesce(n.requirement, '在控制环境下进行');

MERGE (n:Disease {name: 'Kleine-Levin综合征'})
SET 
    n.description = coalesce(n.description, '反复发作性睡眠增多，典型发作期伴认知、精神和行为异常'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '反复发作性思睡'})
SET 
    n.description = coalesce(n.description, '发作期严重思睡，伴随其他认知和精神异常'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '认知功能障碍'})
SET 
    n.description = coalesce(n.description, '发作期间表现为认知能力减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '贪食'})
SET 
    n.description = coalesce(n.description, '发作期可能出现贪食行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Examination {name: '脑电图'})
SET 
    n.description = coalesce(n.description, '监测大脑电活动的检查'),
    n.method = coalesce(n.method, '检查脑电图'),
    n.requirement = coalesce(n.requirement, '在发作期进行');

MERGE (n:Disease {name: '药物或物质滥用所致过度思睡'})
SET 
    n.description = coalesce(n.description, '因药物或物质滥用引起的思睡'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '因药物或物质滥用引起的日间过度思睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Disease {name: '睡眠不足综合征'})
SET 
    n.description = coalesce(n.description, '由于急性或慢性睡眠剥夺而致'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '表现为白天难以保持清醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '警觉性降低'})
SET 
    n.description = coalesce(n.description, '注意力和警觉性降低'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '精神涣散'})
SET 
    n.description = coalesce(n.description, '表现为缺乏专注'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = '晨间或小睡后觉醒困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性睡眠增多'
MATCH (to) WHERE to.name = 'MSLT'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = 'Kleine-Levin综合征'
MATCH (to) WHERE to.name = '反复发作性思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'Kleine-Levin综合征'
MATCH (to) WHERE to.name = '认知功能障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'Kleine-Levin综合征'
MATCH (to) WHERE to.name = '贪食'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'Kleine-Levin综合征'
MATCH (to) WHERE to.name = '脑电图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '药物或物质滥用所致过度思睡'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠不足综合征'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠不足综合征'
MATCH (to) WHERE to.name = '警觉性降低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠不足综合征'
MATCH (to) WHERE to.name = '精神涣散'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #32
   Timestamp: 2024-12-27 20:07:53
*/
// 节点更新
MERGE (n:Disease {name: '周期性肢体运动障碍'})
SET 
    n.description = coalesce(n.description, '一种以腿部不自主运动为特征的睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '在静止时出现不适感，影响睡眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠相关性腿痉挛'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现的腿部突然痉挛'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '下肢肌肉不自主强直收缩'})
SET 
    n.description = coalesce(n.description, '表现为突发的肌肉收缩伴疼痛'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '腿部疼痛'})
SET 
    n.description = coalesce(n.description, '突发的腿部强烈疼痛感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '肌肉压痛'})
SET 
    n.description = coalesce(n.description, '腿部肌肉在痉挛后感到疼痛'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '因腿部不适而难以入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '下肢肌肉不自主强直收缩'
MATCH (to) WHERE to.name = '睡眠相关性腿痉挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '腿部疼痛'
MATCH (to) WHERE to.name = '睡眠相关性腿痉挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '肌肉压痛'
MATCH (to) WHERE to.name = '睡眠相关性腿痉挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '睡眠相关性腿痉挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #33
   Timestamp: 2024-12-27 20:07:53
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种伴随有强烈想要活动腿部的症状，常常伴有腿部不适'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '腿部不适感'})
SET 
    n.description = coalesce(n.description, '强烈的腿部不适感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间症状加重'})
SET 
    n.description = coalesce(n.description, '夜间腿部症状明显加重'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '运动后缓解'})
SET 
    n.description = coalesce(n.description, '通过活动症状部分或完全缓解'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '需求活动腿部的冲动'})
SET 
    n.description = coalesce(n.description, '有一种想活动腿的强烈欲望'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '血液化验'})
SET 
    n.description = coalesce(n.description, '检查血液以排除其他合并症'),
    n.method = coalesce(n.method, '常规血液检查'),
    n.requirement = coalesce(n.requirement, '在空腹状态下进行');

MERGE (n:Examination {name: '电生理检查'})
SET 
    n.description = coalesce(n.description, '评估神经和肌肉功能'),
    n.method = coalesce(n.method, '肌电图'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '夜间症状加重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '运动后缓解'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '需求活动腿部的冲动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '血液化验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '电生理检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #34
   Timestamp: 2024-12-27 20:07:55
*/
// 节点更新
MERGE (n:Disease {name: '中枢性肺泡低通气综合征'})
SET 
    n.description = coalesce(n.description, '一种存在肺泡通气减少从而导致睡眠相关性低氧血症与高碳酸血症的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥胖低通气综合征'})
SET 
    n.description = coalesce(n.description, '伴有下丘脑功能失调的出现低通气症状的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间呼吸变浅'})
SET 
    n.description = coalesce(n.description, '夜间频繁出现呼吸变浅的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '早上醒来时出现头痛'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '认知功能减退'})
SET 
    n.description = coalesce(n.description, '思维能力下降和注意力不集中'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲乏'})
SET 
    n.description = coalesce(n.description, '常感到疲劳无力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于检测夜间低通气和氧气水平'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = '夜间呼吸变浅'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = '认知功能减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = '疲乏'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '中枢性肺泡低通气综合征'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '夜间呼吸变浅'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '肥胖低通气综合征'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #35
   Timestamp: 2024-12-27 20:07:55
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '一种因上气道部分或完全阻塞造成的睡眠呼吸暂停症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '低氧睡眠'})
SET 
    n.description = coalesce(n.description, '夜间睡眠过程中血氧水平下降的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠中发生的暂停呼吸现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '夜间发出声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于评估睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在静息状态下进行');

MERGE (n:Examination {name: 'CT检查'})
SET 
    n.description = coalesce(n.description, '计算机断层扫描，用于评估上气道异常'),
    n.method = coalesce(n.method, '影像学检查'),
    n.requirement = coalesce(n.requirement, '在扫描前保持放松');

MERGE (n:Complication {name: '室息'})
SET 
    n.description = coalesce(n.description, '在手术或麻醉过程中出现的呼吸停止状态'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '出血'})
SET 
    n.description = coalesce(n.description, '手术后可能出现的出血问题'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '低氧睡眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '呼吸暂停'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = 'CT检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '室息'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸障碍'
MATCH (to) WHERE to.name = '出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #36
   Timestamp: 2024-12-27 20:07:56
*/
// 节点更新
MERGE (n:Disease {name: '特发性刺痛性头痛'})
SET 
    n.description = coalesce(n.description, '头侧部发生的短暂刺痛的良性综合征'),
    n.severity = coalesce(n.severity, '轻微');

MERGE (n:Disease {name: '霹雳头痛'})
SET 
    n.description = coalesce(n.description, '蛛网膜下腔出血为特征的非常严重的突然发作的头痛'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '睡眠性头痛综合征'})
SET 
    n.description = coalesce(n.description, '经常入睡后4~6小时醒来，并伴有恶心的弥散性头痛'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠相关性幻觉'})
SET 
    n.description = coalesce(n.description, '人睡时或从睡眠中醒来时出现的幻觉体验'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '原发性睡眠遗尿症'})
SET 
    n.description = coalesce(n.description, '在没有泌尿系统和神经系统疾病的情况下,未能建立正常的夜间控制小便的能力'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '继发性遗尿症'})
SET 
    n.description = coalesce(n.description, '之前曾连续6个月不尿床,后来又开始每周至少尿床两次的情况'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种常见的神经系统感觉运动障碍性疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '刺痛'})
SET 
    n.description = coalesce(n.description, '头侧部的短暂刺痛'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '剧烈头痛'})
SET 
    n.description = coalesce(n.description, '非常强烈的疼痛'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '伴随头痛时的恶心感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '睡眠时或从睡眠中醒来出现的幻觉体验'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '复发性无意识排尿'})
SET 
    n.description = coalesce(n.description, '在睡眠期间的无意识排尿'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '下肢不适'})
SET 
    n.description = coalesce(n.description, '下肢出现极度的不适感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '头颅MRI'})
SET 
    n.description = coalesce(n.description, '用于排查神经系统问题'),
    n.method = coalesce(n.method, '成像检查'),
    n.requirement = coalesce(n.requirement, '患者需保持静止');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '住院观察');

MERGE (n:Examination {name: '神经心理学检查'})
SET 
    n.description = coalesce(n.description, '帮助鉴别诊断的检查'),
    n.method = coalesce(n.method, '神经评估'),
    n.requirement = coalesce(n.requirement, '在清醒状态下进行');

MERGE (n:Examination {name: 'EEG'})
SET 
    n.description = coalesce(n.description, '脑电图检查，用于评估脑电活动'),
    n.method = coalesce(n.method, '电生理检查'),
    n.requirement = coalesce(n.requirement, '在静息状态下进行');

// 关系更新
MATCH (from) WHERE from.name = '刺痛'
MATCH (to) WHERE to.name = '特发性刺痛性头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '剧烈头痛'
MATCH (to) WHERE to.name = '霹雳头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '恶心'
MATCH (to) WHERE to.name = '睡眠性头痛综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '幻觉'
MATCH (to) WHERE to.name = '睡眠相关性幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '复发性无意识排尿'
MATCH (to) WHERE to.name = '原发性睡眠遗尿症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '下肢不适'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠性头痛综合征'
MATCH (to) WHERE to.name = '头颅MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠相关性幻觉'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '原发性睡眠遗尿症'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #37
   Timestamp: 2024-12-27 20:07:56
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，特征为睡眠中反复出现的呼吸暂停或通气不足'),
    n.severity = coalesce(n.severity, '严重');

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

MERGE (n:Symptom {name: '睡眠维持障碍'})
SET 
    n.description = coalesce(n.description, '因活动增加和经常觉醒导致的睡眠中断'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中出现的暂停呼吸现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '通过监测脑电波、血氧水平等用于诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠图'),
    n.requirement = coalesce(n.requirement, '在医院或相关设施中进行');

MERGE (n:Disease {name: '卒中'})
SET 
    n.description = coalesce(n.description, '大脑供血不足导致的急性病症'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '疲乏'})
SET 
    n.description = coalesce(n.description, '精神和身体的极度疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '持续的疼痛感，可能影响日常活动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'CT扫描'})
SET 
    n.description = coalesce(n.description, '头部计算机断层摄影，用于判断脑部情况'),
    n.method = coalesce(n.method, '影像学检查'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠维持障碍'
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
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '疲乏'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = 'CT扫描'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #38
   Timestamp: 2024-12-27 20:07:56
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '一种持续的睡眠障碍，患者常常难以入睡或维持睡眠状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, '一种睡眠时上气道反复塌陷、阻塞引起呼吸暂停和低通气的疾病'),
    n.severity = coalesce(n.severity, '严重');

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

MERGE (n:Symptom {name: '无法入睡'})
SET 
    n.description = coalesce(n.description, '难以入睡或维持睡眠状态的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '因不能入睡而感到焦虑'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断睡眠障碍的金标准'),
    n.method = coalesce(n.method, '监测心电图、脑电图等'),
    n.requirement = coalesce(n.requirement, '在实验室中进行');

MERGE (n:NonDrugTreatment {name: '放松疗法'})
SET 
    n.description = coalesce(n.description, '通过一系列不同形式的放松模式来帮助入睡'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '认知治疗'})
SET 
    n.description = coalesce(n.description, '用正确的信念和态度取代不良认知来改善睡眠'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '每周1次'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '矛盾意念法'})
SET 
    n.description = coalesce(n.description, '让患者努力保持清醒以转移焦虑，帮助入睡'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '每次觉醒后使用'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '渐进放松'})
SET 
    n.description = coalesce(n.description, '通过深呼吸和肌肉放松来促进睡眠'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '生物反馈法'})
SET 
    n.description = coalesce(n.description, '通过反馈信号学习调节生理功能以有利于睡眠'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '生物反馈仪器');

MERGE (n:NonDrugTreatment {name: '多组分治疗'})
SET 
    n.description = coalesce(n.description, '结合多种行为治疗方法以改善慢性失眠'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '每周'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '无法入睡'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '放松疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '认知治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '对症支持治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '矛盾意念法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '对症支持治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '渐进放松'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.78),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '综合治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '生物反馈法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '对症支持治疗');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '多组分治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.76),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '综合治疗');



// =====================================

/* Response #39
   Timestamp: 2024-12-27 20:07:56
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为紊乱'})
SET 
    n.description = coalesce(n.description, '表现为在REM睡眠期间的行为异常'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '肌张力增高'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期间肌张力增高的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '面部或肢体动作'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期间可能出现大量的面部或肢体动作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期间可见的周期性肢体运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '间歇');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于诊断RBD'),
    n.method = coalesce(n.method, '肌电图和视频监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: '脑部CT或MRI'})
SET 
    n.description = coalesce(n.description, '用于明确脑器质性疾病的存在'),
    n.method = coalesce(n.method, '影像学检查'),
    n.requirement = coalesce(n.requirement, '根据医生建议');

MERGE (n:NonDrugTreatment {name: '安全的睡眠环境'})
SET 
    n.description = coalesce(n.description, '为RBD患者提供相对安全的睡眠环境'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '床垫、家具保护');

MERGE (n:DrugTreatment {name: '氯硝西泮'})
SET 
    n.description = coalesce(n.description, '治疗RBD的有效药物'),
    n.dosage = coalesce(n.dosage, '0.25~2.0mg'),
    n.frequency = coalesce(n.frequency, '睡前15分钟服用'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '与痴呆、阻塞性睡眠呼吸暂停综合征患者谨慎使用');

MERGE (n:DrugTreatment {name: '褪黑激素'})
SET 
    n.description = coalesce(n.description, '用于控制RBD症状的药物'),
    n.dosage = coalesce(n.dosage, '3~12mg'),
    n.frequency = coalesce(n.frequency, '睡前服用'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:DrugTreatment {name: '多巴及多巴受体激动剂'})
SET 
    n.description = coalesce(n.description, '可能诱发或加重RBD的药物'),
    n.dosage = coalesce(n.dosage, '最大剂量0.7mg，3次/天'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '与帕金森病伴随RBD患者无效');

MERGE (n:Disease {name: '反复发作的孤立性睡瘫症'})
SET 
    n.description = coalesce(n.description, '从REM睡眠唤醒时出现意识的觉醒和肌肉失张力'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '短暂的不能进行随意运动'})
SET 
    n.description = coalesce(n.description, '意识清醒却暂时不能动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶现');

MERGE (n:Symptom {name: '意识清醒'})
SET 
    n.description = coalesce(n.description, '在失能状态下意识是清醒的'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于观察反复发作的孤立性睡瘫症'),
    n.method = coalesce(n.method, '脑电图监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:NonDrugTreatment {name: '规律睡眠习惯'})
SET 
    n.description = coalesce(n.description, '养成规律的睡眠习惯，以减少睡瘫症的发生'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:Disease {name: '梦魔障碍'})
SET 
    n.description = coalesce(n.description, '以恐怖不安或焦虑为主要特征的梦境体验'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '清晰的梦境回忆'})
SET 
    n.description = coalesce(n.description, '能详细回忆恐怖梦境'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑情绪'})
SET 
    n.description = coalesce(n.description, '由于梦境而导致的焦虑或恐惧情绪'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '心理评估'})
SET 
    n.description = coalesce(n.description, '评估梦魔障碍的频率和影响'),
    n.method = coalesce(n.method, '临床访谈'),
    n.requirement = coalesce(n.requirement, '根据临床表现');

MERGE (n:NonDrugTreatment {name: '认知行为治疗'})
SET 
    n.description = coalesce(n.description, '帮助患者认识到梦境与现实的关系'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

// 关系更新
MATCH (from) WHERE from.name = '肌张力增高'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '面部或肢体动作'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '周期性肢体运动'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '间歇'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '脑部CT或MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '安全的睡眠环境'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '褪黑激素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为紊乱'
MATCH (to) WHERE to.name = '多巴及多巴受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = '短暂的不能进行随意运动'
MATCH (to) WHERE to.name = '反复发作的孤立性睡瘫症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶现'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '意识清醒'
MATCH (to) WHERE to.name = '反复发作的孤立性睡瘫症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '反复发作的孤立性睡瘫症'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '反复发作的孤立性睡瘫症'
MATCH (to) WHERE to.name = '规律睡眠习惯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '一般治疗');

MATCH (from) WHERE from.name = '清晰的梦境回忆'
MATCH (to) WHERE to.name = '梦魔障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.92),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑情绪'
MATCH (to) WHERE to.name = '梦魔障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '梦魔障碍'
MATCH (to) WHERE to.name = '心理评估'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '梦魔障碍'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '心理治疗');



// =====================================

/* Response #40
   Timestamp: 2024-12-27 20:08:01
*/
// 节点更新
MERGE (n:Disease {name: '不规律睡眠觉醒节律障碍'})
SET 
    n.description = coalesce(n.description, '患者长期反复24小时内不规则睡眠觉醒发作，伴随日间过度思睡等症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '患者难以入睡的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '睡眠周期不规律'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '夜间睡眠中频繁觉醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '在不适当的时间感到困倦的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '一段时间内记录睡眠情况，以评估睡眠模式'),
    n.method = coalesce(n.method, '日常记录'),
    n.requirement = coalesce(n.requirement, '需要患者主动记录');

MERGE (n:Examination {name: '体动记录仪'})
SET 
    n.description = coalesce(n.description, '记录患者在24小时内的体动情况'),
    n.method = coalesce(n.method, '监测体动'),
    n.requirement = coalesce(n.requirement, '在特定条件下使用');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于评估患者的睡眠质量'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '通常不作为常规检查');

MERGE (n:Disease {name: '时差变化睡眠障碍'})
SET 
    n.description = coalesce(n.description, '快速跨越多个时区后，导致的昼夜节律失调性睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度');

// 关系更新
MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.92),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

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
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '不规律睡眠觉醒节律障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '时差变化睡眠障碍'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #41
   Timestamp: 2024-12-27 20:08:25
*/
// 节点更新
MERGE (n:Disease {name: '帕金森病'})
SET 
    n.description = coalesce(n.description, '一种常见的神经退行性疾病，影响运动控制和睡眠质量'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '患者在夜间难以入睡或维持睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间运动障碍'})
SET 
    n.description = coalesce(n.description, '患者在睡眠中出现异常运动行为'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦并可能突然入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '患者在静态时体验到下肢不适感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '快速眼球运动期行为紊乱'})
SET 
    n.description = coalesce(n.description, '患者在REM睡眠期表现出异常运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠状况和障碍'),
    n.method = coalesce(n.method, '多导睡眠监测法'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '夜间运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '快速眼球运动期行为紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #42
   Timestamp: 2024-12-27 20:08:25
*/
// 节点更新
MERGE (n:Disease {name: '重性抑郁障碍相关性睡眠障碍'})
SET 
    n.description = coalesce(n.description, '由重性抑郁障碍引起的睡眠紊乱'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或维持睡眠困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '过度睡眠'})
SET 
    n.description = coalesce(n.description, '白天反复睡眠发作或夜间睡眠时间超过9小时'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不常见');

MERGE (n:Symptom {name: '噩梦'})
SET 
    n.description = coalesce(n.description, '噩梦的发生影响睡眠质量'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于了解睡眠结构及监测睡眠紊乱'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '重性抑郁障碍相关性睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '过度睡眠'
MATCH (to) WHERE to.name = '重性抑郁障碍相关性睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '噩梦'
MATCH (to) WHERE to.name = '重性抑郁障碍相关性睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '重性抑郁障碍相关性睡眠障碍'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #43
   Timestamp: 2024-12-27 20:08:25
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关性癫痫'})
SET 
    n.description = coalesce(n.description, '夜间发生的癫痫发作，常导致患者在睡眠中觉醒'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠中发生的呼吸暂停，导致睡眠质量下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '频繁夜间觉醒'})
SET 
    n.description = coalesce(n.description, '多次在夜间醒来，影响睡眠连续性'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠片段化'})
SET 
    n.description = coalesce(n.description, '睡眠被打断，表现为觉醒和再入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到无故的困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抗癫痫药物相关嗜睡'})
SET 
    n.description = coalesce(n.description, '由于药物副作用导致的困倦'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '夜间睡眠时出现的呼吸问题'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '频繁夜间觉醒'
MATCH (to) WHERE to.name = '睡眠相关性癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠片段化'
MATCH (to) WHERE to.name = '睡眠相关性癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度嗜睡'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '抗癫痫药物相关嗜睡'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠相关性癫痫'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #44
   Timestamp: 2024-12-27 20:08:26
*/
// 节点更新
MERGE (n:Disease {name: '致死性失眠'})
SET 
    n.description = coalesce(n.description, '一种至今尚无有效治疗方法的疾病'),
    n.severity = coalesce(n.severity, '极重');

MERGE (n:Disease {name: '广泛性焦虑障碍'})
SET 
    n.description = coalesce(n.description, '以持续显著的紧张不安和过分警觉为特征的慢性焦虑障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '惊恐障碍'})
SET 
    n.description = coalesce(n.description, '其主要特征为反复惊恐发作的疾病'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Symptom {name: '睡眠困难'})
SET 
    n.description = coalesce(n.description, '无法入睡或维持睡眠的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间觉醒'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来并难以再次入睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '早于预定时间醒来且无法再入睡的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '预期性焦虑'})
SET 
    n.description = coalesce(n.description, '对夜间可能失眠的焦虑情绪'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '强烈恐惧'})
SET 
    n.description = coalesce(n.description, '在惊恐障碍发作期间产生的强烈恐惧感'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '身体不适'})
SET 
    n.description = coalesce(n.description, '惊恐发作时的身体不适感，如心动过速或胸部不适'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '用于监测睡眠过程和质量的检查'),
    n.method = coalesce(n.method, '多导睡眠记录'),
    n.requirement = coalesce(n.requirement, '需在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '夜间觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '夜间觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '预期性焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '强烈恐惧'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '身体不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '致死性失眠'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '广泛性焦虑障碍'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '惊恐障碍'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #45
   Timestamp: 2024-12-27 20:08:27
*/
// 节点更新
MERGE (n:Disease {name: '精神分裂症相关性睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与精神分裂症相关的睡眠障碍，主要表现为失眠和睡眠质量下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难，难以入睡或维持睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '在清醒时体验到不真实的感觉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '做噩梦'})
SET 
    n.description = coalesce(n.description, '频繁经历不愉快的梦境'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '片段睡眠'})
SET 
    n.description = coalesce(n.description, '睡眠不连续，经常醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.description = coalesce(n.description, '入睡的时间延长'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，评估睡眠结构和质量'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '做噩梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '片段睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = '睡眠潜伏期延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '精神分裂症相关性睡眠障碍'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #46
   Timestamp: 2024-12-27 20:08:29
*/
// 节点更新
MERGE (n:Disease {name: '慢性阻塞性肺病'})
SET 
    n.description = coalesce(n.description, '一种持续影响气道和肺部的慢性疾病，导致呼吸困难'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '由于各种原因导致的睡眠质量下降或睡眠时间不足'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天出现的过度困倦，影响日常生活'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '晨起头痛'})
SET 
    n.description = coalesce(n.description, '醒来时出现头痛的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测(PSG)'})
SET 
    n.description = coalesce(n.description, '记录睡眠阶段及睡眠相关的生理参数'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '住院或家庭环境均可');

MERGE (n:DrugTreatment {name: '抗胆碱能药物(溴化异丙托品)'})
SET 
    n.description = coalesce(n.description, '用于改善慢性阻塞性肺病患者睡眠期的呼吸情况'),
    n.dosage = coalesce(n.dosage, '每日剂量根据医生建议'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '4周'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对胆碱能药物过敏');

MERGE (n:DrugTreatment {name: '沙美特罗'})
SET 
    n.description = coalesce(n.description, '长效β受体激动剂，有助于改善气体交换'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '吸入'),
    n.contraindication = coalesce(n.contraindication, '对该药物过敏');

MERGE (n:NonDrugTreatment {name: '呼吸肌锻炼'})
SET 
    n.description = coalesce(n.description, '通过锻炼增强呼吸肌的活性，改善通气'),
    n.duration = coalesce(n.duration, '10周'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '无创机械通气治疗'})
SET 
    n.description = coalesce(n.description, '通过无创通气改善患者的呼吸状态与睡眠质量'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无创通气设备');

MERGE (n:Disease {name: '哮喘'})
SET 
    n.description = coalesce(n.description, '一种慢性炎症性气道疾病，表现为气道高反应性'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '由于呼吸困难和夜间症状引起的心理反应'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:NonDrugTreatment {name: '认知行为治疗'})
SET 
    n.description = coalesce(n.description, '通过心理干预改善病人睡眠质量与焦虑感'),
    n.duration = coalesce(n.duration, '每周一次'),
    n.frequency = coalesce(n.frequency, '多次疗程'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '心理治疗设备');

// 关系更新
MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '晨起头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '多导睡眠监测(PSG)'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '抗胆碱能药物(溴化异丙托品)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '沙美特罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '维持治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '呼吸肌锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期治疗');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '无创机械通气治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '重度患者');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '哮喘'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.65),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '慢性阻塞性肺病'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');



// =====================================

/* Response #47
   Timestamp: 2024-12-27 20:08:29
*/
// 节点更新
MERGE (n:Disease {name: '酒精相关睡眠障碍'})
SET 
    n.description = coalesce(n.description, '由于酒精使用导致睡眠质量和数量下降的问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠潜伏期缩短'})
SET 
    n.description = coalesce(n.description, '由于酒精使用，睡前入睡的时间缩短现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: 'REM睡眠减少'})
SET 
    n.description = coalesce(n.description, '酒精摄入后的REM睡眠时段下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠表浅和断续'})
SET 
    n.description = coalesce(n.description, '由于戒断症状，睡眠变得不稳定和浅表'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较为频繁');

MERGE (n:Symptom {name: '噩梦增多'})
SET 
    n.description = coalesce(n.description, '睡眠质量下降导致梦境或噩梦的频率增加'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '心动过速'})
SET 
    n.description = coalesce(n.description, '由于交感神经系统兴奋引发的心率加快现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '出汗'})
SET 
    n.description = coalesce(n.description, '酒精戒断症状的一种表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '问卷调查'})
SET 
    n.description = coalesce(n.description, '用于评估酒精使用及其对睡眠影响的检测'),
    n.method = coalesce(n.method, '问卷评估'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Disease {name: '咖啡因相关性障碍'})
SET 
    n.description = coalesce(n.description, '由于咖啡因摄入引发的睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间失眠'})
SET 
    n.description = coalesce(n.description, '因咖啡因摄入影响，导致的夜间无法入睡的状况'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '由于前一晚的咖啡因影响，白天有过度困倦感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较为频繁');

MERGE (n:Examination {name: '临床表现观察'})
SET 
    n.description = coalesce(n.description, '对咖啡因摄入后的睡眠模式进行观察与评估'),
    n.method = coalesce(n.method, '临床访谈'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Disease {name: '烟草相关性障碍'})
SET 
    n.description = coalesce(n.description, '由于尼古丁摄入导致的睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜间觉醒'})
SET 
    n.description = coalesce(n.description, '因尼古丁缺乏或戒断引发的夜间醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠质量下降'})
SET 
    n.description = coalesce(n.description, '由于烟草使用引起的整体睡眠质量差'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠图检查，用于观察烟草使用对睡眠的影响'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '安静环境');

// 关系更新
MATCH (from) WHERE from.name = '酒精相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠潜伏期缩短'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '酒精相关睡眠障碍'
MATCH (to) WHERE to.name = 'REM睡眠减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '酒精相关睡眠障碍'
MATCH (to) WHERE to.name = '睡眠表浅和断续'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '较为频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '酒精相关睡眠障碍'
MATCH (to) WHERE to.name = '噩梦增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '酒精相关睡眠障碍'
MATCH (to) WHERE to.name = '心动过速'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '酒精相关睡眠障碍'
MATCH (to) WHERE to.name = '出汗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '酒精相关睡眠障碍'
MATCH (to) WHERE to.name = '问卷调查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '夜间失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '较为频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '咖啡因相关性障碍'
MATCH (to) WHERE to.name = '临床表现观察'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '烟草相关性障碍'
MATCH (to) WHERE to.name = '夜间觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '烟草相关性障碍'
MATCH (to) WHERE to.name = '睡眠质量下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '烟草相关性障碍'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #48
   Timestamp: 2024-12-27 20:08:29
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '一种由上气道阻塞引起的睡眠呼吸障碍，导致反复呼吸暂停'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '中枢性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '因脑部控制呼吸的功能障碍而引起的睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '心力衰竭'})
SET 
    n.description = coalesce(n.description, '心脏泵血能力下降，导致身体各部位血液供应不足'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '夜间端坐呼吸'})
SET 
    n.description = coalesce(n.description, '在夜间持续保持坐姿以呼吸更为顺畅的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '阵发性呼吸困难'})
SET 
    n.description = coalesce(n.description, '夜间当躺下的时候突然感到呼吸困难的情况'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '咳粉红色泡沫样痰'})
SET 
    n.description = coalesce(n.description, '伴随着泡沫及血丝的痰液咳出'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '频繁的夜间醒来，打断睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦，无法保持清醒状态'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于评估睡眠中的呼吸障碍'),
    n.method = coalesce(n.method, '睡眠观察'),
    n.requirement = coalesce(n.requirement, '在安静的环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '严重'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '夜间端坐呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '阵发性呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '咳粉红色泡沫样痰'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间端坐呼吸'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '阵发性呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #49
   Timestamp: 2024-12-27 20:08:30
*/
// 节点更新
MERGE (n:Disease {name: '纤维肌痛'})
SET 
    n.description = coalesce(n.description, '一种导致慢性疼痛和多种症状的病症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '慢性疲劳综合征'})
SET 
    n.description = coalesce(n.description, '一种以极度疲劳为主症状的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '慢波睡眠减少'})
SET 
    n.description = coalesce(n.description, '睡眠结构中慢波睡眠的比例下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '无恢复感睡眠'})
SET 
    n.description = coalesce(n.description, '睡眠后没有恢复精力的感觉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '疼痛症状'})
SET 
    n.description = coalesce(n.description, '伴随的慢性疼痛'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '持续的无力感和疲惫感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '认知行为疗法'})
SET 
    n.description = coalesce(n.description, '帮助建立对睡眠的正确认知'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '放松疗法'})
SET 
    n.description = coalesce(n.description, '通过放松来改善睡眠质量'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '常见'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '有氧锻炼'})
SET 
    n.description = coalesce(n.description, '通过锻炼来提升体力和睡眠质量'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '频繁'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '运动器材');

MERGE (n:DrugTreatment {name: '普瑞巴林'})
SET 
    n.description = coalesce(n.description, '用于纤维肌痛的药物'),
    n.dosage = coalesce(n.dosage, '按医生处方'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对普瑞巴林过敏');

MERGE (n:DrugTreatment {name: '度洛西汀'})
SET 
    n.description = coalesce(n.description, '广泛用于缓解疼痛和改善睡眠的药物'),
    n.dosage = coalesce(n.dosage, '按医生处方'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对度洛西汀过敏');

MERGE (n:DrugTreatment {name: '米那普仑'})
SET 
    n.description = coalesce(n.description, '可改善无恢复感睡眠的药物'),
    n.dosage = coalesce(n.dosage, '按医生处方'),
    n.frequency = coalesce(n.frequency, '每日'),
    n.duration = coalesce(n.duration, '长期'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '对米那普仑过敏');

MERGE (n:Examination {name: '多导睡眠图检查'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠质量和结构的检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '无恢复感睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '疼痛症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性疲劳综合征'
MATCH (to) WHERE to.name = '无恢复感睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性疲劳综合征'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

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
    r.stage = coalesce(r.stage, '支持治疗');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '有氧锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '增强治疗');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '普瑞巴林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.88),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '度洛西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '米那普仑'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.87),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '多导睡眠图检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '慢性疲劳综合征'
MATCH (to) WHERE to.name = '多导睡眠图检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #50
   Timestamp: 2024-12-27 20:08:43
*/
// 节点更新
MERGE (n:Disease {name: '偏头痛'})
SET 
    n.description = coalesce(n.description, '一种表现为一侧眼球后部或额颞部中重度搏动样头痛的疾病'),
    n.severity = coalesce(n.severity, '中重度');

MERGE (n:Disease {name: '丛集性头痛'})
SET 
    n.description = coalesce(n.description, '一种表现为一侧眼眶周围、颧骨和额部的剧烈疼痛的疾病'),
    n.severity = coalesce(n.severity, '剧烈');

MERGE (n:Disease {name: '慢性阵发性半侧头痛'})
SET 
    n.description = coalesce(n.description, '一种变异型丛集性头痛，表现为一侧眼眶、眶上或颞部的剧痛'),
    n.severity = coalesce(n.severity, '剧烈');

MERGE (n:Disease {name: '睡眠性头痛'})
SET 
    n.description = coalesce(n.description, '只在夜间出现的罕见头痛类型'),
    n.severity = coalesce(n.severity, '轻至中度');

MERGE (n:Disease {name: '钟表半侧头痛'})
SET 
    n.description = coalesce(n.description, '一种非常罕见的疾病，以头痛像闹钟一样准时发生著称'),
    n.severity = coalesce(n.severity, '轻至中度');

MERGE (n:Disease {name: '觉醒头痛'})
SET 
    n.description = coalesce(n.description, '一种在醒来的时候发生的头痛'),
    n.severity = coalesce(n.severity, '轻至中度');

MERGE (n:Symptom {name: '恶心'})
SET 
    n.description = coalesce(n.description, '在偏头痛发作时常见的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定');

MERGE (n:Symptom {name: '呕吐'})
SET 
    n.description = coalesce(n.description, '偏头痛发作时可能出现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定');

MERGE (n:Symptom {name: '畏光'})
SET 
    n.description = coalesce(n.description, '偏头痛发作时常见的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定');

MERGE (n:Symptom {name: '流泪'})
SET 
    n.description = coalesce(n.description, '丛集性头痛的伴随症状之一'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定');

MERGE (n:Symptom {name: '鼻塞流涕'})
SET 
    n.description = coalesce(n.description, '丛集性头痛时可能出现的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定');

MERGE (n:Symptom {name: '自主神经症状'})
SET 
    n.description = coalesce(n.description, '包括结膜充血等伴随症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定');

// 关系更新
MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '恶心'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '畏光'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '丛集性头痛'
MATCH (to) WHERE to.name = '流泪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '剧烈');

MATCH (from) WHERE from.name = '丛集性头痛'
MATCH (to) WHERE to.name = '鼻塞流涕'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '剧烈');

MATCH (from) WHERE from.name = '丛集性头痛'
MATCH (to) WHERE to.name = '自主神经症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '剧烈');



// =====================================

/* Response #51
   Timestamp: 2024-12-27 20:08:51
*/
// 节点更新
MERGE (n:Disease {name: '胃食管反流病'})
SET 
    n.description = coalesce(n.description, '一种导致胃酸反流进入食管的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '反复呕吐'})
SET 
    n.description = coalesce(n.description, '无明显原因的反复呕吐现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '咽下困难'})
SET 
    n.description = coalesce(n.description, '吞咽食物时感到困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '慢性呼吸道感染'})
SET 
    n.description = coalesce(n.description, '反复发生的慢性呼吸道感染症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '难治性哮喘'})
SET 
    n.description = coalesce(n.description, '难以治疗的哮喘症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '生长发育迟缓'})
SET 
    n.description = coalesce(n.description, '儿童在生长和发育方面的延迟'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '室息'})
SET 
    n.description = coalesce(n.description, '睡眠中短暂无呼吸的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '睡眠质量差或无法入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '夜间出现多次呼吸暂停现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，诊断睡眠障碍的标准检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Disease {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '胰岛素分泌不足或利用障碍导致的代谢紊乱'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Symptom {name: '疲乏无力'})
SET 
    n.description = coalesce(n.description, '持续感到身体疲倦无力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多饮'})
SET 
    n.description = coalesce(n.description, '饮水量明显增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多食'})
SET 
    n.description = coalesce(n.description, '食量不断增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多尿'})
SET 
    n.description = coalesce(n.description, '排尿次数增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '消瘦'})
SET 
    n.description = coalesce(n.description, '体重明显减轻'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入睡或睡眠不深'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度频繁感到困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Disease {name: '甲状腺功能亢进症'})
SET 
    n.description = coalesce(n.description, '甲状腺产生过多的激素，导致代谢加快和多种症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入眠或保持睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '烦躁'})
SET 
    n.description = coalesce(n.description, '情绪不定，容易焦虑和烦恼'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Disease {name: '甲状腺功能减退症'})
SET 
    n.description = coalesce(n.description, '体内缺乏甲状腺激素，导致代谢减慢'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '常感到精力不足和疲倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天困倦和无精打采'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '记忆力减退'})
SET 
    n.description = coalesce(n.description, '无法集中注意力或记住事情'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Disease {name: '纤维肌痛'})
SET 
    n.description = coalesce(n.description, '一种导致普遍性疼痛和睡眠障碍的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '广泛性疼痛'})
SET 
    n.description = coalesce(n.description, '身体多个部位有疼痛感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '容易在夜间醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '睡眠时频繁做梦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Disease {name: '慢性疲劳综合征'})
SET 
    n.description = coalesce(n.description, '一种导致持续疲劳感和多种症状的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '持续疲劳'})
SET 
    n.description = coalesce(n.description, '持续感到极度疲惫'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '记忆力模糊'})
SET 
    n.description = coalesce(n.description, '无法清晰记忆和进行思考'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '反复呕吐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '咽下困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '慢性呼吸道感染'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '难治性哮喘'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '生长发育迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '室息'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '胃食管反流病'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '疲乏无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '多饮'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '多食'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '多尿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '消瘦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '甲状腺功能亢进症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '甲状腺功能亢进症'
MATCH (to) WHERE to.name = '烦躁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '甲状腺功能减退症'
MATCH (to) WHERE to.name = '记忆力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '广泛性疼痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '纤维肌痛'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性疲劳综合征'
MATCH (to) WHERE to.name = '持续疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性疲劳综合征'
MATCH (to) WHERE to.name = '记忆力模糊'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

