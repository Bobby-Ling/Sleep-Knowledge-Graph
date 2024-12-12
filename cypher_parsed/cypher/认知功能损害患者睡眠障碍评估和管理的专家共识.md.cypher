// File: 认知功能损害患者睡眠障碍评估和管理的专家共识.md
// Processed at: 2024-12-12 01:28:39
// Total pairs: 32

/* Response #1
   Timestamp: 2024-12-12 01:26:34
*/
// 节点更新
MERGE (n:Disease {name: '嗜睡障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'EDS');

MERGE (n:Disease {name: '轻度认知障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'MCI');

MERGE (n:Disease {name: '痴呆'})
SET 
    n.short_name = coalesce(n.short_name, 'Dementia');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.short_name = coalesce(n.short_name, 'Narcolepsy');

MERGE (n:Disease {name: '特发性过度嗜睡'})
SET 
    n.short_name = coalesce(n.short_name, 'Idiopathic Hypersomnia');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'SDB');

MERGE (n:Symptom {name: '过度嗜睡'})
SET 
    n.description = coalesce(n.description, '日间过度嗜睡'),
    n.severity = coalesce(n.severity, '中度至重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '病史报告'})
SET 
    n.description = coalesce(n.description, '患者病历信息'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '持续');

// 关系更新
MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = '嗜睡障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '痴呆'
MATCH (to) WHERE to.name = '嗜睡障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = '嗜睡障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '痴呆'
MATCH (to) WHERE to.name = '嗜睡障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '嗜睡障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性过度嗜睡'
MATCH (to) WHERE to.name = '嗜睡障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '嗜睡障碍'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '嗜睡障碍'
MATCH (to) WHERE to.name = '过度嗜睡'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.95),
    r.recommendation_level = coalesce(r.recommendation_level, '强烈推荐');

MATCH (from) WHERE from.name = '病史报告'
MATCH (to) WHERE to.name = '嗜睡障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '一次性评估'),
    r.severity = coalesce(r.severity, '重度');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:26:40
*/
// 节点更新
MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '为RBD患者提供安全有效的管理');

MERGE (n:Treatment {name: '安全防范措施'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用简单方法加强防护');

// 关系更新
MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '安全防范措施'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '持续');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:26:42
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害患者'})
SET 
    n.description = coalesce(n.description, '认知功能损害患者的相关情况'),
    n.category = coalesce(n.category, '健康状况');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与睡眠相关的障碍'),
    n.category = coalesce(n.category, '健康状况');

// 关系更新
MATCH (from) WHERE from.name = '认知功能损害患者'
MATCH (to) WHERE to.name = '睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '认知功能损害患者'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:26:44
*/
// 节点更新
MERGE (n:Disease {name: '过度嗜睡综合征'})
SET 
    n.description = coalesce(n.description, 'EDS'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'SDB'),
    n.description = coalesce(n.description, '与睡眠相关的呼吸障碍');

MERGE (n:Disease {name: '不宁腿综合症'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS'),
    n.description = coalesce(n.description, '一种引起肢体不适的疾病');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.short_name = coalesce(n.short_name, 'PDD'),
    n.description = coalesce(n.description, '与情绪相关的精神疾病');

MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.short_name = coalesce(n.short_name, 'DLB'),
    n.description = coalesce(n.description, '一种影响记忆和认知的疾病');

MERGE (n:Treatment {name: '行为治疗'})
SET 
    n.description = coalesce(n.description, '改善生活方式和睡眠卫生教育');

// 关系更新
MATCH (from) WHERE from.name = '过度嗜睡综合征'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期治疗');

MATCH (from) WHERE from.name = '过度嗜睡综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '过度嗜睡综合征'
MATCH (to) WHERE to.name = '不宁腿综合症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '抑郁症'
MATCH (to) WHERE to.name = '过度嗜睡综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '过度嗜睡综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:26:48
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '最常见的睡眠呼吸障碍类型'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到困倦'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现的声音'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠时呼吸停止'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠质量的检测'),
    n.method = coalesce(n.method, '多导监测'),
    n.requirement = coalesce(n.requirement, '需在医院进行');

MERGE (n:Scale {name: '嗜睡量表'})
SET 
    n.description = coalesce(n.description, '用于评估日间嗜睡程度的量表'),
    n.score_range = coalesce(n.score_range, '0-24'),
    n.interpretation = coalesce(n.interpretation, '分数越高，嗜睡越严重');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '嗜睡量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:26:56
*/
// 节点更新
MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Disease {name: '认知障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'Cognitive Impairment');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '治疗伴认知障碍RBD患者有效的药物'),
    n.dosage = coalesce(n.dosage, '0.25~0.5 mg/d'),
    n.duration = coalesce(n.duration, '必要时可增量至1.0 mg/d'),
    n.contraindication = coalesce(n.contraindication, '谨慎使用以避免出现跌倒和加重认知损害');

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '有一定辅助睡眠作用的药物'),
    n.dosage = coalesce(n.dosage, '2~12 mg/d'),
    n.duration = coalesce(n.duration, '睡前30分钟应用');

MERGE (n:Treatment {name: '多奈哌齐'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '对认知功能损害患者的RBD有一定疗效的药物'),
    n.dosage = coalesce(n.dosage, '需监测'),
    n.duration = coalesce(n.duration, '需监测'),
    n.contraindication = coalesce(n.contraindication, '监测过程中注意');

MERGE (n:Treatment {name: '抗抑郁药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可诱发或加剧RBD的药物'),
    n.dosage = coalesce(n.dosage, '应停止应用或不晚于睡前6小时应用'),
    n.duration = coalesce(n.duration, '应停止应用'),
    n.contraindication = coalesce(n.contraindication, '诱发或加剧RBD');

MERGE (n:RiskFactor {name: '铁缺乏'})
SET 
    n.description = coalesce(n.description, '影响RLS发病风险与加重的因素'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '多巴胺拮抗剂'})
SET 
    n.description = coalesce(n.description, '影响RLS发病风险与加重的因素'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, 'IA级'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '多奈哌齐'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, 'IIIC级'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '快速眼动睡眠行为障碍'
MATCH (to) WHERE to.name = '抗抑郁药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, 'IIIC级'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '认知障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '6.1%'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '铁缺乏'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, 'IIIC级');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '多巴胺拮抗剂'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, 'IIIC级');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:26:58
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度嗜睡的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '睡眠时发出的声响'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '睡眠中呼吸暂停的现象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠图'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠状态的检查'),
    n.method = coalesce(n.method, '应用多项监测技术'),
    n.requirement = coalesce(n.requirement, '配合检查');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:27:00
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害患者睡眠障碍'})
SET 
    n.description = coalesce(n.description, '认知功能损害患者出现的睡眠问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '睡眠的质量和/或时间异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '无法配合检查'})
SET 
    n.description = coalesce(n.description, '患者在检查过程中无法配合的情况'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Treatment {name: 'PSG检测'})
SET 
    n.type = coalesce(n.type, '检查'),
    n.description = coalesce(n.description, '多导睡眠监测');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '认知功能损害患者睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '无法配合检查'
MATCH (to) WHERE to.name = '认知功能损害患者睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '认知功能损害患者睡眠障碍'
MATCH (to) WHERE to.name = 'PSG检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:27:00
*/
// 节点更新
MERGE (n:Treatment {name: '养血清脑颗粒'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可改善PD患者EDS');

MERGE (n:Treatment {name: '络氧疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '可增加伴发失眠的痴呆患者的睡眠时间');

MERGE (n:Disease {name: '认知功能损害'});

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.short_name = coalesce(n.short_name, 'PD');

// 关系更新
MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '养血清脑颗粒'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '帕金森病'
MATCH (to) WHERE to.name = '养血清脑颗粒'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '络氧疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '络氧疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '中期');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:27:02
*/
// 节点更新
MERGE (n:Disease {name: '轻度认知功能损害'})
SET 
    n.code = coalesce(n.code, 'MCI');

MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.code = coalesce(n.code, 'AD');

MERGE (n:Disease {name: '血管性痴呆'})
SET 
    n.code = coalesce(n.code, 'VaD');

MERGE (n:Disease {name: '额颞叶变性'})
SET 
    n.code = coalesce(n.code, 'FTLD/FTD');

MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.code = coalesce(n.code, 'LBD');

MERGE (n:Disease {name: '帕金森病痴呆'})
SET 
    n.code = coalesce(n.code, 'PDD');

MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'insomnia');

MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'EDS');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.code = coalesce(n.code, 'SDB');

MERGE (n:Disease {name: '异态睡眠'})
SET 
    n.code = coalesce(n.code, 'RBD');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS');

MERGE (n:Disease {name: '周期性肢体运动'})
SET 
    n.code = coalesce(n.code, 'PLMs');

MERGE (n:Disease {name: '昼夜节律失调性睡眠-觉醒障碍'})
SET 
    n.code = coalesce(n.code, 'CRSWDs');

// 关系更新
MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, 'high'),
    r.stage = coalesce(r.stage, 'management');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, 'high'),
    r.stage = coalesce(r.stage, 'management');

MATCH (from) WHERE from.name = '额颞叶变性'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, 'medium'),
    r.stage = coalesce(r.stage, 'management');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, 'medium'),
    r.stage = coalesce(r.stage, 'management');

