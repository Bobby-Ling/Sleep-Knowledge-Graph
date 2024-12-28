<template>
    <view class="container">
        <!-- 报告头部 -->
        <view class="header" :style="'background-color: ' + report.color">
            <view class="header-content" style="width: 550rpx; display: block; box-sizing: border-box">
                <view class="test-info">
                    <text class="test-type">{{ report.type }}</text>
                    <text class="test-date">{{ report.date }} · 用时{{ report.duration }}</text>
                </view>
                <view class="score-section">
                    <view class="score-circle">
                        <text class="score-number">{{ report.score }}</text>
                        <text class="score-label">分</text>
                    </view>
                    <text class="score-result">{{ report.result }}</text>
                </view>
            </view>
        </view>

        <!-- 报告内容 -->
        <view class="content">
            <!-- 评估分析 -->
            <view class="section">
                <view class="section-title">评估分析</view>
                <view class="analysis-card">
                    <text class="analysis-summary">{{ report.analysis.summary }}</text>
                    <view class="factors-grid">
                        <view class="factor-item" v-for="(item, index) in report.analysis.factors" :key="index">
                            <view class="factor-score">
                                <text class="number">{{ item.score }}</text>
                                <text class="label">分</text>
                            </view>

                            <text class="factor-name">{{ item.name }}</text>

                            <text class="factor-desc">{{ item.desc }}</text>
                        </view>
                    </view>
                </view>
            </view>

            <!-- 改善建议 -->
            <view class="section">
                <view class="section-title">改善建议</view>
                <view class="suggestions-list">
                    <view class="suggestion-item" @tap="viewSuggestionDetail" :data-index="index" v-for="(item, index) in report.suggestions" :key="index">
                        <view class="suggestion-content">
                            <text class="suggestion-title">{{ item.title }}</text>
                            <text class="suggestion-desc">{{ item.content }}</text>
                        </view>

                        <image class="arrow-icon" src="/static/assets/icons/arrow-right.png"></image>
                    </view>
                </view>
            </view>

            <!-- 趋势变化 -->
            <view class="section">
                <view class="section-title">趋势变化</view>
                <view class="trend-chart">
                    <canvas canvas-id="lineChart" class="line-chart"></canvas>
                </view>
            </view>
        </view>

        <!-- 底部操作栏 -->
        <view class="footer">
            <view class="action-buttons">
                <button class="export-btn" @tap="exportReport">
                    <image
                        src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/export.png?sign=87644dc333dcbd61cd05d95b2f228b98&t=1735286948"
                    ></image>
                    <text>导出报告</text>
                </button>
                <button class="share-btn" open-type="share">
                    <image
                        src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/share.png?sign=6efd0bc37cdc7506b0021bebc407921f&t=1735286992"
                    ></image>
                    <text>分享报告</text>
                </button>
            </view>
            <button class="new-test-btn" @tap="startNewTest" :style="'background-color: ' + report.color">开始新的测试</button>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            report: {
                id: 1,
                type: '失眠风险评估',
                date: '2024-11-26 11:30',
                duration: '3分钟',
                score: 85,
                result: '轻度失眠风险',
                color: '#4A6FEB',
                analysis: {
                    summary: '您当前存在轻度失眠风险，建议关注睡眠习惯的改善。',
                    factors: [
                        {
                            name: '入睡时间',
                            score: 75,
                            desc: '入睡较慢，平均需要30分钟以上'
                        },
                        {
                            name: '睡眠质量',
                            score: 82,
                            desc: '睡眠质量一般，存在易醒情况'
                        },
                        {
                            name: '睡眠时长',
                            score: 88,
                            desc: '睡眠时长基本达标，但略显不足'
                        },
                        {
                            name: '日间表现',
                            score: 90,
                            desc: '日间精神状态良好'
                        }
                    ]
                },
                suggestions: [
                    {
                        title: '规律作息',
                        content: '建议保持规律的作息时间，每天固定时间上床和起床，包括周末。'
                    },
                    {
                        title: '睡眠环境',
                        content: '确保睡眠环境安静、黑暗、温度适宜（18-22℃），有助于提高睡眠质量。'
                    },
                    {
                        title: '放松训练',
                        content: '睡前进行10-15分钟的放松练习，如深呼吸、渐进性肌肉放松等。'
                    },
                    {
                        title: '行为调整',
                        content: '避免睡前使用电子设备，不在床上处理工作或看手机。'
                    }
                ],
                trends: [
                    {
                        date: '10-20',
                        score: 75
                    },
                    {
                        date: '10-25',
                        score: 78
                    },
                    {
                        date: '11-01',
                        score: 80
                    },
                    {
                        date: '11-08',
                        score: 82
                    },
                    {
                        date: '11-15',
                        score: 83
                    },
                    {
                        date: '11-26',
                        score: 85
                    }
                ]
            }
        };
    },
    onLoad(options) {
        // 实际应用中，根据options.id从服务器获取报告数据
        // const reportId = options.id;
        // this.getReportData(reportId);
    },
    // 分享报告
    onShareAppMessage() {
        return {
            title: '我的睡眠评估报告',
            path: `/pages/report/report?id=${this.report.id}`
        };
    },
    onReady: function () {
        this.drawLineChart();
    },
    methods: {
        // 导出报告
        exportReport() {
            uni.showLoading({
                title: '正在导出...'
            });
            setTimeout(() => {
                uni.hideLoading();
                uni.showToast({
                    title: '报告已导出',
                    icon: 'success'
                });
            }, 1500);
        },

        // 查看建议详情
        viewSuggestionDetail(e) {
            const index = e.currentTarget.dataset.index;
            const suggestion = this.report.suggestions[index];
            uni.showModal({
                title: suggestion.title,
                content: suggestion.content,
                showCancel: false
            });
        },

        // 开始新测试
        startNewTest() {
            uni.navigateTo({
                url: '/pages/quickTest/quickTest'
            });
        },

        drawLineChart: function () {
            const ctx = uni.createCanvasContext('lineChart');
            const trends = this.report.trends;

            // 获取系统信息来设置画布大小
            const systemInfo = uni.getSystemInfoSync();
            const width = systemInfo.windowWidth - 80; // 减去外部padding
            const height = 500;

            // 设置图表边距
            const padding = {
                top: 50,
                right: 50,
                bottom: 70,
                left: 70
            };

            // 计算坐标轴的实际可用范围
            const chartWidth = width - padding.left - padding.right;
            const chartHeight = height - padding.top - padding.bottom;

            // 计算数据范围
            const maxScore = Math.max(...trends.map((t) => t.score));
            const minScore = Math.min(...trends.map((t) => t.score));
            const scoreRange = maxScore - minScore;

            // Y轴刻度计算
            const yTickCount = 5;
            const yTickStep = Math.ceil(scoreRange / (yTickCount - 1));
            const yAxisMin = Math.floor(minScore / yTickStep) * yTickStep;
            const yAxisMax = Math.ceil(maxScore / yTickStep) * yTickStep;

            // 绘制网格线和Y轴刻度
            ctx.setStrokeStyle('#EEEEEE');
            ctx.setLineWidth(1);
            ctx.setFontSize(12);
            ctx.setTextAlign('right');
            ctx.setTextBaseline('middle');
            for (let i = 0; i <= yTickCount; i++) {
                const y = padding.top + chartHeight * (1 - i / yTickCount);
                const yValue = yAxisMin + (yAxisMax - yAxisMin) * (i / yTickCount);

                // 绘制水平网格线
                ctx.beginPath();
                ctx.moveTo(padding.left, y);
                ctx.lineTo(width - padding.right, y);
                ctx.stroke();

                // 绘制Y轴刻度值
                ctx.setFillStyle('#666666');
                ctx.fillText(yValue.toFixed(0), padding.left - 10, y);
            }

            // 绘制X轴刻度和竖直网格线
            ctx.setTextAlign('center');
            ctx.setTextBaseline('top');
            const xStep = chartWidth / (trends.length - 1);
            trends.forEach((item, index) => {
                const x = padding.left + xStep * index;

                // 绘制竖直网格线
                ctx.setStrokeStyle('#EEEEEE');
                ctx.beginPath();
                ctx.moveTo(x, padding.top);
                ctx.lineTo(x, height - padding.bottom);
                ctx.stroke();

                // 绘制X轴刻度值
                ctx.setFillStyle('#666666');
                ctx.save();
                ctx.translate(x, height - padding.bottom + 10);
                ctx.rotate(-Math.PI / 4); // 45度角旋转
                ctx.fillText(item.date, 0, 0);
                ctx.restore();
            });

            // 绘制坐标轴
            ctx.setStrokeStyle('#000000');
            ctx.setLineWidth(2);
            // Y轴
            ctx.beginPath();
            ctx.moveTo(padding.left, padding.top);
            ctx.lineTo(padding.left, height - padding.bottom);
            // X轴
            ctx.moveTo(padding.left, height - padding.bottom);
            ctx.lineTo(width - padding.right, height - padding.bottom);
            ctx.stroke();

            // 绘制折线和数据点
            ctx.beginPath();
            ctx.setStrokeStyle('#4A6FEB');
            ctx.setLineWidth(2);
            trends.forEach((item, index) => {
                const x = padding.left + xStep * index;
                const y = padding.top + chartHeight * (1 - (item.score - yAxisMin) / (yAxisMax - yAxisMin));
                if (index === 0) {
                    ctx.moveTo(x, y);
                } else {
                    ctx.lineTo(x, y);
                }
            });
            ctx.stroke();

            // 绘制数据点和数值
            trends.forEach((item, index) => {
                const x = padding.left + xStep * index;
                const y = padding.top + chartHeight * (1 - (item.score - yAxisMin) / (yAxisMax - yAxisMin));

                // 绘制数据点
                ctx.beginPath();
                ctx.setFillStyle('#FFFFFF');
                ctx.setStrokeStyle('#4A6FEB');
                ctx.setLineWidth(2);
                ctx.arc(x, y, 4, 0, Math.PI * 2);
                ctx.stroke();
                ctx.fill();

                // 绘制数值
                ctx.setFontSize(12);
                ctx.setTextAlign('center');
                ctx.setFillStyle('#4A6FEB');
                ctx.fillText(item.score, x, y - 15);
            });

            // 添加Y轴标题
            ctx.save();
            ctx.setFontSize(14);
            ctx.setTextAlign('center');
            ctx.translate(padding.left - 40, height / 2);
            ctx.rotate(-Math.PI / 2);
            ctx.fillText('得分', 0, 0);
            ctx.restore();

            // 添加X轴标题
            ctx.setFontSize(14);
            ctx.setTextAlign('center');
            ctx.fillText('日期', width / 2, height - 20);
            ctx.draw();
        }
    }
};
</script>
<style>
@import './report.css';
</style>
