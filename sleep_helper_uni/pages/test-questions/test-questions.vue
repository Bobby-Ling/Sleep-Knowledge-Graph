<template>
    <view>
        <!-- pages/questionnaire/questionnaire.wxml -->
        <progress-bar :current-step="currentStep" />
        <view class="page-container">
            <view class="header">
                <view class="main-title">{{ currentQuestionnaire }}失眠量表</view>
                <view class="sub-title">{{ description }}</view>
            </view>

            <view class="questions-container">
                <view class="question-card" v-for="(item, questionIndex) in questions" :key="questionIndex">
                    <view class="question-number">问题 {{ questionIndex + 1 }}</view>

                    <view class="question-content">{{ item.title }}</view>

                    <!-- 选择题 -->

                    <block v-if="item.type === 'radiogroup'">
                        <view class="options-grid">
                            <view
                                :class="'option-card ' + (selectedAnswers[questionIndex] === choice.value ? 'selected' : '')"
                                @tap="handleOptionSelect"
                                :data-question-index="questionIndex"
                                :data-value="choice.value"
                                v-for="(choice, choiceIndex) in item.choices"
                                :key="choiceIndex"
                            >
                                <text>{{ choice.text }}</text>
                            </view>
                        </view>
                    </block>

                    <!-- 文本、时间和数字输入 -->

                    <block v-if="item.type === 'text'">
                        <!-- 时间选择 -->
                        <block v-if="item.inputType === 'time'">
                            <picker mode="time" :value="selectedAnswers[questionIndex]" @change="handleTimeChange" :data-question-index="questionIndex" class="picker-container">
                                <view class="picker-value">
                                    <text v-if="selectedAnswers[questionIndex]">{{ selectedAnswers[questionIndex] }}点</text>
                                    <text v-else class="placeholder">请选择时间</text>
                                    <image class="picker-arrow" src="/static/assets/icons/arrow-down.png" mode="aspectFit"></image>
                                </view>
                            </picker>
                        </block>

                        <!-- 数字选择 -->
                        <block v-else-if="item.inputType === 'number'">
                            <picker
                                mode="selector"
                                :range="[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]"
                                :value="selectedAnswers[questionIndex]"
                                @change="handleNumberChange"
                                :data-question-index="questionIndex"
                                class="picker-container"
                            >
                                <view class="picker-value">
                                    <text v-if="selectedAnswers[questionIndex] !== null">{{ selectedAnswers[questionIndex] }}小时</text>
                                    <text v-else class="placeholder">请选择小时数</text>
                                    <image class="picker-arrow" src="/static/assets/icons/arrow-down.png" mode="aspectFit"></image>
                                </view>
                            </picker>
                        </block>

                        <!-- 普通文本输入 -->
                        <block v-else>
                            <view class="text-input-container">
                                <textarea
                                    class="text-input"
                                    placeholder="请输入您的答案"
                                    :value="selectedAnswers[questionIndex]"
                                    @input="handleTextInput"
                                    :data-question-index="questionIndex"
                                    maxlength="-1"
                                    auto-height
                                ></textarea>
                            </view>
                        </block>
                    </block>
                </view>
            </view>

            <view class="footer">
                <view class="submit-button" @tap="submitQuestionnaire">
                    <text>提交评估</text>
                </view>
            </view>
        </view>
    </view>
</template>

