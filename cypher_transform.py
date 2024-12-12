# %%
import re
from typing import List, Dict, Tuple

def parse_cypher_block(cypher_block: str) -> Tuple[List[Dict], List[Dict]]:
    # 忽略注释行
    lines = [line for line in cypher_block.split('\n') if not line.strip().startswith('//')]
    cypher_block = '\n'.join(lines)

    # 分别匹配MERGE和CREATE语句
    node_patterns = re.finditer(r'(?:MERGE|CREATE) \(([\w\d]+):(\w+) {([^}]+)}\)', cypher_block)
    rel_patterns = re.finditer(r'MERGE \(([\w\d]+)\)-\[:(\w+) {([^}]+)}\]->\(([\w\d]+)\)', cypher_block)

    nodes = []
    node_vars = {}

    for match in node_patterns:
        var, label, props = match.groups()
        props_dict = {}
        # 更健壮的属性解析
        props_str = props.strip()
        in_quote = False
        current_key = ''
        current_value = ''
        current_str = ''

        for char in props_str + ',':  # 添加最后一个逗号以处理最后一个属性
            if char == '"' or char == "'":
                in_quote = not in_quote
                current_str += char
            elif char == ':' and not in_quote:
                current_key = current_str.strip().strip('"\'')
                current_str = ''
            elif char == ',' and not in_quote:
                current_value = current_str.strip().strip('"\'')
                if current_key and current_value:
                    props_dict[current_key] = current_value
                current_key = ''
                current_value = ''
                current_str = ''
            else:
                current_str += char

        nodes.append({
            'label': label,
            'properties': props_dict
        })
        if 'name' in props_dict:
            node_vars[var] = props_dict['name']

    # 解析关系
    relationships = []
    for match in rel_patterns:
        from_var, rel_type, props, to_var = match.groups()
        props_dict = {}
        # 使用相同的属性解析逻辑
        props_str = props.strip()
        in_quote = False
        current_key = ''
        current_value = ''
        current_str = ''

        for char in props_str + ',':
            if char == '"' or char == "'":
                in_quote = not in_quote
                current_str += char
            elif char == ':' and not in_quote:
                current_key = current_str.strip().strip('"\'')
                current_str = ''
            elif char == ',' and not in_quote:
                current_value = current_str.strip().strip('"\'')
                if current_key and current_value:
                    try:
                        if current_value.replace('.', '').isdigit():
                            props_dict[current_key] = float(current_value)
                        else:
                            props_dict[current_key] = current_value
                    except ValueError:
                        props_dict[current_key] = current_value
                current_key = ''
                current_value = ''
                current_str = ''
            else:
                current_str += char

        # 只处理能找到对应节点的关系
        if from_var in node_vars and (to_var in node_vars or to_var.startswith('t') or to_var.startswith('e')):
            to_name = node_vars.get(to_var, to_var)
            relationships.append({
                'from_name': node_vars[from_var],
                'to_name': to_name,
                'type': rel_type,
                'properties': props_dict
            })

    return nodes, relationships

def generate_incremental_cypher(nodes: List[Dict], relationships: List[Dict]) -> str:
    cypher = "// 节点更新\n"

    # 处理节点
    for node in nodes:
        props = node['properties']
        if 'name' not in props:
            continue

        cypher += f"MERGE (n:{node['label']} {{name: '{props['name']}'}})"

        # 只有当有其他属性时才添加SET子句
        other_props = [(k, v) for k, v in props.items() if k != 'name']
        if other_props:
            cypher += "\nSET \n"
            props_lines = []
            for key, value in other_props:
                props_lines.append(f"    n.{key} = coalesce(n.{key}, '{value}')")
            cypher += ",\n".join(props_lines)
        cypher += ";\n\n"

    # 处理关系
    if relationships:
        cypher += "// 关系更新\n"
        for rel in relationships:
            cypher += (f"MATCH (from) WHERE from.name = '{rel['from_name']}'\n"
                      f"MATCH (to) WHERE to.name = '{rel['to_name']}'\n"
                      f"MERGE (from)-[r:{rel['type']}]->(to)")

            # 只有当有属性时才添加SET子句
            if rel['properties']:
                cypher += "\nSET \n"
                props_lines = []
                for key, value in rel['properties'].items():
                    if isinstance(value, (int, float)):
                        props_lines.append(f"    r.{key} = coalesce(r.{key}, {value})")
                    else:
                        props_lines.append(f"    r.{key} = coalesce(r.{key}, '{value}')")
                cypher += ",\n".join(props_lines)
            cypher += ";\n\n"

    return cypher

def transform_cypher_block(block: str) -> str:
    nodes, relationships = parse_cypher_block(block)
    incremental_cypher = generate_incremental_cypher(nodes, relationships)
    return incremental_cypher

def process_cypher_blocks(blocks: List[str]) -> List[str]:
    results = []
    for block in blocks:
        incremental_cypher = transform_cypher_block(block)
        results.append(incremental_cypher)
    return results

