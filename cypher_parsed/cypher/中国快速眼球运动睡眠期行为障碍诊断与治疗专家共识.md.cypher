// File: 中国快速眼球运动睡眠期行为障碍诊断与治疗专家共识.md
// Processed at: 2024-12-12 01:30:18
// Total pairs: 19

/* Response #1
   Timestamp: 2024-12-12 01:29:34
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '具有独特表现的睡眠期疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '特发性RBD'})
SET 
    n.short_name = coalesce(n.short_name, 'iRBD'),
    n.description = coalesce(n.description, '约占RBD总数的60%');

MERGE (n:Disease {name: '继发性RBD'})
SET 
    n.short_name = coalesce(n.short_name, 'sRBD'),
    n.description = coalesce(n.description, '约占RBD总数的40%');

// 关系更新
MATCH (from) WHERE from.name = '特发性RBD'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6);

MATCH (from) WHERE from.name = '继发性RBD'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4);



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:29:35
*/
// 节点更新
MERGE (n:Disease {name: '特发性RBD'})
SET 
    n.description = coalesce(n.description, 'RBD 是一种独立症状，单独出现，无其他伴随症状'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:RiskFactor {name: '突触核蛋白病'})
SET 
    n.description = coalesce(n.description, '可能是突触核蛋白病的一个危险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '特发性RBD'
MATCH (to) WHERE to.name = '突触核蛋白病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '未知');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:29:37
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, 'RBD是以REM睡眠期肌肉失弛缓并出现与梦境相关的复杂运动为特征的发作性疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '持续或间歇性肌张力增高'})
SET 
    n.description = coalesce(n.description, '在REM睡眠期出现的肌张力增高现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '可变');

MERGE (n:Symptom {name: '多梦'})
SET 
    n.description = coalesce(n.description, '频繁做梦的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '梦境演绎行为'})
SET 
    n.description = coalesce(n.description, '在梦境中表现出与梦境相关的复杂行为'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '肌肉抽动'})
SET 
    n.description = coalesce(n.description, '睡眠中肌肉突然收缩的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '各种复杂剧烈的行为动作'})
SET 
    n.description = coalesce(n.description, '包括讲话、唱歌、喊叫等多种异常行为'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '持续或间歇性肌张力增高'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多梦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '梦境演绎行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '肌肉抽动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '各种复杂剧烈的行为动作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:29:38
*/
// 节点更新


// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:29:40
*/
// 节点更新


// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:29:40
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD'),
    n.description = coalesce(n.description, '一种睡眠障碍，表现为在快速眼动睡眠期出现不自主运动'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: 'REM睡眠期出现RWA'})
SET 
    n.description = coalesce(n.description, '在快速眼动睡眠期出现肌肉活动'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '梦境行为演绎'})
SET 
    n.description = coalesce(n.description, '在梦中表现出行为的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = 'REM睡眠期出现RWA'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '梦境行为演绎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:29:43
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '以梦境相关的行为和情感反应为特征的睡眠障碍，患者在睡眠中可能表现出行为动作甚至暴力行为。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '鲜活梦境'})
SET 
    n.description = coalesce(n.description, '经历鲜活或暴力的梦境，并伴随相关的行为或情感反应。'),
    n.severity = coalesce(n.severity, '明显'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '梦境相关行为'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现梦境内容相关的行为，可能涉及暴力或攻击性行为。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '身体受伤'})
SET 
    n.description = coalesce(n.description, '由于睡眠期间的不安定和梦境行为导致身体受伤。'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '白天思睡'})
SET 
    n.description = coalesce(n.description, '患者白天有思睡的情况，但相对少见。'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '少量');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '鲜活梦境'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '明显');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '梦境相关行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '身体受伤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '白天思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '少量'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:29:44
*/
// 节点更新
MERGE (n:Disease {name: '意识模糊性觉醒'})
SET 
    n.description = coalesce(n.description, '不能从睡眠中很快觉醒，从睡眠到觉醒的过程中有一段较长的意识模糊期，但没有暴力行为.');