<script>
import progressBar from '@/components/progress-bar/progress-bar';
// pages/questionnaire/questionnaire.js
export default {
    components: {
        progressBar
    },
    data() {
        return {
            questions: [],
            selectedAnswers: [],
            currentQuestionnaire: null,
            testId: null,
            description: null,
            type: null,
            currentStep: 2,

            // 添加测试模式标志
            testMode: true,

            // 设置为true开启测试模式，false关闭
            // 测试时统一选择的选项值
            testValue: 1,

            questionIndex: 0,

            choice: {
                value: '',
                text: ''
            },

            choiceIndex: 0
        };
    },
    onLoad: function (options) {
        // 获取url中的id
        const testId = options.id;
        this.setData({
            testId: testId
        });
        this.fetchQuestionnaire();
    },
    methods: {
        // 更新步骤的方法
        updateStep(step) {
            this.setData({
                currentStep: step
            });
        },

        fetchQuestionnaire: function () {
            const testId = this.testId - 1;
            uni.request({
                url: 'http://113.44.52.217:5000/scales',
                method: 'GET',
                success: (res) => {
                    const firstQuestionnaire = res.data[testId];
                    const questions = firstQuestionnaire.content.pages[0].elements;

                    // 在测试模式下，自动填充所有答案
                    let initialAnswers = new Array(questions.length).fill(null);
                    if (this.testMode) {
                        initialAnswers = new Array(questions.length).fill(this.testValue);
                    }
                    this.setData({
                        questions: questions,
                        currentQuestionnaire: firstQuestionnaire.name,
                        selectedAnswers: initialAnswers,
                        description: res.data[testId].content.description
                    });
                    console.log(this.questions);
                },
                fail: (error) => {
                    console.error('Failed to fetch questionnaire:', error);
                    uni.showToast({
                        title: '获取问卷失败',
                        icon: 'none'
                    });
                }
            });
        },

        handleOptionSelect: function (e) {
            const { questionIndex, value } = e.currentTarget.dataset;
            const newSelectedAnswers = [...this.selectedAnswers];

            // 如果点击的是已选中的选项，则取消选择
            if (newSelectedAnswers[questionIndex] === parseInt(value)) {
                newSelectedAnswers[questionIndex] = null;
            } else {
                // 否则选中新的选项
                newSelectedAnswers[questionIndex] = parseInt(value);
            }
            this.setData({
                selectedAnswers: newSelectedAnswers
            });
            console.log(this.selectedAnswers);
        },

        // 处理文本输入
        handleTextInput(e) {
            const { questionIndex } = e.currentTarget.dataset;
            const value = e.detail.value; // 从 e.detail.value 获取输入值
            const newSelectedAnswers = [...this.selectedAnswers];
            newSelectedAnswers[questionIndex] = parseInt(value);
            this.setData({
                selectedAnswers: newSelectedAnswers
            });
            console.log(this.selectedAnswers);
        },

        handleTimeChange: function (e) {
            const questionIndex = e.currentTarget.dataset.questionIndex;
            const value = e.detail.value;
            const newSelectedAnswers = [...this.selectedAnswers];
            newSelectedAnswers[questionIndex] = parseInt(value);
            this.setData({
                selectedAnswers: newSelectedAnswers
            });
            console.log(this.selectedAnswers);
        },

        handleNumberChange: function (e) {
            const questionIndex = e.currentTarget.dataset.questionIndex;
            const value = e.detail.value;
            const newSelectedAnswers = [...this.selectedAnswers];
            newSelectedAnswers[questionIndex] = parseInt(value);
            this.setData({
                selectedAnswers: newSelectedAnswers
            });
            console.log(this.selectedAnswers);
        },

        submitQuestionnaire: function () {
            // 检查是否所有问题都已回答
            if (this.selectedAnswers.some((answer) => answer === null)) {
                uni.showToast({
                    title: '请回答所有问题',
                    icon: 'none'
                });
                return;
            }

            // 更新全局数据
            const app = getApp();
            app.globalData.scaleResults[this.currentQuestionnaire] = this.selectedAnswers;
            console.log(app.globalData.scaleResults);
            app.globalData.selectedAnswers = this.selectedAnswers;
            app.globalData.schema_name = this.currentQuestionnaire;
            app.globalData.indexNext += 1;
            // 跳转到诊断页面
            uni.navigateTo({
                url: '/pages/diagnosis/diagnosis'
            });
        }
    }
};
</script>
<style>
@import './test-questions.css';
</style>
