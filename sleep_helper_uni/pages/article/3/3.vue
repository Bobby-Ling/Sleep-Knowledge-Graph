<template>
    <view class="container">
        <view class="header">
            <text class="title">常见睡眠误区辟谣</text>
        </view>

        <view class="myth-list">
            <block v-for="(item, index) in myths" :key="index">
                <view class="myth-item">
                    <view class="myth-header" @tap="toggleMyth" :data-id="item.id">
                        <view class="myth-title">
                            <text class="myth-number">{{ item.id }}</text>
                            {{ item.myth }}
                        </view>
                        <view :class="'myth-toggle ' + (item.isExpanded ? 'expanded' : '')">
                            <text class="cuIcon-unfold"></text>
                        </view>
                    </view>
                    <view :class="'myth-content ' + (item.isExpanded ? 'expanded' : '')">
                        <text class="truth-text">{{ item.truth }}</text>
                    </view>
                </view>
            </block>
        </view>

        <view class="footer">
            <text>点击每条误区可展开查看详细解释</text>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            myths: [
                {
                    id: 1,
                    myth: '睡前喝酒有助于睡眠',
                    truth: '虽然酒精可能帮助快速入睡，但会严重影响睡眠质量。酒精会打断REM睡眠周期，导致睡眠浅和易醒，第二天感觉疲惫。',
                    isExpanded: false
                },
                {
                    id: 2,
                    myth: '周末补觉可以弥补工作日的睡眠不足',
                    truth: '不规律的睡眠时间会扰乱生理时钟。即使周末补觉，也无法完全弥补睡眠债务，反而可能导致"社交时差"，影响下周的作息。',
                    isExpanded: false
                },
                {
                    id: 3,
                    myth: '人老了就需要较少的睡眠时间',
                    truth: '年长者仍需要7-8小时的睡眠。随年龄增长，可能更难获得持续的睡眠，但睡眠需求并未显著减少。',
                    isExpanded: false
                },
                {
                    id: 4,
                    myth: '失眠时应该躺在床上直到入睡',
                    truth: '如果20-30分钟内无法入睡，最好起床做些放松活动，直到感觉困倦。长时间躺床可能增加焦虑，使入睡更困难。',
                    isExpanded: false
                },
                {
                    id: 5,
                    myth: '打呼噜只是令人烦恼，并无大碍',
                    truth: '严重打呼噜可能是睡眠呼吸暂停的征兆，会导致血氧降低，增加心血管疾病风险，应及时就医检查。',
                    isExpanded: false
                },
                {
                    id: 6,
                    myth: '运动前睡觉会影响运动表现',
                    truth: '适度的午睡（20-30分钟）反而可能提升下午的运动表现，但要避免长时间深度睡眠。',
                    isExpanded: false
                },
                {
                    id: 7,
                    myth: '看电视直到入睡是放松的好方法',
                    truth: '电视的蓝光会抑制褪黑激素分泌，影响自然睡眠周期。此外，某些节目可能使大脑保持活跃状态。',
                    isExpanded: false
                },
                {
                    id: 8,
                    myth: '睡不着时吃点东西有助于入睡',
                    truth: '临睡前进食会增加消化系统负担，反而影响睡眠质量。如果饥饿，可以适量食用含色氨酸的小点心。',
                    isExpanded: false
                }
            ]
        };
    },
    onShareAppMessage: function () {
        return {
            title: '常见睡眠误区辟谣',
            path: '/pages/test-questions/3/3'
        };
    },
    methods: {
        toggleMyth: function (e) {
            const mythId = e.currentTarget.dataset.id;
            const myths = this.myths;
            const mythIndex = myths.findIndex((item) => item.id === mythId);
            myths[mythIndex].isExpanded = !myths[mythIndex].isExpanded;
            this.setData({
                myths: myths
            });
        }
    }
};
</script>
<style>
@import './3.css';
</style>
