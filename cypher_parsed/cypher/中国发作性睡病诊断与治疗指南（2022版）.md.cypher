// File: 中国发作性睡病诊断与治疗指南（2022版）.md
// Processed at: 2024-12-12 01:32:44
// Total pairs: 35

/* Response #1
   Timestamp: 2024-12-12 01:31:42
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:31:45
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种神经内科的罕见病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '患者在白天异常嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '猝倒症'})
SET 
    n.description = coalesce(n.description, '患者在情绪激动时突然失去意识'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '人睡前幻觉'})
SET 
    n.description = coalesce(n.description, '患者在入睡前出现虚幻的体验'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '人睡前幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:31:46
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种罕见的神经疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '患者在日常生活中表现出异常的嗜睡'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '患者在情绪激动时发生肌力突然减弱的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '入睡幻觉'})
SET 
    n.description = coalesce(n.description, '在入睡时出现幻觉的现象'),
    n.severity = coalesce(n.severity, '轻微'),
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
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '入睡幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:31:48
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'G47.4'),
    n.description = coalesce(n.description, '发作性睡病是全球公认的罕见病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Disease {name: 'H1N1流感'})
SET 
    n.code = coalesce(n.code, 'J09'),
    n.description = coalesce(n.description, 'H1N1流感是一种病毒性呼吸道感染'),
    n.category = coalesce(n.category, '病毒感染'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '甲型流感'})
SET 
    n.code = coalesce(n.code, 'J10'),
    n.description = coalesce(n.description, '甲型流感是一种由甲型流感病毒引起的疾病'),
    n.category = coalesce(n.category, '病毒感染'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'H1N1流感'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '低');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '甲型流感'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '低');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:31:49
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'G47.4'),
    n.description = coalesce(n.description, '一种以过度的日间嗜睡为特征的神经疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:RiskFactor {name: 'HLA等位基因'})
SET 
    n.description = coalesce(n.description, '与发作性睡病1型高度相关的基因'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '肿瘤坏死因子α2'})
SET 
    n.description = coalesce(n.description, '与发作性睡病相关的非HLA基因'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '嘌呤能受体P2Y11基因'})
SET 
    n.description = coalesce(n.description, '与发作性睡病相关的非HLA基因'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'HLA等位基因'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '肿瘤坏死因子α2'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '嘌呤能受体P2Y11基因'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:31:51
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Symptom {name: '抗Hcrt自身抗体'})
SET 
    n.description = coalesce(n.description, '位于Hcrt神经元上');

MERGE (n:Symptom {name: 'TRIB2特异性抗体水平升高'})
SET 
    n.description = coalesce(n.description, '与Hcrt神经元损伤的因果关系存在不同意见');

MERGE (n:Symptom {name: 'Hcrt的CD4+和CD8+细胞'})
SET 
    n.description = coalesce(n.description, '在发作性睡病患者中表达升高');

MERGE (n:Symptom {name: 'H1N1流感病毒免疫应答'})
SET 
    n.description = coalesce(n.description, '递呈给CD4+ T细胞，引发针对自身抗原的免疫反应');

// 关系更新
MATCH (from) WHERE from.name = '抗Hcrt自身抗体'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'TRIB2特异性抗体水平升高'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'Hcrt的CD4+和CD8+细胞'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'H1N1流感病毒免疫应答'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:31:56
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'G47.4'),
    n.description = coalesce(n.description, '发作性睡病是一种慢性中枢神经系统疾病，以过分嗜睡和睡眠发作为主要特征'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '下丘脑分泌素-1水平下降'})
SET 
    n.description = coalesce(n.description, '患者脑脊液中的下丘脑分泌素-1水平下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '骨骼肌失张力'})
SET 
    n.description = coalesce(n.description, '发作性睡病患者在睡眠发作时出现骨骼肌失张力'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '猝倒发作'})
SET 
    n.description = coalesce(n.description, '患者在强烈情绪刺激下突发的猝倒'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '时常发生');

MERGE (n:Examination {name: '脑脊液检查'})
SET 
    n.description = coalesce(n.description, '通过分析脑脊液中的成分来诊断神经系统疾病'),
    n.method = coalesce(n.method, '脑脊液采样'),
    n.requirement = coalesce(n.requirement, '需进行神经系统评估');

MERGE (n:Treatment {name: '刺激事件避免'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '避免强烈情感刺激以减少猝倒发作'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '患者白天易感到困倦'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '下丘脑分泌素-1水平下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '骨骼肌失张力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '时常发生'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '脑脊液检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '刺激事件避免'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期管理');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:31:59
*/
// 节点更新
MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '发生在刚入睡或从睡眠向觉醒转换过程中，可能是发作时患者直接进入REM睡眠所致，通常发生率为25%至50%。发作时患者虽然意识清醒，但无法自主活动或讲话，常伴呼吸困难和各种形式的幻觉，主要为恐怖性体验，持续时间为数十秒到数分钟，在外界刺激（身体受到触碰）下可迅速恢复正常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '25%-50%');

