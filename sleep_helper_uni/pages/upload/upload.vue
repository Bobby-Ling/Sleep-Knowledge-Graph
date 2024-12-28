<template>
    <view>
        <!-- pages/upload/upload.wxml -->
        <progress-bar :current-step="currentStep" />

        <view class="container">
            <view class="info-card">
                <view class="info-icon">ℹ️</view>
                <view class="info-content">
                    <text class="info-text">如果您已有病历，请在此页面完成上传。</text>
                    <text class="info-text">若您还没有做系统检查，可直接跳至下一步。</text>
                </view>
            </view>

            <!-- <view class="upload-section">
    <view class="upload-options">
      <button class="upload-btn camera" bindtap="chooseImageFromCamera">
        <view class="btn-icon">📸</view>
        <text>拍照上传</text>
      </button>
      <button class="upload-btn album" bindtap="chooseImageFromAlbum">
        <view class="btn-icon">🖼️</view>
        <text>从相册选择</text>
      </button>
    </view>
  </view> -->

            <view class="upload-section">
                <view class="upload-options">
                    <button class="upload-btn camera" @tap="chooseImageFromCamera">
                        <view class="btn-icon">📸</view>
                        <text>拍照上传</text>
                    </button>
                    <button class="upload-btn album" @tap="chooseImageFromAlbum">
                        <view class="btn-icon">🖼️</view>
                        <text>从相册选择</text>
                    </button>
                </view>

                <view class="test-images" v-if="!uploadSuccess">
                    <view class="section-title">测试用例（点击上传）</view>
                    <view class="test-images-grid">
                        <view class="test-image-btn" @tap="uploadTestImage" :data-index="index" hover-class="btn-hover" v-for="(item, index) in testImages" :key="index">
                            <image :src="item.src" mode="aspectFit"></image>

                            <text>{{ item.name }}</text>
                        </view>
                    </view>
                </view>
            </view>

            <view v-if="uploading" class="loading">
                <view class="loading-spinner"></view>
                <text>正在解析病历...</text>
            </view>

            <block v-if="uploadSuccess">
                <view class="result-section">
                    <view class="result-header">
                        <text class="result-title">病历解析结果</text>
                    </view>

                    <!-- 患者信息 -->
                    <view class="info-block">
                        <view class="block-title">基本信息</view>
                        <view class="info-grid">
                            <view class="info-item">
                                <text class="label">姓名</text>
                                <text class="value">{{ uploadResult.patient.name }}</text>
                            </view>
                            <view class="info-item">
                                <text class="label">性别</text>
                                <text class="value">{{ uploadResult.patient.gender }}</text>
                            </view>
                            <view class="info-item">
                                <text class="label">年龄</text>
                                <text class="value">{{ uploadResult.patient.age }}岁</text>
                            </view>
                        </view>
                    </view>

                    <!-- 发病经过 -->
                    <view class="info-block">
                        <view class="block-title">发病经过</view>
                        <view class="course-grid">
                            <view class="course-item">
                                <text class="label">病程</text>
                                <text class="value">{{ uploadResult.course.duration }}</text>
                            </view>
                            <view class="course-item">
                                <text class="label">加重时间</text>
                                <text class="value">{{ uploadResult.course.aggravation_period }}</text>
                            </view>
                            <view class="course-item">
                                <text class="label">睡眠情况</text>
                                <text class="value">{{ uploadResult.course.sleep_condition }}</text>
                            </view>
                        </view>
                    </view>

                    <view class="info-block symptoms-block">
                        <view class="block-title">当前症状</view>
                        <view class="symptoms-list">
                            <view class="symptom-item" v-for="(item, index) in uploadResult.symptoms.current" :key="index">
                                <view class="symptom-content">
                                    <view class="symptom-name-tag">{{ item.name }}</view>
                                    <text v-if="item.details" class="symptom-details">{{ item.details }}</text>
                                </view>

                                <view class="symptom-indicator"></view>
                            </view>
                        </view>
                    </view>

                    <!-- 否认症状部分的WXML -->
                    <view class="info-block denied-block">
                        <view class="block-title">否认症状</view>
                        <view class="denied-symptoms">
                            <view class="denied-symptom-tag" v-for="(item, index) in uploadResult.symptoms.denied" :key="index">
                                {{ item }}
                            </view>
                        </view>
                    </view>

                    <!-- 既往病史 -->
                    <view class="info-block">
                        <view class="block-title">病史记录</view>
                        <view class="history-list">
                            <view class="history-item">
                                <text class="history-label">既往史：</text>
                                <text class="history-value">{{ uploadResult.medical_history.past }}</text>
                            </view>
                            <view class="history-item">
                                <text class="history-label">个人史：</text>
                                <text class="history-value">{{ uploadResult.medical_history.personal }}</text>
                            </view>
                        </view>
                    </view>

                    <!-- 诊断信息 -->
                    <!-- <view class="info-block">
        <view class="block-title">诊断信息</view>
        <view class="diagnosis-section">
          <view class="sub-title">初步诊断</view>
          <view class="diagnosis-list">
            <view wx:for="{{uploadResult.diagnosis.preliminary}}" wx:key="*this" 
                  class="diagnosis-item">{{item}}</view>
          </view>
          
          <view class="sub-title margin-top">鉴别诊断</view>
          <view class="diagnosis-list">
            <view wx:for="{{uploadResult.diagnosis.differential}}" wx:key="*this" 
                  class="diagnosis-item differential">{{item}}</view>
          </view>
        </view>
      </view> -->
                </view>
            </block>

            <!-- <view class="action-section">
    <button class="next-btn" bindtap="goToAnalysis">
      前往分析页面
      <text class="arrow">→</text>
    </button>
  </view> -->
        </view>
    </view>
