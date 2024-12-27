import re
from pyecharts.charts import Line
from pyecharts import options as opts

filename = "result.txt"
index = []
score_disease = []
score_treatment = []

with open(filename, "r") as file:
    for line in file:
        match = re.match(r"(\d+): score_disease: ([0-9.]+), score_treatment: ([0-9.]+)", line)
        if match:
            idx, disease, treatment = match.groups()
            index.append(int(idx))
            score_disease.append(float(disease))
            score_treatment.append(float(treatment))

# 设置阈值
threshold = 0.9

# 计算平均值
avg_disease = sum(score_disease) / len(score_disease) if score_disease else 0
avg_treatment = sum(score_treatment) / len(score_treatment) if score_treatment else 0

# 创建折线图
line_chart = (
    Line()
    .add_xaxis(index)
    .add_yaxis(
        "疾病相似度",
        score_disease,
        # is_smooth=True,
        is_symbol_show=True,
        linestyle_opts=opts.LineStyleOpts(width=0),  # 禁用线条
        # markline_opts=opts.MarkLineOpts(
        #     data=[
        #         opts.MarkLineItem(y=threshold, name="Threshold"),
        #     ],
        #     linestyle_opts=opts.LineStyleOpts(type_="dashed", color="red"),
        # ),
        markline_opts=opts.MarkLineOpts(
            data=[
                opts.MarkLineItem(y=avg_disease, name="Average Disease"),
            ],
            linestyle_opts=opts.LineStyleOpts(type_="dashed", color="red"),
        ),
        # markpoint_opts=opts.MarkPointOpts(
        #     data=[opts.MarkPointItem(type_="max", name="Max")]
        # ),
    )
    .add_yaxis(
        "治疗手段相似度",
        score_treatment,
        # is_smooth=True,
        is_symbol_show=True,
        linestyle_opts=opts.LineStyleOpts(width=0),  # 禁用线条
        # markline_opts=opts.MarkLineOpts(
        #     data=[
        #         opts.MarkLineItem(y=threshold, name="Threshold"),
        #     ],
        #     linestyle_opts=opts.LineStyleOpts(type_="dashed", color="blue"),
        # ),
        markline_opts=opts.MarkLineOpts(
            data=[
                opts.MarkLineItem(y=avg_treatment, name="Average Treatment"),
            ],
            linestyle_opts=opts.LineStyleOpts(type_="dashed", color="blue"),
        ),
        # markpoint_opts=opts.MarkPointOpts(
        #     data=[opts.MarkPointItem(type_="max", name="Max")]
        # ),
    )
    .set_global_opts(
        title_opts=opts.TitleOpts(title="预测准确率", subtitle=""),
        xaxis_opts=opts.AxisOpts(name="Index"),
        yaxis_opts=opts.AxisOpts(name="Accuracy"),
        legend_opts=opts.LegendOpts(is_show=True),
        tooltip_opts=opts.TooltipOpts(trigger="axis"),
    )
)

# 渲染到HTML文件
line_chart.render("prediction_accuracy.html")