MERGE (n:Symptom {name: '夜间睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '包括夜间睡眠不安，表现为反复夜间睡眠中断、觉醒次数增多和时间延长，导致睡眠片段化，发生率为30%至95%。可伴随睡眠中周期性腿动、不自主运动、REM期或非快速眼球运动（NREM）期异态睡眠及阻塞性睡眠呼吸暂停（OSA）等。'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '30%-95%');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，包含多种症状，如睡眠瘫痪和夜间睡眠紊乱'),
    n.category = coalesce(n.category, '睡眠疾病'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '睡眠瘫痪'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, 's1.frequency'),
    r.severity = coalesce(r.severity, 's1.severity');

MATCH (from) WHERE from.name = '夜间睡眠紊乱'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, 's2.frequency'),
    r.severity = coalesce(r.severity, 's2.severity');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:31:59
*/
// 节点更新
MERGE (n:Scale {name: '简易精神状态检查量表'})
SET 
    n.description = coalesce(n.description, '用于评估认知功能'),
    n.score_range = coalesce(n.score_range, '0-30'),
    n.interpretation = coalesce(n.interpretation, '分数越高，认知能力越好');

MERGE (n:Scale {name: '蒙特利尔认知评估量表'})
SET 
    n.description = coalesce(n.description, '评估认知能力的一种量表'),
    n.score_range = coalesce(n.score_range, '0-30'),
    n.interpretation = coalesce(n.interpretation, '分数越高，认知能力越好');

MERGE (n:Scale {name: '阳性阴性症状量表'})
SET 
    n.description = coalesce(n.description, '用于评估精神状况的量表'),
    n.score_range = coalesce(n.score_range, '0-112'),
    n.interpretation = coalesce(n.interpretation, '分数越高，症状越严重');

MERGE (n:Scale {name: '焦虑抑郁量表'})
SET 
    n.description = coalesce(n.description, '评估个体焦虑和抑郁程度的量表'),
    n.score_range = coalesce(n.score_range, '0-63'),
    n.interpretation = coalesce(n.interpretation, '分数越高，焦虑和抑郁程度越严重');

MERGE (n:Scale {name: '注意力缺陷或多动和冲动量表'})
SET 
    n.description = coalesce(n.description, '用于评估注意力缺陷和多动症状的量表'),
    n.score_range = coalesce(n.score_range, '0-39'),
    n.interpretation = coalesce(n.interpretation, '分数越高，症状越明显');

MERGE (n:Scale {name: '自闭症谱系筛查问卷'})
SET 
    n.description = coalesce(n.description, '用于筛查自闭症谱系障碍的问卷'),
    n.score_range = coalesce(n.score_range, '0-22'),
    n.interpretation = coalesce(n.interpretation, '分数越高，可能性越大');

// 关系更新
MATCH (from) WHERE from.name = '简易精神状态检查量表'
MATCH (to) WHERE to.name = '自闭症谱系筛查问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '高');

MATCH (from) WHERE from.name = '蒙特利尔认知评估量表'
MATCH (to) WHERE to.name = '自闭症谱系筛查问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, '高');

MATCH (from) WHERE from.name = '阳性阴性症状量表'
MATCH (to) WHERE to.name = '焦虑抑郁量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '中');

MATCH (from) WHERE from.name = '注意力缺陷或多动和冲动量表'
MATCH (to) WHERE to.name = '焦虑抑郁量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.75),
    r.recommendation_level = coalesce(r.recommendation_level, '中');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:32:00
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.short_name = coalesce(n.short_name, 'Narcolepsy');

