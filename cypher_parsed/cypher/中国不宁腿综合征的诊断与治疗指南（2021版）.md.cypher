// File: 中国不宁腿综合征的诊断与治疗指南（2021版）.md
// Processed at: 2024-12-12 01:57:33
// Total pairs: 52

/* Response #1
   Timestamp: 2024-12-12 01:56:34
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:56:35
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:56:37
*/
// 节点更新


// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:56:39
*/
// 节点更新


// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:56:40
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '不宁腿综合征是一种影响睡眠的神经系统疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '在静止时腿部感到不适，通常需要活动腿部才能缓解'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '夜间活动'})
SET 
    n.description = coalesce(n.description, '在夜间频繁活动以缓解腿部不适'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '夜间活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:56:41
*/
// 节点更新
MERGE (n:Disease {name: '中国不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '表现为无法抑制的腿部不适感，通常伴随有腿部的不自主活动'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Symptom {name: '间歇发作型'})
SET 
    n.description = coalesce(n.description, '症状出现频率平均每周少于2次'),
    n.frequency = coalesce(n.frequency, '每周少于2次');

MERGE (n:Symptom {name: '慢性持续型'})
SET 
    n.description = coalesce(n.description, '症状出现频率平均每周2次或以上（未经治疗的患者）'),
    n.frequency = coalesce(n.frequency, '每周2次或以上');

// 关系更新
MATCH (from) WHERE from.name = '间歇发作型'
MATCH (to) WHERE to.name = '中国不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周少于2次'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '慢性持续型'
MATCH (to) WHERE to.name = '中国不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '每周2次或以上'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:56:42
*/
// 节点更新


// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:56:43
*/
// 节点更新


// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:56:44
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种导致患者在静止状态下感到不适，从而出现强烈移动腿部冲动的病症'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '中枢神经系统铁缺乏'})
SET 
    n.description = coalesce(n.description, '中枢神经系统中铁含量不足的状态'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '中枢神经系统多巴胺能功能紊乱'})
SET 
    n.description = coalesce(n.description, '多巴胺系统功能受损的状态'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '基因变异'})
SET 
    n.description = coalesce(n.description, '基因序列或结构的变化'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '中枢神经系统铁缺乏'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '中枢神经系统多巴胺能功能紊乱'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '基因变异'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '低');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:56:45
*/
// 节点更新


// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:56:46
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '多巴胺能功能障碍'});

MERGE (n:Symptom {name: '症状加重'});

MERGE (n:Symptom {name: '症状改善'});

