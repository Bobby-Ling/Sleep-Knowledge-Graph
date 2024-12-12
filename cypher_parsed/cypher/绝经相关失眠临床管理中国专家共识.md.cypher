// File: 绝经相关失眠临床管理中国专家共识.md
// Processed at: 2024-12-12 01:28:33
// Total pairs: 18

/* Response #1
   Timestamp: 2024-12-12 01:26:35
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '绝经期间常见的失眠问题'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '一种常见的睡眠障碍'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '一种情绪障碍，可能导致失眠'),
    n.category = coalesce(n.category, '精神疾病');

MERGE (n:Disease {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '情绪障碍，常与失眠相关'),
    n.category = coalesce(n.category, '精神疾病');

MERGE (n:Disease {name: '血管舒缩症状'})
SET 
    n.description = coalesce(n.description, '身体对环境温度变化的反应，有时会影响睡眠'),
    n.category = coalesce(n.category, '生理症状');

MERGE (n:Symptom {name: '失眠家族史'})
SET 
    n.description = coalesce(n.description, '有家族成员患有失眠症状'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '激素水平改变'})
SET 
    n.description = coalesce(n.description, '由于绝经导致的激素变化'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '工作生活压力增大'})
SET 
    n.description = coalesce(n.description, '生活及工作的压力影响睡眠质量'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Symptom {name: '疼痛'})
SET 
    n.description = coalesce(n.description, '身体不适，可能导致失眠'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:Symptom {name: '负面情绪'})
SET 
    n.description = coalesce(n.description, '情绪低落，影响睡眠'),
    n.severity = coalesce(n.severity, '高');

MERGE (n:RiskFactor {name: '既往存在失眠或抑郁'})
SET 
    n.description = coalesce(n.description, '历史上有失眠或抑郁的病史'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '性格追求完美'})
SET 
    n.description = coalesce(n.description, '个体性格特征，增加失眠风险'),
    n.impact_level = coalesce(n.impact_level, '中');

MERGE (n:RiskFactor {name: '焦虑倾向'})
SET 
    n.description = coalesce(n.description, '个体存在焦虑情绪，影响睡眠'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '年龄增长'})
SET 
    n.description = coalesce(n.description, '年龄增长可能导致生理和心理上的变化，影响睡眠'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '发生应激事件'})
SET 
    n.description = coalesce(n.description, '经历重大生活变化或压力事件'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '健康状况差'})
SET 
    n.description = coalesce(n.description, '整体健康状况不佳可能导致失眠'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '轮值夜班'})
SET 
    n.description = coalesce(n.description, '工作时间不规律影响生物钟'),
    n.impact_level = coalesce(n.impact_level, '高');

MERGE (n:RiskFactor {name: '错误的睡眠认知和睡眠卫生习惯'})
SET 
    n.description = coalesce(n.description, '不良的认知和习惯导致失眠'),
    n.impact_level = coalesce(n.impact_level, '高');

// 关系更新
MATCH (from) WHERE from.name = '失眠家族史'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '激素水平改变'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '工作生活压力增大'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '疼痛'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '高');

MATCH (from) WHERE from.name = '负面情绪'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.75),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '既往存在失眠或抑郁'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '性格追求完美'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '中'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '焦虑倾向'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '年龄增长'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '强');

MATCH (from) WHERE from.name = '发生应激事件'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '健康状况差'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '轮值夜班'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');

MATCH (from) WHERE from.name = '错误的睡眠认知和睡眠卫生习惯'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INFLUENCED_BY]->(to)
SET 
    r.impact_level = coalesce(r.impact_level, '高'),
    r.evidence_level = coalesce(r.evidence_level, '中等');



// =====================================

/* Response #2
   Timestamp: 2024-12-12 01:26:36
*/
// 节点更新


// =====================================

/* Response #3
   Timestamp: 2024-12-12 01:26:37
*/
// 节点更新


// =====================================

/* Response #4
   Timestamp: 2024-12-12 01:26:39
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '绝经期间女性常见的失眠问题'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '难以入睡的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间频繁觉醒'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '感到紧张不安的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '潮热'})
SET 
    n.description = coalesce(n.description, '感觉冷热波动的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '出汗'})
SET 
    n.description = coalesce(n.description, '汗水分泌异常的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '夜间频繁觉醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '焦虑'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '抑郁'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.7),
    r.frequency = coalesce(r.frequency, '中等'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '潮热'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '出汗'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.6),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #5
   Timestamp: 2024-12-12 01:26:47
*/
// 节点更新


