<template>
    <view class="container">
        <view class="header">
            <text class="title">10个改善睡眠质量的使用技巧</text>
        </view>

        <view class="tip-card">
            <view class="tip-number">技巧 {{ currentTip + 1 }}/10</view>
            <view class="tip-title">{{ tips[currentTip].title }}</view>
            <view class="tip-content">{{ tips[currentTip].content }}</view>
        </view>

        <view class="navigation">
            <view class="nav-button" @tap="prevTip">上一条</view>
            <view class="nav-button" @tap="nextTip">下一条</view>
        </view>

        <view class="dots-container">
            <block v-for="(item, index) in tips" :key="index">
                <view :class="'dot ' + (currentTip === index ? 'active' : '')" @tap="jumpToTip" :data-index="index"></view>
            </block>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            tips: [
                {
                    title: '保持规律的作息时间',
                    content: '每天在固定时间入睡和起床，包括周末。这有助于调节你的生理时钟，使身体形成自然的睡眠-清醒周期。',
                    icon: 'clock'
                },
                {
                    title: '创造理想的睡眠环境',
                    content: '保持卧室安静、黑暗和凉爽。理想的睡眠温度在18-22℃之间。使用舒适的床垫和枕头。',
                    icon: 'home'
                },
                {
                    title: '避免使用电子设备',
                    content: '睡前一小时避免使用手机、平板电脑等电子设备。蓝光会抑制褪黑激素的分泌，影响睡眠质量。',
                    icon: 'phone-off'
                },
                {
                    title: '建立睡前放松仪式',
                    content: '可以尝试热水澡、冥想、深呼吸或轻柔的瑜伽。这些活动能帮助身心放松，更容易入睡。',
                    icon: 'yoga'
                },
                {
                    title: '注意饮食习惯',
                    content: '睡前避免大量进食，远离咖啡因、酒精和尼古丁。晚餐最好在睡前2-3小时完成。',
                    icon: 'food'
                },
                {
                    title: '规律运动',
                    content: '保持规律运动习惯，但避免睡前剧烈运动。适度运动有助于改善睡眠质量，最好在傍晚前完成。',
                    icon: 'run'
                },
                {
                    title: '控制午睡时间',
                    content: '如果需要午睡，建议控制在20-30分钟内，并在下午3点前完成，以免影响晚上的睡眠。',
                    icon: 'nap'
                },
                {
                    title: '管理压力和焦虑',
                    content: '尝试写日记或列清单，将烦恼事项记录下来，避免躺在床上想心事。必要时寻求专业帮助。',
                    icon: 'mind'
                },
                {
                    title: '合理使用床铺',
                    content: '床只用于睡眠和亲密活动。避免在床上工作、看电视或玩手机，建立床与睡眠的关联。',
                    icon: 'bed'
                },
                {
                    title: '遵循自然光照规律',
                    content: '白天多接触自然光，晚上避免强光照射。这有助于维持正常的昼夜节律。',
                    icon: 'sun'
                }
            ],

            currentTip: 0,
            title: '',
            content: ''
        };
    },
    methods: {
        // 切换到下一个提示
        nextTip: function () {
            let next = this.currentTip + 1;
            if (next >= this.tips.length) {
                next = 0;
            }
            this.setData({
                currentTip: next
            });
        },

        // 切换到上一个提示
        prevTip: function () {
            let prev = this.currentTip - 1;
            if (prev < 0) {
                prev = this.tips.length - 1;
            }
            this.setData({
                currentTip: prev
            });
        },

        // 直接跳转到指定提示
        jumpToTip: function (e) {
            const index = parseInt(e.currentTarget.dataset.index);
            this.setData({
                currentTip: index
            });
        }
    }
};
</script>
<style>
@import './2.css';
</style>
