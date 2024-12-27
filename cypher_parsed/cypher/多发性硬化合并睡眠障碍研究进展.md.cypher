// File: 多发性硬化合并睡眠障碍研究进展.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:26
*/
// 节点更新
MERGE (n:Disease {name: '多发性硬化'})
SET 
    n.description = coalesce(n.description, '一种慢性中枢神经系统自身免疫性脱髓鞘疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠困难或无法维持睡眠的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠运动障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠期间无意识地进行运动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠相关呼吸异常'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现的呼吸障碍，如睡眠呼吸暂停'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Symptom {name: '发作性睡病'})
SET 
    n.description = coalesce(n.description, '以过度日间嗜睡为特征的慢性睡眠障碍'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '快速眼动期睡眠行为障碍'})
SET 
    n.description = coalesce(n.description, 'REM期睡眠时出现异常运动行为'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '严重');

MERGE (n:Symptom {name: '异常睡眠-觉醒节律'})
SET 
    n.description = coalesce(n.description, '睡眠与觉醒周期失调'),
    n.severity = coalesce(n.severity, '轻微'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '白天睡眠过多'})
SET 
    n.description = coalesce(n.description, '白天过度困倦或无法保持清醒'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '不安腿综合征'})
SET 
    n.description = coalesce(n.description, '在静止状态下出现的腿部不适感，需通过运动缓解'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '持久的身体或精神疲惫感'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠图检查'})
SET 
    n.description = coalesce(n.description, '用于诊断各种睡眠障碍的检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行');

MERGE (n:Examination {name: 'MRI'})
SET 
    n.description = coalesce(n.description, '核磁共振成像，用于检查神经系统受损情况'),
    n.method = coalesce(n.method, '核磁共振扫描'),
    n.requirement = coalesce(n.requirement, '在扫描前保持放松');

// 关系更新
MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '睡眠运动障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '睡眠相关呼吸异常'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '快速眼动期睡眠行为障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '严重'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '异常睡眠-觉醒节律'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻微');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '白天睡眠过多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '不安腿综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = '多导睡眠图检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '多发性硬化'
MATCH (to) WHERE to.name = 'MRI'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

