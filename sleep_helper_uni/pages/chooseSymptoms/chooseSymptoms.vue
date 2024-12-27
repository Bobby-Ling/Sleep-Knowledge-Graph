<template>
    <view>
        <!-- chooseSymptoms.wxml -->

        <progress-bar :current-step="currentStep" />
        <view class="page-container">
            <view class="header">
                <view class="header-content">
                    <text class="page-title">症状选择</text>
                    <text class="page-subtitle">若您存在下述问题，我们建议您完成标签内所示的问卷完成自查</text>
                </view>
                <!-- <button class="complete-button" bindtap="viewDiagnosis">下一步</button> -->
            </view>

            <view class="content">
                <block v-for="(item, index) in symptomCategories" :key="index">
                    <view class="category-section">
                        <view class="category-title">{{ item.category }}</view>
                        <scroll-view class="symptoms-scroll" :scroll-x="true" :enhanced="true" :show-scrollbar="false">
                            <view class="symptoms-container">
                                <view
                                    :class="'symptom-card ' + (utils.isSelected(selectedSymptoms, symptom.internal_name) ? 'selected' : '')"
                                    @tap="toggleSymptom"
                                    :data-name="symptom.internal_name"
                                    v-for="(symptom, index1) in item.symptoms"
                                    :key="index1"
                                >
                                    <view class="symptom-content">
                                        <view class="symptom-name">{{ symptom.name }}</view>
                                        <view class="symptom-description">{{ symptom.description }}</view>
                                        <view class="related-scales" v-if="symptom.related_scales.length > 0">
                                            <view :class="'scale-tag ' + utils.getTagClass(index)" v-for="(scale, index2) in symptom.related_scales" :key="index2">
                                                {{ scale }}
                                            </view>
                                        </view>
                                    </view>
                                </view>
                            </view>
                        </scroll-view>
                    </view>
                </block>
            </view>
        </view>
    </view>
</template>
<script module="utils" lang="wxs" src="@/pages/chooseSymptoms/utils.wxs"></script>
<script>
import progressBar from '@/components/progress-bar/progress-bar';
// chooseSymptoms.js
export default {
    components: {
        progressBar
    },
    data() {
        return {
            symptomCategories: [],
            selectedSymptoms: [],
            currentStep: 0,

            symptom: {
                internal_name: '',
                name: '',
                description: '',
                related_scales: []
            },

            scale: ''
        };
    },
    onLoad: function () {
        this.fetchSymptoms();
    },
    methods: {
        // 更新步骤的方法
        updateStep(step) {
            this.setData({
                currentStep: step
            });
        },

        fetchSymptoms: function () {
            uni.request({
                url: 'http://113.44.52.217:5000/query',
                method: 'GET',
                success: (res) => {
                    this.setData({
                        symptomCategories: res.data
                    });
                },
                fail: (error) => {
                    console.error('获取症状数据失败:', error);
                    uni.showToast({
                        title: '数据加载失败',
                        icon: 'none'
                    });
                }
            });
        },

        isSelected: function (symptomName) {
            console.log(this.selectedSymptoms.includes(symptomName));
            return this.selectedSymptoms.includes(symptomName);
        },

        toggleSymptom: function (e) {
            const symptomName = e.currentTarget.dataset.name;
            const selectedSymptoms = [...this.selectedSymptoms];
            const index = selectedSymptoms.indexOf(symptomName);
            if (index === -1) {
                selectedSymptoms.push(symptomName);
            } else {
                selectedSymptoms.splice(index, 1);
            }
            console.log('选中的症状：', selectedSymptoms); // 添加调试信息
            this.setData({
                selectedSymptoms: selectedSymptoms
            });
            getApp().globalData.symptoms = selectedSymptoms;
        },

        viewDiagnosis: function () {
            if (this.selectedSymptoms.length === 0) {
                uni.showToast({
                    title: '请至少选择一个症状',
                    icon: 'none',
                    duration: 2000
                });
                return;
            }

            // 将选择的症状保存到全局数据
            getApp().globalData.symptoms = this.selectedSymptoms;
            uni.showToast({
                title: '保存成功',
                icon: 'success',
                duration: 1500,
                success: () => {
                    setTimeout(() => {
                        // 跳转到诊断结果页面
                        uni.navigateTo({
                            url: '/pages/diagnosisResult/diagnosisResult'
                        });
                    }, 1500);
                }
            });
        }
    }
};
</script>
<style>
@import './chooseSymptoms.css';
</style>