MERGE (n:Symptom {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '发生在发作性睡病1型患者中更为常见。体重指数通常≥30，可能在发病后1年内出现体重急剧增加。'),
    n.severity = coalesce(n.severity, '未知'),
    n.frequency = coalesce(n.frequency, '发生较常');

MERGE (n:Symptom {name: '性早熟'})
SET 
    n.description = coalesce(n.description, '意大利报道约17%的儿童期发病的发作性睡病患者伴有性早熟，国内报道该比例为7.4%。'),
    n.severity = coalesce(n.severity, '未知'),
    n.frequency = coalesce(n.frequency, '发生较少');

MERGE (n:Symptom {name: '精神障碍'})
SET 
    n.description = coalesce(n.description, '25%的发作性睡病患者有惊恐发作或社交恐惧等症状，18%至57%的发作性睡病患者伴有抑郁、兴趣低下、快感缺乏。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '发生较常');

MERGE (n:Symptom {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, 'Hcrt-1与脑内多种神经递质及前额叶功能相关。表现为工作记忆、执行功能和持续注意力缺陷。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '发生较常');

MERGE (n:Symptom {name: '偏头痛'})
SET 
    n.description = coalesce(n.description, '发作性睡病1型患者中偏头痛发生率显著增高，为20%至45%，女性略多于男性。'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '发生较常');

// 关系更新
MATCH (from) WHERE from.name = '肥胖'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '性早熟'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '精神障碍'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '偏头痛'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:32:03
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病1型'});

MERGE (n:Disease {name: '发作性睡病2型'});

MERGE (n:Examination {name: '脑核磁共振'})
SET 
    n.description = coalesce(n.description, '一种成像技术，用于观察脑部结构'),
    n.method = coalesce(n.method, '磁共振成像'),
    n.requirement = coalesce(n.requirement, '在专业医疗机构进行');

MERGE (n:Examination {name: 'CT检查'})
SET 
    n.description = coalesce(n.description, '使用X射线生成脑部图像'),
    n.method = coalesce(n.method, '计算机断层扫描'),
    n.requirement = coalesce(n.requirement, '在专业医疗机构进行');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = '脑核磁共振'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'CT检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病2型'
MATCH (to) WHERE to.name = '脑核磁共振'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病2型'
MATCH (to) WHERE to.name = 'CT检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:32:03
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.short_name = coalesce(n.short_name, 'EDS');

MERGE (n:Disease {name: '自身免疫脑炎'})
SET 
    n.short_name = coalesce(n.short_name, 'AE');

MERGE (n:Disease {name: '发作性睡病1型'})
SET 
    n.short_name = coalesce(n.short_name, 'EDS Type 1');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '自身免疫脑炎'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:32:03
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病1型'})
SET 
    n.description = coalesce(n.description, '一种以发作性嗜睡为临床特征的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Examination {name: '脑脊液 Hcrt-1检测'})
SET 
    n.description = coalesce(n.description, '检测脑脊液中Hcrt-1的含量'),
    n.method = coalesce(n.method, '脑脊液检测'),
    n.requirement = coalesce(n.requirement, '在医院进行');

MERGE (n:Symptom {name: 'EDS症状'})
SET 
    n.description = coalesce(n.description, '过度白天嗜睡的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = '脑脊液 Hcrt-1检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = 'EDS症状'
MATCH (to) WHERE to.name = '发作性睡病1型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '发生频率高'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:32:04
*/
// 节点更新


// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:32:06
*/
// 节点更新
MERGE (n:Scale {name: 'Epworth思睡量表'})
SET 
    n.description = coalesce(n.description, '评估日间思睡程度');

MERGE (n:Scale {name: '斯坦福思睡量表'})
SET 
    n.description = coalesce(n.description, '测试受试者当下的主观倦意');

MERGE (n:Scale {name: 'Ullanlinna发作性睡病量表'})
SET 
    n.description = coalesce(n.description, '评估发作性睡病思睡和猝倒症状');

MERGE (n:Scale {name: '瑞士发作性睡病量表'})
SET 
    n.description = coalesce(n.description, '常用于筛查');

MERGE (n:Scale {name: '情绪触发猝倒问卷'})
SET 
    n.description = coalesce(n.description, '评估猝倒发作的简明问卷');

MERGE (n:Scale {name: '国际不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '严重程度自评量表');

MERGE (n:Scale {name: '快速眼球运动睡眠行为障碍筛查问卷-香港版'})
SET 
    n.description = coalesce(n.description, '评价发作性睡病可能伴发的RBD');

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '不宁腿综合征'});

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'Epworth思睡量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '斯坦福思睡量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'Ullanlinna发作性睡病量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '瑞士发作性睡病量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '情绪触发猝倒问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '国际不宁腿综合征'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '快速眼球运动睡眠行为障碍筛查问卷-香港版'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:32:06
*/
// 节点更新


// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:32:07
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种以白天嗜睡和猝倒为主要症状的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天难以遏制的困倦或睡眠反复发作'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '清醒期突然发生肌张力下降伴警觉性下降的症状'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '数月1次到每天数次');

MERGE (n:Symptom {name: '幻觉'})
SET 
    n.description = coalesce(n.description, '在觉醒-睡眠转换期发生的梦境样体验'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '发生率33%至80%');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '低频'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '中等频率'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:32:07
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病1型'});

MERGE (n:Disease {name: '发作性睡病2型'});

MERGE (n:Examination {name: '夜间多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '诊断发作性睡病的检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '患者卧床时间至少7小时');

MERGE (n:Examination {name: '日间多次睡眠潜伏期试验'})
SET 
    n.description = coalesce(n.description, '诊断发作性睡病的重要诊断依据'),
    n.method = coalesce(n.method, '小睡测试'),
    n.requirement = coalesce(n.requirement, '确保前夜睡眠时间大于6小时');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病2型'
MATCH (to) WHERE to.name = '夜间多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病2型'
MATCH (to) WHERE to.name = '日间多次睡眠潜伏期试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = '夜间多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '可选'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = '日间多次睡眠潜伏期试验'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '可选'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:32:09
*/
// 节点更新


// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:32:09
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '发作性睡病是一类终身性疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '发作性嗜睡'})
SET 
    n.description = coalesce(n.description, '在清醒状态下反复出现的极度嗜睡'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '突发性失去肌肉张力'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '入睡前幻觉'})
SET 
    n.description = coalesce(n.description, '入睡前出现的幻觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '入睡或醒来时无法移动的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '夜间睡眠紊乱'})
SET 
    n.description = coalesce(n.description, '睡眠中断逾越正常模式'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重超出正常范围'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '性早熟'})
SET 
    n.description = coalesce(n.description, '性特征过早发育'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '精神障碍'})
SET 
    n.description = coalesce(n.description, '影响思维和情感的状况'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '思维和理解能力的减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '偏头痛'})
SET 
    n.description = coalesce(n.description, '反复性头痛伴随恶心和对光声敏感'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '发作性嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '猝倒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '入睡前幻觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠瘫痪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '夜间睡眠紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '性早熟'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '偏头痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:32:10
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病1型'})
SET 
    n.short_name = coalesce(n.short_name, 'Narcolepsy Type 1');

MERGE (n:Disease {name: '发作性睡病2型'})
SET 
    n.short_name = coalesce(n.short_name, 'Narcolepsy Type 2');

MERGE (n:RiskFactor {name: 'HLA-DQB1*06:02'})
SET 
    n.description = coalesce(n.description, '发作性睡病最重要的遗传风险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: 'HLA-DQB1*0301'})
SET 
    n.description = coalesce(n.description, '可增加发作性睡病1型的发病风险'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: 'HLA-DQB1*06:03'})
SET 
    n.description = coalesce(n.description, '表现为保护作用'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: 'HLA-DQB1*06:01'})
SET 
    n.description = coalesce(n.description, '表现为保护作用'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: 'HLA-DQB1*05:01'})
SET 
    n.description = coalesce(n.description, '表现为保护作用'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: 'HLA-DQB1*06:09'})
SET 
    n.description = coalesce(n.description, '表现为保护作用'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: 'HLA-DQB1*02'})
SET 
    n.description = coalesce(n.description, '表现为保护作用'),
    n.impact_level = coalesce(n.impact_level, '低');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'HLA-DQB1*06:02'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '发作性睡病2型'
MATCH (to) WHERE to.name = 'HLA-DQB1*0301'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'HLA-DQB1*06:03'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'HLA-DQB1*06:01'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'HLA-DQB1*05:01'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'HLA-DQB1*06:09'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'HLA-DQB1*02'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:32:11
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Symptom {name: '发作性睡病症状'});

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '控制发作性睡病症状的基础');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '发作性睡病症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '基础治疗');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:32:11
*/
// 节点更新
MERGE (n:Disease {name: '过度思睡症'})
SET 
    n.description = coalesce(n.description, '日间规律小睡可持续改善觉醒水平，并有助于减少兴奋性药物和抗抑郁剂的使用剂量'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Treatment {name: '日间规律小睡'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '每日安排特定时间小睡2~3次，每次15~20分钟，对缓解EDS和提高警觉性有显著效果'),
    n.duration = coalesce(n.duration, '每日'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '过度思睡症'
MATCH (to) WHERE to.name = '日间规律小睡'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #24
   Timestamp: 2024-12-12 01:32:14
*/
// 节点更新
MERGE (n:Disease {name: '癫痫'})
SET 
    n.description = coalesce(n.description, '日间无不可抗拒的思睡发作，发作时伴有意识丧失，不能回忆发作过程');

MERGE (n:Disease {name: '假性猝倒'})
SET 
    n.description = coalesce(n.description, '精神疾病相关，常在有人在场时突然倒下，但保持保护性姿势且未受伤');

MERGE (n:Disease {name: '低血压'});

MERGE (n:Disease {name: '短暂性脑缺血发作'});

MERGE (n:Disease {name: '晕厥'});

MERGE (n:Disease {name: '神经肌肉疾病'});

MERGE (n:Disease {name: '睡眠瘫痪'});

MERGE (n:Symptom {name: '意识丧失'})
SET 
    n.description = coalesce(n.description, '发作时伴有意识丧失'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '发作期脑电图可见痫样放电'})
SET 
    n.description = coalesce(n.description, '发作期脑电图发现痫样放电'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '精神心理因素'})
SET 
    n.description = coalesce(n.description, '可能诱发假性猝倒的因素'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '肌肉无力'})
