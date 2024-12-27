<template>
    <view>
        <!-- diagnosisResult.wxml -->
        <progress-bar :current-step="currentStep" />
        <view class="container">
            <block v-if="!loading && relatedScales.length > 0">
                <view class="questionnaire-section">
                    <view class="questionnaire-header">
                        <view class="header-content">
                            <text class="header-title">推荐问卷评估</text>
                            <text class="header-subtitle">基于您的症状，我们建议您完成以下问卷进行深入评估</text>
                        </view>
                        <view class="header-icon">📋</view>
                    </view>

                    <scroll-view :scroll-x="true" class="questionnaire-scroll" :enhanced="true" :show-scrollbar="false">
                        <view class="questionnaire-list">
                            <view
                                class="questionnaire-card"
                                @tap="navigateToQuestionnaire"
                                :data-test-id="relatedScalesIndex[index]"
                                v-for="(item, index) in relatedScales"
                                :key="index"
                            >
                                <view class="card-content">
                                    <view class="questionnaire-icon">
                                        <text class="icon-text">{{ item[0] }}</text>
                                    </view>
                                    <text class="questionnaire-name">{{ item }}</text>
                                    <text class="start-text">开始评估</text>
                                </view>

                                <view class="card-decoration"></view>
                            </view>
                        </view>
                    </scroll-view>
                </view>
            </block>

            <view v-if="loading" class="loading">
                <text>正在分析症状...</text>
            </view>

            <block v-else>
                <view class="disease-card" v-for="(item, index) in diagnosisResults" :key="index">
                    <view class="disease-header">
                        <text class="disease-name">{{ item.Disease.name }}</text>
                        <text class="match-percentage">匹配度: {{ item.MatchPercentage }}%</text>
                    </view>

                    <text v-if="item.Disease.description" class="disease-description">
                        {{ item.Disease.description }}
                    </text>

                    <view
                        v-if="item.Disease.severity"
                        :class="
                            'severity-indicator ' + (item.Disease.severity === '轻度' ? 'severity-low' : item.Disease.severity === '中度' ? 'severity-medium' : 'severity-high')
                        "
                    >
                        严重程度: {{ item.Disease.severity }}
                    </view>

                    <view class="section-title">匹配症状 ({{ item.MatchedSymptomCount }}/{{ item.TotalSymptoms }})</view>

                    <view class="matched-symptoms">
                        <view class="symptom-tag" v-for="(symptom, index1) in item.MatchedSymptoms" :key="index1">
                            {{ symptom.name }}
                        </view>
                    </view>

                    <block v-if="item.DrugTreatments.length > 0">
                        <view class="section-title">药物治疗</view>
                        <view class="treatment-item" v-for="(drug, index1) in item.DrugTreatments" :key="index1">
                            <view class="treatment-name">{{ drug.name }}</view>

                            <view class="treatment-detail">
                                {{ drug.description }}
                                <block v-if="drug.dosage">【用量】{{ drug.dosage }}</block>
                            </view>
                        </view>
                    </block>

                    <block v-if="item.NonDrugTreatments.length > 0">
                        <view class="section-title">非药物治疗</view>
                        <view class="treatment-item" v-for="(treatment, index1) in item.NonDrugTreatments" :key="index1">
                            <view class="treatment-name">{{ treatment.name }}</view>

                            <view class="treatment-detail">{{ treatment.description }}</view>
                        </view>
                    </block>

                    <block v-if="item.RequiredExaminations.length > 0">
                        <view class="section-title">建议检查</view>
                        <view class="examination-item" v-for="(exam, index1) in item.RequiredExaminations" :key="index1">
                            <view class="examination-info">
                                <view class="examination-name">{{ exam.name }}</view>
                                <view class="examination-desc">{{ exam.description }}</view>
                            </view>
                        </view>
                    </block>
                </view>
            </block>
        </view>
    </view>
</template>

<script>
import progressBar from '@/components/progress-bar/progress-bar';
// diagnosisResult.js
export default {
    components: {
        progressBar
    },
    // onLoad: function() {
    data() {
        return {
            diagnosisResults: [],
            loading: true,
            session_id: '',
            currentStep: 1,
            relatedScales: [],
            relatedScalesIndex: [],

            symptom: {
                name: ''
            },

            drug: {
                name: '',
                dosage: ''
            },

            treatment: {
                name: '',
                description: ''
            },

            exam: {
                name: '',
                description: ''
            }
        };
    },
    //   this.getOpenId().then(() => {
    //     this.createSession().then(() => {
    //       this.submitSymptoms();
    //     });
    //   });
    // },
    onLoad: function () {
        // 获取全局的session_id
        const app = getApp();
        this.setData(
            {
                session_id: app.globalData.session_id
            },
            () => {
                this.createSession().then(() => {
                    this.submitSymptoms();
                });
            }
        );
    },
    methods: {
        // getOpenId: function() {
        //   return new Promise((resolve, reject) => {
        //     wx.login({
        //       success: (res) => {
        //         if (res.code) {
        //           // 这里需要替换成你的获取openid的接口
        //           wx.request({
        //             url: 'YOUR_SERVER_API/getOpenId',
        //             data: {
        //               code: res.code
        //             },
        //             success: (res) => {
        //               this.setData({
        //                 openid: res.data.openid
        //               });
        //               resolve();
        //             },
        //             fail: (err) => {
        //               console.error('获取openid失败:', err);
        //               reject(err);
        //             }
        //           });
        //         }
        //       }
        //     });
        //   });
        // },

        createSession: function () {
            return new Promise((resolve, reject) => {
                uni.request({
                    url: `http://113.44.52.217:5000/sessions/${this.session_id}`,
                    method: 'POST',
                    header: {
                        'content-type': 'application/json'
                    },
                    data: {
                        title: 'User Session'
                    },
                    success: (res) => {
                        this.setData({
                            session_id: res.data.session_id
                        });
                        resolve();
                    },
                    fail: (err) => {
                        console.error('创建session失败:', err);
                        reject(err);
                    }
                });
            });
        },

        submitSymptoms: function () {
            const symptoms = getApp().globalData.symptoms;
            uni.request({
                url: `http://113.44.52.217:5000/query/${this.session_id}`,
                method: 'POST',
                header: {
                    'content-type': 'application/json'
                },
                data: symptoms,
                success: (res) => {
                    this.setData({
                        diagnosisResults: res.data.result[0],
                        relatedScales: res.data.related_scales || [],
                        relatedScalesIndex: res.data.related_scales_index || [],
                        loading: false
                    });
                    const app = getApp();
                    app.globalData.relatedScalesIndex = res.data.related_scales_index || [];
                    console.log('诊断结果:', res.data.result);
                    console.log('相关量表索引已更新到全局数据:', app.globalData.relatedScalesIndex);
                },
                fail: (err) => {
                    console.error('提交症状失败:', err);
                    this.setData({
                        loading: false
                    });
                    uni.showToast({
                        title: '诊断失败',
                        icon: 'error'
                    });
                }
            });
        },

        // 新增跳转到问卷的方法
        navigateToQuestionnaire: function (e) {
            const { testId } = e.currentTarget.dataset;
            uni.navigateTo({
                url: `/pages/test-questions/test-questions?id=${testId}`
            });
        }
    }
};
</script>
<style>
@import './diagnosisResult.css';
</style>
