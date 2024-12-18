// File: 认知功能损害患者睡眠障碍评估和管理的专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-19 00:08:59
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害'});

MERGE (n:Disease {name: 'CRSWDs'})
SET 
    n.description = coalesce(n.description, '睡眠-觉醒障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '精神行为异常'})
SET 
    n.description = coalesce(n.description, '伴随宿主认知功能损害的精神行为异常'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '精神行为异常'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.9),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #2
   Timestamp: 2024-12-19 00:09:03
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害'});

MERGE (n:Disease {name: '轻度认知功能损害'})
SET 
    n.code = coalesce(n.code, 'MCI');

MERGE (n:Disease {name: '痴呆'});

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

MERGE (n:Disease {name: '失眠'});

MERGE (n:Disease {name: '日间过度思睡'})
SET 
    n.code = coalesce(n.code, 'EDS');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.code = coalesce(n.code, 'SDB');

MERGE (n:Disease {name: '异态睡眠'});

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
MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '异态睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶发'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '罕见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠-觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '存在'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阿尔茨海默病'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '阿尔茨海默病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '血管性痴呆'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '额颞叶变性'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '血管性痴呆'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