SET 
    n.description = coalesce(n.description, '放声大笑时的肌肉无力'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '意识丧失'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '发作期脑电图可见痫样放电'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '假性猝倒'
MATCH (to) WHERE to.name = '精神心理因素'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '低血压'
MATCH (to) WHERE to.name = '肌肉无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '短暂性脑缺血发作'
MATCH (to) WHERE to.name = '肌肉无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '晕厥'
MATCH (to) WHERE to.name = '肌肉无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '神经肌肉疾病'
MATCH (to) WHERE to.name = '肌肉无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '睡眠瘫痪'
MATCH (to) WHERE to.name = '肌肉无力'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '低');



// =====================================

/* Response #25
   Timestamp: 2024-12-12 01:32:16
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '特发性睡眠增多'});

MERGE (n:Disease {name: '克莱恩-莱文综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'K-LS');

MERGE (n:Disease {name: '睡眠不足综合征'});

MERGE (n:Disease {name: '睡眠-觉醒节律紊乱'});

MERGE (n:Disease {name: '中枢神经系统疾病'});

MERGE (n:Disease {name: '精神疾病'});

MERGE (n:Disease {name: '药物和物质滥用'});

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '特发性睡眠增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '克莱恩-莱文综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠-觉醒节律紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '较少'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '中枢神经系统疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '精神疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.4),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '药物和物质滥用'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.5),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #26
   Timestamp: 2024-12-12 01:32:17
*/
// 节点更新


