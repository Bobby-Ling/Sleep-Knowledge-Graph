// File: 孤独症谱系障碍儿童睡眠障碍临床实践相关指南解读.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:08:59
*/
// 节点更新
MERGE (n:Disease {name: '孤独症谱系障碍'})
SET 
    n.description = coalesce(n.description, '起病于儿童早期的神经发育障碍，核心症状为社交障碍、重复刻板的行为和局限狭窄的兴趣');

MERGE (n:Disease {name: '睡眠障碍'})
SET 
    n.description = coalesce(n.description, '睡眠质量、时长和就寝时间异常，由于多种因素影响，导致儿童失眠或睡眠行为紊乱');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '在睡眠时间和条件下，儿童在启动或维持睡眠上反复出现困难，导致日间功能损害');

MERGE (n:Disease {name: '睡眠呼吸暂停综合征'})
SET 
    n.description = coalesce(n.description, '睡眠时的呼吸异常，伴有睡眠中觉醒');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '睡眠时出现的不适感，需要移动腿以获得缓解的症状');

MERGE (n:Symptom {name: '就寝抵抗'})
SET 
    n.description = coalesce(n.description, '儿童入睡前表现出依恋于亲属的行为，或反复拒绝上床睡觉');

MERGE (n:Symptom {name: '睡眠时间不足'})
SET 
    n.description = coalesce(n.description, '儿童的总睡眠时间低于正常要求');

MERGE (n:Symptom {name: '睡眠节律紊乱'})
SET 
    n.description = coalesce(n.description, '儿童的睡眠模式出现了明显的时间变化和不规律');

MERGE (n:NonDrugTreatment {name: '行为治疗'})
SET 
    n.description = coalesce(n.description, '通过改善睡眠习惯改善儿童的睡眠'),
    n.duration = coalesce(n.duration, '根据临床情况'),
    n.frequency = coalesce(n.frequency, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:NonDrugTreatment {name: 'CBT治疗'})
SET 
    n.description = coalesce(n.description, '认知行为疗法，改善儿童失眠的针对性方法'),
    n.duration = coalesce(n.duration, '短期'),
    n.frequency = coalesce(n.frequency, '根据患者需求'),
    n.contraindication = coalesce(n.contraindication, '无'),
    n.equipment = coalesce(n.equipment, '无');

MERGE (n:DrugTreatment {name: '褪黑素'})
SET 
    n.description = coalesce(n.description, '调节昼夜节律的功能和催眠作用的补充剂'),
    n.dosage = coalesce(n.dosage, '1~3 mg/d'),
    n.frequency = coalesce(n.frequency, '睡前30~60分钟使用'),
    n.duration = coalesce(n.duration, '根据临床需求'),
    n.route = coalesce(n.route, '口服'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '就寝抵抗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠时间不足'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠节律紊乱'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '孤独症谱系障碍'
MATCH (to) WHERE to.name = 'CBT治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '联合治疗');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '特殊治疗');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '睡眠呼吸暂停综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '有时'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠障碍'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

