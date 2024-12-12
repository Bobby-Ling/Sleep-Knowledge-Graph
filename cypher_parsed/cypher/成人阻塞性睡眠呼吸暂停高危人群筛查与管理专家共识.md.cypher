// File: 成人阻塞性睡眠呼吸暂停高危人群筛查与管理专家共识.md
// Processed at: 2024-12-12 01:28:33
// Total pairs: 17

/* Response #1
   Timestamp: 2024-12-12 01:26:42
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸疾病'),
    n.category = coalesce(n.category, '睡眠呼吸障碍'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Disease {name: '高血压'})
SET 
    n.description = coalesce(n.description, '一种常见的心血管疾病');

MERGE (n:Disease {name: '冠心病'})
SET 
    n.description = coalesce(n.description, '一种由于冠状动脉狭窄导致的心脏病');

MERGE (n:Disease {name: '卒中'})
SET 
    n.description = coalesce(n.description, '脑血管意外事件');

MERGE (n:Disease {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '一种以高血糖为特征的代谢性疾病');

MERGE (n:RiskFactor {name: '男性'})
SET 
    n.description = coalesce(n.description, '性别因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '年龄增加'})
SET 
    n.description = coalesce(n.description, '年龄因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '上气道及颌面结构异常'})
SET 
    n.description = coalesce(n.description, '结构异常'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '体重过重'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '不良生活方式'})
SET 
    n.description = coalesce(n.description, '生活习惯不良'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '遗传因素'})
SET 
    n.description = coalesce(n.description, '家族遗传'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '使用镇静安眠药物'})
SET 
    n.description = coalesce(n.description, '药物影响'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:Examination {name: 'OSA筛查'})
SET 
    n.description = coalesce(n.description, '使用医用级睡眠监测设备进行诊断'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '医疗机构');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '男性'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '年龄增加'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '上气道及颌面结构异常'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '不良生活方式'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '遗传因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '使用镇静安眠药物'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA筛查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:26:54
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:26:54
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸疾病，以呼吸暂停低通气指数为诊断标准'),
    n.category = coalesce(n.category, '睡眠呼吸疾病'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Disease {name: '高危人群'})
SET 
    n.description = coalesce(n.description, '可能患有阻塞性睡眠呼吸暂停的群体'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高危人群'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:27:04
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: 'STOP-Bang问卷'})
SET 
    n.type = coalesce(n.type, '问卷'),
    n.description = coalesce(n.description, '简单、可操作性强的人群筛查工具');

MERGE (n:Examination {name: 'III~IV型睡眠监测工具'})
SET 
    n.description = coalesce(n.description, '用于OSA高危人群筛查的睡眠监测工具'),
    n.method = coalesce(n.method, '睡眠监测'),
    n.requirement = coalesce(n.requirement, '适用于医疗机构');

MERGE (n:Complication {name: '医疗支出增加'})
SET 
    n.description = coalesce(n.description, '由于OSA的流行导致的医疗支出上升'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'III~IV型睡眠监测工具'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'STOP-Bang问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '优先级高');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '医疗支出增加'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:27:30
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Disease {name: '高血压'});

MERGE (n:Disease {name: '糖尿病'});

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '过度的日间嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '疲劳'})
SET 
    n.description = coalesce(n.description, '身体疲惫无力'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '疲劳'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:27:30
*/
// 节点更新


// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:27:31
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Scale {name: 'OSA筛查量表'})
SET 
    n.description = coalesce(n.description, '用于筛查阻塞性睡眠呼吸暂停的量表'),
    n.score_range = coalesce(n.score_range, '0-20'),
    n.interpretation = coalesce(n.interpretation, '根据分数判断OSA风险');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA筛查量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '高');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:27:31
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '阻塞性睡眠呼吸暂停疾病，AHI ≥ 5 次/h 诊断'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'HT'),
    n.description = coalesce(n.description, '一种常见的心血管疾病，表现为血压过高'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '冠心病'})
SET 
    n.code = coalesce(n.code, 'CAD'),
    n.description = coalesce(n.description, '冠状动脉的血流不足导致的病症'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '心力衰竭'})
SET 
    n.code = coalesce(n.code, 'HF'),
    n.description = coalesce(n.description, '心脏无法有效泵血的情况'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '重');

MERGE (n:Disease {name: '心房颤动'})
SET 
    n.code = coalesce(n.code, 'AF'),
    n.description = coalesce(n.description, '一种心律失常，心房的不规则收缩'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '2型糖尿病'})