# %%
if __name__ == "__main__":
    blocks = [
        """
MERGE (d1:Disease {name: "阻塞性睡眠呼吸暂停低通气综合征", code: "OSAHS", description: "一种常见的睡眠呼吸疾病", category: "睡眠障碍", severity: "严重"})
MERGE (s1:Symptom {name: "呼吸暂停低通气指数", description: "在一小时内发生的呼吸暂停或低通气事件的次数", severity: "中等", frequency: "≥5次/h"})
MERGE (d1)-[:INDICATES {confidence: 0.9, frequency: "高", severity: "严重"}]->(s1)
MERGE (d1)-[:TREATED_BY {effectiveness: 0.85, priority: "高", stage: "治疗"}]->(t1:Treatment {name: "综合医院治疗", type: "非药物", description: "在三级甲等综合医院进行的疗法", dosage: "根据病情", duration: "持续至恢复", contraindication: "严重合并症患者"})

CREATE (d2:Complication {name: "并发症", description: "可能由于OSAHS未被及时发现和诊治而导致的其他健康问题", severity: "严重"})
MERGE (d1)-[:MAY_CAUSE {probability: 0.7, timeframe: "长期"}]->(d2);
        """,
        """
MERGE (d1:Disease {name: "阻塞性睡眠呼吸暂停低通气综合征", code: "OSAHS"})
MERGE (e1:Examination {name: "阻塞性睡眠呼吸暂停低通气综合征筛查", description: "用于筛查阻塞性睡眠呼吸暂停低通气综合征的检查", method: "临床评估", requirement: "根据临床经验判断必要性"})
MERGE (d1)-[:REQUIRES_EXAM {priority: "高", mandatory: true}]->(e1);
        """,
        """
MERGE (d1:Disease {name: "阻塞性睡眠呼吸暂停低通气综合征", code: "OSAHS", description: "一种常见的睡眠呼吸障碍", category: "睡眠障碍", severity: "严重"})
MERGE (d2:Disease {name: "高血压"})
MERGE (d3:Disease {name: "糖尿病"})
MERGE (d4:Disease {name: "心血管疾病", description: "与高血压、糖尿病相关的健康问题"})
MERGE (d1)-[:MAY_CAUSE {probability: 0.7, timeframe: "长期"}]->(d2)
MERGE (d1)-[:MAY_CAUSE {probability: 0.5, timeframe: "长期"}]->(d3)
MERGE (d1)-[:MAY_CAUSE {probability: 0.6, timeframe: "长期"}]->(d4);
        """,
        """
MERGE (d1:Disease {name: "阻塞性睡眠呼吸暂停低通气综合征", description: "OSAHS 是一种睡眠障碍，其特征是呼吸气流减少或停止，咽喉气道狭窄和阻塞", severity: "轻度/中度/重度"})
MERGE (s1:Symptom {name: "日间嗜睡过多", description: "常见临床体征", severity: "中等", frequency: "持续"})
MERGE (s2:Symptom {name: "休息不够", description: "尽管睡眠时间足够，仍然觉得休息不够", severity: "轻度", frequency: "持续"})
MERGE (s3:Symptom {name: "打鼾", description: "大声或不规则的打鼾", severity: "轻度", frequency: "持续"})
MERGE (s4:Symptom {name: "窒息或呼吸困难", description: "睡觉时窒息或呼吸困难", severity: "重度", frequency: "偶发"})

MERGE (d1)-[:INDICATES {confidence: 0.9, frequency: "高频", severity: "重度"}]->(s1)
MERGE (d1)-[:INDICATES {confidence: 0.8, frequency: "高频", severity: "轻度"}]->(s2)
MERGE (d1)-[:INDICATES {confidence: 0.85, frequency: "高频", severity: "轻度"}]->(s3)
MERGE (d1)-[:INDICATES {confidence: 0.95, frequency: "高频", severity: "重度"}]->(s4);
        """,
        """
MERGE (d1:Disease {name: "阻塞性睡眠呼吸暂停低通气综合征", code: "OSAHS", description: "一种影响睡眠的疾病，导致呼吸暂停和低通气", category: "睡眠障碍", severity: "严重"})
MERGE (s1:Symptom {name: "打鼾", description: "在睡眠中发出响亮的呼吸声", severity: "中等", frequency: "频繁"})
MERGE (s2:Symptom {name: "呼吸暂停", description: "在睡眠中出现短暂的呼吸停止", severity: "高", frequency: "不定期"})
MERGE (s3:Symptom {name: "日间嗜睡", description: "白天过度困倦，影响正常活动", severity: "中等", frequency: "频繁"})
MERGE (s4:Symptom {name: "认知功能障碍", description: "注意力和记忆力差的症状", severity: "中等", frequency: "中等"})
MERGE (s5:Symptom {name: "情绪变化", description: "睡眠不足引起的情绪波动", severity: "轻", frequency: "中等"})
MERGE (s6:Symptom {name: "呼吸困难", description: "在睡眠中感到呼吸受阻", severity: "高", frequency: "偶尔"})
MERGE (s7:Symptom {name: "窒息", description: "睡眠中感到窒息", severity: "高", frequency: "偶尔"})

MERGE (d1)-[:INDICATES {confidence: 0.9, frequency: "高", severity: "严重"}]->(s1)
MERGE (d1)-[:INDICATES {confidence: 0.95, frequency: "中等", severity: "严重"}]->(s2)
MERGE (d1)-[:INDICATES {confidence: 0.8, frequency: "高", severity: "中等"}]->(s3)
MERGE (d1)-[:INDICATES {confidence: 0.75, frequency: "中等", severity: "中等"}]->(s4)
MERGE (d1)-[:INDICATES {confidence: 0.6, frequency: "低", severity: "轻"}]->(s5)
MERGE (d1)-[:INDICATES {confidence: 0.85, frequency: "偶尔", severity: "严重"}]->(s6)
MERGE (d1)-[:INDICATES {confidence: 0.9, frequency: "偶尔", severity: "严重"}]->(s7)
        """
    ]
    converted = process_cypher_blocks(blocks)
    for i, cypher in enumerate(converted, 1):
        print(f"// Block {i}\n{cypher}\n")
# %%
