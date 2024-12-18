// File: 《成年人阻塞性睡眠呼吸暂停低通气综合征筛查：美国预防临床服务指南工作组推荐声明》解读.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-18 09:55:51
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸障碍,表现为在睡眠期间呼吸暂停和上呼吸道阻塞'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '常见');

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'Hypertension'),
    n.description = coalesce(n.description, '一种与OSAHS 紧密相关的健康问题'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '常见');

MERGE (n:Disease {name: '糖尿病'})
SET 
    n.code = coalesce(n.code, 'Diabetes'),
    n.description = coalesce(n.description, '与OSAHS 密切相关的全身性疾病'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '常见');

MERGE (n:Disease {name: '冠心病'})
SET 
    n.code = coalesce(n.code, 'CHD'),
    n.description = coalesce(n.description, '心血管疾病的一种,与OSAHS 相关'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '脑卒中'})
SET 
    n.code = coalesce(n.code, 'Stroke'),
    n.description = coalesce(n.description, '一种与OSAHS 相关的健康问题'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.code = coalesce(n.code, 'Obesity'),
    n.description = coalesce(n.description, 'OSAHS 的主要危险因素之一'),
    n.category = coalesce(n.category, '代谢疾病'),
    n.severity = coalesce(n.severity, '常见');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '在睡眠时发出的响声'),
    n.severity = coalesce(n.severity, '普通'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '呼吸停顿'})
SET 
    n.description = coalesce(n.description, '睡眠时的短暂呼吸中断'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '在白天感到过度疲倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '白天');

MERGE (n:Symptom {name: '短暂的醒来'})
SET 
    n.description = coalesce(n.description, '睡眠中短暂醒来的现象'),
    n.severity = coalesce(n.severity, '普通'),
    n.frequency = coalesce(n.frequency, '夜间');

// 关系更新
MATCH (from) WHERE from.name = '打鼾'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '普通');

MATCH (from) WHERE from.name = '呼吸停顿'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '日间嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '高血压'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '糖尿病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '冠心病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '脑卒中'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '肥胖'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');



// =====================================