MERGE (n:Treatment {name: '甲氧氯普胺'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '多巴胺受体拮抗剂'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '无'),
    n.contraindication = coalesce(n.contraindication, '对RLS患者加重症状');

MERGE (n:Treatment {name: '多巴胺D2和D3受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善RLS临床症状'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '无'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '多巴胺能功能障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '症状加重'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '症状改善'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '甲氧氯普胺'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺D2和D3受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:56:49
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种感觉运动障碍性疾病，主要表现为强烈的腿部活动欲望，通常在傍晚或夜间加重。'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '强烈的活动腿的欲望，通常发生在傍晚或夜间，安静或休息时加重。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Treatment {name: '铁剂补充'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '当血清铁蛋白水平 <75 μg/L 和转铁蛋白饱和度 <45% 时，补充铁剂。');

MERGE (n:Treatment {name: '多巴胺受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '优先选用的治疗方法，虽未在中国获批，但可作为替代治疗药物。');

MERGE (n:Treatment {name: '阿片类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '当其他治疗方法无效时使用。');

MERGE (n:Examination {name: '血清铁蛋白检测'})
SET 
    n.description = coalesce(n.description, '检测血清中铁蛋白的水平。'),
    n.method = coalesce(n.method, '血液检测'),
    n.requirement = coalesce(n.requirement, '空腹');

// 关系更新
MATCH (from) WHERE from.name = '腿部不适'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '血清铁蛋白检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '铁剂补充'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段1');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗阶段2');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '阿片类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '治疗阶段3');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:56:50
*/
// 节点更新
MERGE (n:Scale {name: '国际RLS评定量表'})
SET 
    n.description = coalesce(n.description, '最常用的RLS症状严重程度评估量表');

MERGE (n:Scale {name: 'RLS生活质量问卷'})
SET 
    n.description = coalesce(n.description, '对RLS患者生活质量的评估量表');

MERGE (n:Scale {name: '症状恶化严重程度评定量表'})
SET 
    n.description = coalesce(n.description, '唯一可对症状恶化严重程度进行分级的评估量表');

MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Disease {name: '抑郁'});

MERGE (n:Disease {name: '焦虑'});

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '国际RLS评定量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'RLS生活质量问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '症状恶化严重程度评定量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:56:51
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种神经系统疾病，病人常感到腿部不适，尤其在静止时，通常导致睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Examination {name: '血常规'})
SET 
    n.description = coalesce(n.description, '用于评估血液成分及其功能'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

MERGE (n:Examination {name: '血清铁蛋白'})
SET 
    n.description = coalesce(n.description, '检测血液中铁的存储水平'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

MERGE (n:Examination {name: '总铁结合度'})
SET 
    n.description = coalesce(n.description, '评估血液中铁的传输能力'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

MERGE (n:Examination {name: '转铁蛋白饱和度'})
SET 
    n.description = coalesce(n.description, '检测血液中铁结合蛋白的饱和度'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

MERGE (n:Examination {name: '血尿素氮'})
SET 
    n.description = coalesce(n.description, '评估肾功能的常规检查'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

MERGE (n:Examination {name: '肌酐'})
SET 
    n.description = coalesce(n.description, '用于评估肾功能'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

MERGE (n:Examination {name: '血糖'})
SET 
    n.description = coalesce(n.description, '用于检测血糖水平'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

MERGE (n:Examination {name: '糖化血红蛋白'})
SET 
    n.description = coalesce(n.description, '反映过去几个月的平均血糖水平'),
    n.method = coalesce(n.method, '实验室检查'),
    n.requirement = coalesce(n.requirement, '无特殊准备');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '血常规'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '血清铁蛋白'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '总铁结合度'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '转铁蛋白饱和度'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '血尿素氮'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '肌酐'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '血糖'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '糖化血红蛋白'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:56:52
*/
// 节点更新
MERGE (n:Disease {name: '原发性不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '通常有家族史'),
    n.category = coalesce(n.category, '不宁腿综合征');

MERGE (n:Disease {name: '继发性不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '多种神经系统疾病、铁缺乏、妊娠和慢性肾脏疾病等因素可能导致'),
    n.category = coalesce(n.category, '不宁腿综合征');

MERGE (n:RiskFactor {name: '家族史'})
SET 
    n.description = coalesce(n.description, '大部分家族性RLS呈常染色体显性遗传');

MERGE (n:RiskFactor {name: '神经系统疾病'})
SET 
    n.description = coalesce(n.description, '包括帕金森病、脑卒中、多发性硬化、脊髓病变');

MERGE (n:RiskFactor {name: '铁缺乏'})
SET 
    n.description = coalesce(n.description, '与继发性RLS相关的因素之一');

MERGE (n:RiskFactor {name: '妊娠'})
SET 
    n.description = coalesce(n.description, '可能诱发继发性RLS');

MERGE (n:RiskFactor {name: '慢性肾脏疾病'})
SET 
    n.description = coalesce(n.description, '可能导致继发性RLS');

MERGE (n:RiskFactor {name: '药物/物质影响'})
SET 
    n.description = coalesce(n.description, '尼古丁、酒精、咖啡等可能诱发或加重RLS症状');

// 关系更新
MATCH (from) WHERE from.name = '原发性不宁腿综合征'
MATCH (to) WHERE to.name = '家族史'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '继发性不宁腿综合征'
MATCH (to) WHERE to.name = '神经系统疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '继发性不宁腿综合征'
MATCH (to) WHERE to.name = '铁缺乏'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '继发性不宁腿综合征'
MATCH (to) WHERE to.name = '妊娠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '证据不足');

MATCH (from) WHERE from.name = '继发性不宁腿综合征'
MATCH (to) WHERE to.name = '慢性肾脏疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '继发性不宁腿综合征'
MATCH (to) WHERE to.name = '药物/物质影响'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:56:52
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'R25.81'),
    n.description = coalesce(n.description, '以不适感为特征的四肢静态或动态症状，尤其是腿部'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '周期性肢体运动综合征'})
SET 
    n.description = coalesce(n.description, 'PLMS指数增高'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '家族史阳性'})
SET 
    n.description = coalesce(n.description, '有RLS家族史'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '低频');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '缺少显著日间思睡'),
    n.severity = coalesce(n.severity, '较低'),
    n.frequency = coalesce(n.frequency, '低频');

MERGE (n:Treatment {name: '多巴胺制剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗不宁腿综合征的药物'),
    n.dosage = coalesce(n.dosage, '依赖于患者情况'),
    n.duration = coalesce(n.duration, '需根据医生指示'),
    n.contraindication = coalesce(n.contraindication, '对多巴胺过敏的患者禁止使用');

// 关系更新
MATCH (from) WHERE from.name = '周期性肢体运动综合征'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '家族史阳性'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '低频'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '低频'),
    r.severity = coalesce(r.severity, '较低');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺制剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:56:52
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种引起持续的腿部不适和强烈的活动欲望的神经系统疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '其他非RLS疾病'})
SET 
    n.description = coalesce(n.description, '尚未具体化的与RLS相似的疾病'),
    n.category = coalesce(n.category, '其他疾病'),
    n.severity = coalesce(n.severity, '不明');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '其他非RLS疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '夜间加重'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:56:53
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '想要移动肢体的冲动'})
SET 
    n.description = coalesce(n.description, '强烈、迫切想要移动肢体的冲动/欲望，夜间睡眠或安静时出现或加重'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '肢体不适感'})
SET 
    n.description = coalesce(n.description, '蚁爬感、蠕动感、灼烧感等多种不适感，尤以小腿显著'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '晚间');

MERGE (n:Symptom {name: '睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '入睡困难、睡眠维持困难以及睡眠期或清醒期周期性肢体运动'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '夜间和白天');

MERGE (n:Symptom {name: '日间疲劳'})
SET 
    n.description = coalesce(n.description, '常导致日间疲劳、困倦、抑郁及焦虑'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '白天');

MERGE (n:Symptom {name: '注意缺陷多动障碍'})
SET 
    n.description = coalesce(n.description, 'ADHD在儿童和成人RLS患者中患病率增加'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '想要移动肢体的冲动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '肢体不适感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '日间疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '注意缺陷多动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:56:55
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '不宁腿综合征是一种导致腿部不适感并迫使患者移动腿的疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗中-重度不宁腿综合征的药物'),
    n.dosage = coalesce(n.dosage, '0.125 mg'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '对普拉克索过敏的患者');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首选治疗');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:56:56
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, 'PSG能客观显示RLS患者的睡眠紊乱'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Examination {name: '制动试验'})
SET 
    n.description = coalesce(n.description, 'SIT可用于评估清醒期周期性肢体运动和相关感觉症状'),
    n.method = coalesce(n.method, '就寝前受试者在清醒状态下坐在床上'),
    n.requirement = coalesce(n.requirement, '双下肢伸展，使用PSG监测');

MERGE (n:Examination {name: '下肢神经电生理及血管超声检查'})
SET 
    n.description = coalesce(n.description, '有助于排除脊髓、周围神经病变，和下肢血管病变继发的RLS'),
    n.method = coalesce(n.method, '电生理及血管超声检查'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.description = coalesce(n.description, '患者入睡所需的时间延长'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '觉醒指数升高'})
SET 
    n.description = coalesce(n.description, '夜间觉醒的次数增多'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较常见');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '患者在睡眠中出现周期性的肢体运动'),
    n.severity = coalesce(n.severity, '常见'),
    n.frequency = coalesce(n.frequency, '较常见');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '制动试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '下肢神经电生理及血管超声检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '睡眠潜伏期延长'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '觉醒指数升高'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '周期性肢体运动'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '常见');



// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:56:58
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '是一种导致腿部极度不适和无法抑制活动欲望的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适感'})
SET 
    n.description = coalesce(n.description, '一种迫切需要活动腿部的欲望，通常伴随腿部不适感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '晚间');

MERGE (n:Symptom {name: '症状在休息或不活动状态下出现或加重'})
SET 
    n.description = coalesce(n.description, '症状在躺着或坐着时会加重'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '晚上');

MERGE (n:Symptom {name: '运动可缓解'})
SET 
    n.description = coalesce(n.description, '运动可使症状部分或完全缓解'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '活动时');

MERGE (n:Symptom {name: '夜间加重'})
SET 
    n.description = coalesce(n.description, '症状主要发生在傍晚或夜间'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '晚上');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '症状在休息或不活动状态下出现或加重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '运动可缓解'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '夜间加重'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:56:58
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种用于治疗不宁腿综合征的药物'),
    n.dosage = coalesce(n.dosage, '依医生建议'),
    n.duration = coalesce(n.duration, '根据患者需要'),
    n.contraindication = coalesce(n.contraindication, '对该药物过敏的患者禁用');

MERGE (n:Symptom {name: 'PLMI'})
SET 
    n.description = coalesce(n.description, '不宁腿综合征的运动指数'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '主观睡眠质量'})
SET 
    n.description = coalesce(n.description, '患者自我评估的睡眠质量'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '经常');

// 关系更新
MATCH (from) WHERE from.name = 'PLMI'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '主观睡眠质量'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:56:59
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种以腿部不适为主要症状的神经系统疾病。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '腿部感到不适，影响睡眠的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '铁剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗铁缺乏引起的症状的药物。'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '3个月'),
    n.contraindication = coalesce(n.contraindication, '对铁剂过敏');

MERGE (n:Treatment {name: '静脉铁剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗铁缺乏的静脉注射药物。'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '静脉注射过敏史');

MERGE (n:RiskFactor {name: '药物诱发因素'})
SET 
    n.description = coalesce(n.description, '可能加重RLS症状的药物因素，包括多巴胺受体拮抗剂和抗抑郁药。'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '睡眠卫生习惯'})
SET 
    n.description = coalesce(n.description, '保持良好睡眠卫生习惯以缓解RLS症状。'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '腿部不适'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '铁剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '静脉铁剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '药物诱发因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠卫生习惯'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #24
   Timestamp: 2024-12-12 01:57:00
*/
// 节点更新
MERGE (n:Treatment {name: '罗替高汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于减轻不宁腿综合征症状'),
    n.dosage = coalesce(n.dosage, '未指定'),
    n.duration = coalesce(n.duration, '未指定'),
    n.contraindication = coalesce(n.contraindication, '未指定');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '腿部不适感，无法安静'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');



// =====================================

/* Response #25
   Timestamp: 2024-12-12 01:57:02
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '症状严重程度'})
SET 
    n.description = coalesce(n.description, 'RLS症状的严重程度');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于减轻RLS症状的药物'),
    n.dosage = coalesce(n.dosage, '具体剂量根据医生指导'),
    n.duration = coalesce(n.duration, '6个月至1年'),
    n.contraindication = coalesce(n.contraindication, '已知对普拉克索过敏');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '对D3受体的亲和力较高，减轻中重度RLS患者的临床症状和睡眠质量的药物'),
    n.dosage = coalesce(n.dosage, '具体剂量根据医生指导'),
    n.duration = coalesce(n.duration, '1个月以上'),
    n.contraindication = coalesce(n.contraindication, '已知对罗匹尼罗过敏');

MERGE (n:Complication {name: '用药后恶化'})
SET 
    n.description = coalesce(n.description, '在随访26周中发现的恶化现象'),
    n.severity = coalesce(n.severity, '低');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '症状严重程度'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '维持治疗');

MATCH (from) WHERE from.name = '罗匹尼罗'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:ANY_ADVERSE_REACTIONS]->(to)
SET 
    r.description = coalesce(r.description, '头昏、头痛、疲劳、眩晕和呕吐'),
    r.occurrence = coalesce(r.occurrence, '多在用药后1个月内出现');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '用药后恶化'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.04),
    r.timeframe = coalesce(r.timeframe, '26周内');



// =====================================

/* Response #26
   Timestamp: 2024-12-12 01:57:03
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '不宁腿综合征是一种影响下肢的病症，患者有无法控制的强烈想要移动双腿的感觉。'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Treatment {name: '硫酸亚铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗血清铁蛋白 ≤75 μg/L 的患者可能有效，与维生素C联合使用。'),
    n.dosage = coalesce(n.dosage, '325 mg/次 (2次/d)'),
    n.duration = coalesce(n.duration, '持续使用');

MERGE (n:Treatment {name: '羧基麦芽糖铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗中-重度RLS的有效性。'),
    n.dosage = coalesce(n.dosage, '1,000 mg');

MERGE (n:Treatment {name: '蔗糖铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '在血清铁蛋白 <300 μg/L 的RLS患者中输注的有效性未确定。'),
    n.dosage = coalesce(n.dosage, '200 mg/次, 5次'),
    n.duration = coalesce(n.duration, '间隔超过 24 h');

MERGE (n:Disease {name: '贫血'})
SET 
    n.code = coalesce(n.code, 'ANEMIA'),
    n.description = coalesce(n.description, '一种血液疾病，特征是红细胞不足或功能异常。'),
    n.category = coalesce(n.category, '血液疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '非贫血RLS'})
SET 
    n.code = coalesce(n.code, 'NON_ANEMIC_RLS'),
    n.description = coalesce(n.description, '不伴有贫血的不宁腿综合征。'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '硫酸亚铁'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '羧基麦芽糖铁'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '中度');

MATCH (from) WHERE from.name = '蔗糖铁'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '晚期');

MATCH (from) WHERE from.name = '贫血'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '非贫血RLS'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #27
   Timestamp: 2024-12-12 01:57:04
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种导致患者在静止状态下感到不适并产生不可抗拒的挥动腿部冲动的疾病'),
    n.severity = coalesce(n.severity, '中-重度');

MERGE (n:Symptom {name: 'RLS症状'})
SET 
    n.description = coalesce(n.description, '不宁腿综合征患者的主要症状'),
    n.severity = coalesce(n.severity, '中-重度');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可有效改善不宁腿综合征的药物'),
    n.dosage = coalesce(n.dosage, '0.25~4 mg/d'),
    n.duration = coalesce(n.duration, '依患者反应调整'),
    n.contraindication = coalesce(n.contraindication, '对该药物过敏');

MERGE (n:Treatment {name: '罗替高汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种D1-D5多巴胺受体激动剂，改善不宁腿综合征症状'),
    n.dosage = coalesce(n.dosage, '具体剂量依医生建议'),
    n.duration = coalesce(n.duration, '依患者反应调整'),
    n.contraindication = coalesce(n.contraindication, '对该药物过敏');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗替高汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = 'RLS症状'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中-重度');



// =====================================

/* Response #28
   Timestamp: 2024-12-12 01:57:04
*/
// 节点更新
MERGE (n:Disease {name: '缺铁性RLS'})
SET 
    n.description = coalesce(n.description, '缺铁性不宁腿综合征'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Treatment {name: '羧基麦芽糖铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '最初治疗方法之一'),
    n.dosage = coalesce(n.dosage, '依患者情况'),
    n.duration = coalesce(n.duration, '依患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '静脉铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缺铁性RLS患者'),
    n.dosage = coalesce(n.dosage, '依患者情况'),
    n.duration = coalesce(n.duration, '依患者情况'),
    n.contraindication = coalesce(n.contraindication, '血清铁蛋白水平 > 300μg/L或转铁蛋白饱和度 > 45%');

MERGE (n:Treatment {name: '多巴胺受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善RLS症状'),
    n.dosage = coalesce(n.dosage, '依患者情况'),
    n.duration = coalesce(n.duration, '依患者情况'),
    n.contraindication = coalesce(n.contraindication, '症状恶化时');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '唯一在中国获批RLS适应证的药物'),
    n.dosage = coalesce(n.dosage, '依患者情况'),
    n.duration = coalesce(n.duration, '依患者情况'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '缺铁性RLS'
MATCH (to) WHERE to.name = '羧基麦芽糖铁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '缺铁性RLS'
MATCH (to) WHERE to.name = '静脉铁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = '缺铁性RLS'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '改善症状');

MATCH (from) WHERE from.name = '多巴胺受体激动剂'
MATCH (to) WHERE to.name = '缺铁性RLS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');



// =====================================

/* Response #29
   Timestamp: 2024-12-12 01:57:05
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '一种神经系统疾病，导致患者在静止时感到不适，常伴随运动需求。');

MERGE (n:Treatment {name: '普瑞巴林'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种用于缓解神经疼痛和改善神经系统功能的药物。'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '按需使用'),
    n.contraindication = coalesce(n.contraindication, '对普瑞巴林过敏者禁用');

MERGE (n:Symptom {name: 'RLS症状'})
SET 
    n.description = coalesce(n.description, '不宁腿综合征的主要症状，包括腿部不适和无法静止。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = 'RLS症状'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普瑞巴林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #30
   Timestamp: 2024-12-12 01:57:06
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '加巴喷丁-恩那卡比'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善中-重度RLS及主观睡眠质量'),
    n.dosage = coalesce(n.dosage, '300~1200 mg/d'),
    n.duration = coalesce(n.duration, '<12周'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '普瑞巴林'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'GABA类似物，有效改善RLS，可能改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '未明确'),
    n.duration = coalesce(n.duration, '未明确'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁-恩那卡比'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普瑞巴林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代');



// =====================================

/* Response #31
   Timestamp: 2024-12-12 01:57:06
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: 'RLS症状'})
SET 
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '罗替高汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可有效减轻RLS症状严重程度'),
    n.dosage = coalesce(n.dosage, '1-3 mg/d'),
    n.duration = coalesce(n.duration, '6 个月'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '吡贝地尔'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '尚无足够的证据表明有效'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '无'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '左旋多巴'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '最早用于RLS治疗的多巴胺能药物'),
    n.dosage = coalesce(n.dosage, '100-200 mg'),
    n.duration = coalesce(n.duration, '无'),
    n.contraindication = coalesce(n.contraindication, '健康相关生活质量下降40%-60%');

// 关系更新
MATCH (from) WHERE from.name = 'RLS症状'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗替高汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '吡贝地尔'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '左旋多巴'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #32
   Timestamp: 2024-12-12 01:57:08
*/
// 节点更新
MERGE (n:Disease {name: '卒中后RLS'})
SET 
    n.description = coalesce(n.description, '卒中后不宁腿综合征'),
    n.code = coalesce(n.code, 'RLS'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压病'});

MERGE (n:Disease {name: '心血管疾病'});

MERGE (n:Disease {name: '卒中'});

// 关系更新
MATCH (from) WHERE from.name = '卒中后RLS'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '卒中后RLS'
MATCH (to) WHERE to.name = '高血压病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '卒中后RLS'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

/* Response #33
   Timestamp: 2024-12-12 01:57:10
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '不宁腿综合征是一种以下肢不适感和运动需求为特征的神经系统障碍。'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '不适感'})
SET 
    n.description = coalesce(n.description, '患者描述的下肢不适感，包括刺痛和瘙痒等。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Treatment {name: '普瑞巴林'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于改善不宁腿综合征症状的药物'),
    n.dosage = coalesce(n.dosage, '150 mg/d'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.contraindication = coalesce(n.contraindication, '尚无足够的证据支持用于情绪障碍治疗');

MERGE (n:Treatment {name: '羟考酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于改善不宁腿综合征的阿片类药物'),
    n.dosage = coalesce(n.dosage, '长期使用'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.contraindication = coalesce(n.contraindication, '潜在的滥用风险');

MERGE (n:Complication {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '可能由于使用阿片类药物而诱发或加重的病症'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普瑞巴林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '羟考酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = '不适感'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #34
   Timestamp: 2024-12-12 01:57:11
*/
// 节点更新
MERGE (n:Disease {name: '原发性不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '腿部不适症状'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Treatment {name: '适当体育锻炼'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改善原发性RLS腿部不适症状，尤其是渐进式有氧运动训练'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '无'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '腿部不适'
MATCH (to) WHERE to.name = '原发性不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '原发性不宁腿综合征'
MATCH (to) WHERE to.name = '适当体育锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #35
   Timestamp: 2024-12-12 01:57:14
*/
// 节点更新
MERGE (n:Disease {name: '慢性持续型RLS'})
SET 
    n.description = coalesce(n.description, '慢性腿部不适症状');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '在休息时腿部感到不适需要移动的症状');

MERGE (n:Treatment {name: '加巴喷丁-恩那卡比'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '加巴喷丁的缓释型前体药物'),
    n.dosage = coalesce(n.dosage, '1200 mg/d'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '加巴喷丁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '促进多巴胺能作用的药物'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '普瑞巴林'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解神经性疼痛的药物'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁-恩那卡比'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普瑞巴林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代治疗');



// =====================================

/* Response #36
   Timestamp: 2024-12-12 01:57:14
*/
// 节点更新


// =====================================

/* Response #37
   Timestamp: 2024-12-12 01:57:16
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Disease {name: '卒中'})
SET 
    n.short_name = coalesce(n.short_name, 'Stroke');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.short_name = coalesce(n.short_name, 'PD');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '患者感到腿部不适的症状'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '夜间运动'})
SET 
    n.description = coalesce(n.description, '在夜间出现腿部运动的症状'),
    n.severity = coalesce(n.severity, '较轻');

MERGE (n:RiskFactor {name: '铁缺乏'})
SET 
    n.description = coalesce(n.description, '体内缺乏铁元素'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '营养不良'})
SET 
    n.description = coalesce(n.description, '身体摄入营养不足'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种用于治疗不宁腿综合征的药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '持续使用'),
    n.contraindication = coalesce(n.contraindication, '对普拉克索过敏');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗不宁腿综合征的多巴胺受体激动剂'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '持续使用'),
    n.contraindication = coalesce(n.contraindication, '对罗匹尼罗过敏');

// 关系更新
MATCH (from) WHERE from.name = '卒中'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '铁缺乏'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '营养不良'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '腿部不适'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '夜间运动'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #38
   Timestamp: 2024-12-12 01:57:19
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '气动压缩装置'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '建议在每晚腿部不适症状发生前穿戴使用气动压缩装置');

MERGE (n:Treatment {name: '近红外光照疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '近红外光照疗法可有效改善RLS严重程度');

MERGE (n:Treatment {name: '针灸疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用针灸疗法改善RLS症状及睡眠质量');

MERGE (n:Treatment {name: '重复经颅磁刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '可降低PLMS、改善夜间睡眠质量和缓解情绪障碍');

MERGE (n:Treatment {name: '重复经颅电刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '可不同程度降低PLMS、改善夜间睡眠质量和缓解情绪障碍');

MERGE (n:Treatment {name: '振动垫'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '可不同程度降低PLMS、改善夜间睡眠质量和缓解情绪障碍');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '气动压缩装置'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床使用');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '近红外光照疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '临床使用');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '针灸疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床使用');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '重复经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床使用');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '重复经颅电刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床使用');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '振动垫'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '临床使用');



// =====================================

/* Response #39
   Timestamp: 2024-12-12 01:57:20
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Disease {name: '代谢紊乱'});

MERGE (n:Disease {name: '终末期肾病'});

MERGE (n:Disease {name: '糖尿病'});

MERGE (n:Disease {name: '妊娠'});

MERGE (n:Disease {name: '5-羟色胺能抗抑郁药使用'});

MERGE (n:Symptom {name: '轻度RLS'});

MERGE (n:Complication {name: '恶化风险'})
SET 
    n.description = coalesce(n.description, '可能导致病情加重');

MERGE (n:Treatment {name: '生活方式改变'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改变生活方式以改善症状');

MERGE (n:Treatment {name: '多巴胺受体激动剂治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用普拉克索缓释片或罗替高汀贴剂');

MERGE (n:Treatment {name: '口服补铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '补充铁剂以避免症状加重');

MERGE (n:Treatment {name: '静脉补铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '静脉给予补铁疗法以改善状况');

// 关系更新
MATCH (from) WHERE from.name = '轻度RLS'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '生活方式改变'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺受体激动剂治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '恶化风险'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '代谢紊乱'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '终末期肾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '妊娠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '5-羟色胺能抗抑郁药使用'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '确凿');

MATCH (from) WHERE from.name = '口服补铁'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '静脉补铁'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗阶段');



// =====================================

/* Response #40
   Timestamp: 2024-12-12 01:57:22
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Complication {name: '症状恶化'})
SET 
    n.description = coalesce(n.description, '症状恶化是RLS严重并发症，特征为症状严重程度增加，可能更早出现'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '冲动控制障碍'})
SET 
    n.description = coalesce(n.description, 'ICDs主要发生在接受多巴胺能制剂治疗的RLS患者中'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: 'RLS症状'})
SET 
    n.description = coalesce(n.description, '与不宁腿综合征相关的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '多巴胺能制剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗不宁腿综合征的药物'),
    n.dosage = coalesce(n.dosage, '根据患者情况调整'),
    n.duration = coalesce(n.duration, '视患者情况而定'),
    n.contraindication = coalesce(n.contraindication, '与其他药物的潜在相互作用');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'RLS症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '症状恶化'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '冲动控制障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺能制剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');



// =====================================

/* Response #41
   Timestamp: 2024-12-12 01:57:22
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '阿片类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗当其他治疗方法无效时'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '持续至症状改善'),
    n.contraindication = coalesce(n.contraindication, '不推荐合并阻塞性睡眠呼吸暂停的RLS患者使用');

MERGE (n:Treatment {name: '苯二氮草类'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '非苯二氮草类镇静催眠药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '可乐定'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '二氧化硒'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: 'A 型肉毒毒素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '奥卡西平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '卡马西平'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '丙戊酸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '左乙拉西坦'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚无足够的证据支持用于RLS的治疗'),
    n.dosage = coalesce(n.dosage, '根据医生处方'),
    n.duration = coalesce(n.duration, '不明确'),
    n.contraindication = coalesce(n.contraindication, '暂无');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '阿片类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '当其他治疗方法无效时');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '苯二氮草类'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '非苯二氮草类镇静催眠药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '可乐定'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '二氧化硒'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'A 型肉毒毒素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '奥卡西平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '卡马西平'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '丙戊酸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '左乙拉西坦'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '无足够证据');



// =====================================

/* Response #42
   Timestamp: 2024-12-12 01:57:23
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '铁剂治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '首选铁剂治疗'),
    n.contraindication = coalesce(n.contraindication, '避免加重RLS症状的药物');

MERGE (n:Symptom {name: '睡眠卫生'})
SET 
    n.description = coalesce(n.description, '包括保证足够的睡眠时间、规律作息、避免睡前使用电子产品、卧室环境适宜');

MERGE (n:Symptom {name: '饮食管理'})
SET 
    n.description = coalesce(n.description, '饮食方面需避免咖啡因');

MERGE (n:Symptom {name: '体育锻炼'})
SET 
    n.description = coalesce(n.description, '包括有氧训练和腿部锻炼');

MERGE (n:Symptom {name: '感觉刺激'})
SET 
    n.description = coalesce(n.description, '通过按摩和摩搓等方式进行刺激');

MERGE (n:Symptom {name: '药物影响'})
SET 
    n.description = coalesce(n.description, '避免加重RLS症状的药物');

// 关系更新
MATCH (from) WHERE from.name = '睡眠卫生'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '饮食管理'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '体育锻炼'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '感觉刺激'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '药物影响'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '铁剂治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');



// =====================================

/* Response #43
   Timestamp: 2024-12-12 01:57:23
*/
// 节点更新
MERGE (n:Disease {name: '妊娠期四肢不宁综合征'})
SET 
    n.description = coalesce(n.description, '妊娠期间由于多种因素导致的四肢不宁综合征，患病率随妊娠期变量较大'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '腿部痉挛'})
SET 
    n.description = coalesce(n.description, '腿部不自觉的痉挛感'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '位置性不适'})
SET 
    n.description = coalesce(n.description, '在特定姿势下感到不适的症状'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '下肢静脉回流受阻'})
SET 
    n.description = coalesce(n.description, '下肢静脉血流不畅引起的不适感'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '腿部浮肿'})
SET 
    n.description = coalesce(n.description, '腿部因液体积聚导致的肿胀'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '遗传性压迫易感性周围神经病'})
SET 
    n.description = coalesce(n.description, '遗传性导致的易感性周围神经病'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '韧带扭伤'})
SET 
    n.description = coalesce(n.description, '韧带因过度拉伸而造成的损伤'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '位置性缺血(麻木)皮炎'})
SET 
    n.description = coalesce(n.description, '因位置不当导致的缺血性皮炎，表现为麻木感'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '血红蛋白检查'})
SET 
    n.description = coalesce(n.description, '用于检测血液中含氧的蛋白质水平'),
    n.method = coalesce(n.method, '血液检查'),
    n.requirement = coalesce(n.requirement, '孕期妇女');

MERGE (n:Treatment {name: '补铁治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解妊娠期RLS的铁缺乏症状'),
    n.dosage = coalesce(n.dosage, '根据医嘱'),
    n.duration = coalesce(n.duration, '持续至分娩'),
    n.contraindication = coalesce(n.contraindication, '对铁剂过敏');

// 关系更新
MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '腿部痉挛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '位置性不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '下肢静脉回流受阻'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '腿部浮肿'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '遗传性压迫易感性周围神经病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '韧带扭伤'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.55),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '位置性缺血(麻木)皮炎'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '血红蛋白检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '妊娠期四肢不宁综合征'
MATCH (to) WHERE to.name = '补铁治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗期');



// =====================================

/* Response #44
   Timestamp: 2024-12-12 01:57:24
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS');

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA');

MERGE (n:Disease {name: '快速眼动睡眠期行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD');

MERGE (n:Treatment {name: '短效GABA活性催眠药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于失眠的药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '对GABA活性药物过敏');

MERGE (n:Treatment {name: 'α28钙通道配体'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于RLS的治疗药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '对α28钙通道配体过敏');

MERGE (n:Treatment {name: '持续气道正压通气（CPAP）'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于OSA的治疗方法'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '多巴胺受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于RLS的首选治疗药物'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '对多巴胺受体激动剂过敏');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '持续气道正压通气（CPAP）'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '短效GABA活性催眠药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'α28钙通道配体'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');



// =====================================

/* Response #45
   Timestamp: 2024-12-12 01:57:25
*/
// 节点更新
MERGE (n:Disease {name: '慢性肾脏疾病'})
SET 
    n.description = coalesce(n.description, '慢性肾脏疾病');

MERGE (n:RiskFactor {name: '钙离子受体拮抗剂的摄入'})
SET 
    n.description = coalesce(n.description, '钙离子受体拮抗剂的摄入对慢性肾脏疾病的影响'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '低甲状旁腺功能'})
SET 
    n.description = coalesce(n.description, '低甲状旁腺功能对慢性肾脏疾病的影响'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '糖尿病对慢性肾脏疾病的影响'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对于慢性肾脏疾病的非药物治疗方法'),
    n.duration = coalesce(n.duration, '持续');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '对于慢性肾脏疾病的药物治疗方法'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '持续');

MERGE (n:Treatment {name: '肾移植'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '慢性肾脏疾病的肾移植治疗'),
    n.duration = coalesce(n.duration, '长期');

// 关系更新
MATCH (from) WHERE from.name = '慢性肾脏疾病'
MATCH (to) WHERE to.name = '钙离子受体拮抗剂的摄入'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '有');

MATCH (from) WHERE from.name = '慢性肾脏疾病'
MATCH (to) WHERE to.name = '低甲状旁腺功能'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '有');

MATCH (from) WHERE from.name = '慢性肾脏疾病'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '有');

MATCH (from) WHERE from.name = '慢性肾脏疾病'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '积极');

