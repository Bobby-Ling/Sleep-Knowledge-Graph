// File: 中国6岁以下儿童就寝问题和夜醒治疗指南（2023）.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:57
*/
// 节点更新
MERGE (n:Disease {name: '就寝问题'})
SET 
    n.description = coalesce(n.description, '6岁以下儿童失眠的主要表现，可对儿童生长发育和家长身心健康造成不良影响。');

MERGE (n:Disease {name: '夜醒'})
SET 
    n.description = coalesce(n.description, '6岁以下儿童失眠的主要表现，常见主诉之一。');

MERGE (n:Symptom {name: '人睡潜伏期'})
SET 
    n.description = coalesce(n.description, '从家长准备安顿儿童睡觉到儿童真正人睡的时间，一般认为大于20分钟具有临床意义。');

MERGE (n:Symptom {name: '夜间醒来'})
SET 
    n.description = coalesce(n.description, '儿童频繁夜醒的问题，通常表现为每晚2次以上的夜醒，且每次醒来大于5分钟。');

MERGE (n:Treatment {name: '行为治疗'})
SET 
    n.description = coalesce(n.description, '通过标准消退法、渐进消退法等方式改善儿童就寝问题和夜醒。');

MERGE (n:Treatment {name: '早期睡眠卫生习惯指导'})
SET 
    n.description = coalesce(n.description, '对儿童就寝问题和夜醒的改善效果显著，建议作为干预方法。');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.description = coalesce(n.description, '包括褪黑素，短期内可减少婴幼儿夜醒，但不推荐作为一线方案。');

MERGE (n:Complication {name: '慢性失眠障碍'})
SET 
    n.description = coalesce(n.description, '如果相关睡眠问题每周出现3次并持续3个月，为慢性失眠障碍。');

// 关系更新
MATCH (from) WHERE from.name = '就寝问题'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '就寝问题'
MATCH (to) WHERE to.name = '早期睡眠卫生习惯指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '辅助手段');

MATCH (from) WHERE from.name = '就寝问题'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '就寝问题'
MATCH (to) WHERE to.name = '人睡潜伏期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '夜间醒来'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '早期睡眠卫生习惯指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '辅助手段');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '非首选');

MATCH (from) WHERE from.name = '就寝问题'
MATCH (to) WHERE to.name = '夜醒'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '必需'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

