<template>
    <view class="container">
        <view class="header">
            <text class="page-title">{{ pageTitle }}</text>
        </view>

        <view class="section-nav">
            <view :class="'nav-item ' + (currentSection === index ? 'active' : '')" @tap="switchSection" :data-index="index" v-for="(item, index) in sections" :key="index">
                <text>{{ item.title }}</text>
            </view>
        </view>

        <view class="section-content">
            <view class="section-header">
                <text class="section-icon">{{ sections[currentSection].icon }}</text>
                <text class="section-title">{{ sections[currentSection].title }}</text>
            </view>

            <view class="section-desc">
                {{ sections[currentSection].content }}
            </view>

            <block v-if="showTips">
                <view class="tip-group" v-for="(item, index) in sections[currentSection].tips" :key="index">
                    <view class="tip-subtitle">{{ item.subtitle }}</view>

                    <view class="tip-list">
                        <view class="tip-item" v-for="(point, index1) in item.points" :key="index1">
                            {{ point }}
                        </view>
                    </view>
                </view>
            </block>
        </view>

        <view class="summary">
            <view class="summary-title">温馨提醒：</view>
            <view>良好的睡眠环境需要综合考虑多个因素，建议根据个人情况和居住条件循序渐进地改善。保持环境整洁、定期维护也是确保睡眠质量的重要一环。</view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            pageTitle: '睡眠环境布置指南',

            sections: [
                {
                    title: '光线控制',
                    icon: '🌙',
                    content: '合理的光线对良好睡眠至关重要',
                    tips: [
                        {
                            subtitle: '日间采光',
                            points: ['早晨开窗让自然光进入，有助于调节生理节律', '白天保持室内明亮，提高日间活力', '避免正午强光直射卧室']
                        },
                        {
                            subtitle: '夜间光线',
                            points: ['使用遮光窗帘阻挡外部光源', '避免使用刺眼的白光，选择暖色调光源', '睡前调暗室内灯光，营造舒适氛围']
                        }
                    ]
                },
                {
                    title: '温度与通风',
                    icon: '🌡️',
                    content: '适宜的温度和空气质量是优质睡眠的基础',
                    tips: [
                        {
                            subtitle: '温度控制',
                            points: ['最佳睡眠温度在18-22℃之间', '冬季开暖气时注意保持适度湿度', '夏季空调温度不宜过低']
                        },
                        {
                            subtitle: '空气流通',
                            points: ['每天开窗通风15-30分钟', '使用空气净化器改善空气质量', '保持适度湿度（40%-60%）']
                        }
                    ]
                },
                {
                    title: '床具选择',
                    icon: '🛏️',
                    content: '合适的床具对睡眠质量有重要影响',
                    tips: [
                        {
                            subtitle: '床垫选择',
                            points: ['选择适中硬度的床垫', '定期翻转床垫保持平整', '建议3-8年更换一次床垫']
                        },
                        {
                            subtitle: '床品布置',
                            points: ['选择透气性好的床品材质', '定期更换床单被罩（建议1-2周一次）', '枕头高度要适中，保护颈椎']
                        }
                    ]
                },
                {
                    title: '噪音管理',
                    icon: '🔇',
                    content: '安静的环境是保证睡眠质量的重要因素',
                    tips: [
                        {
                            subtitle: '隔音措施',
                            points: ['使用隔音窗帘或双层玻璃', '墙面可贴隔音材料', '门窗缝隙做好密封处理']
                        },
                        {
                            subtitle: '白噪音应用',
                            points: ['可使用白噪音机遮盖干扰声', '选择自然声音（如下雨声、海浪声）', '音量保持在低于30分贝']
                        }
                    ]
                }
            ],

            currentSection: 0,
            showTips: false,
            icon: '',
            title: '',
            content: '',
            tips: [],
            point: ''
        };
    },
    onShareAppMessage() {
        return {
            title: '睡眠环境布置指南 - 打造完美睡眠空间',
            path: '/pages/knowledgeDetail/3/3'
        };
    },
    methods: {
        switchSection(e) {
            const index = e.currentTarget.dataset.index;
            this.setData({
                currentSection: index,
                showTips: false
            });
            setTimeout(() => {
                this.setData({
                    showTips: true
                });
            }, 100);
        }
    }
};
</script>
<style>
@import './3.css';
</style>
