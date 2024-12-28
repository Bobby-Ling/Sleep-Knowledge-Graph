<template>
    <view>
        <view v-if="loading" class="loading-container">
            <view class="loading-spinner"></view>
            <text class="loading-text">正在加载分析结果...</text>
        </view>

        <view class="container" v-else>
            <!-- 返回按钮 -->
            <view class="back-button" @tap="goBack">
                <image class="back-icon" src="/static/assets/icons/back.png" mode="aspectFit"></image>
                <text>返回首页</text>
            </view>

            <!-- 顶部标签栏 -->
            <view class="tab-header">
                <scroll-view :scroll-x="true" class="tab-scroll" :scroll-with-animation="true" :scroll-left="scrollLeft">
                    <view class="tab-bar">
                        <view :class="'tab-item ' + (activeTab === index ? 'active' : '')" @tap="switchTab" :data-index="index" v-for="(item, index) in tabs" :key="index">
                            <image class="tab-icon" :src="item.icon" mode="aspectFit"></image>

                            <view class="tab-title">{{ item.title }}</view>

                            <view class="tab-line" v-if="activeTab === index"></view>
                        </view>
                    </view>
                </scroll-view>
            </view>

            <swiper class="content-swiper" :current="activeTab" @change="swiperChange">
                <!-- 基本信息 -->
                <swiper-item>
                    <scroll-view :scroll-y="true" class="tab-content">
                        <view class="profile-card">
                            <view class="profile-header">
                                <image class="avatar" src="/static/assets/images/default-avatar.png" mode="aspectFit"></image>
                                <view class="profile-info">
                                    <text class="profile-name">{{ analysis.patient_info.name }}</text>
                                    <text class="profile-basic">{{ analysis.patient_info.age }}岁 | {{ analysis.patient_info.gender }}</text>
                                </view>
                            </view>
                        </view>

                        <view class="section-card">
                            <view class="section-title">
                                <image class="section-icon" src="/static/images/report.png" mode="aspectFit"></image>
                                <text>病史信息</text>
                            </view>
                            <view class="info-list">
                                <view class="info-item">
                                    <text class="info-label">病程时长</text>
                                    <text class="info-value">{{ analysis.patient_info.history.insomnia_duration }}</text>
                                </view>
                                <view class="info-item">
                                    <text class="info-label">加重时间</text>
                                    <text class="info-value">{{ analysis.patient_info.history.aggravation_period }}</text>
                                </view>
                                <view class="info-item">
                                    <text class="info-label">近期变化</text>
                                    <text class="info-value">{{ analysis.patient_info.history.recent_changes }}</text>
                                </view>
                            </view>
                        </view>

                        <view class="section-card">
                            <view class="section-title">
                                <image
                                    class="section-icon"
                                    src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/symptoms.png?sign=0e194cef93ce9a11ba86d228e953c77e&t=1735287638"
                                    mode="aspectFit"
                                ></image>
                                <text>主诉症状</text>
                            </view>
                            <view class="tag-list">
                                <view :class="'tag tag-' + (index % 5)" v-for="(item, index) in analysis.patient_info.main_complaints" :key="index">
                                    {{ item }}
                                </view>
                            </view>
                        </view>
                    </scroll-view>
                </swiper-item>

                <!-- 症状分析 -->
                <swiper-item>
                    <scroll-view :scroll-y="true" class="tab-content">
                        <view class="symptom-grid">
                            <view class="symptom-card" v-for="(item, index) in analysis.symptoms" :key="index">
                                <view class="symptom-header">
                                    <text class="symptom-name">{{ item.name }}</text>
                                    <view
                                        :class="
                                            'severity-tag ' +
                                            (item.severity === '轻度' || item.severity === '无' || item.severity === '轻' || item.severity === '轻微'
                                                ? 'severity-light'
                                                : item.severity === '中' || item.severity === '中等'
                                                ? 'severity-medium'
                                                : 'severity-serious')
                                        "
                                    >
                                        {{ item.severity }}
                                    </view>
                                </view>

                                <!-- <view class="symptom-details">
              <view class="detail-row">
                <image class="detail-icon" src="/assets/icons/frequency.png" mode="aspectFit"></image>
                <text>发生频率：{{item.frequency}}</text>
              </view>
              <view class="detail-row">
                <image class="detail-icon" src="/assets/icons/description.png" mode="aspectFit"></image>
                <text>{{item.description}}</text>
              </view>
            </view> -->
                            </view>
                        </view>
                    </scroll-view>
                </swiper-item>

                <!-- 疾病分析 -->
                <swiper-item>
                    <scroll-view :scroll-y="true" class="tab-content">
                        <view class="disease-card" v-for="(item, index) in analysis.possible_diseases" :key="index">
                            <view class="disease-header">
                                <view class="disease-title-area">
                                    <text class="disease-name">{{ item.name }}</text>
                                    <view :class="'severity-tag ' + (item.severity ? 'severity-' + item.severity : '')">
                                        {{ item.severity || '待评估' }}
                                    </view>
                                </view>
                                <view class="disease-description">{{ item.description }}</view>
                            </view>

                            <view class="treatment-section">
                                <!-- 药物治疗 -->
                                <block v-if="item.treatments.drugs.length > 0">
                                    <view class="treatment-title">
                                        <image
                                            class="treatment-icon"
                                            src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/user.png?sign=fd81da8ef82b0dc196669b03c5a88fb4&t=1735287653"
                                            mode="aspectFit"
                                        ></image>
                                        <text>药物治疗方案</text>
                                    </view>
                                    <view class="drugs-container">
                                        <view class="drug-card" v-for="(drug, index1) in item.treatments.drugs" :key="index1">
                                            <view class="drug-header">
                                                <text class="drug-name">{{ drug.name }}</text>
                                                <view class="drug-tag">{{ drug.route }}</view>
                                            </view>

                                            <view class="drug-content">
                                                <view class="drug-info-row">
                                                    <view class="drug-info-item">
                                                        <text class="info-label">用量：</text>
                                                        <text class="info-value">{{ drug.dosage || '无' }}</text>
                                                    </view>
                                                    <view class="drug-info-item">
                                                        <text class="info-label">用法：</text>
                                                        <text class="info-value">{{ drug.frequency }}</text>
                                                    </view>
                                                </view>
                                                <view class="drug-description">{{ drug.description }}</view>
                                            </view>
                                        </view>
                                    </view>
                                </block>

                                <!-- 非药物治疗 -->
                                <block v-if="item.treatments.non_drug.length > 0">
                                    <view class="treatment-title">
                                        <image
                                            class="treatment-icon"
                                            src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/user.png?sign=fd81da8ef82b0dc196669b03c5a88fb4&t=1735287653"
                                            mode="aspectFit"
                                        ></image>
                                        <text>非药物治疗方案</text>
                                    </view>
                                    <view class="therapy-container">
                                        <view class="therapy-card" v-for="(therapy, index1) in item.treatments.non_drug" :key="index1">
                                            <text class="therapy-name">{{ therapy.name }}</text>

                                            <text class="therapy-description">{{ therapy.description }}</text>
                                        </view>
                                    </view>
                                </block>
                            </view>
                        </view>
                    </scroll-view>
                </swiper-item>

                <!-- 检查建议 -->
                <swiper-item>
                    <scroll-view :scroll-y="true" class="tab-content">
                        <view class="exam-grid">
                            <view :class="'exam-card bg-' + (index % 5)" v-for="(item, index) in analysis.recommended_examinations" :key="index">
                                <view class="exam-icon-container">
                                    <image class="exam-icon" :src="'/assets/icons/exam' + ((index % 5) + 1) + '.png'" mode="aspectFit"></image>
                                </view>

                                <view class="exam-content">
                                    <text class="exam-name">{{ item.name }}</text>
                                    <text class="exam-purpose">{{ item.purpose }}</text>
                                </view>
                            </view>
                        </view>
                    </scroll-view>
                </swiper-item>

                <!-- 治疗方案 -->
                <swiper-item>
                    <scroll-view :scroll-y="true" class="tab-content">
                        <view class="plan-section">
                            <view class="section-card">
                                <view class="section-title">
                                    <image
                                        class="section-icon"
                                        src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/exam.png?sign=87a31873fc4610bb53f7c826dcbcdaa4&t=1735287625"
                                        mode="aspectFit"
                                    ></image>
                                    <text>就诊建议</text>
                                </view>
                                <view class="department-card" v-for="(item, index) in analysis.recommended_departments" :key="index">
                                    <text class="department-name">{{ item.name }}</text>

                                    <text class="department-purpose">{{ item.purpose }}</text>
                                </view>
                            </view>

                            <view class="section-card">
                                <view class="section-title">
                                    <image
                                        class="section-icon"
                                        src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/treatment.png?sign=792bb0b6d4916c7aa2421f45fdd53d66&t=1735287662"
                                        mode="aspectFit"
                                    ></image>
                                    <text>治疗计划</text>
                                </view>
                                <view class="plan-list">
                                    <view class="plan-item" v-for="(item, index) in analysis.treatment_plan" :key="index">
                                        <text class="plan-dot">•</text>

                                        <text class="plan-text">{{ item }}</text>
                                    </view>
                                </view>
                            </view>

                            <view class="section-card">
                                <view class="section-title">
                                    <image
                                        class="section-icon"
                                        src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/environment.png?sign=fc1545f4ab32ddcf6ffa1aee7b5ab6d3&t=1735286896"
                                        mode="aspectFit"
                                    ></image>
                                    <text>生活建议</text>
                                </view>
                                <view class="suggestion-list">
                                    <view class="suggestion-item" v-for="(item, index) in analysis.additional_suggestions" :key="index">
                                        <text class="suggestion-dot">•</text>

                                        <text class="suggestion-text">{{ item }}</text>
                                    </view>
                                </view>
                            </view>
                        </view>
                    </scroll-view>
                </swiper-item>
            </swiper>

            <view class="ai-float-btn" @tap="goToAiConsult">
                <image class="ai-icon" src="/static/images/aiconsult.png" mode="aspectFit"></image>
                <text class="ai-text">AI助手咨询</text>
            </view>
        </view>

        <view v-if="!loading && !analysis" class="error-container">
            <icon type="warn" size="64" color="#999"></icon>
            <text class="error-text">加载失败</text>
            <button class="retry-btn" @tap="retryLoading">重试</button>
        </view>
    </view>