MERGE (n:Symptom {name: '意识模糊期'})
SET 
    n.description = coalesce(n.description, '从睡眠中觉醒有一段较长的意识模糊期'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '意识模糊期'
MATCH (to) WHERE to.name = '意识模糊性觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:29:45
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, 'RBD是一种病症，特征为REM睡眠期间伴随梦境及肢体活动'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '多系统萎缩'});

MERGE (n:Disease {name: '路易体痴呆'});

MERGE (n:Treatment {name: 'A级推荐'})
SET 
    n.type = coalesce(n.type, '治疗方案'),
    n.description = coalesce(n.description, '基于循证医学I级证据或获得大多数认可的II级证据，若无禁忌可直接用于临床实践'),
    n.recommendation_level = coalesce(n.recommendation_level, 'A级');

MERGE (n:Treatment {name: 'B级推荐'})
SET 
    n.type = coalesce(n.type, '治疗方案'),
    n.description = coalesce(n.description, '基于II级循证医学证据或高度一致的专家共识，适应证充分时可应用'),
    n.recommendation_level = coalesce(n.recommendation_level, 'B级');

MERGE (n:Treatment {name: 'C级推荐'})
SET 
    n.type = coalesce(n.type, '治疗方案'),
    n.description = coalesce(n.description, '基于循证医学III级证据或专家共识，可在与患者讨论后应用'),
    n.recommendation_level = coalesce(n.recommendation_level, 'C级');

MERGE (n:Treatment {name: 'D级推荐'})
SET 
    n.type = coalesce(n.type, '治疗方案'),
    n.description = coalesce(n.description, '可选择性方案，需告知患者可能潜在的危险，不用于无适应证的患者'),
    n.recommendation_level = coalesce(n.recommendation_level, 'D级');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多系统萎缩'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '路易体痴呆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = 'A级推荐'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = 'B级推荐'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = 'C级推荐'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = 'D级推荐'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '可选'),
    r.stage = coalesce(r.stage, '后期');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:29:45
*/
// 节点更新
MERGE (n:Disease {name: '睡惊症'})
SET 
    n.description = coalesce(n.description, '极度恐惧, 尖叫, 自主神经功能紊乱'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡行症'})
SET 
    n.description = coalesce(n.description, '睡眠中起床行走'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多发生于入睡时或 NREM 睡眠1期'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '监测睡眠阶段');

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '发生于 NREM 睡眠期'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '监测睡眠阶段');

// 关系更新
MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '睡行症'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡惊症'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡行症'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:29:45
*/
// 节点更新


// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:29:47
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '监测REM睡眠期骨骼肌活动'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '监测上下肢的肌电图');

MERGE (n:Scale {name: 'RBD筛查问卷'})
SET 
    n.description = coalesce(n.description, '用于筛查快速眼球运动睡眠期行为障碍'),
    n.score_range = coalesce(n.score_range, '待定义'),
    n.interpretation = coalesce(n.interpretation, '待定义');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = 'RBD筛查问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '必需');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:29:47
*/
// 节点更新
MERGE (n:Symptom {name: '梦魇'})
SET 
    n.description = coalesce(n.description, '恐怖且长而复杂的梦境'),
    n.severity = coalesce(n.severity, '强烈的恐怖焦虑'),
    n.frequency = coalesce(n.frequency, '儿童期');

MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.description = coalesce(n.description, '涉及快速眼球运动睡眠期的行为障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '梦魇'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '儿童期'),
    r.severity = coalesce(r.severity, '强烈的恐怖焦虑');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:29:49
*/
// 节点更新
MERGE (n:Disease {name: '创伤后应激障碍'})
SET 
    n.description = coalesce(n.description, '患者有强烈的创伤经历，症状表现与创伤经历密切相关。清醒时有创伤性应激障碍的其他表现，如持续警觉性增高、持续回避，并伴有社会功能损害。');

MERGE (n:Symptom {name: '持续警觉性增高'})
SET 
    n.description = coalesce(n.description, '病人对周围环境保持高度警惕'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '持续回避'})
