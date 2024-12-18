// File: 睡眠相关的节律性运动障碍.md
// Processed at: 2024-12-18 16:48:29
// Total pairs: 2

/* Response #1
   Timestamp: 2024-12-18 09:56:11
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '与睡眠相关的以身体多部位反复的节律性刻板样动作为表现的综合征。'),
    n.category = coalesce(n.category, '睡眠运动障碍性疾病'),
    n.severity = coalesce(n.severity, '轻度');

MERGE (n:Symptom {name: '撞头'})
SET 
    n.description = coalesce(n.description, '坐位时呈双下肢跪位，上身前后或侧位节律性摆动并有力的撞头'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每晚多次');

MERGE (n:Symptom {name: '摇头'})
SET 
    n.description = coalesce(n.description, '仰卧位时头部向左右不停地摇摆'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每晚多次');

MERGE (n:Symptom {name: '身体摇摆'})
SET 
    n.description = coalesce(n.description, '以手和膝支撑，坐位时摇摆身体'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每晚多次');

MERGE (n:Symptom {name: '卷动'})
SET 
    n.description = coalesce(n.description, '仰卧位时身体向两侧翻滚'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '腿摇摆型'})
SET 
    n.description = coalesce(n.description, '腿摇摆'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '腿撞击型'})
SET 
    n.description = coalesce(n.description, '腿撞向床边'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '少见');

MERGE (n:Symptom {name: '夜间失眠'})
SET 
    n.description = coalesce(n.description, '由于节律性运动导致的睡眠干扰'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '每晚');

MERGE (n:Complication {name: '颈动脉夹层'})
SET 
    n.description = coalesce(n.description, '由于剧烈的碰撞导致的颈动脉损伤'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '视网膜出血'})
SET 
    n.description = coalesce(n.description, '碰撞导致的视网膜出血'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '头部创伤'})
SET 
    n.description = coalesce(n.description, '由于反复的节律性运动导致的头部外伤'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '撞头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每晚多次'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '摇头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每晚多次'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '身体摇摆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每晚多次'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '卷动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '腿摇摆型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '腿撞击型'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '少见'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '夜间失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '每晚'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '颈动脉夹层'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '发作时及之后');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '视网膜出血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '发作时及之后');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '头部创伤'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '发作时及之后');



// =====================================

/* Response #2
   Timestamp: 2024-12-18 16:48:13
*/
// 节点更新


// =====================================

