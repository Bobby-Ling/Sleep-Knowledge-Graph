// File: 中国6岁以下儿童就寝问题和夜醒治疗指南（2023）.md
// Processed at: 2024-12-12 01:31:13
// Total pairs: 10

/* Response #1
   Timestamp: 2024-12-12 01:30:42
*/
// 节点更新
MERGE (n:Disease {name: '失眠障碍'})
SET 
    n.description = coalesce(n.description, '就寝问题和夜醒是6岁以下儿童失眠的主要表现，可能影响儿童生长发育和家长身心健康。');

MERGE (n:Symptom {name: '就寝问题'})
SET 
    n.description = coalesce(n.description, '6岁以下儿童常见的就诊主诉，表现为入睡困难。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周出现≥3次');

MERGE (n:Symptom {name: '夜醒'})
SET 
    n.description = coalesce(n.description, '儿童在夜间频繁醒来，可能影响良好的睡眠质量。'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周出现≥3次');

// 关系更新
MATCH (from) WHERE from.name = '失眠障碍'
MATCH (to) WHERE to.name = '就寝问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '失眠障碍'
MATCH (to) WHERE to.name = '夜醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:30:45
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:30:47
*/
// 节点更新
MERGE (n:Disease {name: '儿童就寝问题'});

MERGE (n:Disease {name: '夜醒'});

MERGE (n:Treatment {name: '行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过特定技术改善儿童的就寝问题和夜醒');

MERGE (n:Treatment {name: '早期睡眠卫生习惯指导'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '指导儿童形成良好的睡眠习惯');

MERGE (n:Symptom {name: '睡眠潜伏期延长'})
SET 
    n.description = coalesce(n.description, '入睡时间过长'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '高');

MERGE (n:Symptom {name: '夜醒次数增多'})
SET 
    n.description = coalesce(n.description, '夜间醒来的次数偏多'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '高');

// 关系更新
MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '早期睡眠卫生习惯指导'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '干预');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '睡眠潜伏期延长'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '夜醒次数增多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:30:51
*/
// 节点更新
MERGE (n:Treatment {name: '水合氯醛'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种镇静催眠药物'),
    n.dosage = coalesce(n.dosage, '未确定'),
    n.duration = coalesce(n.duration, '未确定'),
    n.contraindication = coalesce(n.contraindication, '尚无研究验证其对儿童就寝问题和夜醒的治疗证据');

MERGE (n:Disease {name: '儿童就寝问题'})
SET 
    n.description = coalesce(n.description, '儿童在就寝时遇到的问题'),
    n.category = coalesce(n.category, '睡眠问题'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '夜醒'})
SET 
    n.description = coalesce(n.description, '夜间醒来后难以再次入睡'),
    n.category = coalesce(n.category, '睡眠问题'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '水合氯醛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '水合氯醛'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.0),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:30:55
*/
// 节点更新
MERGE (n:Symptom {name: '夜醒'})
SET 
    n.description = coalesce(n.description, '夜间醒来的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '入睡潜伏期'})
SET 
    n.description = coalesce(n.description, '从开始准备入睡到完全入睡的时间'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '时常');

MERGE (n:Disease {name: '儿童就寝问题'})
SET 
    n.description = coalesce(n.description, '与儿童入睡相关的问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '儿童夜醒问题'})
SET 
    n.description = coalesce(n.description, '儿童夜间醒来的问题'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '使用白噪声'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用白噪声缩短儿童入睡潜伏期，减少夜醒'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '不适用于无就寝问题儿童');

MERGE (n:Treatment {name: '分床睡'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '建议分床睡以降低儿童就寝问题和夜醒发生'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '儿童就寝问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '儿童夜醒问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '入睡潜伏期'
MATCH (to) WHERE to.name = '儿童就寝问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '时常'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '使用白噪声'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '儿童夜醒问题'
MATCH (to) WHERE to.name = '分床睡'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '一线治疗');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '儿童夜醒问题'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '儿童夜醒问题'
MATCH (to) WHERE to.name = '儿童就寝问题'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:30:57
*/
// 节点更新
MERGE (n:Disease {name: '儿童就寝问题'});

MERGE (n:Disease {name: '儿童夜醒'});

MERGE (n:Symptom {name: '睡困难'})
SET 
    n.description = coalesce(n.description, '儿童在入睡过程中遇到的困难'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '夜醒次数增多'})
SET 
    n.description = coalesce(n.description, '夜间醒来的频率增加'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '辅食添加'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过添加辅食来改善婴幼儿的睡眠问题');

MERGE (n:Treatment {name: '铁剂补充'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '补充铁剂以改善儿童因铁缺乏导致的睡眠问题');

// 关系更新
MATCH (from) WHERE from.name = '睡困难'
MATCH (to) WHERE to.name = '儿童就寝问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜醒次数增多'
MATCH (to) WHERE to.name = '儿童夜醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '辅食添加'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '儿童夜醒'
MATCH (to) WHERE to.name = '铁剂补充'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:31:01
*/
// 节点更新


// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:31:01
*/
// 节点更新
MERGE (n:Disease {name: '婴儿睡眠潜伏期'});

MERGE (n:Disease {name: '夜醒'});

MERGE (n:Disease {name: '婴儿就寝抵抗'});

MERGE (n:Disease {name: '睡眠启动困难'});

MERGE (n:Disease {name: '儿童夜间睡眠问题'});

MERGE (n:Symptom {name: '睡前程序耗时过长'})
SET 
    n.description = coalesce(n.description, '在婴儿16和40周龄时的睡前程序耗时超过45分钟的现象'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '自我安抚入睡'})
SET 
    n.description = coalesce(n.description, '婴儿能够自我安抚入睡的现象'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜醒次数'})
SET 
    n.description = coalesce(n.description, '婴儿夜醒的频率'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '夜醒时间'})
SET 
    n.description = coalesce(n.description, '婴儿夜醒后的再次入睡时间'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Treatment {name: '睡眠卫生指导'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对婴儿睡眠进行的卫生指导'),
    n.duration = coalesce(n.duration, '持续至6月龄'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '孕晚期母亲睡眠宣教'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对孕晚期母亲进行的睡眠教育'),
    n.duration = coalesce(n.duration, '1小时'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Treatment {name: '睡眠培训'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对母亲进行的后续睡眠指导'),
    n.duration = coalesce(n.duration, '3周'),
    n.contraindication = coalesce(n.contraindication, '无');

MERGE (n:Complication {name: '睡眠问题'})
SET 
    n.description = coalesce(n.description, '婴儿面临的睡眠困难情况'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '睡前程序耗时过长'
MATCH (to) WHERE to.name = '婴儿睡眠潜伏期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '自我安抚入睡'
MATCH (to) WHERE to.name = '婴儿睡眠潜伏期'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '夜醒次数'
MATCH (to) WHERE to.name = '夜醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '夜醒时间'
MATCH (to) WHERE to.name = '夜醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '睡眠卫生指导'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '婴儿睡眠潜伏期'
MATCH (to) WHERE to.name = '孕晚期母亲睡眠宣教'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '婴儿睡眠潜伏期'
MATCH (to) WHERE to.name = '睡眠培训'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后期');

MATCH (from) WHERE from.name = '夜醒'
MATCH (to) WHERE to.name = '睡眠问题'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:31:02
*/
// 节点更新
MERGE (n:Disease {name: '儿童就寝问题'});

MERGE (n:Disease {name: '夜醒'});

MERGE (n:Treatment {name: '褪黑素'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种胺类激素，能够减少婴幼儿夜醒'),
    n.dosage = coalesce(n.dosage, '0.1 mg/kg (最大1 mg)'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '对儿童睡眠问题持久、严重时使用');

MERGE (n:Treatment {name: '苯海拉明'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种H1组胺受体阻滞剂，未显著缩短入睡潜伏期并未减少夜醒次数'),
    n.dosage = coalesce(n.dosage, '1 mg/kg'),
    n.duration = coalesce(n.duration, '7天'),
    n.contraindication = coalesce(n.contraindication, '不推荐用于睡眠问题');

MERGE (n:Treatment {name: '可乐定'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种α2受体激动剂，用于降血压，尚无研究证明其对儿童就寝问题的治疗作用'),
    n.dosage = coalesce(n.dosage, '根据需要'),
    n.duration = coalesce(n.duration, '根据需要'),
    n.contraindication = coalesce(n.contraindication, '尚无证据支持使用');

// 关系更新
MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '褪黑素'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '主要治疗');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '苯海拉明'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.3),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '可乐定'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.2),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '尚未验证');

MATCH (from) WHERE from.name = '儿童就寝问题'
MATCH (to) WHERE to.name = '夜醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:31:07
*/
// 节点更新
MERGE (n:Disease {name: '慢性失眠'})
SET 
    n.description = coalesce(n.description, '儿童慢性失眠的临床表现和病史'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '伴随腿部不适，导致夜间无法安睡的病症');

MERGE (n:Disease {name: '缺铁性贫血'})
SET 
    n.description = coalesce(n.description, '因缺铁导致的贫血状态');

MERGE (n:Disease {name: '生长痛'})
SET 
    n.description = coalesce(n.description, '儿童在生长阶段常见的疼痛问题');

MERGE (n:Disease {name: '维生素D缺乏'})
SET 
    n.description = coalesce(n.description, '体内维生素D水平低于正常值的状态');

MERGE (n:Disease {name: '维生素B12缺乏'})
SET 
    n.description = coalesce(n.description, '体内维生素B12水平低于正常值的状态');

MERGE (n:Symptom {name: '人睡困难'})
SET 
    n.description = coalesce(n.description, '无法快速入睡的状态');

MERGE (n:Symptom {name: '夜间肢体运动较多'})
SET 
    n.description = coalesce(n.description, '晚上睡眠时肢体频繁移动');

MERGE (n:Symptom {name: '就寝抵抗'})
SET 
    n.description = coalesce(n.description, '儿童对就寝的抵触情绪');

MERGE (n:Symptom {name: '白天嗜睡'})
SET 
    n.description = coalesce(n.description, '白天频繁感到困倦或嗜睡');

MERGE (n:Treatment {name: '硫酸亚铁'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '一种常用的补铁剂'),
    n.dosage = coalesce(n.dosage, '口服'),
    n.duration = coalesce(n.duration, '根据医生处方'),
    n.contraindication = coalesce(n.contraindication, '对铁剂过敏者禁用');

MERGE (n:Treatment {name: '维生素B12补充'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于改善维生素B12缺乏的补充剂'),
    n.dosage = coalesce(n.dosage, '2 μg/d'),
    n.duration = coalesce(n.duration, '根据医生处方'),
    n.contraindication = coalesce(n.contraindication, '对维生素B12过敏者禁用');

// 关系更新
MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '人睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '夜间肢体运动较多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '就寝抵抗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '白天嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.65),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '硫酸亚铁'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '维生素B12缺乏'
MATCH (to) WHERE to.name = '维生素B12补充'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初期');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '不宁腿综合征'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '慢性失眠'
MATCH (to) WHERE to.name = '缺铁性贫血'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '缺铁性贫血'
MATCH (to) WHERE to.name = '生长痛'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '维生素D缺乏'
MATCH (to) WHERE to.name = '慢性失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

