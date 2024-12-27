<template>
    <view class="container">
        <view class="status-bar">
            <text class="status-bar-title">睡眠知识</text>
        </view>

        <view class="search-box">
            <view class="search-bar">
                <image class="search-icon" src="/static/assets/icons/search.png"></image>
                <input class="search-input" placeholder="搜索文章" @input="onSearch" :value="searchValue" />
            </view>
        </view>

        <view class="categories">
            <scroll-view scroll-x class="category-scroll" enhanced :show-scrollbar="false">
                <view
                    :class="'category-item ' + (currentCategory === item.id ? 'active' : '')"
                    :data-category="item.id"
                    @tap="changeCategory"
                    v-for="(item, index) in categories"
                    :key="index"
                >
                    {{ item.name }}
                </view>
            </scroll-view>
        </view>

        <view class="article-list">
            <block v-if="filteredArticles.length > 0">
                <view class="article-card" @tap="viewArticle" :data-id="item.id" v-for="(item, index) in filteredArticles" :key="index">
                    <image class="article-cover" :src="item.cover" mode="aspectFill"></image>

                    <view class="article-info">
                        <text class="article-title">{{ item.title }}</text>
                        <text class="article-summary">{{ item.summary }}</text>
                        <view class="article-meta">
                            <text class="read-time">{{ item.readTime }}</text>
                            <view class="like-btn" @tap.stop.prevent="likeArticle" :data-id="item.id">
                                <image src="/static/assets/icons/like.png"></image>
                                <text>{{ item.likes }}</text>
                            </view>
                        </view>
                    </view>
                </view>
            </block>

            <view class="empty-state" v-if="filteredArticles.length === 0">
                <image src="/static/assets/images/empty.png"></image>
                <text>暂无相关文章</text>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            categories: [
                {
                    id: 'all',
                    name: '全部'
                },
                {
                    id: 'science',
                    name: '科普'
                },
                {
                    id: 'tips',
                    name: '小贴士'
                },
                {
                    id: 'myth',
                    name: '谣言粉碎'
                },
                {
                    id: 'health',
                    name: '健康'
                }
            ],
            currentCategory: 'all',
            articles: [
                {
                    id: 1,
                    title: '为什么我们需要睡眠？',
                    category: 'science',
                    cover: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/images/sleep-science.jpg?sign=ab39102108362d1e4dae9a68551728ab&t=1732639296',
                    summary: '探索睡眠对人体的重要性及其科学原理',
                    readTime: '5分钟',
                    likes: 156
                },
                {
                    id: 2,
                    title: '10个改善睡眠质量的实用技巧',
                    category: 'tips',
                    cover: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/images/sleep-tips.jpg?sign=f3cf3f99aa5c422b718c6d575f932650&t=1732639281',
                    summary: '专家推荐的睡眠建议，帮助您获得更好的休息',
                    readTime: '3分钟',
                    likes: 238
                },
                {
                    id: 3,
                    title: '常见睡眠误区辟谣',
                    category: 'myth',
                    cover: 'https://6d65-mental-miniapp-9gg5j9ahdeb719a2-1322861354.tcb.qcloud.la/assets/images/sleep-myth.jpg?sign=e1bee374f6039a0c4e9c8ae06c6bd089&t=1732639248',
                    summary: '揭秘日常生活中关于睡眠的错误认知',
                    readTime: '4分钟',
                    likes: 185
                }
            ],
            searchValue: '',
            filteredArticles: []
        };
    },
    onLoad() {
        this.setData({
            filteredArticles: this.articles
        });
    },
    methods: {
        // 切换分类
        changeCategory(e) {
            const category = e.currentTarget.dataset.category;
            this.setData({
                currentCategory: category
            });
            this.filterArticles();
        },

        // 搜索文章
        onSearch(e) {
            this.setData({
                searchValue: e.detail.value
            });
            this.filterArticles();
        },

        // 筛选文章
        filterArticles() {
            let filtered = this.articles;

            // 按分类筛选
            if (this.currentCategory !== 'all') {
                filtered = filtered.filter((article) => article.category === this.currentCategory);
            }

            // 按搜索关键词筛选
            if (this.searchValue) {
                const keyword = this.searchValue.toLowerCase();
                filtered = filtered.filter((article) => article.title.toLowerCase().includes(keyword) || article.summary.toLowerCase().includes(keyword));
            }
            this.setData({
                filteredArticles: filtered
            });
        },

        // 查看文章详情
        viewArticle(e) {
            const articleId = e.currentTarget.dataset.id;
            uni.navigateTo({
                url: `/pages/article/${articleId}/${articleId}`
            });
        },

        // 点赞文章
        likeArticle(e) {
            const articleId = e.currentTarget.dataset.id;
            const articles = this.articles.map((article) => {
                if (article.id === articleId) {
                    return {
                        ...article,
                        likes: article.likes + 1
                    };
                }
                return article;
            });
            this.setData({
                articles,
                filteredArticles: this.filterArticles()
            });
        }
    }
};
</script>
<style>
@import './knowledge.css';
</style>
