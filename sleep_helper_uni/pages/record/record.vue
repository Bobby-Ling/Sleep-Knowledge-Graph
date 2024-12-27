<template>
    <view class="container">
        <view class="status-bar">
            <text class="status-bar-title">睡眠记录</text>
        </view>

        <view class="content">
            <view class="summary-card">
                <view class="time-range">
                    <view
                        :class="'range-item ' + (currentRange === item.id ? 'active' : '')"
                        :data-range="item.id"
                        @tap="changeTimeRange"
                        v-for="(item, index) in timeRanges"
                        :key="index"
                    >
                        {{ item.name }}
                    </view>
                </view>

                <view class="stats-grid">
                    <view class="stats-item">
                        <text class="stats-value">{{ statistics.averageDuration }}h</text>
                        <text class="stats-label">平均睡眠时长</text>
                    </view>
                    <view class="stats-item">
                        <text class="stats-value">{{ statistics.averageQuality }}%</text>
                        <text class="stats-label">平均睡眠质量</text>
                    </view>
                    <view class="stats-item">
                        <text class="stats-value">{{ statistics.averageDeepSleep }}h</text>
                        <text class="stats-label">平均深睡时长</text>
                    </view>
                </view>

                <view class="trend-info">
                    <image class="trend-icon" :src="'/assets/icons/' + (sleepTrend.improving ? 'trend-up' : 'trend-down') + '.png'"></image>
                    <text class="trend-text">较上周{{ sleepTrend.improving ? '提升' : '下降' }}{{ sleepTrend.percentage }}%</text>
                </view>
            </view>

            <view class="chart-card">
                <view class="chart-title">睡眠时长趋势</view>
                <canvas type="2d" id="sleepChart" class="sleep-chart"></canvas>
            </view>

            <view class="record-list">
                <view class="list-title">详细记录</view>
                <view class="record-item" @tap="viewDetail" :data-date="item.date" v-for="(item, index) in sleepData.weekData" :key="index">
                    <view class="record-date">
                        <text class="date-text">{{ item.date }}</text>
                    </view>

                    <view class="record-info">
                        <view class="info-item">
                            <text class="info-label">时长</text>
                            <text class="info-value">{{ item.duration }}h</text>
                        </view>
                        <view class="info-item">
                            <text class="info-label">质量</text>
                            <text class="info-value">{{ item.quality }}%</text>
                        </view>
                        <view class="info-item">
                            <text class="info-label">深睡</text>
                            <text class="info-value">{{ item.deepSleep }}h</text>
                        </view>
                    </view>

                    <image class="arrow-icon" src="/static/assets/icons/arrow-right.png"></image>
                </view>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            timeRanges: [
                {
                    id: 'week',
                    name: '周'
                },
                {
                    id: 'month',
                    name: '月'
                },
                {
                    id: 'year',
                    name: '年'
                }
            ],
            currentRange: 'week',
            sleepData: {
                weekData: [
                    {
                        date: '11-19',
                        duration: 7.5,
                        quality: 85,
                        deepSleep: 2.5
                    },
                    {
                        date: '11-20',
                        duration: 6.8,
                        quality: 75,
                        deepSleep: 2.2
                    },
                    {
                        date: '11-21',
                        duration: 7.2,
                        quality: 82,
                        deepSleep: 2.4
                    },
                    {
                        date: '11-22',
                        duration: 8,
                        quality: 90,
                        deepSleep: 2.8
                    },
                    {
                        date: '11-23',
                        duration: 7,
                        quality: 78,
                        deepSleep: 2.3
                    },
                    {
                        date: '11-24',
                        duration: 7.8,
                        quality: 88,
                        deepSleep: 2.6
                    },
                    {
                        date: '11-25',
                        duration: 7.4,
                        quality: 83,
                        deepSleep: 2.4
                    }
                ]
            },
            statistics: {
                averageDuration: 7.4,
                averageQuality: 83,
                averageDeepSleep: 2.5,
                bestQuality: 90,
                worstQuality: 75
            },
            sleepTrend: {
                improving: true,
                percentage: 15
            }
        };
    },
    onLoad() {
        this.initCanvas();
    },
    methods: {
        // 切换时间范围
        changeTimeRange(e) {
            const range = e.currentTarget.dataset.range;
            this.setData({
                currentRange: range
            });
            this.updateChart();
        },

        // 初始化图表
        initCanvas() {
            const query = uni.createSelectorQuery();
            query
                .select('#sleepChart')
                .fields({
                    node: true,
                    size: true
                })
                .exec((res) => {
                    const canvas = res[0].node;
                    const ctx = canvas.getContext('2d');
                    const dpr = uni.getSystemInfoSync().pixelRatio;
                    canvas.width = res[0].width * dpr;
                    canvas.height = res[0].height * dpr;
                    ctx.scale(dpr, dpr);
                    this.canvas = canvas;
                    this.ctx = ctx;
                    this.updateChart();
                });
        },

        // 更新图表
        updateChart() {
            const ctx = this.ctx;
            const data = this.sleepData.weekData;
            const canvas = this.canvas;
            const width = canvas.width / uni.getSystemInfoSync().pixelRatio;
            const height = canvas.height / uni.getSystemInfoSync().pixelRatio;

            // 定义边距
            const margin = {
                left: 60,
                right: 30,
                top: 30,
                bottom: 50
            };

            // 清空画布
            ctx.clearRect(0, 0, width, height);

            // 设置字体
            ctx.font = '12px Arial';
            ctx.fillStyle = '#666666';

            // 计算图表实际区域
            const chartWidth = width - margin.left - margin.right;
            const chartHeight = height - margin.top - margin.bottom;

            // Y轴刻度
            const yMax = 12; // 最大睡眠时间12小时
            const yMin = 0;
            const yStep = 2; // 每2小时一个刻度
            const yTickCount = (yMax - yMin) / yStep;

            // 绘制Y轴刻度和网格线
            for (let i = 0; i <= yTickCount; i++) {
                const y = margin.top + chartHeight * (1 - i / yTickCount);
                const yValue = yMin + i * yStep;

                // 绘制刻度文本
                ctx.fillStyle = '#666666';
                ctx.textAlign = 'right';
                ctx.fillText(yValue + '时', margin.left - 10, y + 4);

                // 绘制网格线
                ctx.beginPath();
                ctx.strokeStyle = '#E0E0E0';
                ctx.lineWidth = 0.5;
                ctx.moveTo(margin.left, y);
                ctx.lineTo(width - margin.right, y);
                ctx.stroke();
            }

            // 绘制X轴日期
            data.forEach((item, index) => {
                const x = margin.left + index * (chartWidth / (data.length - 1));

                // 绘制日期文本
                ctx.fillStyle = '#666666';
                ctx.textAlign = 'center';
                ctx.fillText(item.date, x, height - margin.bottom + 20);

                // 绘制垂直网格线
                ctx.beginPath();
                ctx.strokeStyle = '#E0E0E0';
                ctx.lineWidth = 0.5;
                ctx.moveTo(x, margin.top);
                ctx.lineTo(x, height - margin.bottom);
                ctx.stroke();
            });

            // 绘制折线
            ctx.beginPath();
            ctx.strokeStyle = '#4A6FEB';
            ctx.lineWidth = 2;
            data.forEach((item, index) => {
                const x = margin.left + index * (chartWidth / (data.length - 1));
                const y = margin.top + chartHeight * (1 - item.duration / yMax);
                if (index === 0) {
                    ctx.moveTo(x, y);
                } else {
                    ctx.lineTo(x, y);
                }

                // 绘制数据点
                ctx.fillStyle = '#FFFFFF';
                ctx.beginPath();
                ctx.arc(x, y, 4, 0, Math.PI * 2);
                ctx.fill();
                ctx.strokeStyle = '#4A6FEB';
                ctx.lineWidth = 2;
                ctx.stroke();

                // 绘制数值
                ctx.fillStyle = '#4A6FEB';
                ctx.textAlign = 'center';
                ctx.fillText(item.duration + '时', x, y - 10);
            });
            ctx.stroke();

            // 绘制坐标轴
            ctx.beginPath();
            ctx.strokeStyle = '#999999';
            ctx.lineWidth = 1;
            // Y轴
            ctx.moveTo(margin.left, margin.top);
            ctx.lineTo(margin.left, height - margin.bottom);
            // X轴
            ctx.moveTo(margin.left, height - margin.bottom);
            ctx.lineTo(width - margin.right, height - margin.bottom);
            ctx.stroke();
        },

        // 查看详细记录
        viewDetail(e) {
            const date = e.currentTarget.dataset.date;
            uni.navigateTo({
                url: `/pages/sleep-detail/sleep-detail?date=${date}`
            });
        }
    }
};
</script>
<style>
@import './record.css';
</style>
