// File: 日间过度思睡临床诊断和治疗专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:09:01
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'});

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: '过度思睡'})
SET 
    n.description = coalesce(n.description, '白天出现异常困倦，难以保持警觉'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间睡眠问题'})
SET 
    n.description = coalesce(n.description, '夜间无法维持正常睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:NonDrugTreatment {name: '生活方式干预'})
SET 
    n.description = coalesce(n.description, '通过调整生活方式改善睡眠质量'),
    n.duration = coalesce(n.duration, '长期'),
    n.frequency = coalesce(n.frequency, '持续'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: '光照疗法'})
SET 
    n.description = coalesce(n.description, '使用光照调整昼夜节律'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '每天'),
    n.contraindication = coalesce(n.contraindication, '避免夜间光照'),
    n.equipment = coalesce(n.equipment, '光照设备');

MERGE (n:DrugTreatment {name: '莫达非尼'})
SET 
    n.description = coalesce(n.description, '用于改善日间过度思睡'),
    n.dosage = coalesce(n.dosage, '按需'),
    n.frequency = coalesce(n.frequency, '每日一次'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '过度思睡'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '生活方式干预'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '莫达非尼'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '药物治疗');

MATCH (from) WHERE from.name = '过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:09:09
*/
// 节点更新
MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '在一天需要保持清醒的时间段内无法维持清醒和警觉，出现不能抑制的睡眠需求，甚至不由自主地入睡的症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '是一种中枢性嗜睡疾病，表现为日间过度思睡、猝倒发作等症状'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '特发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '是一种慢性中枢性嗜睡疾病，主要表现为日间过度思睡'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '复发性嗜睡症'})
SET 
    n.description = coalesce(n.description, '以反复发作的思睡伴随认知、精神和行为异常为特征的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '导致睡眠质量下降，容易引发日间过度思睡的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '导引日间过度思睡的常见疾病'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '精神障碍'})
SET 
    n.description = coalesce(n.description, '可表现为日间过度思睡的症状的疾病'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '主观感觉体力和精力的缺乏'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '注意力减退'})
SET 
    n.description = coalesce(n.description, '难以集中注意力的状态'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '记忆力减退'})
SET 
    n.description = coalesce(n.description, '难以保持记忆的状态'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '表现为言语、阅读和记忆困难'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠发作'})
SET 
    n.description = coalesce(n.description, '在无意识状态下入睡的症状'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '特发性嗜睡症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '复发性嗜睡症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '注意力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '记忆力减退'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '认知功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '睡眠发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '日间过度思睡'
MATCH (to) WHERE to.name = '复发性嗜睡症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

