// File: 成人阻塞性睡眠呼吸暂停高危人群筛查与管理专家共识.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:01
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸疾病'),
    n.category = coalesce(n.category, '呼吸系统疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '男性'})
SET 
    n.description = coalesce(n.description, '性别高危因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '年龄增加'})
SET 
    n.description = coalesce(n.description, '年龄是OSA的高危因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '上气道及颌面结构异常'})
SET 
    n.description = coalesce(n.description, '结构异常是OSA的风险因素'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '肥胖是OSA的高度危险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '不良生活方式'})
SET 
    n.description = coalesce(n.description, '某些生活方式引起OSA'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:RiskFactor {name: '遗传因素'})
SET 
    n.description = coalesce(n.description, 'OSA可能与家族遗传有关'),
    n.impact_level = coalesce(n.impact_level, '低');

MERGE (n:RiskFactor {name: '使用镇静安眠类药物'})
SET 
    n.description = coalesce(n.description, '某些药物可能加重OSA'),
    n.impact_level = coalesce(n.impact_level, '中等');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '与OSA密切相关的疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '冠心病'})
SET 
    n.description = coalesce(n.description, '与OSA密切相关的疾病'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '卒中'})
SET 
    n.description = coalesce(n.description, '与OSA密切相关的疾病'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '与OSA密切相关的疾病'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '男性'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '年龄增加'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '上气道及颌面结构异常'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '不良生活方式'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '遗传因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '低'),
    r.evidence_level = coalesce(r.evidence_level, '弱');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '使用镇静安眠类药物'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中等'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