// =====================================

/* Response #6
   Timestamp: 2024-12-12 01:26:57
*/
// 节点更新


// =====================================

/* Response #7
   Timestamp: 2024-12-12 01:27:01
*/
// 节点更新


// =====================================

/* Response #8
   Timestamp: 2024-12-12 01:27:06
*/
// 节点更新


// =====================================

/* Response #9
   Timestamp: 2024-12-12 01:27:07
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '绝经期间由于生理及心理因素导致的失眠现象'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '阻塞性睡眠呼吸暂停'})
SET 
    n.description = coalesce(n.description, '夜间呼吸反复暂停或呼吸不畅'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '不宁腿综合征'})
SET 
    n.description = coalesce(n.description, '患者在静止时出现下肢不适，自觉需要移动'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Disease {name: '焦虑症'})
SET 
    n.description = coalesce(n.description, '一种常见的心理障碍，表现为过度的焦虑和担忧'),
    n.category = coalesce(n.category, '心理障碍');

MERGE (n:Disease {name: '抑郁症'})
SET 
    n.description = coalesce(n.description, '一种常见的情绪障碍，表现为持续的悲伤和兴趣减退'),
    n.category = coalesce(n.category, '心理障碍');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '睡眠质量差，难以入睡或维持睡眠'),
    n.severity = coalesce(n.severity, '严重'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '焦虑'})
SET 
    n.description = coalesce(n.description, '情绪紧张、担忧'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

MERGE (n:Symptom {name: '抑郁'})
SET 
    n.description = coalesce(n.description, '情绪低落，兴趣减退'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '偶尔');

// 关系更新
MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '严重');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '阻塞性睡眠呼吸暂停'
MERGE (from)-[r:REQUIRES_EXAM]->(to)
SET 
    r.priority = coalesce(r.priority, '高'),
    r.mandatory = coalesce(r.mandatory, 'true');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '焦虑症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '抑郁症'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '焦虑'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '抑郁'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.8),
    r.frequency = coalesce(r.frequency, '偶尔'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #10
   Timestamp: 2024-12-12 01:27:11
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '与绝经相关的失眠症状和临床管理'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Symptom {name: '入睡困难'})
SET 
    n.description = coalesce(n.description, '入睡的难度'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '维持睡眠困难'})
SET 
    n.description = coalesce(n.description, '保持睡眠状态的难度'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '早醒'})
SET 
    n.description = coalesce(n.description, '比预期时间早醒'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '不肯上床'})
SET 
    n.description = coalesce(n.description, '对于上床睡觉的抵触'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '疲劳或萎靡不振'})
SET 
    n.description = coalesce(n.description, '日间疲劳感或无精打采'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '注意力、专注力或记忆力下降'})
SET 
    n.description = coalesce(n.description, '认知功能下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '社交、家庭、职业或学业受损'})
SET 
    n.description = coalesce(n.description, '生活质量下降'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '情绪紊乱或易激惹'})
SET 
    n.description = coalesce(n.description, '情绪的不稳定性'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '日间瞌睡'})
SET 
    n.description = coalesce(n.description, '白天睡意朦胧'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '行为问题'})
SET 
    n.description = coalesce(n.description, '包括活动过度、冲动、攻击性'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '动力/精力/工作主动性降低'})
SET 
    n.description = coalesce(n.description, '缺乏动力的表现'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '容易出错'})
SET 
    n.description = coalesce(n.description, '在日常活动中犯错误的频率增加'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

MERGE (n:Symptom {name: '对睡眠的质量非常关切或不满意'})
SET 
    n.description = coalesce(n.description, '患者对睡眠质量的关注'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '每周至少3次');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '入睡困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '维持睡眠困难'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '早醒'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '不肯上床'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '疲劳或萎靡不振'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '注意力、专注力或记忆力下降'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '社交、家庭、职业或学业受损'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '情绪紊乱或易激惹'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '日间瞌睡'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '行为问题'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '动力/精力/工作主动性降低'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '容易出错'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '对睡眠的质量非常关切或不满意'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '每周至少3次'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #11
   Timestamp: 2024-12-12 01:27:16
*/
// 节点更新
MERGE (n:Disease {name: '失眠'})
SET 
    n.description = coalesce(n.description, '最常见的睡眠障碍');

MERGE (n:Disease {name: '围绝经期失眠'})
SET 
    n.description = coalesce(n.description, '绝经期女性群体中，失眠的发生率显著增加');

