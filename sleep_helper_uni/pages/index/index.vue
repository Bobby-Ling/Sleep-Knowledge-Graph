<template>
    <view class="container">
        <!-- 顶部状态栏 -->
        <view class="status-bar">
            <view class="status-bar-title">睡眠健康助手</view>
        </view>

        <!-- 轮播图部分 -->
        <swiper class="banner" :indicator-dots="true" :autoplay="true" interval="3000" :circular="true">
            <swiper-item>
                <image
                    src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/images/banner1.jpg?sign=e1183b3fccf3fe021d47b36da3f28995&t=1735203131"
                    mode="aspectFill"
                ></image>
            </swiper-item>
            <swiper-item>
                <image
                    src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/images/banner2.webp?sign=125760ae29febcd16f18b90f8de3ad70&t=1735203168"
                    mode="aspectFill"
                ></image>
            </swiper-item>
            <swiper-item>
                <image
                    src="https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/images/banner3.webp?sign=78c3578e3322b26b778858bcf22d7a55&t=1735203184"
                    mode="aspectFill"
                ></image>
            </swiper-item>
        </swiper>

        <!-- 主要功能区 -->
        <view class="function-area">
            <view class="function-item" v-if="isShow" @tap="navigateToDiagnosis">
                <image src="/static/images/diagnosis.png"></image>
                <text>量表诊断</text>
            </view>
            <view class="function-item" v-if="isShow" @tap="navigateToKnowledge">
                <image src="/static/images/knowledge.png"></image>
                <text>睡眠百科</text>
            </view>
            <view class="function-item" @tap="navigateToRecord">
                <image src="/static/images/record.png"></image>
                <text>睡眠记录</text>
            </view>
            <view class="function-item" v-if="isShow" @tap="navigateToConsult">
                <image src="/static/images/consult.png"></image>
                <text>在线咨询</text>
            </view>
        </view>

        <!-- 快速检测入口 -->
        <view class="quick-test" v-if="isShow" @tap="startQuickTest">
            <text class="quick-test-title">快速睡眠评估</text>
            <text class="quick-test-desc">仅需6分钟，快速了解您的睡眠状况</text>
        </view>

        <!-- 睡眠知识卡片 -->
        <view class="knowledge-cards" v-if="isShow">
            <view class="card-title">每日睡眠小贴士</view>
            <scroll-view :scroll-x="true" class="cards-container" :enhanced="true" :show-scrollbar="false">
                <view class="knowledge-card" @tap="showKnowledgeDetail" :data-id="item.id" v-for="(item, index) in knowledgeList" :key="index">
                    <image :src="item.image" mode="aspectFill"></image>

                    <text>{{ item.title }}</text>
                </view>
            </scroll-view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            knowledgeList: [
                {
                    id: 1,
                    title: '如何改善入睡困难？',
                    image: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/images/sleep-tips-1.jpg?sign=0c5a41e8397a6cd9954905b34c0c7a30&t=1732639147'
                },
                {
                    id: 2,
                    title: '远离失眠的六个小妙招',
                    image: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/images/sleep-tips-2.jpg?sign=a0c5990d301b41557ec6c8a1d1ab65a1&t=1732639172'
                },
                {
                    id: 3,
                    title: '睡眠环境布置指南',
                    image: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/images/sleep-tips-3.jpg?sign=b95f225139c73b13139d8a704b6c3149&t=1732639183'
                }
            ],
            isShow: false // 初始值
        };
    },
    onLoad: function () {
        // 页面加载时的初始化操作
        console.log(uni.getStorageSync('isShow'));
        // 从 Storage 获取值并更新到 data 中
        const isShow = uni.getStorageSync('isShow');
        this.setData({
            isShow: isShow
        });
    },
    methods: {
        navigateToDiagnosis: function () {
            uni.navigateTo({
                url: '/pages/quickTest/quickTest'
            });
        },

        navigateToKnowledge: function () {
            uni.navigateTo({
                url: '/pages/knowledge/knowledge'
            });
        },

        navigateToRecord: function () {
            uni.navigateTo({
                url: '/pages/record/record'
            });
        },

        navigateToConsult: function () {
            uni.navigateTo({
                url: '/pages/consult/consult'
            });
        },

        startQuickTest: function () {
            uni.navigateTo({
                url: '/pages/chooseSymptoms/chooseSymptoms'
            });
        },

        showKnowledgeDetail: function (e) {
            const id = e.currentTarget.dataset.id;
            uni.navigateTo({
                url: `/pages/knowledgeDetail/${id}/${id}`
            });
        }
    }
};
</script>
<style>
@import './index.css';
</style>