SET 
    n.description = coalesce(n.description, '对与创伤相关的情境或记忆的摆脱'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '社会功能损害'})
SET 
    n.description = coalesce(n.description, '由于创伤经历导致的日常生活或社交能力下降'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '持续警觉性增高'
MATCH (to) WHERE to.name = '创伤后应激障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '持续回避'
MATCH (to) WHERE to.name = '创伤后应激障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '社会功能损害'
MATCH (to) WHERE to.name = '创伤后应激障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:29:52
*/
// 节点更新
MERGE (n:Disease {name: '睡眠期癫痫'});

MERGE (n:Symptom {name: '癫痫发作'});

MERGE (n:Symptom {name: '复杂部分性发作'});

MERGE (n:Symptom {name: '夜间较少见'});

MERGE (n:Symptom {name: '一般不能回忆生动梦境'});

MERGE (n:Symptom {name: '自动症'});

MERGE (n:Symptom {name: '攻击行为'});

MERGE (n:Symptom {name: '强直样活动'});

MERGE (n:Symptom {name: '阵挛样活动'});

MERGE (n:Symptom {name: 'REM行为障碍'});

MERGE (n:Symptom {name: '局灶性运动'});

MERGE (n:Examination {name: 'PSG监测'})
SET 
    n.description = coalesce(n.description, '多导睡眠图监测'),
    n.method = coalesce(n.method, '监测睡眠周期和睡眠质量'),
    n.requirement = coalesce(n.requirement, '观察连续睡眠状态');

MERGE (n:Examination {name: '睡眠脑电图监测'})
SET 
    n.description = coalesce(n.description, '监测睡眠脑电活动'),
    n.method = coalesce(n.method, '检测脑电波'),
    n.requirement = coalesce(n.requirement, '佩戴脑电图仪器');

// 关系更新
MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '癫痫发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '复杂部分性发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '夜间较少见'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '一般不能回忆生动梦境'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '自动症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '攻击行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '强直样活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.3),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '阵挛样活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.3),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = 'REM行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '局灶性运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.2),
    r.frequency = coalesce(r.frequency, '非常少见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = 'PSG监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠期癫痫'
MATCH (to) WHERE to.name = '睡眠脑电图监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:29:54
*/
// 节点更新
MERGE (n:Disease {name: '继发性 RBD'})
SET 
    n.description = coalesce(n.description, '反映与其他疾病相关的快速眼球运动睡眠行为障碍');

MERGE (n:Disease {name: '药源性 RBD'})
SET 
    n.description = coalesce(n.description, '由药物引起的快速眼球运动睡眠行为障碍');

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: 'Machado-Joseph 病'});

MERGE (n:Disease {name: '肌萎缩侧索硬化'});

MERGE (n:Disease {name: '癫痫'});

MERGE (n:Disease {name: '多发性硬化'});

MERGE (n:Disease {name: '吉兰-巴雷综合征'});

MERGE (n:Disease {name: '帕金森病'});

MERGE (n:Disease {name: '路易体痴呆 (DLB)'});

MERGE (n:Disease {name: '多系统萎缩 (MSA)'});

MERGE (n:Disease {name: '阿尔茨海默病 (AD)'});

MERGE (n:Disease {name: '进行性核上性麻痹 (PSP)'});

MERGE (n:Disease {name: '皮质基底节变性 (CBD)'});

MERGE (n:Disease {name: '额颞叶痴呆 (FTD)'});

// 关系更新
MATCH (from) WHERE from.name = '药源性 RBD'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '可能发生'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '一般');

MATCH (from) WHERE from.name = 'Machado-Joseph 病'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '一般');

MATCH (from) WHERE from.name = '肌萎缩侧索硬化'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '一般');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '一般');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '一般');

