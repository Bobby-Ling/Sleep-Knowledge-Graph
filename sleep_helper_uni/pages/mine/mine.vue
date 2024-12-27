<template>
    <view class="container">
        <!-- 个人信息卡片 -->
        <view class="user-card" @tap="handleLogin">
            <view class="user-info">
                <image class="avatar" :src="userInfo.avatar" mode="aspectFill"></image>
                <view class="user-detail">
                    <text class="nickname">{{ userInfo.nickname }}</text>
                    <text class="login-tip" v-if="!userInfo.isLogin">点击登录</text>
                </view>
            </view>
            <image class="arrow-icon" src="/static/assets/icons/arrow-right.png"></image>
        </view>

        <!-- 使用统计 -->
        <view class="stats-section">
            <view class="stat-item">
                <text class="stat-number">{{ stats.testCount }}</text>
                <text class="stat-label">测试次数</text>
            </view>
            <view class="stat-item">
                <text class="stat-number">{{ stats.reportCount }}</text>
                <text class="stat-label">生成报告</text>
            </view>
            <view class="stat-item">
                <text class="stat-number">{{ stats.daysCount }}</text>
                <text class="stat-label">使用天数</text>
            </view>
        </view>

        <!-- 功能列表 -->
        <view class="section">
            <view class="section-title">我的功能</view>
            <view class="function-grid">
                <view class="function-item" @tap="navigateToFunction" :data-path="item.path" v-for="(item, index) in functionList" :key="index">
                    <image class="function-icon" :src="item.icon"></image>

                    <text class="function-title">{{ item.title }}</text>
                </view>
            </view>
        </view>

        <!-- 设置列表 -->
        <view class="section">
            <view class="section-title">设置</view>
            <view class="setting-list">
                <view class="setting-item" @tap="navigateToFunction" :data-path="item.path" v-for="(item, index) in settingList" :key="index">
                    <view class="setting-left">
                        <image class="setting-icon" :src="item.icon"></image>
                        <text class="setting-title">{{ item.title }}</text>
                    </view>

                    <image class="arrow-icon" src="/static/assets/icons/arrow-right.png"></image>
                </view>
            </view>
        </view>

        <!-- 客服入口 -->
        <view class="service-section">
            <button class="service-btn" @tap="contactService">
                <image
                    class="service-icon"
                    src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/mine/service.png?sign=a752c3ede524bc32ddc6e09654417f5d&t=1732640056"
                ></image>
                <text>联系客服</text>
            </button>
        </view>

        <!-- 版本信息 -->
        <view class="version-info">
            <text>当前版本 1.0.0</text>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            userInfo: {
                avatar: '/static/assets/images/default-avatar.png',
                nickname: '未登录',
                isLogin: false
            },
            stats: {
                testCount: 0,
                reportCount: 0,
                daysCount: 0
            },
            functionList: [
                {
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/mine/history.png?sign=a4c05e2451607dddd7e77417bc90d36d&t=1732639970',
                    title: '测试记录',
                    path: '/pages/testHistory/testHistory'
                },
                {
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/mine/myreport.png?sign=44190051920593f034be9b98d4d2778f&t=1732639993',
                    title: '我的报告',
                    path: '/pages/reportList/reportList'
                },
                {
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/mine/reminder.png?sign=2f432e7dec38e107ff554064d43efcdd&t=1732640003',
                    title: '睡眠提醒',
                    path: '/pages/sleepReminder/sleepReminder'
                }
            ],
            settingList: [
                {
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/mine/notification.png?sign=e3fc06c357603fe0bfa80af93543ccd7&t=1732640012',
                    title: '消息通知',
                    path: '/pages/notification/notification'
                },
                {
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/mine/privacy.png?sign=88b970085741bff3114508be8e84cd7a&t=1732640020',
                    title: '隐私设置',
                    path: '/pages/privacy/privacy'
                },
                {
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/mine/about.png?sign=b2eec4793d0a20eb3cd6a74a40b4e9da&t=1732640030',
                    title: '关于我们',
                    path: '/pages/about/about'
                }
            ]
        };
    },
    onLoad() {
        this.checkLoginStatus();
    },
    methods: {
        // 检查登录状态
        checkLoginStatus() {
            const token = uni.getStorageSync('token');
            if (token) {
                this.getUserInfo();
            }
        },

        // 获取用户信息
        getUserInfo() {
            // 模拟获取用户信息
            this.setData({
                'userInfo.isLogin': true,
                'userInfo.avatar': '/static/assets/images/default-avatar.png',
                'userInfo.nickname': '测试用户',
                'stats.testCount': 12,
                'stats.reportCount': 8,
                'stats.daysCount': 30
            });
        },

        // 登录
        handleLogin() {
            if (this.userInfo.isLogin) {
                return;
            }
            uni.navigateTo({
                url: '/pages/login/login'
            });
        },

        // 跳转到功能页面
        navigateToFunction(e) {
            const path = e.currentTarget.dataset.path;
            if (!this.userInfo.isLogin) {
                uni.showToast({
                    title: '请先登录',
                    icon: 'none'
                });
                return;
            }
            uni.navigateTo({
                url: path
            });
        },

        // 联系客服
        contactService() {
            uni.showModal({
                title: '客服消息',
                content: '工作时间：周一至周五 9:00-18:00',
                confirmText: '确定',
                showCancel: false
            });
        }
    }
};
</script>
<style>
@import './mine.css';
</style>