// 关系更新
MATCH (from) WHERE from.name = '围绝经期失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 1.0),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中等');



// =====================================

/* Response #12
   Timestamp: 2024-12-12 01:27:22
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '绝经期女性常见的失眠问题'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Treatment {name: '个体化治疗方案'})
SET 
    n.description = coalesce(n.description, '针对绝经相关失眠患者制定的个性化治疗计划'),
    n.type = coalesce(n.type, '非药物');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '在夜间无法入睡或维持睡眠的状态'),
    n.frequency = coalesce(n.frequency, '频繁'),
    n.severity = coalesce(n.severity, '中');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '个体化治疗方案'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '治疗阶段');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');



// =====================================

/* Response #13
   Timestamp: 2024-12-12 01:27:26
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'});

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '持续睡眠障碍，伴有日间功能受损'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '持续');

MERGE (n:Treatment {name: '药物治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用药物进行失眠的治疗');

MERGE (n:Treatment {name: '非药物治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '采取非药物手段进行失眠的管理');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '高'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初级治疗');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '非药物治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');



// =====================================

/* Response #14
   Timestamp: 2024-12-12 01:27:37
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '与绝经相关的失眠症状'),
    n.code = coalesce(n.code, 'N/A'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '中等');

MERGE (n:Treatment {name: '激素治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善(围)绝经期女性的慢性失眠症'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '需评估适应证和禁忌证');

MERGE (n:Treatment {name: '雌激素治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用雌激素改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '需评估适应证和禁忌证');

MERGE (n:Treatment {name: '孕激素治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '使用孕激素改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '需评估适应证和禁忌证');

MERGE (n:Treatment {name: '替勃龙治疗'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '结合雌激素、孕激素和雄激素作用改善睡眠质量'),
    n.dosage = coalesce(n.dosage, '根据医生建议'),
    n.duration = coalesce(n.duration, '视情况而定'),
    n.contraindication = coalesce(n.contraindication, '需评估适应证和禁忌证');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '激素治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '疗程治疗');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '雌激素治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '疗程治疗');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '孕激素治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '疗程治疗');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '替勃龙治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '疗程治疗');



// =====================================

/* Response #15
   Timestamp: 2024-12-12 01:27:46
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '由绝经引起的失眠症状'),
    n.category = coalesce(n.category, '失眠'),
    n.severity = coalesce(n.severity, '中度');

MERGE (n:Treatment {name: '苯二氮卓受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于治疗失眠的药物'),
    n.dosage = coalesce(n.dosage, '根据具体药物剂量'),
    n.duration = coalesce(n.duration, '短期使用'),
    n.contraindication = coalesce(n.contraindication, '依赖性和成瘾性');

MERGE (n:Treatment {name: '褪黑素和褪黑素受体激动剂'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '用于调节睡眠节律的药物'),
    n.dosage = coalesce(n.dosage, '根据具体药物剂量'),
    n.duration = coalesce(n.duration, '缺乏共识'),
    n.contraindication = coalesce(n.contraindication, '未知');

MERGE (n:Treatment {name: '抗抑郁药物'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '改善绝经相关失眠症状的药物'),
    n.dosage = coalesce(n.dosage, '根据具体药物剂量'),
    n.duration = coalesce(n.duration, '长期使用'),
    n.contraindication = coalesce(n.contraindication, '未知');

MERGE (n:Symptom {name: '失眠'})
SET 
    n.description = coalesce(n.description, '入睡困难或睡眠质量差'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Symptom {name: '夜间觉醒'})
SET 
    n.description = coalesce(n.description, '夜间多次醒来'),
    n.severity = coalesce(n.severity, '中度'),
    n.frequency = coalesce(n.frequency, '频繁');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '苯二氮卓受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '褪黑素和褪黑素受体激动剂'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '急性');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '抗抑郁药物'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '慢性');

MATCH (from) WHERE from.name = '失眠'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');

MATCH (from) WHERE from.name = '夜间觉醒'
MATCH (to) WHERE to.name = '绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.85),
    r.frequency = coalesce(r.frequency, '频繁'),
    r.severity = coalesce(r.severity, '中度');



// =====================================

/* Response #16
   Timestamp: 2024-12-12 01:27:58
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '与绝经相关的失眠症状'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Treatment {name: '失眠的认知行为治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '一种有效的心理疗法，通常实施6-8次'),
    n.duration = coalesce(n.duration, '6~8次');

MERGE (n:Treatment {name: '正念疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过训练让注意力重回当下，减轻焦虑和压力'),
    n.duration = coalesce(n.duration, '8~10周');

MERGE (n:Treatment {name: '催眠'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '集中注意力和减少外围意识的特殊意识状态，针对绝经相关失眠和潮热');

MERGE (n:Treatment {name: '中医心理疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '融合现代心理疗法与中医传统心理治疗');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '失眠的认知行为治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '初始治疗');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '正念疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '催眠'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '辅助治疗');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '中医心理疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.7),
    r.priority = coalesce(r.priority, '低'),
    r.stage = coalesce(r.stage, '长期管理');



// =====================================

/* Response #17
   Timestamp: 2024-12-12 01:28:15
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '因绝经期引起的失眠症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.category = coalesce(n.category, '失眠');

MERGE (n:Symptom {name: '夜不能寐'})
SET 
    n.description = coalesce(n.description, '患者无法入睡的症状'),
    n.severity = coalesce(n.severity, '中等'),
    n.frequency = coalesce(n.frequency, '频繁');

MERGE (n:Treatment {name: '中医治疗'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过辨证论治和外治法对失眠进行中医治疗'),
    n.duration = coalesce(n.duration, '根据患者情况调整'),
    n.contraindication = coalesce(n.contraindication, '无特定禁忌');

MERGE (n:Treatment {name: '物理疗法'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '使用物理因子进行治疗'),
    n.duration = coalesce(n.duration, '根据治疗方案'),
    n.contraindication = coalesce(n.contraindication, '无特定禁忌');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '夜不能寐'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中等');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '中医治疗'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.8),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '进行中');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '物理疗法'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.6),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '研究中');



// =====================================

/* Response #18
   Timestamp: 2024-12-12 01:28:22
*/
// 节点更新
MERGE (n:Disease {name: '绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '与绝经相关的失眠症状'),
    n.category = coalesce(n.category, '睡眠障碍');

MERGE (n:Symptom {name: '发生率高'})
SET 
    n.description = coalesce(n.description, '绝经相关失眠的发生率较高'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '影响因素众多'})
SET 
    n.description = coalesce(n.description, '影响绝经相关失眠的因素包括多种'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '需详细询问病史'})