MATCH (from) WHERE from.name = '慢性肾脏疾病'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '积极');

MATCH (from) WHERE from.name = '慢性肾脏疾病'
MATCH (to) WHERE to.name = '肾移植'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '最终');



// =====================================

/* Response #46
   Timestamp: 2024-12-12 01:57:26
*/
// 节点更新


// =====================================

/* Response #47
   Timestamp: 2024-12-12 01:57:26
*/
// 节点更新


// =====================================

/* Response #48
   Timestamp: 2024-12-12 01:57:29
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种影响下肢的神经系统疾病，患者有强烈的冲动去移动身体，通常在静止或躺下时加重。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括健康教育、中等强度体育锻炼、按摩、瑜伽、气动加压装置等。'),
    n.dosage = coalesce(n.dosage, 'null'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, '避免恶化因素');

MERGE (n:Treatment {name: '口服铁剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '针对妊娠期或哺乳期血清铁蛋白低于75µg/L的患者。'),
    n.dosage = coalesce(n.dosage, 'null'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, '孕早期应避免使用');

MERGE (n:Treatment {name: '低剂量氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '对妊娠期难治性RLS患者的治疗选择。'),
    n.dosage = coalesce(n.dosage, '0.25~1.00 mg'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, '避免孕早期使用');

MERGE (n:Treatment {name: '加巴喷丁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '夜间服用针对哺乳期难治性RLS患者的治疗。'),
    n.dosage = coalesce(n.dosage, '300~900 mg'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, 'null');

MERGE (n:Treatment {name: '低剂量曲马多'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '针对哺乳期难治性RLS患者的治疗选择。'),
    n.dosage = coalesce(n.dosage, 'null'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, 'null');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '口服铁剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '低剂量氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '低剂量曲马多'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '药物治疗');



// =====================================

/* Response #49
   Timestamp: 2024-12-12 01:57:31
*/
// 节点更新