MATCH (from) WHERE from.name = '帕金森病痴呆'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, 'low'),
    r.stage = coalesce(r.stage, 'management');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, 'frequent'),
    r.severity = coalesce(r.severity, 'mild');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, 'frequent'),
    r.severity = coalesce(r.severity, 'moderate');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, 'frequent'),
    r.severity = coalesce(r.severity, 'severe');

MATCH (from) WHERE from.name = '异态睡眠'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, 'occasional'),
    r.severity = coalesce(r.severity, 'moderate');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, 'occasional'),
    r.severity = coalesce(r.severity, 'moderate');

MATCH (from) WHERE from.name = '周期性肢体运动'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, 'rare'),
    r.severity = coalesce(r.severity, 'mild');

MATCH (from) WHERE from.name = '昼夜节律失调性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = '轻度认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, 'rare'),
    r.severity = coalesce(r.severity, 'moderate');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:27:09
*/
// 节点更新
MERGE (n:Disease {name: '日间嗜睡'})
SET 
    n.code = coalesce(n.code, 'EDS');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'SDB');

MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.short_name = coalesce(n.short_name, 'AD');

MERGE (n:Disease {name: '轻度认知障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'MCI');

MERGE (n:Disease {name: '血管性痴呆'})
SET 
    n.short_name = coalesce(n.short_name, 'VaD');

MERGE (n:Disease {name: '额颞叶痴呆'})
SET 
    n.short_name = coalesce(n.short_name, 'FTD');

MERGE (n:Disease {name: '路易体痴呆'})
SET 
    n.short_name = coalesce(n.short_name, 'DLB/PDD');

MERGE (n:Treatment {name: '生活方式和睡眠卫生指导'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括日间光照、减少夜间光照、参加体育锻炼和社会活动、规律觉醒和睡眠时间'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '莫达非尼'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可能有益的低剂量药物'),
    n.dosage = coalesce(n.dosage, '100∼200 mg/d'),
    n.contraindication = coalesce(n.contraindication, '对老年人和共病心血管疾病患者须谨慎使用');

MERGE (n:Treatment {name: 'γ-羟丁酸钠'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可改善PD患者夜间睡眠、日间思睡和疲劳症状'),
    n.dosage = coalesce(n.dosage, '∼9 mg/晚');

MERGE (n:Treatment {name: '司来吉兰'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '具有兴奋作用，可改善日间思睡，但缺乏充足证据'),
    n.dosage = coalesce(n.dosage, '5∼10 mg/d');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '发生率约60%'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.33),
    r.frequency = coalesce(r.frequency, '33%∼53%'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '轻度认知障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.587),
    r.frequency = coalesce(r.frequency, '58.7%'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.744),
    r.frequency = coalesce(r.frequency, '74.4%'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '额颞叶痴呆'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.68),
    r.frequency = coalesce(r.frequency, '68%'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '路易体痴呆'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.76),
    r.frequency = coalesce(r.frequency, '76%'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '生活方式和睡眠卫生指导'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = 'γ-羟丁酸钠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '司来吉兰'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:27:09
*/
// 节点更新


// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:27:10
*/
// 节点更新
MERGE (n:Disease {name: '轻中度痴呆'})
SET 
    n.code = coalesce(n.code, 'Mild Cognitive Impairment'),
    n.description = coalesce(n.description, '轻中度痴呆患者的疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS'),
    n.description = coalesce(n.description, '一种睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Treatment {name: '持续正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用CPAP治疗轻中度痴呆患者的OSAHS'),
    n.dosage = coalesce(n.dosage, '根据个体情况调节'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '有严重心脏病患者需慎用');

MERGE (n:Symptom {name: '睡眠质量差'})
SET 
    n.description = coalesce(n.description, '患者入睡困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '情绪障碍'})
SET 
    n.description = coalesce(n.description, '情绪不稳定'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '轻中度痴呆'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '轻中度痴呆'
MATCH (to) WHERE to.name = '持续正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '睡眠质量差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '日间思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停综合征'
MATCH (to) WHERE to.name = '情绪障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '持续正压通气'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '必需'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:27:13
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'G47.00'),
    n.description = coalesce(n.description, '一种睡眠障碍，表现为入睡困难、维持睡眠困难或早醒'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '下肢不宁综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS'),
    n.code = coalesce(n.code, 'G25.81'),
    n.description = coalesce(n.description, '一种不自主的腿部移动症状，通常在夜间加重'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '周围神经病'})
SET 
    n.code = coalesce(n.code, 'G62.9'),
    n.description = coalesce(n.description, '神经系统的疾病，通常影响肢体的感觉和运动功能'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '睡眠困难'})
SET 
    n.description = coalesce(n.description, '入睡或维持睡眠的困难'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '感觉到腿部不舒服，通常在晚上加重'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天异常的困倦与嗜睡'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Examination {name: '血清铁蛋白检查'})
SET 
    n.description = coalesce(n.description, '用于检测血清中铁的储存水平'),
    n.method = coalesce(n.method, '血液检查'),
    n.requirement = coalesce(n.requirement, '空腹');

MERGE (n:Examination {name: '多导睡眠监测（PSG）'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠模式和其他生理参数'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '入睡前保持安静');

// 关系更新
MATCH (from) WHERE from.name = '睡眠困难'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '腿部不适'
MATCH (to) WHERE to.name = '下肢不宁综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '下肢不宁综合征'
MATCH (to) WHERE to.name = '血清铁蛋白检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '下肢不宁综合征'
MATCH (to) WHERE to.name = '多导睡眠监测（PSG）'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '周围神经病'
MATCH (to) WHERE to.name = '下肢不宁综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '下肢不宁综合征'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:27:15
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害患者睡眠障碍'});

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '作为起始治疗手段，且必须考虑生活方式因素的影响');

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '非痴呆的同年龄段人群'});

// 关系更新
MATCH (from) WHERE from.name = '认知功能损害患者睡眠障碍'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '认知功能损害患者睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '认知功能损害患者睡眠障碍'
MATCH (to) WHERE to.name = '非痴呆的同年龄段人群'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '认知功能损害患者睡眠障碍'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:27:21
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.abbreviation = coalesce(n.abbreviation, 'RLS');

MERGE (n:Symptom {name: '腿部不适'})
SET 
    n.description = coalesce(n.description, '腿部不适需要活动的感觉'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间更明显');

MERGE (n:Symptom {name: '腿部过度活动'})
SET 
    n.description = coalesce(n.description, '腿部运动活动过多的迹象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '非活动期间腿部不适'})
SET 
    n.description = coalesce(n.description, '非活动期间和活动减少时腿部不适的迹象'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '夜间躁动'})
SET 
    n.description = coalesce(n.description, '晚上夜间躁动行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Complication {name: '药物相关综合症'})
SET 
    n.description = coalesce(n.description, '抗精神病药物引起的静坐不能'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '周围神经病'})
SET 
    n.description = coalesce(n.description, '周围神经病变导致的症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '缺铁'})
SET 
    n.description = coalesce(n.description, '缺铁导致的症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '腿部痉挛'})
SET 
    n.description = coalesce(n.description, '腿部肌肉痉挛症状'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部过度活动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '非活动期间腿部不适'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '夜间躁动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '药物相关综合症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '周围神经病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '缺铁'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '腿部痉挛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:27:21
*/
// 节点更新
MERGE (n:Disease {name: '睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种影响睡眠质量的疾病，伴随着呼吸暂停或低通气。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '血管性痴呆'})
SET 
    n.code = coalesce(n.code, 'VaD'),
    n.description = coalesce(n.description, '一种由于脑血管问题导致的认知功能障碍。'),
    n.category = coalesce(n.category, '认知障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '持续气道正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '一种治疗睡眠呼吸暂停的常见方法，使用呼吸机提供持续的气道压力。');

MERGE (n:Treatment {name: '双水平或自动调节CPAP'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '一种对不耐受传统CPAP患者的替代治疗方法。');

MERGE (n:Treatment {name: '多奈哌齐'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可改善认知功能及其对睡眠呼吸暂停的影响。');

// 关系更新
MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '持续气道正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '双水平或自动调节CPAP'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '替代治疗');

MATCH (from) WHERE from.name = '多奈哌齐'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '积极治疗');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:27:28
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'RLS');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗轻度到中重度RLS的药物'),
    n.dosage = coalesce(n.dosage, '0.25~0.75 mg'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '罗匹尼罗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗RLS的药物'),
    n.dosage = coalesce(n.dosage, '1.5~4.6 mg'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '罗替戈汀透皮贴剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '有效的RLS治疗药物'),
    n.dosage = coalesce(n.dosage, '1~3 mg/24h'),
    n.duration = coalesce(n.duration, '长达5年'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗匹尼罗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '罗替戈汀透皮贴剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:27:29
*/
// 节点更新
MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '一种导致患者感到在静止时下肢有不适，并且有不可抗拒的动作欲望的疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到重度');

MERGE (n:Symptom {name: 'RLS症状'})
SET 
    n.description = coalesce(n.description, '在静止状态下感到不适'),
    n.severity = coalesce(n.severity, '轻度到重度'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于轻度RLS患者的治疗，或作为重度RLS患者的辅助治疗');

MERGE (n:Treatment {name: '缺铁治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '积极治疗缺铁以改善缺铁相关RLS');

MERGE (n:Treatment {name: '普拉克索'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一线治疗药物，适用于认知功能损害患者伴有中重度RLS'),
    n.dosage = coalesce(n.dosage, '透皮贴或缓释剂型');

MERGE (n:Treatment {name: '加巴喷丁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, 'RLS二线治疗用药');

MERGE (n:Treatment {name: '阿片类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '重度RLS患者可用');

MERGE (n:Symptom {name: '昼夜节律失调性睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '影响患者及照料者生活质量的睡眠障碍'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.code = coalesce(n.code, 'AD'),
    n.description = coalesce(n.description, '一种导致记忆力和其他思维能力下降的疾病'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = 'RLS症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '轻度到重度');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '缺铁治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急需治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '普拉克索'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '加巴喷丁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '二线治疗');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '阿片类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '特殊情况');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠-觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠-觉醒障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.44),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:27:34
*/
// 节点更新
MERGE (n:Disease {name: 'REM行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD');

MERGE (n:Disease {name: '帕金森病'})
SET 
    n.code = coalesce(n.code, 'PD');

MERGE (n:Disease {name: '嗜睡性脑病'})
SET 
    n.code = coalesce(n.code, 'DLB');

MERGE (n:Disease {name: '阿尔茨海默病'})
SET 
    n.code = coalesce(n.code, 'AD');

MERGE (n:Disease {name: '额颞叶痴呆'})
SET 
    n.code = coalesce(n.code, 'FTD');

MERGE (n:Disease {name: '进行性核上性麻痹'})
SET 
    n.code = coalesce(n.code, 'PSP');

MERGE (n:Disease {name: '皮质基底节变性'})
SET 
    n.code = coalesce(n.code, 'CBD');

// 关系更新
MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.177),
    r.timeframe = coalesce(r.timeframe, '5年');

MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.406),
    r.timeframe = coalesce(r.timeframe, '10年');

MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '帕金森病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.338),
    r.timeframe = coalesce(r.timeframe, '随访');

MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '嗜睡性脑病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.269),
    r.timeframe = coalesce(r.timeframe, '随访');

MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.154),
    r.timeframe = coalesce(r.timeframe, '随访');

MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '额颞叶痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.185),
    r.timeframe = coalesce(r.timeframe, '随访');

MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '进行性核上性麻痹'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.0),
    r.timeframe = coalesce(r.timeframe, '随访');

MATCH (from) WHERE from.name = 'REM行为障碍'
MATCH (to) WHERE to.name = '皮质基底节变性'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.0),
    r.timeframe = coalesce(r.timeframe, '随访');



// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:27:37
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，表现为入睡困难，维持睡眠困难，清晨过早醒来或睡眠质量差。');

MERGE (n:Symptom {name: '睡眠相关症状'})
SET 
    n.description = coalesce(n.description, '与睡眠有关的表现，可能包括入睡困难、早醒等。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '至少一种');

MERGE (n:Symptom {name: '晨醒后无恢复感'})
SET 
    n.description = coalesce(n.description, '早晨醒来后仍感到疲惫，未能恢复活力。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '7%~15%');

MERGE (n:Disease {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '指认知过程的显著降低，影响思维、记忆、判断等。');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠相关症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '23%~34%'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '晨醒后无恢复感'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '7%~15%'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '49.9%'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:27:37
*/
// 节点更新
MERGE (n:Disease {name: 'CRSWDs'})
SET 
    n.description = coalesce(n.description, 'Circadian Rhythm Sleep-Wake Disorders'),
    n.severity = coalesce(n.severity, 'IA级');

MERGE (n:Symptom {name: '白天人睡和觉醒时间'})
SET 
    n.description = coalesce(n.description, '对白天人睡眠和觉醒时间的调查'),
    n.severity = coalesce(n.severity, '重要性中等'),
    n.frequency = coalesce(n.frequency, '每日');

MERGE (n:Symptom {name: '睡眠日记'})
SET 
    n.description = coalesce(n.description, '记录7天的睡眠日记以确诊睡眠障碍'),
    n.severity = coalesce(n.severity, '重要性高'),
    n.frequency = coalesce(n.frequency, '7天');

MERGE (n:Symptom {name: 'ACT检测'})
SET 
    n.description = coalesce(n.description, '使用ACT检测确认睡眠障碍'),
    n.severity = coalesce(n.severity, '重要性中等'),
    n.frequency = coalesce(n.frequency, '7天');

MERGE (n:Symptom {name: '问卷评估'})
SET 
    n.description = coalesce(n.description, '中文版问卷评估睡眠时相类型'),
    n.severity = coalesce(n.severity, '重要性中等'),
    n.frequency = coalesce(n.frequency, '依据所需');

MERGE (n:Symptom {name: '时相标记'})
SET 
    n.description = coalesce(n.description, '时相标记对诊断的辅助作用'),
    n.severity = coalesce(n.severity, '重要性低'),
    n.frequency = coalesce(n.frequency, '依据所需');

// 关系更新
MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '白天人睡和觉醒时间'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, 'IA级');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '睡眠日记'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, 'IIIB级');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = 'ACT检测'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, 'IIIB级');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '问卷评估'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, 'IB级');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '时相标记'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '依据所需'),
    r.severity = coalesce(r.severity, 'IIIC级');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:27:40
*/
// 节点更新
MERGE (n:Disease {name: 'CRSWDs'})
SET 
    n.description = coalesce(n.description, '认知功能损害患者睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '睡眠明显片段化'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，频繁醒来'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '觉醒次数增加'})
SET 
    n.description = coalesce(n.description, '夜间醒来次数增多'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: 'NREM减少大于REM减少'})
SET 
    n.description = coalesce(n.description, 'NREM睡眠较少，REM睡眠变化相对较小'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间徘徊不睡'})
SET 
    n.description = coalesce(n.description, '夜间不能入睡，四处徘徊'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '维持困难'})
SET 
    n.description = coalesce(n.description, '入睡后难以维持较长时间的睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Disease {name: '睡眠-觉醒紊乱'})
SET 
    n.description = coalesce(n.description, '不规则的睡眠-觉醒模式'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠-觉醒时相延迟障碍'})
SET 
    n.description = coalesce(n.description, '主要睡眠时间显著延迟'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '内在昼夜节律性睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '睡眠-觉醒时间提前'),
    n.category = coalesce(n.category, '睡眠障碍');

// 关系更新
MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '睡眠明显片段化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '觉醒次数增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = 'NREM减少大于REM减少'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '夜间徘徊不睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = '维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠-觉醒紊乱'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '睡眠-觉醒时相延迟障碍'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '内在昼夜节律性睡眠-觉醒障碍'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #24
   Timestamp: 2024-12-12 01:27:55
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '根据国际睡眠障碍分类-第3版诊断标准的慢性失眠。');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '患者自述或照料者观察到的症状之一。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '睡眠维持困难'})
SET 
    n.description = coalesce(n.description, '患者自述或照料者观察到的症状之一。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '比期望起床时间更早醒来'})
SET 
    n.description = coalesce(n.description, '患者自述或照料者观察到的症状之一。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '疲劳或缺乏精力'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '注意力、专注力或者记忆力下降'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '社交、家庭、职业或学业等功能损害'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '情绪易烦躁或易激动'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '行为问题(多动、冲动或攻击性)'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '驱动力、精力或动力缺乏'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '易犯错或易出事故'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Symptom {name: '对睡眠质量感到忧虑'})
SET 
    n.description = coalesce(n.description, '由于夜间睡眠困难而出现的症状。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

// 关系更新
MATCH (from) WHERE from.name = '入睡困难'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠维持困难'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '比期望起床时间更早醒来'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '疲劳或缺乏精力'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '注意力、专注力或者记忆力下降'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '社交、家庭、职业或学业等功能损害'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '情绪易烦躁或易激动'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '行为问题(多动、冲动或攻击性)'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '驱动力、精力或动力缺乏'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '易犯错或易出事故'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '对睡眠质量感到忧虑'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #25
   Timestamp: 2024-12-12 01:27:56
*/
// 节点更新
MERGE (n:Treatment {name: '光照治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过光照来调节生理时钟');

MERGE (n:Treatment {name: '褪黑素应用'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用褪黑素以重置生理性睡眠-觉醒周期'),
    n.dosage = coalesce(n.dosage, '小剂量'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '避免应用BZDs药物');

MERGE (n:Treatment {name: '体育锻炼'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过运动促进整体健康与睡眠'),
    n.duration = coalesce(n.duration, '规律');

MERGE (n:Treatment {name: '蓝光治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '有助于睡眠维持障碍的治疗');

MERGE (n:Treatment {name: '清晨光照'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '有利于睡眠时相延迟的患者');

MERGE (n:Treatment {name: '傍晚强光照射'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改善痴呆患者夜间睡眠质量');

MERGE (n:Treatment {name: '外源性褪黑素'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '重置睡眠-觉醒周期的有效治疗');

MERGE (n:Symptom {name: '睡眠维持障碍'})
SET 
    n.description = coalesce(n.description, '难以维持持续睡眠');

MERGE (n:Symptom {name: '睡眠时相提前'})
SET 
    n.description = coalesce(n.description, '睡眠出现时间提前的情况');

MERGE (n:Symptom {name: '睡眠时相延迟'})
SET 
    n.description = coalesce(n.description, '睡眠出现时间延后的情况');

MERGE (n:Symptom {name: '夜间睡眠质量差'})
SET 
    n.description = coalesce(n.description, '夜间睡眠效果不佳');

MERGE (n:Symptom {name: '日间思睡'})
SET 
    n.description = coalesce(n.description, '白天感到困倦的现象');

MERGE (n:Disease {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '描述认知功能损害的疾病');

// 关系更新
MATCH (from) WHERE from.name = '睡眠维持障碍'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠时相提前'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠时相延迟'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '夜间睡眠质量差'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '光照治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '褪黑素应用'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '体育锻炼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '持续');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '蓝光治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '评估');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '清晨光照'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '评估');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '傍晚强光照射'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '评估');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '外源性褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '中期');



// =====================================

/* Response #26
   Timestamp: 2024-12-12 01:27:57
*/
// 节点更新
MERGE (n:Disease {name: 'REM睡眠行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD'),
    n.description = coalesce(n.description, '重复发作的睡眠相关的言语和(或)复杂的运动行为'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: 'NREM期异态睡眠'})
SET 
    n.description = coalesce(n.description, 'NREM期的非正常睡眠表现');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '睡眠时呼吸的异常');

MERGE (n:Disease {name: '周期性腿动症'})
SET 
    n.description = coalesce(n.description, '周期性腿动导致的睡眠干扰');

MERGE (n:Disease {name: '夜间发作的癫痫'})
SET 
    n.description = coalesce(n.description, '夜间癫痫发作');

MERGE (n:Disease {name: '夜间节律性运动障碍'})
SET 
    n.description = coalesce(n.description, '夜间周期性运动导致的睡眠障碍');

// 关系更新
MATCH (from) WHERE from.name = 'REM睡眠行为障碍'
MATCH (to) WHERE to.name = 'NREM期异态睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM睡眠行为障碍'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM睡眠行为障碍'
MATCH (to) WHERE to.name = '周期性腿动症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = 'REM睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间发作的癫痫'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = 'REM睡眠行为障碍'
MATCH (to) WHERE to.name = '夜间节律性运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '轻');



// =====================================

/* Response #27
   Timestamp: 2024-12-12 01:28:06
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害患者的睡眠维持障碍'});

MERGE (n:Disease {name: '睡眠时相提前'});

MERGE (n:Disease {name: '睡眠时相延迟'});

MERGE (n:Disease {name: '患者夜间睡眠时间'});

MERGE (n:Disease {name: '日间思睡'});

MERGE (n:Disease {name: '痴呆'});

MERGE (n:Disease {name: 'PD'});

MERGE (n:Disease {name: 'ASWPD症状'});

MERGE (n:Disease {name: 'CRSWDs'});

MERGE (n:Treatment {name: '蓝光治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '改善认知功能损害患者的睡眠维持障碍');

MERGE (n:Treatment {name: '清晨光照治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '有助于治疗睡眠时相延迟');

MERGE (n:Treatment {name: '傍晚光照治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '增加患者夜间睡眠时间');

MERGE (n:Treatment {name: '褪黑素和光照结合治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '有效治疗痴呆和PD患者');

MERGE (n:Treatment {name: '镇静催眠药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '不用于治疗痴呆患者的CRSWDs');

MERGE (n:Treatment {name: '下午1~2点应用褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善痴呆患者的ASWPD症状');

// 关系更新
MATCH (from) WHERE from.name = '认知功能损害患者的睡眠维持障碍'
MATCH (to) WHERE to.name = '蓝光治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '睡眠时相延迟'
MATCH (to) WHERE to.name = '清晨光照治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '患者夜间睡眠时间'
MATCH (to) WHERE to.name = '傍晚光照治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '痴呆'
MATCH (to) WHERE to.name = '褪黑素和光照结合治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = 'ASWPD症状'
MATCH (to) WHERE to.name = '下午1~2点应用褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 1.0),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '痴呆'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '患者夜间睡眠时间'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #28
   Timestamp: 2024-12-12 01:28:09
*/
// 节点更新
MERGE (n:Disease {name: '快速眼动睡眠行为障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'RBD');

MERGE (n:Examination {name: '视频 PSG'})
SET 
    n.description = coalesce(n.description, '诊断 RBD 的金标准'),
    n.method = coalesce(n.method, '视频多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '患者必须经过合适的准备');

MERGE (n:Scale {name: 'RBD 严重程度量表'})
SET 
    n.description = coalesce(n.description, '用于评估 RBD 的症状严重程度'),
    n.score_range = coalesce(n.score_range, '1-5'),
    n.interpretation = coalesce(n.interpretation, '分数越高，症状越严重');

MERGE (n:Scale {name: 'RBD 筛查问卷'})
SET 
    n.description = coalesce(n.description, '用于筛查 RBD 的问卷'),
    n.score_range = coalesce(n.score_range, '是/否'),
    n.interpretation = coalesce(n.interpretation, '回答为‘是’则可能存在 RBD');

MERGE (n:Scale {name: '香港版 RBD 问卷'})
SET 
    n.description = coalesce(n.description, '用于 RBD 筛查的香港版本问卷'),
    n.score_range = coalesce(n.score_range, '1-5'),
    n.interpretation = coalesce(n.interpretation, '分数越高，RBD 可能性越大');

// 关系更新
MATCH (from) WHERE from.name = 'RBD 严重程度量表'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '强烈推荐');

MATCH (from) WHERE from.name = 'RBD 筛查问卷'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '香港版 RBD 问卷'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = '视频 PSG'
MATCH (to) WHERE to.name = '快速眼动睡眠行为障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #29
   Timestamp: 2024-12-12 01:28:12
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '认知功能的减退，影响日常生活和活动的能力');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，难以入睡或持续睡眠的状态');

MERGE (n:Disease {name: '其他类型睡眠障碍'})
SET 
    n.description = coalesce(n.description, '包括各种非正常睡眠状态，如嗜睡症、睡眠呼吸暂停等');

MERGE (n:Disease {name: '躯体疾病'})
SET 
    n.description = coalesce(n.description, '对生理健康造成影响的各种疾病');

MERGE (n:Disease {name: '精神疾病'})
SET 
    n.description = coalesce(n.description, '影响情绪、思维和行为的各种精神状态');

MERGE (n:Disease {name: '药物及环境因素'})
SET 
    n.description = coalesce(n.description, '影响睡眠的药物和环境条件');

MERGE (n:Examination {name: '匹兹堡睡眠质量指数'})
SET 
    n.description = coalesce(n.description, '评估患者的整体睡眠质量'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '患者自我评估');

MERGE (n:Examination {name: 'PSG实验室检查'})
SET 
    n.description = coalesce(n.description, '多导睡眠监测，用于睡眠障碍的诊断'),
    n.method = coalesce(n.method, '多导监测'),
    n.requirement = coalesce(n.requirement, '患者配合');

MERGE (n:Examination {name: '体动记录仪'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠-觉醒模式的设备'),
    n.method = coalesce(n.method, '身体活动监测'),
    n.requirement = coalesce(n.requirement, '患者佩戴');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '其他类型睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '躯体疾病'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '精神疾病'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '药物及环境因素'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '匹兹堡睡眠质量指数'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'PSG实验室检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '体动记录仪'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #30
   Timestamp: 2024-12-12 01:28:36
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '认知功能下降的障碍'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: '日间过度嗜睡症'})
SET 
    n.description = coalesce(n.description, '白天异常嗜睡的症状'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '晚上睡觉时呼吸暂停的症状'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '一种以突发的睡眠发作为特征的疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Disease {name: '原发性睡眠增多症'})
SET 
    n.description = coalesce(n.description, '以过度嗜睡为特征的疾病'),
    n.category = coalesce(n.category, '神经系统疾病');

MERGE (n:Symptom {name: '日落综合征'})
SET 
    n.description = coalesce(n.description, '傍晚激越、漫游、易激惹和思维混乱的症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '思睡'})
SET 
    n.description = coalesce(n.description, '有意无意的白天嗜睡表现'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '中、重度痴呆患者的思睡'})
SET 
    n.description = coalesce(n.description, '认知障碍严重患者的嗜睡症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Examination {name: 'Epworth思睡量表'})
SET 
    n.description = coalesce(n.description, '主观问卷用于评估日间嗜睡'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '适用于任何年龄');

MERGE (n:Examination {name: '多次睡眠潜伏期试验'})
SET 
    n.description = coalesce(n.description, '客观评估睡眠潜伏期的检测方法'),
    n.method = coalesce(n.method, '临床试验'),
    n.requirement = coalesce(n.requirement, '在实验室进行');

MERGE (n:Examination {name: '清醒维持试验'})
SET 
    n.description = coalesce(n.description, '评估个体在保持清醒状态下的表现'),
    n.method = coalesce(n.method, '临床试验'),
    n.requirement = coalesce(n.requirement, '在实验室进行');

// 关系更新
MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = 'Epworth思睡量表'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '日间过度嗜睡症'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠呼吸暂停'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '日间过度嗜睡症'
MATCH (to) WHERE to.name = '日落综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '日间过度嗜睡症'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '发作性睡病'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '原发性睡眠增多症'
MATCH (to) WHERE to.name = '思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '中、重度痴呆患者的思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #31
   Timestamp: 2024-12-12 01:28:38
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'G47.00'),
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为入眠困难、睡眠中断或早醒等症状'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '认知功能损害'})
SET 
    n.code = coalesce(n.code, 'F06.7'),
    n.description = coalesce(n.description, '涉及思维、记忆及其他认知功能下降的综合症'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'G47.10'),
    n.description = coalesce(n.description, '白天过度嗜睡，影响日常生活'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '痴呆'})
SET 
    n.code = coalesce(n.code, 'F00-F03'),
    n.description = coalesce(n.description, '智能下降严重到影响社会生活及生活自理的状态'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '快速眼动行为障碍'})
SET 
    n.code = coalesce(n.code, 'G47.50'),
    n.description = coalesce(n.description, '在快速眼动睡眠期出现的异常运动或行为'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'G25.81'),
    n.description = coalesce(n.description, '在休息时感到腿部不适，并伴有移动腿部的冲动'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Treatment {name: '非BZDs'})
SET 
    n.description = coalesce(n.description, '非苯二氮平类睡眠药物，适用于失眠治疗'),
    n.type = coalesce(n.type, '药物'),
    n.dosage = coalesce(n.dosage, '视患者情况而定'),
    n.duration = coalesce(n.duration, '按需'),
    n.contraindication = coalesce(n.contraindication, '对苯二氮平类药物过敏');

MERGE (n:Treatment {name: '褪黑素受体激动剂'})
SET 
    n.description = coalesce(n.description, '结合褪黑素受体的药物，能有效治疗失眠'),
    n.type = coalesce(n.type, '药物'),
    n.dosage = coalesce(n.dosage, '视患者情况而定'),
    n.duration = coalesce(n.duration, '按需'),
    n.contraindication = coalesce(n.contraindication, '对褪黑素过敏');

MERGE (n:Treatment {name: '低剂量曲唑酮'})
SET 
    n.description = coalesce(n.description, '用于伴有睡眠维持困难的患者的治疗'),
    n.type = coalesce(n.type, '药物'),
    n.dosage = coalesce(n.dosage, '低剂量'),
    n.duration = coalesce(n.duration, '按需'),
    n.contraindication = coalesce(n.contraindication, '对曲唑酮过敏');

MERGE (n:Treatment {name: '胆碱酯酶抑制剂'})
SET 
    n.description = coalesce(n.description, '改善认知功能损害患者认知和睡眠质量的药物'),
    n.type = coalesce(n.type, '药物'),
    n.dosage = coalesce(n.dosage, '视患者情况而定'),
    n.duration = coalesce(n.duration, '按需'),
    n.contraindication = coalesce(n.contraindication, '对胆碱酯酶抑制剂过敏');

MERGE (n:Treatment {name: 'NMDA受体拮抗剂'})
SET 
    n.description = coalesce(n.description, '可能改善认知功能损害患者的睡眠'),
    n.type = coalesce(n.type, '药物'),
    n.dosage = coalesce(n.dosage, '视患者情况而定'),
    n.duration = coalesce(n.duration, '按需'),
    n.contraindication = coalesce(n.contraindication, '对NMDA受体拮抗剂过敏');

MERGE (n:Treatment {name: '抗抑郁药'})
SET 
    n.description = coalesce(n.description, '可能加重RBD和RLS的药物'),
    n.type = coalesce(n.type, '药物'),
    n.dosage = coalesce(n.dosage, '视患者情况而定'),
    n.duration = coalesce(n.duration, '按需'),
    n.contraindication = coalesce(n.contraindication, '对抗抑郁药过敏');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '非BZDs'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '褪黑素受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '胆碱酯酶抑制剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '慢性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '痴呆'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.38),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '快速眼动行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #32
   Timestamp: 2024-12-12 01:28:39
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为入睡困难、睡眠维持困难或早醒。');

MERGE (n:Disease {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '指到达一定年龄与正常认知思想能力退化相较，影响生活与学习能力');

MERGE (n:Disease {name: '运动迟缓'})
SET 
    n.description = coalesce(n.description, '影响运动的表现，通常与神经系统疾病相关');

MERGE (n:Disease {name: '膀胱高反应性'})
SET 
    n.description = coalesce(n.description, '膀胱异常过度活跃，导致频繁排尿');

MERGE (n:Disease {name: '肢体疼痛'})
SET 
    n.description = coalesce(n.description, '一般指躯体某部位的疼痛，影响日常生活');

MERGE (n:Disease {name: 'RLS'})
SET 
    n.description = coalesce(n.description, '静坐不安症，表现为腿部的不适感，导致患者无法静止');

MERGE (n:Disease {name: 'SDB'})
SET 
    n.description = coalesce(n.description, '睡眠呼吸暂停，指在睡眠中反复出现呼吸暂停或呼吸减弱的症状');

MERGE (n:Treatment {name: '非苯二氮草类药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗失眠的药物，如唑吡坦、右佐匹克隆'),
    n.duration = coalesce(n.duration, '3-6个月'),
    n.contraindication = coalesce(n.contraindication, '药物依赖与成瘾');

MERGE (n:Treatment {name: '褪黑素受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '治疗失眠的药物，用于痴呆患者'),
    n.contraindication = coalesce(n.contraindication, '效果有限');

MERGE (n:Treatment {name: '非典型抗精神病药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可改善夜间睡眠质量的药物'),
    n.contraindication = coalesce(n.contraindication, '增加心脑血管风险');

MERGE (n:Treatment {name: '曲唑酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于合并失眠的轻中度痴呆患者，能提高睡眠效率'),
    n.contraindication = coalesce(n.contraindication, '低血压');

MERGE (n:Treatment {name: '失眠认知行为治疗(CBT-I)'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对共病失眠的认知行为干预'),
    n.duration = coalesce(n.duration, '长期');

MERGE (n:Treatment {name: '光照疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对伴有失眠的痴呆患者有效的治疗方法'),
    n.duration = coalesce(n.duration, '短期至长期');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '运动迟缓'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '膀胱高反应性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '肢体疼痛'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'RLS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = 'SDB'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '非苯二氮草类药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '褪黑素受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '维护');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '非典型抗精神病药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠认知行为治疗(CBT-I)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '光照疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '辅助治疗');



// =====================================

