// File: 儿童中枢性睡眠呼吸暂停56例临床分析.md
// Processed at: 2024-12-19 00:12:18
// Total pairs: 1

/* Response #1
   Timestamp: 2024-12-19 00:08:59
*/
// 节点更新
MERGE (n:Disease {name: '中枢性睡眠呼吸暂停(CSA)'})
SET 
    n.description = coalesce(n.description, '以呼吸驱动缺乏或异常导致的通气功能障碍为特征，相对于阻塞性睡眠呼吸暂停(OSA)发生率更低'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停(OSA)'})
SET 
    n.description = coalesce(n.description, '在睡眠过程中频繁发生部分或全部上气道阻塞'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '中枢性睡眠呼吸暂停(CSA)'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停(OSA)'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

