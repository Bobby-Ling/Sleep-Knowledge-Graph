// File: 卒中相关睡眠障碍评估与管理中国专家共识.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 3

/* Response #1
   Timestamp: 2024-12-18 09:56:12
*/
// 节点更新
MERGE (n:Disease {name: '卒中相关睡眠障碍'})
SET 
    n.code = coalesce(n.code, 'SSD'),
    n.description = coalesce(n.description, '卒中后常见症状, 临床多见却易被忽视'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '失眠'})
SET 
    n.code = coalesce(n.code, 'Insomnia'),
    n.description = coalesce(n.description, '睡眠困难或维持困难'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '日间思睡'})
SET 
    n.code = coalesce(n.code, 'EDS'),
    n.description = coalesce(n.description, '无法克制的困倦欲睡或非预期的白天入睡'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '睡眠呼吸障碍'})
SET 
    n.code = coalesce(n.code, 'SDB'),
    n.description = coalesce(n.description, '睡眠期间出现呼吸中断'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '睡眠中打鼾伴呼吸暂停'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.code = coalesce(n.code, 'RLS'),
    n.description = coalesce(n.description, '活动双下肢的强烈愿望，伴随下肢不适感'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Disease {name: '快速眼动睡眠期行为障碍'})
SET 
    n.code = coalesce(n.code, 'RBD'),
    n.description = coalesce(n.description, '睡眠中出现复杂运动行为'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '昼夜节律失调性睡眠觉醒障碍'})
SET 
    n.code = coalesce(n.code, 'CRSWD'),
    n.description = coalesce(n.description, '生物节律与睡眠-觉醒周期的失调'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '对未来或日常问题感到紧张不安'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '持续的忧郁情绪，失去兴趣'),
    n.severity = coalesce(n.severity, '重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:RiskFactor {name: '高血压'})
SET 
    n.description = coalesce(n.description, '血压持续升高的状态'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '高度的血糖水平导致的疾病'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '心脏病'})
SET 
    n.description = coalesce(n.description, '影响心脏健康的疾病'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '习惯性打鼾'})
SET 
    n.description = coalesce(n.description, '睡觉时发出的噪音影响睡眠'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:Complication {name: '卒中死亡'})
SET 
    n.description = coalesce(n.description, '卒中引起的死亡风险'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Complication {name: '卒中复发'})
SET 
    n.description = coalesce(n.description, '再次发生卒中'),
    n.severity = coalesce(n.severity, '重');

// 关系更新
MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '卒中死亡'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '卒中复发'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '卒中相关睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '日间思睡'
MATCH (to) WHERE to.name = '卒中相关睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '睡眠呼吸障碍'
MATCH (to) WHERE to.name = '卒中相关睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '不宁腿综合征'
MATCH (to) WHERE to.name = '卒中相关睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '快速眼动睡眠期行为障碍'
MATCH (to) WHERE to.name = '卒中相关睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.88),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '心脏病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '卒中相关睡眠障碍'
MATCH (to) WHERE to.name = '习惯性打鼾'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 16:48:13
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-18 16:48:13
*/
// 节点更新


// =====================================

