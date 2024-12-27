<template>
    <!-- progress-bar.wxml -->
    <view class="nav-container">
        <view class="progress-bar">
            <view class="progress-track">
                <view class="progress-fill" :style="'width: ' + currentStep * 20 + '%'"></view>
            </view>

            <view class="steps-wrapper">
                <view
                    :class="'step-item ' + (currentStep >= index ? 'completed' : '') + ' ' + (currentStep == index ? 'current' : '')"
                    @tap="navigateToStep"
                    :data-path="item.path"
                    :data-index="index"
                    v-for="(item, index) in steps"
                    :key="index"
                >
                    <view class="step-circle">
                        <view class="circle-content">
                            <text v-if="currentStep > index" class="check-icon">✓</text>
                            <text v-else>{{ index + 1 }}</text>
                        </view>
                    </view>

                    <view class="step-label">{{ item.name }}</view>
                </view>
            </view>
        </view>

        <view class="control-buttons">
            <button :class="'btn prev ' + (currentStep === 0 ? 'disabled' : '')" @tap="handlePrevStep" :disabled="currentStep === 0">
                <text class="btn-icon">←</text>
                <text>上一步</text>
            </button>

            <button :class="'btn skip ' + (currentStep === 0 || currentStep === 3 ? 'disabled' : '')" @tap="handleSkip" :disabled="currentStep === 0 || currentStep === 3">
                <text class="btn-icon">⤵</text>
                <text>跳过</text>
            </button>
            <button :class="'btn next ' + (currentStep === 2 ? 'disabled' : '')" @tap="handleNextStep">
                <text>下一步</text>
                <text class="btn-icon">→</text>
            </button>
        </view>
    </view>
</template>

<script>
// components/progress-bar/progress-bar.js
export default {
    data() {
        return {
            steps: [
                {
                    id: 0,
                    name: '症状选择',
                    path: '/pages/chooseSymptoms/chooseSymptoms'
                },
                {
                    id: 1,
                    name: '初步诊断',
                    path: '/pages/diagnosisResult/diagnosisResult'
                },
                {
                    id: 2,
                    name: '问卷调查',
                    path: '/pages/test-questions/test-questions'
                },
                {
                    id: 3,
                    name: '问卷分析',
                    path: '/pages/diagnosis/diagnosis'
                },
                {
                    id: 4,
                    name: '病历上传',
                    path: '/pages/upload/upload'
                },
                {
                    id: 5,
                    name: '最终诊断',
                    path: '/pages/analysis_all/analysis_all'
                }
            ]
        };
    },
    props: {
        currentStep: {
            type: Number,
            default: 0
        }
    },
    methods: {
        handlePrevStep() {
            const currentStep = this.currentStep;
            const app = getApp();
            switch (currentStep) {
                case 1:
                    // 在初步诊断页面
                    uni.navigateTo({
                        url: '/pages/chooseSymptoms/chooseSymptoms'
                    });
                    break;
                case 2:
                    // 在问卷调查页面
                    if (app.globalData.indexNext === 0) {
                        uni.navigateTo({
                            url: '/pages/diagnosisResult/diagnosisResult'
                        });
                    } else {
                        uni.navigateTo({
                            url: '/pages/diagnosis/diagnosis'
                        });
                    }
                    break;
                case 3:
                    // 在问卷分析页面
                    app.globalData.indexNext -= 1;
                    uni.navigateTo({
                        url: `/pages/test-questions/test-questions?id=${app.globalData.relatedScalesIndex[app.globalData.indexNext]}`
                    });
                    break;
                case 4:
                    // 在病历上传页面
                    uni.navigateTo({
                        url: '/pages/diagnosis/diagnosis'
                    });
                    break;
            }
        },

        handleNextStep() {
            const currentStep = this.currentStep;
            const app = getApp();
            switch (currentStep) {
                case 0:
                    // 在症状选择页面
                    if (app.globalData.symptoms.length === 0) {
                        uni.showToast({
                            title: '请至少选择一个症状',
                            icon: 'none',
                            duration: 2000
                        });
                        return;
                    }
                    uni.navigateTo({
                        url: '/pages/diagnosisResult/diagnosisResult'
                    });
                    break;
                case 1:
                    // 在初步诊断页面
                    if (app.globalData.indexNext < app.globalData.relatedScalesIndex.length) {
                        uni.navigateTo({
                            url: `/pages/test-questions/test-questions?id=${app.globalData.relatedScalesIndex[app.globalData.indexNext]}`
                        });
                    } else {
                        uni.navigateTo({
                            url: '/pages/upload/upload'
                        });
                    }
                    break;
                case 3:
                    // 在问卷分析页面
                    console.log(app.globalData.indexNext);
                    console.log(app.globalData.relatedScalesIndex);
                    if (app.globalData.indexNext < app.globalData.relatedScalesIndex.length) {
                        uni.navigateTo({
                            url: `/pages/test-questions/test-questions?id=${app.globalData.relatedScalesIndex[app.globalData.indexNext]}`
                        });
                    } else {
                        uni.navigateTo({
                            url: '/pages/upload/upload'
                        });
                    }
                    break;
                case 4:
                    // 在病历上传页面
                    uni.navigateTo({
                        url: '/pages/analysis_all/analysis_all'
                    });
                    break;
            }
        },

        handleSkip() {
            const currentStep = this.currentStep;
            const app = getApp();
            switch (currentStep) {
                case 1:
                    // 在初步诊断页面
                    uni.navigateTo({
                        url: '/pages/upload/upload'
                    });
                    break;
                case 2:
                    // 在问卷调查页面
                    if (app.globalData.indexNext < app.globalData.relatedScalesIndex.length - 1) {
                        app.globalData.indexNext += 1;
                        uni.navigateTo({
                            url: `/pages/test-questions/test-questions?id=${app.globalData.relatedScalesIndex[app.globalData.indexNext]}`
                        });
                    } else {
                        uni.navigateTo({
                            url: '/pages/upload/upload'
                        });
                    }
                    break;
                case 4:
                    // 在病历上传页面
                    uni.navigateTo({
                        url: '/pages/analysis_all/analysis_all'
                    });
                    break;
            }
        },

        navigateToStep() {
            console.log('占位：函数 navigateToStep 未声明');
        }
    },
    created: function () {}
};
</script>
<style>
@import './progress-bar.css';
</style>