SET 
    n.description = coalesce(n.description, '需要详细询问病史以了解患者情况'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '全面评估患者身心状况'})
SET 
    n.description = coalesce(n.description, '需全面评估以制定治疗方案'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Symptom {name: '早期识别绝经相关失眠'})
SET 
    n.description = coalesce(n.description, '应早期识别该病症以便及时处理'),
    n.severity = coalesce(n.severity, '中'),
    n.frequency = coalesce(n.frequency, '常见');

MERGE (n:Treatment {name: '个体化药物治疗方案'})
SET 
    n.type = coalesce(n.type, '药物'),
    n.description = coalesce(n.description, '制定个体化的药物治疗方案以改善失眠'),
    n.dosage = coalesce(n.dosage, '依患者情况而定'),
    n.duration = coalesce(n.duration, '持续至症状改善'),
    n.contraindication = coalesce(n.contraindication, '对药物过敏者禁用');

MERGE (n:Treatment {name: '非药物管理策略'})
SET 
    n.type = coalesce(n.type, '非药物'),
    n.description = coalesce(n.description, '通过非药物方式管理绝经相关失眠'),
    n.dosage = coalesce(n.dosage, '无'),
    n.duration = coalesce(n.duration, '长期'),
    n.contraindication = coalesce(n.contraindication, '无');

// 关系更新
MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '发生率高'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '影响因素众多'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '需详细询问病史'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '全面评估患者身心状况'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '早期识别绝经相关失眠'
MERGE (from)-[r:INDICATES]->(to)
SET 
    r.confidence = coalesce(r.confidence, 0.9),
    r.frequency = coalesce(r.frequency, '常见'),
    r.severity = coalesce(r.severity, '中');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '个体化药物治疗方案'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.85),
    r.priority = coalesce(r.priority, '高'),
    r.stage = coalesce(r.stage, '早期');

MATCH (from) WHERE from.name = '绝经相关失眠'
MATCH (to) WHERE to.name = '非药物管理策略'
MERGE (from)-[r:TREATED_BY]->(to)
SET 
    r.effectiveness = coalesce(r.effectiveness, 0.75),
    r.priority = coalesce(r.priority, '中'),
    r.stage = coalesce(r.stage, '长期管理');



// =====================================

