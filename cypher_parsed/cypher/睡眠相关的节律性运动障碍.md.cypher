// File: 睡眠相关的节律性运动障碍.md
// Processed at: 2024-12-12 01:56:09
// Total pairs: 12

/* Response #1
   Timestamp: 2024-12-12 01:55:40
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:55:40
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:55:45
*/
// 节点更新


// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:55:50
*/
// 节点更新
MERGE (n:Disease {name: '药物过度使用性头痛'})
SET 
    n.code = coalesce(n.code, 'MOH'),
    n.description = coalesce(n.description, '一种慢性头痛形式'),
    n.category = coalesce(n.category, '头痛'),
    n.severity = coalesce(n.severity, '慢性');

MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '疼痛感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '药物过度使用性头痛'
MATCH (to) WHERE to.name = '头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:55:51
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '表现为大肌肉群做重复、刻板、节律性的运动，与睡眠显著相关，可能导致日间功能障碍和自身损伤'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '妨碍正常睡眠'})
SET 
    n.description = coalesce(n.description, '运动行为妨碍正常的睡眠过程'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间功能严重障碍'})
SET 
    n.description = coalesce(n.description, '日间活动受限，影响正常生活'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '可能造成损伤'})
SET 
    n.description = coalesce(n.description, '在没有防范措施的情况下可能导致自身损伤'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: 'V-PSG'})
SET 
    n.description = coalesce(n.description, '视频多导睡眠图监测'),
    n.method = coalesce(n.method, '脑电图监测'),
    n.requirement = coalesce(n.requirement, '需要在睡眠状态下进行');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '妨碍正常睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '日间功能严重障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '可能造成损伤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = 'V-PSG'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:55:52
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.description = coalesce(n.description, 'SRMD的病因不明，绝大多数患者不伴有其他疾病，也有少数患者同时患有精神发育迟滞、自闭症等神经精神疾病。'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '精神发育迟滞'})
SET 
    n.description = coalesce(n.description, '一种影响认知发展的心理障碍。'),
    n.category = coalesce(n.category, '神经精神疾病');

MERGE (n:Disease {name: '自闭症'})
SET 
    n.description = coalesce(n.description, '一种影响社交和交流的神经发育障碍。'),
    n.category = coalesce(n.category, '神经精神疾病');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '精神发育迟滞'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '自闭症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '精神发育迟滞'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '低');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '自闭症'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '低');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:55:52
*/
// 节点更新
MERGE (n:Disease {name: '节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '重复、刻板和节律性的大组肌群的运动，多发生在人睡时和睡眠中，少数发生在早晨将醒时，由撞头、摇头、身体前后摆动及身体旋转等复杂而固定模式的异常运动组成'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '撞头'});

MERGE (n:Symptom {name: '摇头'});

MERGE (n:Symptom {name: '身体前后摆动'});

MERGE (n:Symptom {name: '身体旋转'});

// 关系更新
MATCH (from) WHERE from.name = '撞头'
MATCH (to) WHERE to.name = '节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '0.5~2.0 次/s'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '摇头'
MATCH (to) WHERE to.name = '节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '0.5~2.0 次/s'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '身体前后摆动'
MATCH (to) WHERE to.name = '节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '0.5~2.0 次/s'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '身体旋转'
MATCH (to) WHERE to.name = '节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '0.5~2.0 次/s'),
    r.severity = coalesce(r.severity, '轻度');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:55:53
*/
// 节点更新


// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:55:54
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '与睡眠相关的综合征，表现为身体多部位重复的节律性刻板样动作'),
    n.category = coalesce(n.category, '睡眠运动障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '发作性'})
SET 
    n.description = coalesce(n.description, '发作性'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '反复性'})
SET 
    n.description = coalesce(n.description, '反复性'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '刻板性'})
SET 
    n.description = coalesce(n.description, '刻板性'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '发作后回忆困难'})
SET 
    n.description = coalesce(n.description, '发作后不能回忆发作过程'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '反复');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '发作性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '反复性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '刻板性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '发作后回忆困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:56:01
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.description = coalesce(n.description, '以不规则的运动干扰睡眠的疾病');

MERGE (n:Complication {name: '颅脑外伤'})
SET 
    n.description = coalesce(n.description, '由于运动导致的头部受伤'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '颈动脉破裂'})
SET 
    n.description = coalesce(n.description, '运动导致的颈部血管损伤'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '视网膜出血'})
