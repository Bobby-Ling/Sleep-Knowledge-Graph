// File: 《成年人阻塞性睡眠呼吸暂停低通气综合征筛查：美国预防临床服务指南工作组推荐声明》解读.md
// Processed at: 2024-12-12 01:29:29
// Total pairs: 13

/* Response #1
   Timestamp: 2024-12-12 01:29:07
*/
// 节点更新


// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:29:10
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:29:11
*/
// 节点更新


// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:29:14
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸疾病'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '呼吸暂停低通气指数'})
SET 
    n.description = coalesce(n.description, '在一小时内发生的呼吸暂停或低通气事件的次数'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '≥5次/h');

MERGE (n:Complication {name: '并发症'})
SET 
    n.description = coalesce(n.description, '可能由于OSAHS未被及时发现和诊治而导致的其他健康问题'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸暂停低通气指数'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '并发症'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:29:15
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS');

MERGE (n:Examination {name: '阻塞性睡眠呼吸暂停低通气综合征筛查'})
SET 
    n.description = coalesce(n.description, '用于筛查阻塞性睡眠呼吸暂停低通气综合征的检查'),
    n.method = coalesce(n.method, '临床评估'),
    n.requirement = coalesce(n.requirement, '根据临床经验判断必要性');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征筛查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');



// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:29:16
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见的睡眠呼吸障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '高血压'});

MERGE (n:Disease {name: '糖尿病'});

MERGE (n:Disease {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, '与高血压、糖尿病相关的健康问题');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.7),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:29:20
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.description = coalesce(n.description, 'OSAHS 是一种睡眠障碍，其特征是呼吸气流减少或停止，咽喉气道狭窄和阻塞'),
    n.severity = coalesce(n.severity, '轻度/中度/重度');

MERGE (n:Symptom {name: '日间嗜睡过多'})
SET 
    n.description = coalesce(n.description, '常见临床体征'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '休息不够'})
SET 
    n.description = coalesce(n.description, '尽管睡眠时间足够，仍然觉得休息不够'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '大声或不规则的打鼾'),
    n.severity = coalesce(n.severity, '轻度'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Symptom {name: '窒息或呼吸困难'})
SET 
    n.description = coalesce(n.description, '睡觉时窒息或呼吸困难'),
    n.severity = coalesce(n.severity, '重度'),
    n.frequency = coalesce(n.frequency, '偶发');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡过多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高频'),
    r.severity = coalesce(r.severity, '重度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '休息不够'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高频'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '高频'),
    r.severity = coalesce(r.severity, '轻度');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '窒息或呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '高频'),
    r.severity = coalesce(r.severity, '重度');



// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:29:23
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种影响睡眠的疾病，导致呼吸暂停和低通气'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Symptom {name: '打鼾'})
SET 
    n.description = coalesce(n.description, '在睡眠中发出响亮的呼吸声'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '呼吸暂停'})
SET 
    n.description = coalesce(n.description, '在睡眠中出现短暂的呼吸停止'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '不定期');

MERGE (n:Symptom {name: '日间嗜睡'})
SET 
    n.description = coalesce(n.description, '白天过度困倦，影响正常活动'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '认知功能障碍'})
SET 
    n.description = coalesce(n.description, '注意力和记忆力差的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: '情绪变化'})
SET 
    n.description = coalesce(n.description, '睡眠不足引起的情绪波动'),
    n.severity = coalesce(n.severity, '轻'),
    n.frequency = coalesce(n.frequency, '中等');

MERGE (n:Symptom {name: '呼吸困难'})
SET 
    n.description = coalesce(n.description, '在睡眠中感到呼吸受阻'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '窒息'})
SET 
    n.description = coalesce(n.description, '睡眠中感到窒息'),
    n.severity = coalesce(n.severity, '高'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '打鼾'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸暂停'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.95),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '日间嗜睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '认知功能障碍'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '情绪变化'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '低'),
    r.severity = coalesce(r.severity, '轻');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '呼吸困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '窒息'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '严重');



// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:29:24
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种睡眠相关呼吸障碍，特征为睡眠时反复发生上呼吸道的部分或完全阻塞'),
    n.category = coalesce(n.category, '睡眠病'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:RiskFactor {name: '年龄因素'})
SET 
    n.description = coalesce(n.description, '40岁及以上的成年人更容易受到OSAHS的影响，原因是上呼吸道肌肉和组织随年龄增长而松弛，导致呼吸道阻塞更为常见'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '肥胖和超重'})
SET 
    n.description = coalesce(n.description, 'BMI≥30 kg/m²的成年人面临更高的OSAHS风险，过多的脂肪沉积在颈部和喉部可能导致上呼吸道狭窄，增加呼吸道阻塞的可能性'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '高血压'})
SET 
    n.description = coalesce(n.description, '高血压与OSAHS存在双向关联，高血压患者更容易患上OSAHS，OSAHS也会加重高血压'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '2型糖尿病'})
SET 
    n.description = coalesce(n.description, '糖尿病患者更容易患上OSAHS，OSAHS也可以加重糖尿病症状，二者的相互影响可能与胰岛素敏感性和胰岛素抵抗有关'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '心血管疾病'})
SET 
    n.description = coalesce(n.description, 'OSAHS与心血管疾病之间存在紧密联系，呼吸暂停导致低氧血症和交感神经活性增加，可能增加冠状动脉疾病的风险'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '性别差异'})
SET 
    n.description = coalesce(n.description, '虽然OSAHS在男性中更为常见，但绝经后妇女也是高危人群，更年期后雌激素水平下降可能导致上呼吸道肌肉松弛，增加发生风险'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '家族史'})
SET 
    n.description = coalesce(n.description, '家族中有OSAHS患者可能使个体具有遗传上的易感性'),
    n.impact_level = coalesce(n.impact_level, '中');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '年龄因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '优质');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥胖和超重'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '优质');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '优质');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '2型糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '优质');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '心血管疾病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '优质');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '性别差异'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '家族史'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:29:26
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS');

MERGE (n:Symptom {name: 'OSAHS 典型症状'})
SET 
    n.description = coalesce(n.description, '具有 OSAHS 典型症状、体征、相关合并疾病');

MERGE (n:Symptom {name: '无症状 OSAHS'})
SET 
    n.description = coalesce(n.description, '不具备典型症状或未意识到 OSAHS 症状的高危人群');

MERGE (n:Symptom {name: '高危职业人群'})
SET 
    n.description = coalesce(n.description, '职业司机、飞行员、消防员及危险工作人群');

MERGE (n:Complication {name: '肥胖'})
SET 
    n.description = coalesce(n.description, '与 OSAHS 患病相关的风险因素');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '与 OSAHS 患病相关的风险因素');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, '与 OSAHS 患病相关的风险因素');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'OSAHS 典型症状'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '无症状 OSAHS'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '中'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高危职业人群'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '良好');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '良好');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '良好');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:29:26
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见但易被忽视的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Examination {name: 'OSAHS筛查'})
SET 
    n.description = coalesce(n.description, '评估成年人OSAHS筛查的受益与风险'),
    n.method = coalesce(n.method, '问卷调查'),
    n.requirement = coalesce(n.requirement, '无');

MERGE (n:Symptom {name: '嗜睡'})
SET 
    n.description = coalesce(n.description, '患者白天感到异常嗜睡'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:RiskFactor {name: '生活方式因素'})
SET 
    n.description = coalesce(n.description, '包括肥胖、缺乏运动等'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:Complication {name: '高血压'})
SET 
    n.description = coalesce(n.description, '由于OSAHS可能导致的并发症'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Complication {name: '糖尿病'})
SET 
    n.description = coalesce(n.description, 'OSAHS可能增加糖尿病风险'),
    n.severity = coalesce(n.severity, '严重');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'OSAHS筛查'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '嗜睡'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停低通气综合征'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '生活方式因素'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.6),
    r.timeframe = coalesce(r.timeframe, '长期');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:MAY_CAUSE]->(to)