</template>

<script>
import progressBar from '@/components/progress-bar/progress-bar';
export default {
    components: {
        progressBar
    },
    data() {
        return {
            currentStep: 5,
            activeTab: 0,
            scrollLeft: 0,

            tabs: [
                {
                    title: '基本信息',
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/user.png?sign=fd81da8ef82b0dc196669b03c5a88fb4&t=1735287653'
                },
                {
                    title: '症状分析',
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/symptoms.png?sign=0e194cef93ce9a11ba86d228e953c77e&t=1735287638'
                },
                {
                    title: '疾病分析',
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/disease.png?sign=4ad20cc89485b3931b63e878b38b1889&t=1735287614'
                },
                {
                    title: '检查建议',
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/exam.png?sign=87a31873fc4610bb53f7c826dcbcdaa4&t=1735287625'
                },
                {
                    title: '治疗方案',
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/treatment.png?sign=792bb0b6d4916c7aa2421f45fdd53d66&t=1735287662'
                }
            ],

            analysis: null,
            loading: true,
            name: '',
            age: '',
            gender: '',

            history: {
                insomnia_duration: '',
                aggravation_period: '',
                recent_changes: ''
            },

            main_complaints: [],

            drug: {
                name: '',
                route: '',
                dosage: '',
                frequency: '',
                description: ''
            },

            therapy: {
                name: '',
                description: ''
            }
        };
    },
    onLoad: function () {
        this.fetchAnalysisData();
    },
    methods: {
        fetchAnalysisData: function () {
            const sessionId = getApp().globalData.session_id;
            uni.request({
                url: `http://113.44.52.217:5000/analysis/${sessionId}`,
                method: 'GET',
                timeout: 180000,
                success: (res) => {
                    if (res.statusCode === 200) {
                        try {
                            const result = typeof res.data === 'string' ? JSON.parse(res.data) : res.data;
                            console.log('Analysis data:', result.analysis);
                            this.setData({
                                analysis: result.analysis,
                                loading: false
                            });
                        } catch (e) {
                            console.log('CatchClause', e);
                            console.log('CatchClause', e);
                            console.error('Parse error:', e);
                            this.handleError('数据解析失败');
                        }
                    } else {
                        this.handleError('请求失败');
                    }
                },
                fail: (err) => {
                    console.error('Request error:', err);
                    this.handleError('网络请求失败');
                },
                complete: () => {
                    uni.hideLoading();
                }
            });
        },

        handleError: function (message) {
            uni.hideLoading();
            uni.showToast({
                title: message,
                icon: 'error',
                duration: 2000
            });
            this.setData({
                loading: false
            });
        },

        switchTab(e) {
            const index = e.currentTarget.dataset.index;
            this.setData({
                activeTab: index
            });
            this.updateScrollLeft(index);
        },

        swiperChange(e) {
            const index = e.detail.current;
            this.setData({
                activeTab: index
            });
            this.updateScrollLeft(index);
        },

        updateScrollLeft(index) {
            const query = uni.createSelectorQuery();
            query.select('.tab-item').boundingClientRect();
            query.exec((rect) => {
                if (rect[0]) {
                    const tabWidth = rect[0].width;
                    const scrollLeft = (index - 2) * tabWidth;
                    this.setData({
                        scrollLeft: scrollLeft > 0 ? scrollLeft : 0
                    });
                }
            });
        },

        retryLoading: function () {
            this.fetchAnalysisData();
        },

        goBack: function () {
            uni.switchTab({
                url: '/pages/index/index'
            });
        },

        goToAiConsult: function () {
            uni.switchTab({
                url: '/pages/aiconsult/aiconsult'
            });
        }
    }
};
</script>
<style>
@import './analysis_all.css';
</style>
