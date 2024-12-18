// File: 中国6岁以下儿童就寝问题和夜醒治疗指南（2023）.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:03
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '慢性失眠障碍'});

MERGE (n:Disease {name: '短期失眠障碍'});

MERGE (n:Disease {name: '睡眠呼吸障碍'});

MERGE (n:Disease {name: '胃食管反流'});

MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Disease {name: '缺铁性贫血'});

MERGE (n:Disease {name: '抑郁障碍'});

MERGE (n:Symptom {name: '就寝问题'})
SET 
    n.description = coalesce(n.description, '儿童入睡困难'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜醒'})
SET 
    n.description = coalesce(n.description, '儿童夜间频繁醒来'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '过度困倦'})
SET 
    n.description = coalesce(n.description, '白天过度困倦'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '注意力不集中'})
SET 
    n.description = coalesce(n.description, '注意力难以集中'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '多动'})
SET 
    n.description = coalesce(n.description, '儿童活动性过强'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶见');

MERGE (n:Symptom {name: '情绪问题'})
SET 
    n.description = coalesce(n.description, '情绪不稳定'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '偶见');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '就寝问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '非常常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '夜醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '就寝问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '靠前'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '缺铁性贫血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.55),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '胃食管反流'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '抑郁障碍'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '慢性失眠障碍'
MATCH (to) WHERE to.name = '注意力不集中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '慢性失眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '就寝问题'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '胃食管反流'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中');



// =====================================

