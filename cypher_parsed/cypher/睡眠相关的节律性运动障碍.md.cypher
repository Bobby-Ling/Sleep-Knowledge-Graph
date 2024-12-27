// File: 睡眠相关的节律性运动障碍.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:36
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.description = coalesce(n.description, '一种与睡眠相关的以身体多部位反复的节律性刻板样动作为表现的综合征'),
    n.severity = coalesce(n.severity, '未知');

MERGE (n:Symptom {name: '撞头'})
SET 
    n.description = coalesce(n.description, '坐位时呈双下肢跪位,上身前后或侧位节律性摆动并有力的撞头'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚发作数次至数十次');

MERGE (n:Symptom {name: '摇头'})
SET 
    n.description = coalesce(n.description, '仰卧位时头部向左右不停地摇摆'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚发作数次至数十次');

MERGE (n:Symptom {name: '身体前后摆动'})
SET 
    n.description = coalesce(n.description, '以手和膝支撑,坐位时摇摆身体'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每晚发作数次至数十次');

MERGE (n:Symptom {name: '身体旋转'})
SET 
    n.description = coalesce(n.description, '仰卧位时身体向两侧翻滚'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '较少见');

MERGE (n:Symptom {name: '腿摇摆'})
SET 
    n.description = coalesce(n.description, '腿部摇摆的行为'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '较少见');

MERGE (n:Symptom {name: '腿撞击'})
SET 
    n.description = coalesce(n.description, '腿部撞击的行为'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '较少见');

MERGE (n:Examination {name: '视频多导睡眠图'})
SET 
    n.description = coalesce(n.description, '监测睡眠阶段,记录节律性运动及其他参数'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '夜间简单观察');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '撞头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '摇头'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '身体前后摆动'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '身体旋转'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '腿摇摆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '腿撞击'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '视频多导睡眠图'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