// =====================================

/* Response #27
   Timestamp: 2024-12-12 01:32:19
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病1型'});

MERGE (n:Disease {name: '发作性睡病2型'});

MERGE (n:Symptom {name: '日间困倦'})
SET 
    n.description = coalesce(n.description, '患者在白天感到过度困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续至少3个月');

MERGE (n:Symptom {name: '猝倒发作'})
SET 
    n.description = coalesce(n.description, '突发的无意识性摔倒'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '出现');

MERGE (n:Symptom {name: '夜晚睡眠时间过长'})
SET 
    n.description = coalesce(n.description, '晚上睡眠时长明显延长'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '可能出现');

MERGE (n:Symptom {name: '日间打瞌睡时间延长'})
SET 
    n.description = coalesce(n.description, '白天容易入睡且难以清醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '可能出现');

MERGE (n:Symptom {name: '思睡症状'})
SET 
    n.description = coalesce(n.description, '持续的嗜睡感觉'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Treatment {name: 'MSLT检查'})
SET 
    n.type = coalesce(n.type, '检查'),
    n.description = coalesce(n.description, '昼间多次睡眠潜伏期测试');

MERGE (n:Examination {name: '反应性检测'})
SET 
    n.description = coalesce(n.description, '脑脊液中的Hcrt-1水平检测'),
    n.method = coalesce(n.method, '放射免疫法'),
    n.requirement = coalesce(n.requirement, '样本取自患者的脑脊液');

MERGE (n:Treatment {name: 'nPSG检查'})
SET 
    n.type = coalesce(n.type, '检查'),
    n.description = coalesce(n.description, '夜间多普勒监测检查');

// 关系更新
MATCH (from) WHERE from.name = '日间困倦'
MATCH (to) WHERE to.name = '发作性睡病1型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每日'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '猝倒发作'
MATCH (to) WHERE to.name = '发作性睡病1型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '可能出现'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '夜晚睡眠时间过长'
MATCH (to) WHERE to.name = '发作性睡病2型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '可能出现'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间打瞌睡时间延长'
MATCH (to) WHERE to.name = '发作性睡病2型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '可能出现'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '思睡症状'
MATCH (to) WHERE to.name = '发作性睡病2型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '发作性睡病1型'
MATCH (to) WHERE to.name = 'MSLT检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病2型'
MATCH (to) WHERE to.name = 'nPSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病2型'
MATCH (to) WHERE to.name = '反应性检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #28
   Timestamp: 2024-12-12 01:32:21
*/
// 节点更新