SET 
    r.probability = coalesce(r.probability, 0.5),
    r.timeframe = coalesce(r.timeframe, '长期');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:29:29
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.short_name = coalesce(n.short_name, 'OSAHS');

MERGE (n:Scale {name: 'Epworth 嗜睡量表'})
SET 
    n.description = coalesce(n.description, '用于评估白天嗜睡程度'),
    n.score_range = coalesce(n.score_range, '0-24'),
    n.interpretation = coalesce(n.interpretation, '分数越高，嗜睡程度越严重');

MERGE (n:Scale {name: 'STOP 问卷'})
SET 
    n.description = coalesce(n.description, '评估打鼾、疲劳、观察到的呼吸暂停、高血压对OSAHS的影响'),
    n.score_range = coalesce(n.score_range, '0-8'),
    n.interpretation = coalesce(n.interpretation, '分数越高，风险越大');

MERGE (n:Scale {name: 'STOP-Bang 问卷'})
SET 
    n.description = coalesce(n.description, '结合BMI、年龄、颈围和性别筛查OSAHS'),
    n.score_range = coalesce(n.score_range, '0-8'),
    n.interpretation = coalesce(n.interpretation, '分数越高，风险越大');

MERGE (n:Scale {name: '柏林问卷'})
SET 
    n.description = coalesce(n.description, '通过打鼾、疲劳和睡眠历史识别OSAHS高危人群'),
    n.score_range = coalesce(n.score_range, '0-3'),
    n.interpretation = coalesce(n.interpretation, '分数越高，风险越大');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'Epworth 嗜睡量表'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.9),
    r.recommendation_level = coalesce(r.recommendation_level, '高推荐');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'STOP 问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.85),
    r.recommendation_level = coalesce(r.recommendation_level, '高推荐');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = 'STOP-Bang 问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.95),
    r.recommendation_level = coalesce(r.recommendation_level, '高推荐');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '柏林问卷'
MERGE (from)-[r:ASSESSED_BY]->(to)
SET 
    r.applicability = coalesce(r.applicability, 0.8),
    r.recommendation_level = coalesce(r.recommendation_level, '中推荐');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:29:29
*/
// 节点更新
MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停低通气综合征'})
SET 
    n.code = coalesce(n.code, 'OSAHS'),
    n.description = coalesce(n.description, '一种常见却常被低估的睡眠障碍，表现为在睡眠期间呼吸暂停和上呼吸道阻塞'),
    n.category = coalesce(n.category, '睡眠障碍'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Disease {name: '高血压'})
SET 
    n.code = coalesce(n.code, 'HT'),
    n.description = coalesce(n.description, '高血压是一种以动脉血压持续升高为特点的疾病'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '冠心病'})
SET 
    n.code = coalesce(n.code, 'CHD'),
    n.description = coalesce(n.description, '冠状动脉供血不足导致的心脏病'),
    n.category = coalesce(n.category, '心血管疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '脑卒中'})
SET 
    n.code = coalesce(n.code, 'Stroke'),
    n.description = coalesce(n.description, '由于脑部供血不足而导致的功能障碍'),
    n.category = coalesce(n.category, '神经系统疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '糖尿病'})
SET 
    n.code = coalesce(n.code, 'DM'),
    n.description = coalesce(n.description, '以高血糖为特征的代谢病'),
    n.category = coalesce(n.category, '内分泌疾病'),
    n.severity = coalesce(n.severity, '严重');

MERGE (n:Disease {name: '肥胖'})
SET 
    n.code = coalesce(n.code, 'Obesity'),
    n.description = coalesce(n.description, '体内脂肪过多的一种状态'),
    n.category = coalesce(n.category, '代谢性疾病'),
    n.severity = coalesce(n.severity, '中等');

// 关系更新
MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '高血压'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '冠心病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '脑卒中'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '糖尿病'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '阻塞性睡眠呼吸暂停低通气综合征'
MATCH (to) WHERE to.name = '肥胖'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

