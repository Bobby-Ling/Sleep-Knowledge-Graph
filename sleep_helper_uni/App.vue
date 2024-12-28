<script>
// app.js
export default {
    data() {
        return {};
    },
    onLaunch() {
        // const accountInfo = wx.getAccountInfoSync();
        //开发时，将这个写死，方便自己预览
        // const isShow = accountInfo.miniProgram.envVersion === 'develop';
        // const isShow = accountInfo.miniProgram.envVersion === 'release';
        const isShow = true;
        // 存储当前版本,也可以使用globalData
        uni.setStorageSync('isShow', isShow);
        // 使用页面，直接读取envVersion，然后判断

        this.globalData.checkAndSetTabBar();
        // 展示本地存储能力
        const logs = uni.getStorageSync('logs') || [];
        logs.unshift(Date.now());
        uni.setStorageSync('logs', logs);
        this.globalData.session_id = this.globalData.generateUUID();
        console.log('启动成功，用户的session_id为', this.globalData.session_id);
    },
    globalData: {
        userInfo: null,

        scaleResults: {
            AISI: [],
            ESS: [],
            HAMA: [],
            HAMD: [],
            IRLSSG: [],
            PSQI: [],
            RBDSQ: [],
            StopBang: []
        },

        symptoms: [],
        selectedAnswers: [],
        schema_name: null,
        relatedScalesIndex: [],
        indexNext: 0,
        session_id: '',

        generateUUID: function () {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                var r = (Math.random() * 16) | 0;
                var v = c == 'x' ? r : (r & 3) | 8;
                return v.toString(16);
            });
        },

        checkAndSetTabBar: function () {
            console.log(uni.getStorageSync('isShow'));
            if (!uni.getStorageSync('isShow')) {
                uni.hideTabBar();
            }
        }
    }
};
</script>
<style>
@import './app.css';
</style>
