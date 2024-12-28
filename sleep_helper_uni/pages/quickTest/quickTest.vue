<template>
    <view class="container">
        <view class="header" style="width: 558rpx; display: block; box-sizing: content-box">
            <text class="title" style="position: relative; left: -93rpx; top: -8rpx">快速测试</text>
            <view class="search-bar" style="width: 599rpx; display: flex; box-sizing: border-box; position: relative; left: -93rpx; top: 2rpx">
                <icon type="search" size="14"></icon>
                <input placeholder="搜索测试项目" />
            </view>
        </view>

        <view class="content">
            <!-- 测试类型列表 -->
            <view class="test-types">
                <view class="test-card" @tap="startTest" :data-id="item.id" :style="'border-color: ' + item.color + '20'" v-for="(item, index) in testTypes" :key="index">
                    <view class="test-icon" :style="'background-color: ' + item.color + '15'">
                        <image :src="item.icon"></image>
                    </view>

                    <view class="test-info">
                        <text class="test-title">{{ item.title }}</text>
                        <view style="height: 0px"></view>
                        <text class="test-desc">{{ item.desc }}</text>
                        <view class="test-meta">
                            <text>{{ item.duration }}</text>
                            <text>{{ item.questions }}个问题</text>
                        </view>
                    </view>

                    <view class="start-btn" :style="'background-color: ' + item.color">开始测试</view>
                </view>
            </view>

            <!-- 最近报告 -->
            <view class="section">
                <view class="section-header">
                    <text class="section-title">最近报告</text>
                    <text class="view-all" @tap="viewHistoryReports">查看全部</text>
                </view>
                <view class="reports-list">
                    <view class="report-card" @tap="viewReport" :data-id="item.id" v-for="(item, index) in recentReports" :key="index">
                        <view class="report-header" :style="'background-color: ' + item.color + '15'">
                            <text class="report-type">{{ item.type }}</text>
                            <text class="report-date">{{ item.date }}</text>
                        </view>

                        <view class="report-content">
                            <view class="score-circle" :style="'border-color: ' + item.color">
                                <text class="score-number">{{ item.score }}</text>
                                <text class="score-label">分</text>
                            </view>
                            <text class="report-result" :style="'color: ' + item.color">{{ item.result }}</text>
                        </view>
                    </view>
                </view>
            </view>

            <!-- 睡眠小贴士 -->
            <view class="section">
                <view class="section-header">
                    <text class="section-title">睡眠小贴士</text>
                </view>
                <view class="tips-list">
                    <view class="tip-item" v-for="(item, index) in sleepTips" :key="index">
                        <image class="tip-icon" :src="item.icon"></image>

                        <view class="tip-content">
                            <text class="tip-title">{{ item.title }}</text>
                            <view style="height: 0px"></view>
                            <text class="tip-desc">{{ item.content }}</text>
                        </view>
                    </view>
                </view>
            </view>
        </view>

        <!-- 分享按钮 -->
        <view class="share-btn" @tap="shareTest">
            <image src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/share.png?sign=6efd0bc37cdc7506b0021bebc407921f&t=1735286992"></image>
            <text>分享给好友</text>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            testTypes: [
                {
                    id: 1,
                    title: '阿森斯失眠量表',
                    desc: '睡眠障碍的自我评估',
                    duration: '约2分钟',
                    questions: 8,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/insomnia.png?sign=78b4c8b0a91bae785d826a3da45cd40b&t=1735287082',
                    color: '#4A6FEB'
                },
                {
                    id: 2,
                    title: 'Epworth嗜睡量表',
                    desc: '评估您的瞌睡情况',
                    duration: '约2分钟',
                    questions: 8,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/quality.png?sign=9ec87685212acda8d2d17b1ebca8acca&t=1735287095',
                    color: '#FF7D54'
                },
                {
                    id: 3,
                    title: '汉密顿焦虑量表',
                    desc: '检测您当前的焦虑症状',
                    duration: '约4分钟',
                    questions: 12,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/habit.png?sign=ac286bd2a27d52ed5f4ba368ec8d69b5&t=1735287106',
                    color: '#45C479'
                },
                {
                    id: 4,
                    title: '汉密顿抑郁量表',
                    desc: '评估您当前的抑郁症状',
                    duration: '约5分钟',
                    questions: 17,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/depression.png?sign=f6ddc05591e0da633087503a21da4f2b&t=1735287174',
                    color: '#FFB347'
                },
                {
                    id: 5,
                    title: '国际不宁腿综合征研究组评分标准',
                    desc: '评估您是否存在不宁腿症状',
                    duration: '约3分钟',
                    questions: 10,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/restless_legs.png?sign=cb680a9d65059cff7c18d67a5b99748f&t=1735287434',
                    color: '#76D7C4'
                },
                {
                    id: 6,
                    title: '匹茨堡睡眠质量指数量表',
                    desc: '评估您的睡眠质量',
                    duration: '约5分钟',
                    questions: 19,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/sleep_quality.png?sign=914c98b1c8ca1894d4682e4cd46054ff&t=1735287449',
                    color: '#9B59B6'
                },
                {
                    id: 7,
                    title: 'RBD筛查问卷',
                    desc: '评估您是否存在快速眼动睡眠行为障碍',
                    duration: '约3分钟',
                    questions: 6,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/rbd.png?sign=0ec93fe4adf3416c844681622e9cc06c&t=1735287461',
                    color: '#F39C12'
                },
                {
                    id: 8,
                    title: '睡眠呼吸暂停风险评估',
                    desc: '评估您睡眠呼吸暂停的风险',
                    duration: '约4分钟',
                    questions: 8,
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/sleep_apnea.png?sign=6ec866dfdc6b50816fef1b64df84df57&t=1735287473',
                    color: '#E74C3C'
                }
            ],
            recentReports: [
                {
                    id: 1,
                    type: '失眠风险评估',
                    date: '2024-11-24',
                    score: 85,
                    result: '轻度失眠风险',
                    color: '#4A6FEB'
                },
                {
                    id: 2,
                    type: '睡眠质量评估',
                    date: '2024-11-20',
                    score: 92,
                    result: '睡眠质量良好',
                    color: '#FF7D54'
                }
            ],
            sleepTips: [
                {
                    id: 1,
                    title: '保持规律作息',
                    content: '每天固定时间上床睡觉和起床',
                    icon: '/static/assets/icons/clock.png'
                },
                {
                    id: 2,
                    title: '创造良好环境',
                    content: '保持安静、黑暗、适温的睡眠环境',
                    icon: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/icons/environment.png?sign=fc1545f4ab32ddcf6ffa1aee7b5ab6d3&t=1735286896'
                },
                {
                    id: 3,
                    title: '避免电子产品',
                    content: '睡前一小时避免使用手机等电子设备',
                    icon: '/static/assets/icons/device.png'
                }
            ]
        };
    },
    methods: {
        // 开始测试
        startTest(e) {
            const testId = e.currentTarget.dataset.id;
            console.log(testId);
            uni.navigateTo({
                url: `/pages/test-questions/test-questions?id=${testId}`
            });
        },

        // 查看报告详情
        viewReport(e) {
            const reportId = e.currentTarget.dataset.id;
            uni.navigateTo({
                url: `/pages/test-report/test-report?id=${reportId}`
            });
        },

        // 查看更多测试类型
        viewMoreTests() {
            uni.navigateTo({
                url: '/pages/all-tests/all-tests'
            });
        },

        // 查看历史报告
        viewHistoryReports() {
            uni.navigateTo({
                url: '/pages/report-history/report-history'
            });
        },

        // 分享测试
        shareTest() {
            uni.showShareMenu({
                withShareTicket: true,
                menus: ['shareAppMessage', 'shareTimeline']
            });
        }
    }
};
</script>
<style>
@import './quickTest.css';
</style>