// =====================================

/* Response #29
   Timestamp: 2024-12-12 01:32:22
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，表现为白天过度嗜睡，夜间睡眠质量受影响'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '过度嗜睡'})
SET 
    n.description = coalesce(n.description, '在不适当的场合出现强烈的睡意'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '日常');

MERGE (n:Symptom {name: '睡眠剥夺'})
SET 
    n.description = coalesce(n.description, '因各种原因未能获得足够睡眠'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '充足高质量夜间睡眠'})
SET 
    n.description = coalesce(n.description, '达到身体和精神恢复的睡眠'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Treatment {name: '认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过改变认知和行为来改善睡眠质量'),
    n.duration = coalesce(n.duration, '持续'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物控制白天嗜睡和改善睡眠'),
    n.dosage = coalesce(n.dosage, '根据医嘱'),
    n.duration = coalesce(n.duration, '根据治疗需要'),
    n.contraindication = coalesce(n.contraindication, '戒断症状');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '睡眠剥夺'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '充足高质量夜间睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '合并症治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '主要治疗');



// =====================================

/* Response #30
   Timestamp: 2024-12-12 01:32:24
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.short_name = coalesce(n.short_name, 'EDS');

MERGE (n:Treatment {name: '替洛利生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种新型组胺H3受体拮抗剂/反向激动剂，通过增加中枢神经系统内源性组胺和其他兴奋性神经递质，改善EDS和猝倒'),
    n.dosage = coalesce(n.dosage, '最大剂量36 mg/d, 常用剂量18~36 mg/d'),
    n.duration = coalesce(n.duration, '长期疗效稳定'),
    n.contraindication = coalesce(n.contraindication, '常见不良反应包括失眠、头痛、恶心、焦虑等');

MERGE (n:Treatment {name: '莫达非尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'FDA批准用于治疗发作性睡病的药物，通过阻断多巴胺转运体再摄取等机制改善EDS症状'),
    n.dosage = coalesce(n.dosage, '初始剂量100 mg/d, 可逐渐增量至200~400 mg/d'),
    n.duration = coalesce(n.duration, '长期疗效稳定'),
    n.contraindication = coalesce(n.contraindication, '常见不良反应包括头痛、胃肠道反应等');

MERGE (n:Treatment {name: 'γ-羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '中枢神经系统内的一种神经递质，能显著改善发作性睡病患者的EDS和猝倒'),
    n.dosage = coalesce(n.dosage, '优于400 mg的莫达非尼'),
    n.duration = coalesce(n.duration, '长期疗效稳定'),
    n.contraindication = coalesce(n.contraindication, '无具体禁忌症说明');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'γ-羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '长期');



// =====================================

/* Response #31
   Timestamp: 2024-12-12 01:32:25
*/
// 节点更新


// =====================================