// =====================================

/* Response #50
   Timestamp: 2024-12-12 01:57:31
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '安静或休息时加重'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '晚上或夜间加重');

MERGE (n:Symptom {name: '冲动活动'})
SET 
    n.description = coalesce(n.description, '患者感到需要活动以缓解不适'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '睡眠质量差'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '情绪障碍'})
SET 
    n.description = coalesce(n.description, '情绪波动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '认知功能受损'})
SET 
    n.description = coalesce(n.description, '注意力不集中'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '刺痛感'})
SET 
    n.description = coalesce(n.description, '腿部的奇怪感觉'),
    n.severity = coalesce(n.severity, '低'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '冲动活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '情绪障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '认知功能受损'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '刺痛感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');



// =====================================

/* Response #51
   Timestamp: 2024-12-12 01:57:33
*/
// 节点更新


// =====================================

/* Response #52
   Timestamp: 2024-12-12 01:57:33
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种以休息时出现四肢不适感为特征的综合征'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '不宁腿症状'})
SET 
    n.description = coalesce(n.description, '在休息状态下感到腿部不适'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '有氧训练'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '适度渐进式有氧训练可减轻RLS的症状'),
    n.duration = coalesce(n.duration, '持续');

MERGE (n:Treatment {name: '加巴喷丁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可缓解RLS症状严重程度，缩短睡眠潜伏期及改善睡眠质量');

MERGE (n:Treatment {name: '铁剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '在起初1-2周可能减轻RLS严重程度'),
    n.duration = coalesce(n.duration, '1-2周');

MERGE (n:Treatment {name: '维生素C和E'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可能缓解RLS症状严重程度，且不良反应小');

MERGE (n:Treatment {name: '肾移植'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '可有效缓解RLS症状，但透析不能'),
    n.contraindication = coalesce(n.contraindication, '透析患者不适用');

MERGE (n:Complication {name: '缺铁性贫血'})
SET 
    n.description = coalesce(n.description, '一种因缺乏铁而导致的贫血'),
    n.severity = coalesce(n.severity, '轻度');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '不宁腿症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '有氧训练'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '铁剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '维生素C和E'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '持续治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '肾移植'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '严重病例');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '缺铁性贫血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '缺铁性贫血'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