SET 
    n.description = coalesce(n.description, '运动导致的眼部出血'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '腿部的不适感，难以安静地坐着或躺着'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '持续的担心或恐惧感'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落的状态'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '白日嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '易激惹'})
SET 
    n.description = coalesce(n.description, '容易感到烦躁'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '难以集中焦点'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠质量差'})
SET 
    n.description = coalesce(n.description, '难以入睡或保持睡眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于减少SRMD发作的药物'),
    n.dosage = coalesce(n.dosage, '0.5~1.0 mg'),
    n.duration = coalesce(n.duration, '按需服用'),
    n.contraindication = coalesce(n.contraindication, '尚无长期疗效研究');

MERGE (n:Treatment {name: '丙咪嗪'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '对SRMD有效的治疗药物'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '根据医生处方'),
    n.contraindication = coalesce(n.contraindication, '个体差异');

MERGE (n:Treatment {name: '行为干预'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过行为改变改善症状'),
    n.dosage = coalesce(n.dosage, '根据医生指导'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '个体差异');

MERGE (n:Treatment {name: '催眠'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过催眠帮助入睡'),
    n.dosage = coalesce(n.dosage, '根据医生指导'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '个体差异');

MERGE (n:Treatment {name: '睡眠限定'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '限制入睡时间以提高睡眠质量'),
    n.dosage = coalesce(n.dosage, '根据医生指导'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '个体差异');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '颅脑外伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '颈动脉破裂'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '视网膜出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '白日嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '易激惹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '注意力不集中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '睡眠质量差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '丙咪嗪'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后续');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '行为干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助手段');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '催眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助手段');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '睡眠限定'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助手段');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:56:03
*/
// 节点更新
MERGE (n:Symptom {name: '头痛'})
SET 
    n.description = coalesce(n.description, '在药物过量应用期间头痛加重或恶化'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '≥ 15 d/月');

MERGE (n:Treatment {name: '药物过量使用'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '在药物过量使用后可能导致头痛Symptom加重'),
    n.duration = coalesce(n.duration, '≥ 3 个月');

MERGE (n:RiskFactor {name: '遗传因素'})
SET 
    n.description = coalesce(n.description, 'MOH具有遗传易患性'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '家族史患者'})
SET 
    n.description = coalesce(n.description, '风险增加3倍'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '家庭成员存在MOH'})
SET 
    n.description = coalesce(n.description, '风险增加4倍'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Complication {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '与头痛合并出现'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '与头痛合并出现'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '药物过量使用'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '≥ 15 d/月'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '遗传因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '家族史患者'
MATCH (to) WHERE to.name = '遗传因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '家庭成员存在MOH'
MATCH (to) WHERE to.name = '遗传因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '持续存在');

MATCH (from) WHERE from.name = '头痛'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '持续存在');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:56:09
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.description = coalesce(n.description, 'SRMD主要发生在人睡时、睡中短暂觉醒期或浅睡的转换阶段，可能导致失眠和各种并发症'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '撞头型发作'})
SET 
    n.description = coalesce(n.description, '坐位时双下肢跪位，上身前后或侧位节律性摆动并有力的撞头'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚数次至数十次');

MERGE (n:Symptom {name: '摇头型发作'})
SET 
    n.description = coalesce(n.description, '仰卧位时头部向左右不停地摇摆'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚数次至数十次');

MERGE (n:Symptom {name: '身体摇摆型发作'})
SET 
    n.description = coalesce(n.description, '以手和膝支撑，坐位时摇摆身体'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚数次至数十次');

MERGE (n:Symptom {name: '腿摇摆型发作'})
SET 
    n.description = coalesce(n.description, '腿摇摆'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚数次至数十次');

MERGE (n:Symptom {name: '腿撞击型发作'})
SET 
    n.description = coalesce(n.description, '腿撞击'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚数次至数十次');

MERGE (n:Complication {name: '颈动脉夹层'})
SET 
    n.description = coalesce(n.description, '由于剧烈的碰撞导致颈动脉夹层'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '视网膜出血'})
SET 
    n.description = coalesce(n.description, '碰撞导致视网膜出血'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '头部创伤'})
SET 
    n.description = coalesce(n.description, '因发作导致的头部创伤'),
    n.severity = coalesce(n.severity, '高');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '撞头型发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每晚数次至数十次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '摇头型发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每晚数次至数十次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '身体摇摆型发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每晚数次至数十次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '腿摇摆型发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每晚数次至数十次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '腿撞击型发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每晚数次至数十次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '颈动脉夹层'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '视网膜出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '头部创伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

