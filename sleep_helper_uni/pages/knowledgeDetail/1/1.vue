<template>
    <view class="container">
        <view class="header">
            <text class="title">{{ article.title }}</text>
        </view>

        <block v-for="(item, index) in article.sections" :key="index">
            <view class="section">
                <view class="section-title">{{ item.title }}</view>

                <block v-if="item.content">
                    <view class="section-content">{{ item.content }}</view>
                </block>

                <block v-if="item.key_points">
                    <view class="key-points">
                        <view class="key-point" v-for="(point, index1) in item.key_points" :key="index1">
                            {{ point }}
                        </view>
                    </view>
                </block>

                <block v-if="item.list">
                    <view class="list-items">
                        <view class="list-item" v-for="(listItem, index1) in item.list" :key="index1">
                            {{ listItem }}
                        </view>
                    </view>
                </block>

                <block v-if="item.solutions">
                    <view class="solutions">
                        <view class="solution-card" v-for="(solution, index1) in item.solutions" :key="index1">
                            <view class="solution-title">{{ solution.title }}</view>

                            <view class="solution-detail">{{ solution.detail }}</view>
                        </view>
                    </view>
                </block>

                <block v-if="item.warning_signs">
                    <view class="warning-list">
                        <view class="warning-item" v-for="(sign, index1) in item.warning_signs" :key="index1">
                            {{ sign }}
                        </view>
                    </view>
                </block>
            </view>
        </block>

        <view class="back-to-top" @tap="backToTop" v-if="showBackToTop">顶部</view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            article: {
                title: '如何改善睡眠困难',
                sections: [
                    {
                        title: '什么是睡眠困难？',
                        content: '睡眠困难是指难以入睡、无法持续睡眠、早醒或睡眠质量差等问题。这些问题如果持续超过三周，就可能构成失眠症。',
                        key_points: ['入睡困难', '睡眠不持续', '早醒', '睡眠质量差']
                    },
                    {
                        title: '常见原因',
                        content: '睡眠困难的原因通常包括：',
                        list: ['压力和焦虑', '不规律的作息时间', '不良的睡眠环境', '电子设备的过度使用', '咖啡因摄入过量', '运动时间不当', '饮食习惯问题']
                    },
                    {
                        title: '改善方法',
                        solutions: [
                            {
                                title: '建立规律作息',
                                detail: '固定睡眠时间，包括周末也保持相同的作息时间，帮助建立稳定的生理时钟。'
                            },
                            {
                                title: '优化睡眠环境',
                                detail: '保持卧室安静、黑暗、通风和适宜温度（18-22℃），使用舒适的床具。'
                            },
                            {
                                title: '放松技巧',
                                detail: '睡前进行深呼吸、渐进性肌肉放松、冥想等放松活动。'
                            },
                            {
                                title: '控制光照',
                                detail: '白天多接触自然光，晚上避免强光刺激，特别是蓝光。'
                            },
                            {
                                title: '调整生活习惯',
                                detail: '避免睡前饮酒、吸烟、剧烈运动和食用重餐。'
                            }
                        ]
                    },
                    {
                        title: '需要就医的情况',
                        warning_signs: ['持续性失眠超过一个月', '伴随其他健康问题', '影响日常工作和生活', '出现情绪问题', '使用助眠药物无效']
                    }
                ]
            },

            showBackToTop: false,
            point: '',
            listItem: [],

            solution: {
                title: '',
                detail: ''
            },

            sign: ''
        };
    },
    onPageScroll: function (e) {
        this.setData({
            showBackToTop: e.scrollTop > 300
        });
    },
    onShareAppMessage: function () {
        return {
            title: '如何改善睡眠困难 - 实用指南',
            path: '/pages/knowledgeDetail/1/1'
        };
    },
    methods: {
        backToTop: function () {
            uni.pageScrollTo({
                scrollTop: 0,
                duration: 300
            });
        }
    }
};
</script>
<style>
@import './1.css';
</style>
