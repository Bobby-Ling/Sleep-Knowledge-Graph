// File: 睡眠相关的节律性运动障碍的临床特点.md
// Processed at: 2024-12-12 01:29:21
// Total pairs: 6

/* Response #1
   Timestamp: 2024-12-12 01:29:01
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:29:09
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '表现为身体多部位反复的节律性刻板样动作'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '反复的节律性刻板样动作'})
SET 
    n.description = coalesce(n.description, '夜间发作，影响睡眠质量'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '夜间');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可明显减轻症状及改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '按需'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '效果不佳者可尝试加用盐酸曲唑酮');

MERGE (n:Treatment {name: '盐酸曲唑酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '可加用以改善疗效'),
    n.dosage = coalesce(n.dosage, '按需'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '反复的节律性刻板样动作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '夜间'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '盐酸曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');



// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:29:10
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍性疾病'});

MERGE (n:Disease {name: '癫痫'});

MERGE (n:Symptom {name: '不自主摇头'})
SET 
    n.description = coalesce(n.description, '患者入睡后出现头部左右摆动'),
    n.severity = coalesce(n.severity, '频繁'),
    n.frequency = coalesce(n.frequency, '每晚均有发作');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗SRMD'),
    n.dosage = coalesce(n.dosage, '0.5mg至1.0mg'),
    n.duration = coalesce(n.duration, '随访1年'),
    n.contraindication = coalesce(n.contraindication, '无特殊');

MERGE (n:Complication {name: '智力发育稍迟滞并伴有抑郁状态'})
SET 
    n.description = coalesce(n.description, '患者伴随症状'),
    n.severity = coalesce(n.severity, '轻度');

// 关系更新
MATCH (from) WHERE from.name = '不自主摇头'
MATCH (to) WHERE to.name = '睡眠障碍性疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每晚均有发作'),
    r.severity = coalesce(r.severity, '频繁');

MATCH (from) WHERE from.name = '癫痫'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '睡眠障碍性疾病'
MATCH (to) WHERE to.name = '智力发育稍迟滞并伴有抑郁状态'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:29:11
*/
// 节点更新
MERGE (n:Disease {name: '睡眠障碍性疾病'})
SET 
    n.description = coalesce(n.description, '考虑非癫痫性发作，睡眠障碍性疾病');

MERGE (n:Symptom {name: '头部不自主摇摆'})
SET 
    n.description = coalesce(n.description, '在睡眠中，患者头部出现不自主的摇摆，通常夜间发作'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '反复');

MERGE (n:Symptom {name: '白天困倦疲乏'})
SET 
    n.description = coalesce(n.description, '由于睡眠中反复将自己摇醒，导致白天感到困倦疲乏'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Treatment {name: '氯硝西泮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于减少发作的药物'),
    n.dosage = coalesce(n.dosage, '0.5mg'),
    n.duration = coalesce(n.duration, '不定'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '盐酸曲唑酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改用的药物，发作消失'),
    n.dosage = coalesce(n.dosage, '50mg'),
    n.duration = coalesce(n.duration, '不定'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '睡眠障碍性疾病'
MATCH (to) WHERE to.name = '氯硝西泮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '睡眠障碍性疾病'
MATCH (to) WHERE to.name = '盐酸曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '调整');

MATCH (from) WHERE from.name = '头部不自主摇摆'
MATCH (to) WHERE to.name = '睡眠障碍性疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '累计'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '白天困倦疲乏'
MATCH (to) WHERE to.name = '睡眠障碍性疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:29:13
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.code = coalesce(n.code, 'SRMD'),
    n.description = coalesce(n.description, '一组影响睡眠的运动障碍，常见于儿童并可能在青春期复发。'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '轻度到中度');

MERGE (n:Symptom {name: '撞头'})
SET 
    n.description = coalesce(n.description, '发作时以头部撞击为主，可能伴随响亮的嗡嗡声或吟唱声。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '摇头'})
SET 
    n.description = coalesce(n.description, '表现为头部的节律性摇摆，出现在睡眠觉醒转换期。'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '身体摇摆'})
SET 
    n.description = coalesce(n.description, '身体在睡眠中出现的摇摆动作。'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '腿摇摆'})
SET 
    n.description = coalesce(n.description, '腿部在睡眠中出现的摇摆动作。'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '偶尔');

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
MATCH (to) WHERE to.name = '身体摇摆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '腿摇摆'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '轻度');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:29:19
*/
// 节点更新
MERGE (n:Disease {name: '睡眠相关的节律性运动障碍'})
SET 
    n.short_name = coalesce(n.short_name, 'SRMD');

MERGE (n:Symptom {name: '睡眠效率降低'})
SET 
    n.description = coalesce(n.description, '睡眠效率低下的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: 'NREM I期、III期发作'})
SET 
    n.description = coalesce(n.description, '在NREM I和III期的发作'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: 'REM潜伏期延长'})
SET 
    n.description = coalesce(n.description, '快速动眼睡眠潜伏期的延长'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '觉醒次数增加'})
SET 
    n.description = coalesce(n.description, '全夜觉醒次数的增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Treatment {name: '三环类抗抑郁药 (TCAs)'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗SRMD的药物'),
    n.dosage = coalesce(n.dosage, '根据医嘱'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '不良反应较多');

MERGE (n:Treatment {name: '盐酸曲唑酮'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于提高睡眠效率、减少觉醒次数的药物'),
    n.dosage = coalesce(n.dosage, '按医嘱'),
    n.duration = coalesce(n.duration, '个案研究'),
    n.contraindication = coalesce(n.contraindication, '尚需研究');

// 关系更新
MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '睡眠效率降低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = 'NREM I期、III期发作'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = 'REM潜伏期延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '轻度'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '觉醒次数增加'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '三环类抗抑郁药 (TCAs)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '睡眠相关的节律性运动障碍'
MATCH (to) WHERE to.name = '盐酸曲唑酮'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

