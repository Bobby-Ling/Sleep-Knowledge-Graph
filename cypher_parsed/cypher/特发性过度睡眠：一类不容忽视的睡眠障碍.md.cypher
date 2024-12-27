// File: 特发性过度睡眠：一类不容忽视的睡眠障碍.md
// Processed at: 2024-12-27 20:09:32
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-27 20:08:23
*/
// 节点更新
MERGE (n:Disease {name: '特发性过度睡眠'})
SET 
    n.description = coalesce(n.description, '一种慢性中枢性嗜睡疾病,主要表现为尽管睡眠时间正常或延长,但白天仍会出现过度嗜睡'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '日间过度嗜睡'})
SET 
    n.description = coalesce(n.description, '白天感到过度困倦'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜间睡眠时间延长'})
SET 
    n.description = coalesce(n.description, '成人患者典型睡眠时间为10小时以上'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '睡眠惰性'})
SET 
    n.description = coalesce(n.description, '醒后感到疲倦和难以快速清醒的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '认知功能受损'})
SET 
    n.description = coalesce(n.description, '注意力不集中、记忆力减退等表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '用于诊断过度睡眠障碍的检查'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '在安静环境中进行监测');

MERGE (n:Examination {name: '多次睡眠潜伏期测试'})
SET 
    n.description = coalesce(n.description, '评估患者的日间嗜睡程度'),
    n.method = coalesce(n.method, '测试患者入睡的潜伏期'),
    n.requirement = coalesce(n.requirement, '在安静的环境中进行');

// 关系更新
MATCH (from) WHERE from.name = '日间过度嗜睡'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '夜间睡眠时间延长'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '睡眠惰性'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '认知功能受损'
MATCH (to) WHERE to.name = '特发性过度睡眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '特发性过度睡眠'
MATCH (to) WHERE to.name = '多次睡眠潜伏期测试'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