/* Response #32
   Timestamp: 2024-12-12 01:32:26
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.code = coalesce(n.code, 'G47.429'),
    n.description = coalesce(n.description, '一种以嗜睡和睡眠发作为特征的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: 'γ-羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善夜间睡眠不安，缓解EDS'),
    n.dosage = coalesce(n.dosage, '服用方式: 晚上睡前服用，建议夜间加服1次'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '不良反应包括恶心、头晕、夜间遗尿等');

MERGE (n:Treatment {name: '马吲哚'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '非苯丙胺类精神振奋剂，通过大脑中隔区产生拟交感神经作用'),
    n.dosage = coalesce(n.dosage, '每日服药，建议起始剂量为75 mg'),
    n.duration = coalesce(n.duration, '根据临床状况调整'),
    n.contraindication = coalesce(n.contraindication, '不良反应包括口干、心悸等');

MERGE (n:Treatment {name: '索林非妥'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '双重作用的多巴胺和去甲肾上腺素再摄取抑制剂，用于治疗成人EDS'),
    n.dosage = coalesce(n.dosage, '每日服药1次，最大剂量150 mg'),
    n.duration = coalesce(n.duration, '根据临床状况调整'),
    n.contraindication = coalesce(n.contraindication, '不良反应包括头痛、食欲下降等');

MERGE (n:Treatment {name: '哌甲酯'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '苯丙胺类精神振奋剂，改善发作性睡病患者的过度思睡症状'),
    n.dosage = coalesce(n.dosage, '起始每日1次18 mg，最大剂量不超过54 mg'),
    n.duration = coalesce(n.duration, '根据临床状况调整'),
    n.contraindication = coalesce(n.contraindication, '禁用于高血压等患者');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'γ-羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '马吲哚'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '索林非妥'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '临床治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '哌甲酯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '临床治疗');



// =====================================

/* Response #33
   Timestamp: 2024-12-12 01:32:34
*/
// 节点更新
MERGE (n:Treatment {name: '帕罗西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'SSRI药物');

MERGE (n:Treatment {name: '氟西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'SSRI药物');

MERGE (n:Treatment {name: '舍曲林'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'SSRI药物');

MERGE (n:Treatment {name: '西酞普兰'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'SSRI药物');

MERGE (n:Treatment {name: '瑞波西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'NaRI药物'),
    n.dosage = coalesce(n.dosage, '最高剂量10 mg/d');

MERGE (n:Treatment {name: '阿托莫西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '选择性抑制去甲肾上腺素的突触前转运'),
    n.dosage = coalesce(n.dosage, '有效治疗剂量为10到60 mg/d，最大剂量80 mg/d');

MERGE (n:Treatment {name: '替洛利生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于人睡前幻觉和睡眠瘫痪的治疗');

MERGE (n:Treatment {name: 'γ-羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '被证实对发作性睡病夜间睡眠不安有确切疗效');

MERGE (n:Treatment {name: '巴氯芬'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可改善慢波睡眠，减少睡眠片段化');

MERGE (n:Disease {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '发作性睡病的一种症状');

MERGE (n:Disease {name: '日间过度睡眠'})
SET 
    n.description = coalesce(n.description, '发作性睡病的一种症状');

MERGE (n:Disease {name: '人睡前幻觉'})
SET 
    n.description = coalesce(n.description, '睡眠障碍的一种');

MERGE (n:Disease {name: '睡眠瘫痪'})
SET 
    n.description = coalesce(n.description, '睡眠障碍的一种');

MERGE (n:Disease {name: '夜间睡眠不安'})
SET 
    n.description = coalesce(n.description, '睡眠障碍的一种');

// 关系更新
MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '帕罗西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, 'II级推荐');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '氟西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, 'II级推荐');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '舍曲林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.3),
    r.priority = coalesce(r.priority, 'II级推荐');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '西酞普兰'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.3),
    r.priority = coalesce(r.priority, 'II级推荐');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '瑞波西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, 'II级推荐');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '阿托莫西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, 'II级推荐');

MATCH (from) WHERE from.name = '日间过度睡眠'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, 'I级推荐');

MATCH (from) WHERE from.name = '夜间睡眠不安'
MATCH (to) WHERE to.name = 'γ-羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, 'I级推荐');

MATCH (from) WHERE from.name = '夜间睡眠不安'
MATCH (to) WHERE to.name = '巴氯芬'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, 'III级推荐');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '日间过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度睡眠'
MATCH (to) WHERE to.name = '帕罗西汀'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #34
   Timestamp: 2024-12-12 01:32:40
*/
// 节点更新
MERGE (n:Disease {name: '猝倒'})
SET 
    n.description = coalesce(n.description, '发作性睡病的一种症状'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '替洛利生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '显著改善猝倒发作'),
    n.dosage = coalesce(n.dosage, '7周治疗可减少每周猝倒发作75%'),
    n.duration = coalesce(n.duration, '7周'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可降低猝倒发生率'),
    n.dosage = coalesce(n.dosage, '6.0 g/d'),
    n.duration = coalesce(n.duration, '至少3个月'),
    n.contraindication = coalesce(n.contraindication, '部分患者无法耐受');

MERGE (n:Treatment {name: '文拉法辛'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '有效抑制5-羟色胺和去甲肾上腺素的再摄取'),
    n.dosage = coalesce(n.dosage, '起始剂量37.5 mg，每日2~3次'),
    n.duration = coalesce(n.duration, '根据医生指示'),
    n.contraindication = coalesce(n.contraindication, '副作用包括恶心、头晕、食欲下降');

MERGE (n:Treatment {name: '去甲基文拉法辛'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '抗猝倒效果可能优于文拉法辛'),
    n.dosage = coalesce(n.dosage, '根据医生指示'),
    n.duration = coalesce(n.duration, '根据医生指示'),
    n.contraindication = coalesce(n.contraindication, '副作用包括恶心');

MERGE (n:Treatment {name: '度洛西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '有效治疗发作性睡病猝倒'),
    n.dosage = coalesce(n.dosage, '20~60 mg/d'),
    n.duration = coalesce(n.duration, '根据医生指示'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '氯米帕明'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗猝倒'),
    n.dosage = coalesce(n.dosage, '根据医生指示'),
    n.duration = coalesce(n.duration, '根据医生指示'),
    n.contraindication = coalesce(n.contraindication, '便秘、视力模糊等不良反应');

MERGE (n:Treatment {name: '去甲阿米替林'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗猝倒'),
    n.dosage = coalesce(n.dosage, '根据医生指示'),
    n.duration = coalesce(n.duration, '根据医生指示'),
    n.contraindication = coalesce(n.contraindication, '便秘、视力模糊等不良反应');

MERGE (n:Treatment {name: '丙咪嗪'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗猝倒'),
    n.dosage = coalesce(n.dosage, '根据医生指示'),
    n.duration = coalesce(n.duration, '根据医生指示'),
    n.contraindication = coalesce(n.contraindication, '便秘、视力模糊等不良反应');

// 关系更新
MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, 'I级推荐'),
    r.stage = coalesce(r.stage, '起始阶段');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, 'I级推荐'),
    r.stage = coalesce(r.stage, '起始阶段');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '文拉法辛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, 'III级推荐'),
    r.stage = coalesce(r.stage, '根据医生指示');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '去甲基文拉法辛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, 'III级推荐'),
    r.stage = coalesce(r.stage, '根据医生指示');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '度洛西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, 'II级推荐'),
    r.stage = coalesce(r.stage, '根据医生指示');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '氯米帕明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, 'II级推荐'),
    r.stage = coalesce(r.stage, '根据医生指示');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '去甲阿米替林'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, 'II级推荐'),
    r.stage = coalesce(r.stage, '根据医生指示');

MATCH (from) WHERE from.name = '猝倒'
MATCH (to) WHERE to.name = '丙咪嗪'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, 'II级推荐'),
    r.stage = coalesce(r.stage, '根据医生指示');



// =====================================

/* Response #35
   Timestamp: 2024-12-12 01:32:41
*/
// 节点更新
MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Treatment {name: '新型苯二氮草类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '包括了唑吡坦、佐匹克隆、右佐匹克隆'),
    n.contraindication = coalesce(n.contraindication, '不建议长期使用苯二氮草类药物');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗发作性睡病患者的夜间睡眠不安');

MERGE (n:Treatment {name: 'γ-羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '单用或与其他药物联合使用');

MERGE (n:Treatment {name: '文拉法辛'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '与γ-羟丁酸钠联合使用');

MERGE (n:Treatment {name: '氯米帕明'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '与γ-羟丁酸钠联合使用');

MERGE (n:Treatment {name: '替洛利生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一线促醒剂');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '首选治疗不宁腿综合征');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可选药物');

MERGE (n:Treatment {name: '罗替高汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可选药物');

MERGE (n:Treatment {name: '加巴喷丁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可选药物');

MERGE (n:Treatment {name: 'SSRIs'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '镇静作用小的抗抑郁剂');

MERGE (n:Treatment {name: 'SNRIs'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '镇静作用小的抗抑郁剂');

MERGE (n:Treatment {name: '氟西汀'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '孕产妇推荐药物');

MERGE (n:Treatment {name: '替洛利生'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '孕产妇推荐药物');

MERGE (n:Treatment {name: 'γ-羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '孕产妇推荐药物');

MERGE (n:Treatment {name: '文拉法辛'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '孕产妇推荐药物');

MERGE (n:Treatment {name: '氯米帕明'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '孕产妇推荐药物');

// 关系更新
MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '新型苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'γ-羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '文拉法辛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '氯米帕明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '首选治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '可选治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '罗替高汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '可选治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '可选治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'SSRIs'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '可选治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'SNRIs'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '可选治疗');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '氟西汀'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '替洛利生'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = 'γ-羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '文拉法辛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '推荐');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '氯米帕明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '推荐');



// =====================================