SET 
    n.code = coalesce(n.code, 'T2DM'),
    n.description = coalesce(n.description, '代谢性疾病，胰岛素抵抗或分泌不足导致高血糖'),
    n.category = coalesce(n.category, '代谢疾病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.code = coalesce(n.code, 'OB'),
    n.description = coalesce(n.description, '体重过重，通常以BMI来衡量'),
    n.category = coalesce(n.category, '代谢疾病'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '高血压'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '冠心病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '心力衰竭'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '重');

MATCH (from) WHERE from.name = '心房颤动'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '2型糖尿病'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '肥胖'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心力衰竭'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心房颤动'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '短期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.8),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:27:32
*/
// 节点更新


// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:27:46
*/
// 节点更新
MERGE (n:Scale {name: '柏林问卷'})
SET 
    n.description = coalesce(n.description, '包含夜间打鼾和呼吸暂停、日间过度嗜睡等多个维度的风险评估问卷'),
    n.score_range = coalesce(n.score_range, '2个以上类别为阳性'),
    n.interpretation = coalesce(n.interpretation, 'OSA高风险');

MERGE (n:Scale {name: 'STOP-Bang问卷'})
SET 
    n.description = coalesce(n.description, '有效筛查中重度OSA的工具，包括多个风险因素'),
    n.score_range = coalesce(n.score_range, '评分 >= 3 分'),
    n.interpretation = coalesce(n.interpretation, '提示OSA高危');

MERGE (n:Scale {name: 'Epworth嗜睡量表'})
SET 
    n.description = coalesce(n.description, '量化成人日间嗜睡程度的问卷'),
    n.score_range = coalesce(n.score_range, '得分 >= 9分'),
    n.interpretation = coalesce(n.interpretation, '提示日间嗜睡');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停症'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

// 关系更新
MATCH (from) WHERE from.name = '柏林问卷'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停症'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '常用');

MATCH (from) WHERE from.name = 'STOP-Bang问卷'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停症'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 1.0),
    r.recommendation_level = coalesce(r.recommendation_level, '推荐');

MATCH (from) WHERE from.name = 'Epworth嗜睡量表'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停症'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.5),
    r.recommendation_level = coalesce(r.recommendation_level, '不推荐单独使用');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:27:56
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Examination {name: '多导睡眠监测'})
SET 
    n.description = coalesce(n.description, '诊断OSA的金标准'),
    n.method = coalesce(n.method, 'PSG'),
    n.requirement = coalesce(n.requirement, '适用于高风险人群筛查的确诊工具');

MERGE (n:Examination {name: '家庭睡眠呼吸暂停监测'})
SET 
    n.description = coalesce(n.description, '适用于中重度OSA的诊断'),
    n.method = coalesce(n.method, 'HSAT'),
    n.requirement = coalesce(n.requirement, '不推荐无症状人群大规模使用HSAT');

MERGE (n:Examination {name: 'IV型睡眠监测'})
SET 
    n.description = coalesce(n.description, '简单、客观的OSA筛查工具'),
    n.method = coalesce(n.method, '单/双信号通道记录'),
    n.requirement = coalesce(n.requirement, '可应用于医院内高危人群的筛查');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '多导睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '家庭睡眠呼吸暂停监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '中'),
    r.mandatory = coalesce(r.mandatory, 'false');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'IV型睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '低'),
    r.mandatory = coalesce(r.mandatory, 'false');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:28:05
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: 'OSA高危人群'})
SET 
    n.description = coalesce(n.description, '有可能发展为阻塞性睡眠呼吸暂停的患者群体');

MERGE (n:Complication {name: '心肺疾病'})
SET 
    n.description = coalesce(n.description, '影响心脏和肺功能的疾病');

MERGE (n:Complication {name: '神经肌肉疾病'})
SET 
    n.description = coalesce(n.description, '影响肌肉控制的疾病');

MERGE (n:Complication {name: '慢性阿片类药物使用'})
SET 
    n.description = coalesce(n.description, '长期使用阿片类药物的情况');

MERGE (n:Complication {name: '卒中'})
SET 
    n.description = coalesce(n.description, '脑血管事故');

MERGE (n:Complication {name: '失眠'})
SET 
    n.description = coalesce(n.description, '无法入睡或维持睡眠的状态');

MERGE (n:Complication {name: '其他睡眠障碍'})
SET 
    n.description = coalesce(n.description, '与睡眠有关的其他疾病');

MERGE (n:Examination {name: 'STOP-Bang问卷'})
SET 
    n.description = coalesce(n.description, '评估阻塞性睡眠呼吸暂停风险的问卷'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '需由专业人员指导');

MERGE (n:Examination {name: 'IV型睡眠监测'})
SET 
    n.description = coalesce(n.description, '一种用于监测睡眠呼吸暂停的设备'),
    n.method = coalesce(n.method, '监测设备'),
    n.requirement = coalesce(n.requirement, '在医疗机构进行');

MERGE (n:Treatment {name: 'HSAT'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '家用睡眠监测设备'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '不适合所有患者');

MERGE (n:Treatment {name: 'PSG'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '多导睡眠监测'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '短期'),
    n.contraindication = coalesce(n.contraindication, '不适合所有患者');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'OSA高危人群'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心肺疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '神经肌肉疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '慢性阿片类药物使用'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '卒中'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.3),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '其他睡眠障碍'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.4),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'STOP-Bang问卷'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'IV型睡眠监测'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'HSAT'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始诊断');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PSG'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '确诊');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:28:15
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Symptom {name: 'OSA症状'})
SET 
    n.description = coalesce(n.description, '与OSA相关的临床症状'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Treatment {name: '睡眠监测'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '用于OSA的诊断和评估'),
    n.duration = coalesce(n.duration, '持续时间依患者情况而定');

MERGE (n:Complication {name: '心脑血管疾病'})
SET 
    n.description = coalesce(n.description, 'OSA可能引发的心脑血管问题'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '代谢性疾病'})
