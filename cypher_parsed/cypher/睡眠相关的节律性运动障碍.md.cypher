// File: 睡眠相关的节律性运动障碍.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:09:45
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '是一种与睡眠相关的以身体多部位反复的节律性刻板样动作为表现的综合征。'),
    n.category = coalesce(n.category, '睡眠运动障碍'),
    n.severity = coalesce(n.severity, '轻至中等');

MERGE (n:Symptom {name: '反复的节律性运动'})
SET 
    n.description = coalesce(n.description, '表现为身体多部位反复的节律性刻板样动作为特征。'),
    n.severity = coalesce(n.severity, '轻至中等'),
    n.frequency = coalesce(n.frequency, '发作性');

MERGE (n:Symptom {name: '撞头'})
SET 
    n.description = coalesce(n.description, '患者在发作时可能将头部撞击床头或墙壁。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚发作数次至数十次');

MERGE (n:Symptom {name: '摇头'})
SET 
    n.description = coalesce(n.description, '头部向左右不停地摇摆。'),
    n.severity = coalesce(n.severity, '轻至中等'),
    n.frequency = coalesce(n.frequency, '偶见于发作');

MERGE (n:Symptom {name: '身体前后摆动'})
SET 
    n.description = coalesce(n.description, '身体以复杂而固定模式进行前后摆动。'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '混合型发作'})
SET 
    n.description = coalesce(n.description, '包含两种或两种以上发作类型的表现。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常出现');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '反复的节律性运动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '撞头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '摇头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻至中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '身体前后摆动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '混合型发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

