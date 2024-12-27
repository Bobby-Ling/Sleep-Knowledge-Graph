<template>
    <view>
        <!-- diagnosis.wxml -->
        <progress-bar :current-step="currentStep" />
        <view class="container">
            <view class="loading" v-if="loading">
                <view class="loading-spinner"></view>
                <text>分析中...</text>
            </view>

            <view class="error" v-else-if="error">
                <icon type="warn" size="64"></icon>
                <text>分析失败，请重试</text>
            </view>

            <block v-else>
                <!-- 当前问卷分析 -->
                <view class="analysis-card current-analysis">
                    <view class="card-title">当前问卷分析</view>

                    <view class="score-section" v-if="currentAnalysis.summary">
                        <view class="progress-container">
                            <canvas canvas-id="progressBar" class="progress-canvas"></canvas>
                            <view class="score-text">
                                <text class="score">{{ currentAnalysis.summary.score }}</text>
                                <text class="max-score">/{{ currentAnalysis.summary.max_score }}</text>
                            </view>
                        </view>

                        <view class="interpretation">
                            <text class="level-label">{{ currentAnalysis.summary.interpretation }}</text>
                            <view class="levels-list">
                                <view class="level-item" v-for="(item, index) in currentAnalysis.summary.levels" :key="index">
                                    <view class="level-dot"></view>

                                    <text>{{ item.label }} ({{ item.from }}-{{ item.to }}分)</text>
                                </view>
                            </view>
                        </view>
                    </view>

                    <view class="components-section" v-if="currentAnalysis.details">
                        <view class="component-list">
                            <view class="component-item" v-for="(item, index) in currentAnalysis.details.components" :key="index">
                                <view class="component-header">
                                    <text class="component-name">{{ item.name }}</text>
                                    <text class="component-score">{{ item.score }}/{{ item.max_score }}</text>
                                </view>

                                <view class="progress-bar">
                                    <view class="progress" :style="'width: ' + (item.score / item.max_score) * 100 + '%'"></view>
                                </view>
                            </view>
                        </view>
                    </view>
                </view>

                <!-- 综合分析 -->
                <view class="analysis-card combined-analysis" v-if="combinedAnalysis">
                    <view class="card-title">综合诊断分析</view>

                    <view class="summary-section">
                        <text class="summary-text">{{ combinedAnalysis.summary }}</text>
                    </view>

                    <view class="predictions-section">
                        <view class="prediction-list">
                            <view class="prediction-item" v-for="(item, index) in combinedAnalysis.predict" :key="index">
                                <view class="prediction-bar">
                                    <view class="prediction-progress" :style="'width: ' + item.probability * 100 + '%'"></view>
                                    <text class="prediction-label">{{ item.diagnosis }}</text>
                                    <text class="prediction-probability">{{ item.probability * 100 }}%</text>
                                </view>
                            </view>
                        </view>
                    </view>
                </view>
            </block>
        </view>
    </view>
</template>

<script>
import progressBar from '@/components/progress-bar/progress-bar';
// diagnosis.js
export default {
    components: {
        progressBar
    },
    data() {
        return {
            currentAnalysis: null,
            combinedAnalysis: null,
            loading: true,
            error: false,
            currentStep: 3,
            progressPercent: 0,
            score: '',
            max_score: '',
            interpretation: '',
            levels: [],
            components: []
        };
    },
    onLoad: function () {
        const app = getApp();
        const currentAnswers = app.globalData.selectedAnswers;
        const questionnaireName = app.globalData.schema_name;
        const sessionId = app.globalData.session_id;
        console.log(currentAnswers);
        // 获取当前问卷分析
        this.getCurrentAnalysis(sessionId, questionnaireName, currentAnswers);
        // 获取综合分析
        this.getCombinedAnalysis(sessionId, app.globalData.scaleResults);
    },
    methods: {
        // 更新步骤的方法
        updateStep(step) {
            this.setData({
                currentStep: step
            });
        },

        getCurrentAnalysis: function (sessionId, questionnaireName, answers) {
            uni.request({
                url: `http://113.44.52.217:5000/scales/${sessionId}/${questionnaireName}`,
                method: 'POST',
                data: answers,
                success: (res) => {
                    this.setData({
                        currentAnalysis: res.data,
                        loading: false
                    });

                    // 计算进度条颜色
                    if (res.data.summary) {
                        const score = res.data.summary.score;
                        const maxScore = res.data.summary.max_score;
                        const percentage = (score / maxScore) * 100;
                        this.drawProgressBar(percentage);
                    }
                },
                fail: (error) => {
                    console.error('Failed to get current analysis:', error);
                    this.setData({
                        error: true,
                        loading: false
                    });
                }
            });
        },

        getCombinedAnalysis: function (sessionId, scaleResults) {
            uni.request({
                url: `http://113.44.52.217:5000/scales/${sessionId}`,
                method: 'POST',
                data: scaleResults,
                success: (res) => {
                    this.setData({
                        combinedAnalysis: res.data
                    });
                },
                fail: (error) => {
                    console.error('Failed to get combined analysis:', error);
                }
            });
        },

        drawProgressBar: function (percentage) {
            const ctx = uni.createCanvasContext('progressBar');
            const centerX = 75;
            const centerY = 75;
            const radius = 60;

            // 绘制背景圆环
            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
            ctx.setLineWidth(10);
            ctx.setStrokeStyle('#E5E5E5');
            ctx.stroke();

            // 绘制进度圆环
            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, -Math.PI / 2, -Math.PI / 2 + (2 * Math.PI * percentage) / 100);
            ctx.setLineWidth(10);
            ctx.setStrokeStyle(this.getColorByPercentage(percentage));
            ctx.stroke();
            ctx.draw();
        },

        getColorByPercentage: function (percentage) {
            if (percentage <= 30) {
                return '#4CAF50';
            }
            if (percentage <= 70) {
                return '#FFC107';
            }
            return '#F44336';
        }
    }
};
</script>
<style>
@import './diagnosis.css';
</style>
