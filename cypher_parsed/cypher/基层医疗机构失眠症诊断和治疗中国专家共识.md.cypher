// File: 基层医疗机构失眠症诊断和治疗中国专家共识.md
// Processed at: 2024-12-12 01:32:19
// Total pairs: 24

/* Response #1
   Timestamp: 2024-12-12 01:31:12
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:31:14
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:31:16
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '最常见的睡眠障碍'),
    n.severity = coalesce(n.severity, '高'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '躯体疾病'})
SET 
    n.description = coalesce(n.description, '各种身体健康问题的统称');

MERGE (n:Disease {name: '精神障碍'})
SET 
    n.description = coalesce(n.description, '精神健康问题的统称');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '躯体疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:31:17
*/
// 节点更新
MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠是一种症状，也可以是独立的疾病'),
    n.severity = coalesce(n.severity, '短期'),
    n.frequency = coalesce(n.frequency, '可自行缓解');

MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '失眠症是一种持续数月，对个体的社会功能产生较大负面影响的睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '短期与压力、焦虑等因素相关'),
    r.severity = coalesce(r.severity, '短期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:31:21
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:Treatment {name: '传统镇静催眠药'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗失眠的药物'),
    n.dosage = coalesce(n.dosage, '根据具体情况而定'),
    n.duration = coalesce(n.duration, '根据医生建议'),
    n.contraindication = coalesce(n.contraindication, '对镇静催眠药过敏者禁用');

MERGE (n:Treatment {name: '中医药'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '应用中医理论与方法治疗失眠'),
    n.dosage = coalesce(n.dosage, '依据医嘱'),
    n.duration = coalesce(n.duration, '依据医嘱'),
    n.contraindication = coalesce(n.contraindication, '对中药成分过敏者禁用');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '传统镇静催眠药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '中医药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '普通'),
    r.stage = coalesce(r.stage, '初级治疗');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:31:21
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为无法入睡或保持睡眠状态');

MERGE (n:Symptom {name: '睡眠困难'})
SET 
    n.description = coalesce(n.description, '入睡困难，难以开始睡眠'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '睡眠不深'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，睡眠浅'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '易醒'})
SET 
    n.description = coalesce(n.description, '容易在夜间醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '提前醒来，无法继续睡眠'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '睡眠不深'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '易醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '轻度');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:31:22
*/
// 节点更新


// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:31:23
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '一种睡眠障碍，表现为入睡困难、维持睡眠困难或早醒等症状');

MERGE (n:Symptom {name: '情绪问题'})
SET 
    n.description = coalesce(n.description, '情绪反应不当，伴随失眠症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '记忆障碍'})
SET 
    n.description = coalesce(n.description, '在睡眠中无法保持记忆'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Treatment {name: '失眠认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过改变失眠者的认知和行为模式来改善失眠症状'),
    n.duration = coalesce(n.duration, '8-12周');

MERGE (n:Treatment {name: '放松训练'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过放松技巧来缓解日间的烦躁情绪'),
    n.duration = coalesce(n.duration, '短期');

MERGE (n:Treatment {name: 'β-受体阻滞剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '通过阻断去甲肾上腺素受体来调控REM睡眠'),
    n.duration = coalesce(n.duration, '视患者情况而定');

MERGE (n:Treatment {name: '胍法辛'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '抑制蓝斑的活动以调节情绪反应'),
    n.duration = coalesce(n.duration, '视患者情况而定');

// 关系更新
MATCH (from) WHERE from.name = '情绪问题'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '记忆障碍'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '放松训练'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '症状缓解期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = 'β-受体阻滞剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '胍法辛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:31:24
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '当前存在至少一种失眠症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '日间功能受损'})
SET 
    n.description = coalesce(n.description, '白天表现出不能正常工作的状态'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '常见');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '日间功能受损'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:31:25
*/
// 节点更新


// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:31:26
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '失眠是一种过度觉醒，呈持续性，横跨24小时日周期'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '睡眠期觉醒增多'})
SET 
    n.description = coalesce(n.description, '睡眠期觉醒增多的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '日间小睡潜伏期延长'})
SET 
    n.description = coalesce(n.description, '日间小睡需要较长时间才能入睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '24h代谢率增加'})
SET 
    n.description = coalesce(n.description, '身体代谢速率在24小时内的增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '清醒期更多β波活动'})
SET 
    n.description = coalesce(n.description, '清醒状态下更频繁的β波活动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '睡眠期的频繁α波和β波'})
SET 
    n.description = coalesce(n.description, '睡眠期间 α波 和 β波 的频繁出现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '自主神经功能活性增加'})
SET 
    n.description = coalesce(n.description, '自主神经系统在失眠患者中的活性增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '下丘脑-垂体-肾上腺轴过度活跃'})
SET 
    n.description = coalesce(n.description, '下丘脑-垂体-肾上腺轴在睡眠障碍中表现为过度活跃'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '炎症因子释放增加'})
SET 
    n.description = coalesce(n.description, '失眠患者体内炎症因子的释放量增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

// 关系更新
MATCH (from) WHERE from.name = '睡眠期觉醒增多'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '日间小睡潜伏期延长'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '24h代谢率增加'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '清醒期更多β波活动'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '睡眠期的频繁α波和β波'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '自主神经功能活性增加'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '下丘脑-垂体-肾上腺轴过度活跃'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '炎症因子释放增加'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:31:29
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:Treatment {name: '认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '针对行为和认知因素导致失眠症的多成分非药物治疗，包括睡眠卫生教育、睡眠限制治疗、刺激控制治疗、认知治疗、放松训练等五个部分'),
    n.dosage = coalesce(n.dosage, 'null'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, 'null');

MERGE (n:Treatment {name: '失眠数字疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过应用程序、微信、网络、电话等形式开展的治疗方法'),
    n.dosage = coalesce(n.dosage, 'null'),
    n.duration = coalesce(n.duration, 'null'),
    n.contraindication = coalesce(n.contraindication, 'null');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠数字疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠数字疗法'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:31:31
*/
// 节点更新


// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:31:36
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:Treatment {name: '催眠药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于缓解失眠的药物'),
    n.duration = coalesce(n.duration, '不超过4周');

MERGE (n:Treatment {name: 'BZRA'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '苯二氮草类受体激动剂'),
    n.duration = coalesce(n.duration, '不超过4周');

MERGE (n:Treatment {name: 'DORA'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '双重食欲素受体拮抗剂'),
    n.duration = coalesce(n.duration, '不超过4周');

MERGE (n:Complication {name: '失眠改善后'})
SET 
    n.description = coalesce(n.description, '伴随药物逐渐减量或停药'),
    n.severity = coalesce(n.severity, '轻');

MERGE (n:Complication {name: '失眠反跳'})
SET 
    n.description = coalesce(n.description, '突然停药可能导致此症'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Complication {name: '癫痫发作'})
SET 
    n.description = coalesce(n.description, '可能由突然停药引起'),
    n.severity = coalesce(n.severity, '重');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '催眠药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '催眠药物'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = 'BZRA'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = 'DORA'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠改善后'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠反跳'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '癫痫发作'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:31:37
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '难以入眠、维持睡眠或过早醒来'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '经常');

MERGE (n:Treatment {name: '分级诊疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过不同级别医疗机构提供的治疗服务'),
    n.duration = coalesce(n.duration, '持续');

MERGE (n:Complication {name: '药物依赖性失眠'})
SET 
    n.description = coalesce(n.description, '因药物滥用导致的失眠症状'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '分级诊疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '药物依赖性失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:31:38
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，影响睡眠质量和数量');

MERGE (n:Treatment {name: '良好生活习惯'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括科学膳食、充足日照、合理运动和心理调适等'),
    n.duration = coalesce(n.duration, '长期');

MERGE (n:Treatment {name: '心理治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过心理干预改善睡眠'),
    n.duration = coalesce(n.duration, '短期');

MERGE (n:Treatment {name: '物理治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用物理手段改善睡眠质量'),
    n.duration = coalesce(n.duration, '短期');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物来帮助睡眠'),
    n.duration = coalesce(n.duration, '短期');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难、睡眠维持困难或早醒'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:RiskFactor {name: '咖啡因摄入'})
SET 
    n.description = coalesce(n.description, '过量摄入咖啡、茶等刺激性食物'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '良好生活习惯'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '基础治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '心理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '优选治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '物理治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '优选治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '低效治疗');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '咖啡因摄入'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '明确');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:31:39
*/
// 节点更新


// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:31:40
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠症'})
SET 
    n.code = coalesce(n.code, '7A00');

MERGE (n:Disease {name: '短期失眠症'})
SET 
    n.code = coalesce(n.code, '7A01');

MERGE (n:Disease {name: '其他失眠症'})
SET 
    n.code = coalesce(n.code, '7A0Z');

MERGE (n:Symptom {name: '睡眠困难'});

MERGE (n:Symptom {name: '睡眠维持困难'});

MERGE (n:Symptom {name: '早醒'});

MERGE (n:Symptom {name: '拒绝上床睡觉'});

MERGE (n:Symptom {name: '难以入睡'});

MERGE (n:Symptom {name: '疲劳或萎靡不振'});

MERGE (n:Symptom {name: '注意力下降'});

MERGE (n:Symptom {name: '日间困倦'});

MERGE (n:Symptom {name: '情绪不稳'});

MERGE (n:Symptom {name: '行为问题'});

MERGE (n:Symptom {name: '对睡眠质量的强烈关切'});

// 关系更新
MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '拒绝上床睡觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '难以入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '疲劳或萎靡不振'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '注意力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '日间困倦'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '情绪不稳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '行为问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '慢性失眠症'
MATCH (to) WHERE to.name = '对睡眠质量的强烈关切'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '短期失眠症'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '短期失眠症'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '短期失眠症'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '短期失眠症'
MATCH (to) WHERE to.name = '拒绝上床睡觉'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '短期失眠症'
MATCH (to) WHERE to.name = '难以入睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '其他失眠症'
MATCH (to) WHERE to.name = '睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '其他失眠症'
MATCH (to) WHERE to.name = '睡眠维持困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '不定期'),
    r.severity = coalesce(r.severity, '低');



// =====================================

/* Response #19
   Timestamp: 2024-12-12 01:31:41
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:Symptom {name: '症状缓解'})
SET 
    n.description = coalesce(n.description, '失眠症患者经上级医疗机构规范治疗后的症状改善'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '偶发');

MERGE (n:Treatment {name: '认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, 'CBTI可以提高基层失眠症的临床疗效，减少复发率、降低发病率');

MERGE (n:Disease {name: '躯体疾病'});

MERGE (n:Disease {name: '精神障碍'});

MERGE (n:Disease {name: '其他睡眠障碍'});

MERGE (n:Examination {name: 'PSG检查'})
SET 
    n.description = coalesce(n.description, '通过多导睡眠监测法进行疾病诊断'),
    n.method = coalesce(n.method, '多导睡眠监测'),
    n.requirement = coalesce(n.requirement, '患者需在睡眠实验室进行');

MERGE (n:Examination {name: '核磁共振'})
SET 
    n.description = coalesce(n.description, '用于明确睡眠相关疾病的检查'),
    n.method = coalesce(n.method, '核磁共振成像'),
    n.requirement = coalesce(n.requirement, '无特殊要求');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '症状缓解'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '经常'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '躯体疾病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '精神障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '其他睡眠障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '持续'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = 'PSG检查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '核磁共振'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #20
   Timestamp: 2024-12-12 01:31:41
*/
// 节点更新


// =====================================

/* Response #21
   Timestamp: 2024-12-12 01:31:46
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '影响睡眠的疾病'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '睡眠问题'})
SET 
    n.description = coalesce(n.description, '包括难以入睡、易醒等症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '日间功能损害'})
SET 
    n.description = coalesce(n.description, '影响到日常工作的功能'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑情绪'})
SET 
    n.description = coalesce(n.description, '伴随着焦虑的情绪表现'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Symptom {name: '抑郁情绪'})
SET 
    n.description = coalesce(n.description, '伴随着抑郁的情绪表现'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '间歇性');

MERGE (n:Treatment {name: '失眠症认知行为疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '旨在改善睡眠质量的心理治疗方法'),
    n.duration = coalesce(n.duration, '2-6周');

MERGE (n:Treatment {name: '失眠症药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '通过药物缓解失眠症状'),
    n.dosage = coalesce(n.dosage, '视医生处方而定'),
    n.duration = coalesce(n.duration, '短期用药');

MERGE (n:Complication {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '与失眠症相关的常见并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Complication {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '与失眠症相关的常见并发症'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Scale {name: '失眠严重程度指数'})
SET 
    n.description = coalesce(n.description, '评估失眠严重程度的量表'),
    n.score_range = coalesce(n.score_range, '0-28'),
    n.interpretation = coalesce(n.interpretation, '分数越高，失眠越严重');

MERGE (n:Scale {name: '匹兹堡睡眠质量指数'})
SET 
    n.description = coalesce(n.description, '评估睡眠质量的量表'),
    n.score_range = coalesce(n.score_range, '0-21'),
    n.interpretation = coalesce(n.interpretation, '分数越高，睡眠质量越差');

MERGE (n:Scale {name: 'Epworth嗜睡量表'})
SET 
    n.description = coalesce(n.description, '评估日间嗜睡程度的量表'),
    n.score_range = coalesce(n.score_range, '0-24'),
    n.interpretation = coalesce(n.interpretation, '分数越高，嗜睡程度越严重');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '睡眠问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '日间功能损害'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '焦虑情绪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '抑郁情绪'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠症认知行为疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠症药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '需要时');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '失眠严重程度指数'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.95),
    r.recommendation_level = coalesce(r.recommendation_level, '高');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '匹兹堡睡眠质量指数'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '高');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = 'Epworth嗜睡量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, '中');



// =====================================

/* Response #22
   Timestamp: 2024-12-12 01:31:51
*/
// 节点更新
MERGE (n:Disease {name: '失眠'});

MERGE (n:Treatment {name: '光照疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '光照疗法可改善失眠患者的日间思睡，减少睡眠片段化，适用人群广泛。推荐晨间光照，单位 2500~10000 lux，每天光照时间 30~45 min。');

MERGE (n:Treatment {name: '重复经颅磁刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '低频 rTMS (≤1 Hz) 通过降低失眠患者的皮质异常兴奋性、诱导慢波睡眠、增加睡眠深度，同时影响松果体褪黑素的合成和分泌，以维持正常睡眠觉醒周期和改善睡眠质量。');

MERGE (n:Treatment {name: '经颅电刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, 'TES通过向头皮施加低强度电流来调节大脑活动，包括经颅交流电刺激(tACS)和经颅直流电刺激(tDCS)。');

MERGE (n:Treatment {name: '生物反馈疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '生物反馈旨在减少条件唤醒，尤其是躯体、认知或皮质的过度唤醒，可以减少失眠者的入睡时间和觉醒次数。');

MERGE (n:Treatment {name: '迷走神经刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '迷走神经刺激尚缺乏高质量的临床证据支持，暂不推荐。');

MERGE (n:Treatment {name: '虚拟现实'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '虚拟现实(VR)治疗尚缺乏高质量的临床证据支持，暂不推荐。');

MERGE (n:Treatment {name: '听觉刺激'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '听觉刺激尚缺乏高质量的临床证据支持，暂不推荐。');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '光照疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '重复经颅磁刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '经颅电刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初始');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '生物反馈疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '迷走神经刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '不推荐');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '虚拟现实'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '不推荐');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '听觉刺激'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '不推荐');



// =====================================

/* Response #23
   Timestamp: 2024-12-12 01:32:00
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍，表现为入睡困难、睡眠质量差或早醒等症状');

MERGE (n:Treatment {name: '柴胡疏肝散'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于疏肝解郁');

MERGE (n:Treatment {name: '逍遥散'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于疏肝解郁');

MERGE (n:Treatment {name: '舒肝解郁胶囊'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于舒肝解郁');

MERGE (n:Treatment {name: '舒眠胶囊'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于帮助睡眠');

MERGE (n:Treatment {name: '龙胆泻肝汤'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于疏肝解郁、清热化火');

MERGE (n:Treatment {name: '保和丸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于和胃降逆');

MERGE (n:Treatment {name: '半夏林米汤'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于导滞');

MERGE (n:Treatment {name: '黄连温胆汤'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于化痰清热');

MERGE (n:Treatment {name: '血府逐瘀汤'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于活血化瘀');

MERGE (n:Treatment {name: '导赤汤'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于清心泻火');

MERGE (n:Treatment {name: '交泰丸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于养血安神');

MERGE (n:Treatment {name: '朱砂安神丸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于养心安神');

MERGE (n:Treatment {name: '归脾汤'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于益气健脾');

MERGE (n:Treatment {name: '枣仁安神胶囊'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于养心安神');

MERGE (n:Treatment {name: '安神定志丸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于镇静安神');

MERGE (n:Treatment {name: '酸枣仁汤'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于养心安神');

MERGE (n:Treatment {name: '六味地黄丸'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于滋阴降火');

MERGE (n:Treatment {name: '天王补心丹'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于滋阴降火');

MERGE (n:Treatment {name: '乌灵胶囊'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于养心安神');

MERGE (n:Treatment {name: '百乐眠胶囊'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于助眠');

// 关系更新
MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '柴胡疏肝散'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '逍遥散'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '舒肝解郁胶囊'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '舒眠胶囊'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '龙胆泻肝汤'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '保和丸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '半夏林米汤'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '黄连温胆汤'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '血府逐瘀汤'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '导赤汤'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '交泰丸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '朱砂安神丸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '归脾汤'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '中期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '枣仁安神胶囊'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '安神定志丸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '酸枣仁汤'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '六味地黄丸'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '天王补心丹'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '乌灵胶囊'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '百乐眠胶囊'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '后期');



// =====================================

/* Response #24
   Timestamp: 2024-12-12 01:32:19
*/
// 节点更新
MERGE (n:Disease {name: '失眠症'});

MERGE (n:Disease {name: '抑郁障碍'});

MERGE (n:Disease {name: '双相情感障碍'});

MERGE (n:Disease {name: '焦虑障碍'});

MERGE (n:Disease {name: '内分泌系统疾病'});

MERGE (n:Disease {name: '神经系统疾病'});

MERGE (n:Disease {name: '心血管系统疾病'});

MERGE (n:Disease {name: '呼吸系统疾病'});

MERGE (n:Disease {name: '消化系统疾病'});

MERGE (n:Disease {name: '睡眠呼吸障碍'});

MERGE (n:Disease {name: '不宁腿综合征'});

MERGE (n:Disease {name: '发作性睡病'});

MERGE (n:Disease {name: '异态睡眠'});

MERGE (n:Disease {name: '环境性睡眠障碍'});

MERGE (n:Disease {name: '睡眠不足综合征'});

MERGE (n:Disease {name: '抗抑郁药物'});

MERGE (n:Disease {name: '中枢兴奋性药物'});

MERGE (n:Disease {name: '心血管药物'});

MERGE (n:Disease {name: '麻醉性镇痛药'});

MERGE (n:Disease {name: '平喘药'});

MERGE (n:Disease {name: '酒精'});

MERGE (n:Disease {name: '烟草'});

MERGE (n:Symptom {name: '共病性失眠症'});

MERGE (n:Symptom {name: '单纯性失眠症'});

MERGE (n:Symptom {name: '未达诊断标准的失眠症状'});

// 关系更新
MATCH (from) WHERE from.name = '共病性失眠症'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '单纯性失眠症'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '未达诊断标准的失眠症状'
MATCH (to) WHERE to.name = '失眠症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶见'),
    r.severity = coalesce(r.severity, '低');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '抑郁障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '双相情感障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '焦虑障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '内分泌系统疾病'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '神经系统疾病'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '心血管系统疾病'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '呼吸系统疾病'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '消化系统疾病'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '睡眠呼吸障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '发作性睡病'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '异态睡眠'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '环境性睡眠障碍'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '睡眠不足综合征'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '抗抑郁药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '中枢兴奋性药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '心血管药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '麻醉性镇痛药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.65),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '晚期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '平喘药'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '晚期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '酒精'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '晚期');

MATCH (from) WHERE from.name = '失眠症'
MATCH (to) WHERE to.name = '烟草'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.55),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '晚期');



// =====================================

