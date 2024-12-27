<template>
    <view class="container">
        <!-- <view class="status-bar">
    <text class="status-bar-title">咨询服务</text>
  </view> -->

        <view class="content">
            <!-- 咨询类型 -->
            <view class="consult-types">
                <view
                    class="type-item"
                    @tap="startConsult"
                    :data-type="item.id"
                    :style="'background-color: ' + item.color + '15'"
                    v-for="(item, index) in consultTypes"
                    :key="index"
                >
                    <image class="type-icon" :src="item.icon"></image>

                    <text class="type-name">{{ item.name }}</text>
                </view>
            </view>

            <!-- 专家推荐 -->
            <view class="section">
                <view class="section-header">
                    <text class="section-title">推荐专家</text>
                    <text class="section-more">查看全部</text>
                </view>
                <view class="experts-list">
                    <view class="expert-card" @tap="selectExpert" :data-id="item.id" v-for="(item, index) in experts" :key="index">
                        <image class="expert-avatar" :src="item.avatar" mode="aspectFill"></image>

                        <view class="expert-info">
                            <view class="expert-header">
                                <text class="expert-name">{{ item.name }}</text>
                                <text class="expert-title">{{ item.title }}</text>
                            </view>
                            <text class="expert-hospital">{{ item.hospital }}</text>
                            <view style="height: 0px"></view>
                            <text class="expert-specialty">擅长：{{ item.specialty }}</text>
                            <view class="expert-stats">
                                <view class="rating">
                                    <text class="rating-score">{{ item.rating }}</text>
                                    <text class="rating-label">评分</text>
                                </view>
                                <view class="consult-count">
                                    <text class="count-number">{{ item.consultCount }}</text>
                                    <text class="count-label">咨询</text>
                                </view>
                            </view>
                        </view>
                    </view>
                </view>
            </view>

            <!-- 咨询历史 -->
            <view class="section">
                <view class="section-header">
                    <text class="section-title">咨询记录</text>
                    <text class="section-more">全部记录</text>
                </view>
                <view class="history-list">
                    <view class="history-item" @tap="viewConsultDetail" :data-id="item.id" v-for="(item, index) in consultHistory" :key="index">
                        <view class="history-header">
                            <view class="history-type">{{ item.type }}</view>
                            <view class="history-status">{{ item.status }}</view>
                        </view>

                        <view class="history-content">
                            <text class="history-doctor">咨询医生：{{ item.doctor }}</text>
                            <text class="history-date">咨询时间：{{ item.date }}</text>
                            <text class="history-summary">{{ item.summary }}</text>
                        </view>
                    </view>
                </view>
            </view>

            <!-- 客服支持 -->
            <view class="service-support" @tap="contactService">
                <image class="service-icon" src="/static/assets/icons/service.png"></image>
                <text class="service-text">联系客服</text>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            consultTypes: [
                {
                    id: 1,
                    name: '睡眠障碍',
                    icon: '/static/assets/icons/disorder.png',
                    color: '#4A6FEB'
                },
                {
                    id: 2,
                    name: '睡眠习惯',
                    icon: '/static/assets/icons/sleephabit.png',
                    color: '#FF7D54'
                },
                {
                    id: 3,
                    name: '专业问诊',
                    icon: '/static/assets/icons/doctor.png',
                    color: '#45C479'
                },
                {
                    id: 4,
                    name: '其他咨询',
                    icon: '/static/assets/icons/other.png',
                    color: '#9B6FF9'
                }
            ],
            experts: [
                {
                    id: 1,
                    name: '张医生',
                    title: '主任医师',
                    hospital: '华中科技大学同济医学院附属同济医院',
                    specialty: '睡眠呼吸障碍',
                    avatar: '/static/assets/images/doctor1.jpg',
                    rating: 4.9,
                    consultCount: 1280
                },
                {
                    id: 2,
                    name: '李医生',
                    title: '副主任医师',
                    hospital: '华中科技大学同济医学院附属同济医院',
                    specialty: '睡眠质量分析',
                    avatar: '/static/assets/images/doctor2.jpg',
                    rating: 4.8,
                    consultCount: 960
                }
            ],
            consultHistory: [
                {
                    id: 1,
                    type: '睡眠障碍',
                    doctor: '张医生',
                    date: '2024-11-24',
                    status: '已完成',
                    summary: '建议调整作息时间，保持规律作息...'
                },
                {
                    id: 2,
                    type: '睡眠习惯',
                    doctor: '李医生',
                    date: '2024-11-20',
                    status: '已完成',
                    summary: '建议改善睡眠环境，避免使用电子设备...'
                }
            ]
        };
    },
    methods: {
        // 开始咨询
        startConsult(e) {
            const typeId = e.currentTarget.dataset.type;
            if (typeId === 4) {
                uni.navigateTo({
                    url: `/pages/aiconsult/aiconsult`
                });
            }
            if (typeId === 1 || typeId === 2) {
                uni.navigateTo({
                    url: `/pages/knowledge/knowledge`
                });
            }
        },

        // 选择专家
        selectExpert(e) {
            const expertId = e.currentTarget.dataset.id;
            uni.navigateTo({
                url: `/pages/expert-detail/expert-detail?id=${expertId}`
            });
        },

        // 查看咨询详情
        viewConsultDetail(e) {
            const consultId = e.currentTarget.dataset.id;
            uni.navigateTo({
                url: `/pages/consult-detail/consult-detail?id=${consultId}`
            });
        },

        // 联系客服
        contactService() {
            uni.showModal({
                title: '联系客服',
                content: '工作时间：周一至周五 9:00-18:00',
                confirmText: '立即咨询',
                success(res) {
                    if (res.confirm) {
                        // 这里可以接入在线客服系统
                    }
                }
            });
        }
    }
};
</script>
<style>
@import './consult.css';
</style>