</template>

<script>
import progressBar from '@/components/progress-bar/progress-bar';
// pages/upload/upload.js
export default {
    components: {
        progressBar
    },
    data() {
        return {
            currentStep: 4,
            uploadResult: null,
            uploading: false,
            uploadSuccess: false,
            sessionId: '',

            testImages: [
                {
                    name: '测试图片1',
                    src: '/static/assets/test/1.png'
                },
                {
                    name: '测试图片2',
                    src: '/static/assets/test/2.png'
                }
                // 可以继续添加更多测试图片...
            ],

            name: '',
            gender: '',
            age: '',
            duration: '',
            aggravation_period: '',
            sleep_condition: '',
            current: [],
            denied: [],
            past: '',
            personal: ''
        };
    },
    onLoad() {
        this.setData({
            sessionId: getApp().globalData.session_id
        });
    },
    methods: {
        chooseImageFromCamera: function () {
            this.chooseImage('camera');
        },

        chooseImageFromAlbum: function () {
            this.chooseImage('album');
        },

        uploadTestImage: function (e) {
            const index = e.currentTarget.dataset.index;
            const imageUrl = this.testImages[index].src;
            this.uploadFile(imageUrl);
        },

        chooseImage: function (source) {
            uni.chooseMedia({
                count: 1,
                mediaType: ['image'],
                sourceType: [source],
                success: (res) => {
                    this.uploadFile(res.tempFiles[0].tempFilePath);
                }
            });
        },

        uploadFile: function (filePath) {
            this.setData({
                uploading: true,
                uploadSuccess: false,
                uploadResult: null
            });
            uni.uploadFile({
                url: `http://113.44.52.217:5000/medical_history/${this.sessionId}`,
                filePath: filePath,
                name: 'file',
                success: (res) => {
                    try {
                        const responseData = JSON.parse(res.data);
                        console.log(responseData); // 调试用
                        const parsedData = responseData.result;
                        if (parsedData) {
                            this.setData({
                                uploadResult: parsedData,
                                uploadSuccess: true
                            });
                        } else {
                            throw new Error('Invalid response data');
                        }
                    } catch (error) {
                        console.log('CatchClause', error);
                        console.log('CatchClause', error);
                        console.error('Parse error:', error);
                        uni.showToast({
                            title: '数据解析失败',
                            icon: 'error',
                            duration: 2000
                        });
                    }
                },
                fail: (error) => {
                    console.error('Upload error:', error);
                    uni.showToast({
                        title: '上传失败',
                        icon: 'error',
                        duration: 2000
                    });
                },
                complete: () => {
                    this.setData({
                        uploading: false
                    });
                }
            });
        },

        goToAnalysis: function () {
            uni.navigateTo({
                url: '/pages/analysis_all/analysis_all'
            });
        }
    }
};
</script>
<style>
@import './upload.css';
</style>