SET 
    n.description = coalesce(n.description, 'OSA可能引发的代谢问题'),
    n.severity = coalesce(n.severity, '中度');

// 关系更新
MATCH (from) WHERE from.name = 'OSA症状'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 92.2),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '睡眠监测'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 87.9),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初步诊断');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '心脑血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 81.1),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '代谢性疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 60.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:28:15
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:RiskFactor {name: '超重/肥胖'})
SET 
    n.description = coalesce(n.description, 'OSA 常见且可逆的风险因素'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '酗酒'})
SET 
    n.description = coalesce(n.description, '危险因素控制'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '吸烟'})
SET 
    n.description = coalesce(n.description, '危险因素控制'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:Complication {name: '失眠'})
SET 
    n.description = coalesce(n.description, '共病失眠的 OSA 患者'),
    n.severity = coalesce(n.severity, '中');

MERGE (n:Treatment {name: '失眠认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '包括刺激控制、睡眠限制、放松训练、认知疗法、睡眠卫生教育'),
    n.duration = coalesce(n.duration, '视情况而定');

MERGE (n:Treatment {name: '失眠简明行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '选取 CBTI 最核心的行为干预'),
    n.duration = coalesce(n.duration, '缩短治疗时长');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '超重/肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '酗酒'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '吸烟'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '失眠简明行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '治疗');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:28:16
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: 'PAP'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, 'OSA的一线治疗手段，使用时间越长，患者获益越大');

MERGE (n:Treatment {name: '口腔矫治器'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对于不能耐受PAP的轻中度OSA患者，可选择口腔矫治器治疗');

MERGE (n:Treatment {name: '体位治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '佩戴绑在背部的网球、背包或泡沫装置等，以减少仰卧位的睡眠时间，可减轻部分患者OSA严重程度');

MERGE (n:Treatment {name: '外科手术'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '适合扁桃体肥大等或需要下颌前移的明显下颌后缩患者'),
    n.contraindication = coalesce(n.contraindication, 'BMI≥35 kg/m²病态肥胖患者需转诊进行外科减重手术评估');

MERGE (n:Treatment {name: '药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '目前尚缺乏对治疗OSA具有明确疗效的药物');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = 'PAP'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '一线');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治器'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '二线');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '体位治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.5),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '辅助');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '外科手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.4),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '外科');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.1),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '药物');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:28:31
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.code = coalesce(n.code, 'OSA'),
    n.description = coalesce(n.description, '阻塞性睡眠呼吸暂停是一种常见的睡眠障碍， characterized by repeated episodes of complete or partial obstruction of the airway during sleep.'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '白天嗜睡是OSA的常见症状，可能导致工作效率低下.'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间窒息'})
SET 
    n.description = coalesce(n.description, 'OSA患者可能在夜间经历窒息感或呼吸暂停.'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '持续气道正压通气'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用CPAP设备持续提供气道正压以保持气道开放.'),
    n.dosage = coalesce(n.dosage, 'N/A'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '对设备的不耐受');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, 'OSA可导致高血压等多种并发症，进一步影响心血管健康.'),
    n.severity = coalesce(n.severity, '重度');

MERGE (n:Complication {name: '早产'})
SET 
    n.description = coalesce(n.description, '妊娠期的OSA可增加早产的风险.'),
    n.severity = coalesce(n.severity, '重度');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '夜间窒息'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '持续气道正压通气'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '早产'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:28:33
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.short_name = coalesce(n.short_name, 'OSA');

MERGE (n:Treatment {name: '正压通气(PAP)'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '对明确诊断并接受PAP治疗的OSA患者进行的治疗');

MERGE (n:Treatment {name: '口腔矫治器'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '非PAP治疗的OSA患者的选择之一');

MERGE (n:Treatment {name: '外科手术'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '非PAP治疗的OSA患者的选择之一');

MERGE (n:Symptom {name: '症状改善'})
SET 
    n.description = coalesce(n.description, 'OSA患者PAP治疗后症状的改善情况'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '检测');

MERGE (n:Symptom {name: '合并症'})
SET 
    n.description = coalesce(n.description, 'OSA患者可能出现的并发症'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '检测');

MERGE (n:RiskFactor {name: '生活方式'})
SET 
    n.description = coalesce(n.description, '影响OSA患者的生活方式因素'),
    n.impact_level = coalesce(n.impact_level, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '生活方式'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '症状改善'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '定期'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '正压通气(PAP)'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.95),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '口腔矫治器'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后续治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '外科手术'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '后续治疗');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停'
MATCH (to) WHERE to.name = '合并症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