MATCH (from) WHERE from.name = '吉兰-巴雷综合征'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '一般');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '33%-100%'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '路易体痴呆 (DLB)'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '75%-100%'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多系统萎缩 (MSA)'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '接近100%'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '路易体痴呆 (DLB)'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '多系统萎缩 (MSA)'
MATCH (to) WHERE to.name = '继发性 RBD'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:29:55
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Disease {name: '阻塞性呼吸睡眠暂停综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAS');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '临床症状中的伤害性行为'})
SET 
    n.description = coalesce(n.description, '高达30%∼81%的发生率'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Treatment {name: '安全的睡眠环境'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '为伴有伤害性行为的RBD患者提供相对安全的睡眠环境'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '临床症状中的伤害性行为'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性呼吸睡眠暂停综合征'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '快速眼球运动睡眠期行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '安全的睡眠环境'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '标准化治疗');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:30:00
*/
// 节点更新
MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Treatment {name: '地昔帕明'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '有效抑制周期性的REM睡眠'),
    n.dosage = coalesce(n.dosage, '50mg/晚'),
    n.duration = coalesce(n.duration, '3周');

MERGE (n:Treatment {name: '氯氮平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗伴有痴呆的RBD患者');

MERGE (n:Treatment {name: '卡马西平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可单独使用或与苯二氮草类药物联用，有效缓解RBD症状控制剧烈的伤害性行为'),
    n.dosage = coalesce(n.dosage, '0.1g/次, 3次/d');

MERGE (n:Treatment {name: '抑肝散'})
SET 
    n.type = coalesce(n.type, '中药'),
    n.description = coalesce(n.description, '对RBD有缓解作用，机制可能与影响GABA能和5-羟色胺能神经的活性有关');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '地昔帕明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '氯氮平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '卡马西平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '抑肝散'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:30:18
*/
// 节点更新
MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '治疗RBD的有效药物'),
    n.dosage = coalesce(n.dosage, '0.25~2.00 mg'),
    n.duration = coalesce(n.duration, '睡前15 min服用，最高不超过4.0 mg'),
    n.contraindication = coalesce(n.contraindication, '慎用于RBD伴有痴呆、步态异常及OSAS患者; 用药过程中需严格监控，尤其适用于神经退行性疾病、OSAS及肝功能异常患者');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '治疗RBD，效果明显且不良反应较少'),
    n.dosage = coalesce(n.dosage, '3~12 mg'),
    n.duration = coalesce(n.duration, '睡前服用');

MERGE (n:Treatment {name: '多巴及多巴受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '左旋多巴对RBD效果尚不肯定; 普拉克索治疗RBD有一定疗效'),
    n.dosage = coalesce(n.dosage, '每日最大剂量不超过0.7 mg'),
    n.contraindication = coalesce(n.contraindication, '一些原发性RBD患者存在多巴胺能黑质纹状体通路障碍');

MERGE (n:Treatment {name: '帕罗西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '治疗RBD效果尚不肯定，可能诱发或加重症状'),
    n.dosage = coalesce(n.dosage, '10~40 mg'),
    n.duration = coalesce(n.duration, '睡前服用');

MERGE (n:Treatment {name: '多奈哌齐'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '乙酰胆碱酯酶抑制剂，可能对RBD症状有缓解作用'),
    n.dosage = coalesce(n.dosage, '10~15 mg'),
    n.duration = coalesce(n.duration, '晚上睡前服用'),
    n.contraindication = coalesce(n.contraindication, '对治疗RBD的疗效尚存在争议，可能引起惊厥');

MERGE (n:Treatment {name: '镇静催眠药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '右佐匹克隆与佐匹克隆，兴奋GABA能神经元'),
    n.dosage = coalesce(n.dosage, '小剂量睡前服用'),
    n.contraindication = coalesce(n.contraindication, '临床缺乏充足证据');

MERGE (n:Disease {name: '快速眼球运动睡眠期行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

// 关系更新
MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, 'B级推荐'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, 'B级推荐'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多巴及多巴受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, 'C级推荐'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '帕罗西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, 'C级推荐'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '多奈哌齐'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, 'C级推荐'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '快速眼球运动睡眠期行为障碍'
MATCH (to) WHERE to.name = '镇静催眠药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.55),
    r.priority = coalesce(r.priority, 'C级推荐'),
    r.stage = coalesce(r.stage, '治疗阶段');



// =====================================

