// File: 认知功能损害患者睡眠障碍评估和管理的专家共识.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-27 20:08:25
*/
// 节点更新
MERGE (n:Disease {name: '认知功能损害'})
SET 
    n.description = coalesce(n.description, '包括轻度认知功能损害和痴呆，主要症状为认知能力下降'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '痴呆'})
SET 
    n.description = coalesce(n.description, '主要包括阿尔茨海默病、血管性痴呆等，表现为记忆与认知功能的逐渐下降'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠难以入睡或维持的症状'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间过度思睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度瞌睡，难以保持清醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠呼吸障碍'})
SET 
    n.description = coalesce(n.description, '包括阻塞性睡眠呼吸暂停等'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '异态睡眠'})
SET 
    n.description = coalesce(n.description, '快速眼球运动睡眠期的行为异常'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '腿部有不舒服的感觉，导致想要活动'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '周期性肢体运动'})
SET 
    n.description = coalesce(n.description, '在睡眠中反复性的腿部运动'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '昼夜节律失调性睡眠-觉醒障碍'})
SET 
    n.description = coalesce(n.description, '生物钟与社会生活的脱节'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '通过监测睡眠状态来诊断睡眠障碍'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '住院观察');

// 关系更新
MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '日间过度思睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '异态睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '周期性肢体运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '昼夜节律失调性睡眠-觉醒障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能损害'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #2
   Timestamp: 2024-12-27 20:08:28
*/
// 节点更新
MERGE (n:Disease {name: 'CRSWDs'})
SET 
    n.description = coalesce(n.description, '认知功能损害患者的睡眠障碍类型'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '睡眠明显片段化'})
SET 
    n.description = coalesce(n.description, '患者夜间的睡眠质量下降，睡眠时常被打断'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '觉醒次数增加'})
SET 
    n.description = coalesce(n.description, '夜间被唤醒的频率高，影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间徘徊不睡'})
SET 
    n.description = coalesce(n.description, '患者夜间活动频繁，难以维持睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '人睡及维持困难'})
SET 
    n.description = coalesce(n.description, '患者入睡和维持睡眠的困难'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '较常见');

MERGE (n:Examination {name: 'ACT检测'})
SET 
    n.description = coalesce(n.description, '可客观评估患者的睡眠和觉醒状态的检测方法'),
    n.method = coalesce(n.method, '活动监测'),
    n.requirement = coalesce(n.requirement, '至少使用7天');

// 关系更新
MATCH (from) WHERE from.name = '睡眠明显片段化'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '觉醒次数增加'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜间徘徊不睡'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '人睡及维持困难'
MATCH (to) WHERE to.name = 'CRSWDs'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '较常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = 'CRSWDs'
MATCH (to) WHERE to.name = 'ACT检测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

