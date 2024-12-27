<template>
    <view class="container">
        <view class="header">
            <text class="title">远离失眠的六个小妙招</text>
        </view>

        <scroll-view class="tips-nav" :scroll-x="true">
            <view :class="'tip-nav-item ' + (currentTip === index ? 'active' : '')" @tap="switchTip" :data-index="index" v-for="(item, index) in tips" :key="index">
                {{ item.title }}
            </view>
        </scroll-view>

        <view class="tip-content animation-fade">
            <view class="tip-header">
                <text class="tip-icon">{{ tips[currentTip].icon }}</text>
                <text class="tip-title">{{ tips[currentTip].title }}</text>
            </view>

            <view class="tip-main-content">
                {{ tips[currentTip].content }}
            </view>

            <view class="tip-details">
                <view class="detail-item" v-for="(item, index) in tips[currentTip].details" :key="index">
                    {{ item }}
                </view>
            </view>
        </view>

        <view class="note">
            <view class="note-title">温馨提示：</view>
            <view>以上方法需要持之以恒，如果失眠问题持续超过一个月，建议及时就医咨询专业医生的意见。良好的睡眠习惯需要循序渐进地培养，切勿操之过急。</view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            tips: [
                {
                    id: 1,
                    title: '规律作息，固定时间',
                    icon: '🕐',
                    content: '每天保持固定的睡眠和起床时间，包括周末。这样可以调节身体的生理时钟，使其形成自然的睡眠-觉醒周期。建议睡眠时间在7-9小时之间。',
                    details: ['避免日间过长午睡', '保持规律的作息时间', '即使周末也不要睡太晚', '循序渐进调整作息时间']
                },
                {
                    id: 2,
                    title: '创造理想睡眠环境',
                    icon: '🛏️',
                    content: '营造安静、黑暗、凉爽的睡眠环境。室温保持在18-22℃之间，使用舒适的床具和枕头，确保房间通风良好。',
                    details: ['使用遮光窗帘', '选择舒适床具', '保持适宜温度', '确保空气流通']
                },
                {
                    id: 3,
                    title: '控制饮食和运动',
                    icon: '🏃',
                    content: '晚餐要适量，避免睡前3小时内进行剧烈运动。午后4点后避免摄入咖啡因，睡前不要饮酒或吸烟。适量运动有助于提高睡眠质量。',
                    details: ['避免睡前重餐', '控制咖啡因摄入', '适量运动但避免晚上剧烈运动', '戒烟限酒']
                },
                {
                    id: 4,
                    title: '放松身心',
                    icon: '🧘',
                    content: '睡前进行放松活动，如听轻音乐、阅读、深呼吸或冥想。避免使用手机、电脑等电子设备，其蓝光会影响褪黑激素的分泌。',
                    details: ['练习呼吸放松', '做些轻柔伸展', '听舒缓音乐', '避免使用电子设备']
                },
                {
                    id: 5,
                    title: '建立睡前仪式',
                    icon: '🌙',
                    content: '养成固定的睡前习惯，如泡个温和的热水澡、喝杯温热牛奶、做些简单的护肤等。这些仪式能帮助身体认知即将入睡。',
                    details: ['泡温和热水澡', '喝温热饮品', '进行基础护理', '穿着舒适睡衣']
                },
                {
                    id: 6,
                    title: '调整入睡心态',
                    icon: '💭',
                    content: '不要强迫自己入睡，如果躺床30分钟还无法入睡，建议起身做些轻松活动直到感觉困倦。保持平和心态，避免焦虑。',
                    details: ['不要躺床强求入睡', '避免看时间', '保持平和心态', '适当转移注意力']
                }
            ],

            currentTip: 0,
            icon: '',
            title: '',
            content: '',
            details: []
        };
    },
    onShareAppMessage: function () {
        return {
            title: '远离失眠的六个小妙招',
            path: '/pages/knowledgeDetail/2/2'
        };
    },
    methods: {
        switchTip: function (e) {
            const index = e.currentTarget.dataset.index;
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
