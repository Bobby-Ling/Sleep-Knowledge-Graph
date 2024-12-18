// File: 特发性过度睡眠：一类不容忽视的睡眠障碍.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:56:05
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.code = coalesce(n.code, 'IH'),
    n.description = coalesce(n.description, '一种慢性中枢性嗜睡疾病，主要表现为尽管睡眠时间正常或延长，但白天仍会出现过度嗜睡。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度至重度');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '醒后无恢复感的过度嗜睡，通常表现为难以控制的困倦。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠惰性'})
SET 
    n.description = coalesce(n.description, '醒后难以迅速清醒，表现为醉酒样睡眠。'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '脑雾症状'})
SET 
    n.description = coalesce(n.description, '表现为记忆力减退、注意力不集中、常忘记事情等。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Symptom {name: '睡眠时间延长'})
SET 
    n.description = coalesce(n.description, '成人患者典型睡眠时间为10小时以上。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '普遍');

MERGE (n:Symptom {name: '小睡后恢复感差'})
SET 
    n.description = coalesce(n.description, '小睡后醒来仍感到困倦。'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于评估睡眠状况的综合检测方法。'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '需排除其他睡眠障碍');

MERGE (n:Examination {name: '多次睡眠潜伏期测试'})
SET 
    n.description = coalesce(n.description, '用于测定睡眠潜伏期的测试方法。'),
    n.method = coalesce(n.method, '多次睡眠潜伏期测试'),
    n.requirement = coalesce(n.requirement, '需保证检测环境安静');

MERGE (n:NonDrugTreatment {name: '健康教育'})
SET 
    n.description = coalesce(n.description, '对疾病症状、严重程度的认识，规律小睡，保持良好睡眠卫生。'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '莫达非尼'})
SET 
    n.description = coalesce(n.description, '用于治疗日间过度嗜睡的药物，安全性高。'),
    n.dosage = coalesce(n.dosage, '200mg'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '视效果而定'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '抑郁症患者慎用');

MERGE (n:DrugTreatment {name: '低钠羟丁酸'})
SET 
    n.description = coalesce(n.description, '用于治疗发作性睡病和特发性过度睡眠的药物，采用低钠成分。'),
    n.dosage = coalesce(n.dosage, '3-4.5g'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '视效果而定'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '有药物滥用史的患者慎用');

// 关系更新
MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '日间过度嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠惰性'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '脑雾症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '睡眠时间延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '普遍'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '小睡后恢复感差'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '多次睡眠潜伏期测试'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '健康教育'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '维持');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '维持');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '低钠羟丁酸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '维持');



// =====================================

