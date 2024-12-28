<template>
    <view class="container">
        <scroll-view
            :class="'chat-container ' + (isInputFocused ? 'input-focused' : '')"
            :scroll-y="true"
            :enhanced="true"
            :show-scrollbar="false"
            :scroll-with-animation="true"
            :scroll-top="scrollTop"
            :scroll-into-view="'msg' + (messages.length - 1)"
        >
            <view class="messages">
                <view
                    :class="'message ' + (item.type === 'Human' ? 'user' : 'ai') + ' ' + (loading && index === messages.length - 1 ? 'loading' : '')"
                    :id="'msg' + index"
                    v-for="(item, index) in messages"
                    :key="index"
                >
                    <view class="avatar user-avatar" v-if="item.type === 'Human'"></view>

                    <view :class="'avatar ' + (item.type === 'AI' ? 'ai' : 'user-avatar')" v-if="item.type === 'AI'"></view>

                    <view :class="'content ' + (item.type === 'AI' ? 'ai-content' : 'user-content')">
                        <text :user-select="true">{{ item.content }}</text>

                        <view v-if="item.type === 'AI' && item.references && item.references.hint_documents.length > 0" class="references">
                            <view class="references-header" @tap="toggleReferences" :data-message-index="index">
                                <text class="references-title">参考知识</text>
                                <view class="reference-count">{{ item.references.hint_documents.length }}条</view>
                                <view :class="'expand-icon ' + (expandedRefs[index] ? 'expanded' : '')">
                                    <text class="expand-text">{{ expandedRefs[index] ? '收起' : '展开' }}</text>
                                    <!-- <view class="expand-arrow"></view> -->
                                </view>
                            </view>

                            <view class="references-content" v-if="expandedRefs[index]">
                                <view class="reference-item" v-for="(doc, docIndex) in item.references.hint_documents" :key="docIndex">
                                    <view
                                        :class="'ref-header ' + (expandedDocs[index + '-' + docIndex] ? 'expanded' : '')"
                                        @tap="toggleDocument"
                                        :data-message-index="index"
                                        :data-doc-index="docIndex"
                                    >
                                        <text class="doc-name">{{ doc.document_name }}</text>
                                        <text class="doc-score">相关度：{{ doc.scoreFormatted }}%</text>
                                        <view class="expand-icon"></view>
                                    </view>

                                    <view :class="'ref-content ' + (expandedDocs[index + '-' + docIndex] ? 'expanded' : '')" v-if="expandedDocs[index + '-' + docIndex]">
                                        {{ doc.content }}
                                    </view>
                                </view>
                            </view>
                        </view>
                    </view>
                </view>
            </view>
        </scroll-view>

        <view :class="'input-container ' + (isInputFocused ? 'keyboard-active' : '')">
            <view v-if="followupQueries && followupQueries.length > 0" class="followup-container" :animation="followupAnimation">
                <view class="followup-item" @tap="handleFollowup" :data-query="item || ''" v-for="(item, index) in followupQueries" :key="index">
                    {{ item || '' }}
                </view>
            </view>

            <view class="input-wrapper">
                <textarea
                    class="input"
                    :value="inputValue"
                    @input="onInput"
                    @focus="onInputFocus"
                    @blur="onInputBlur"
                    auto-height
                    maxlength="500"
                    placeholder="请描述您的问题..."
                    :disabled="loading"
                    cursor-spacing="20"
                    :show-confirm-bar="false"
                    :hold-keyboard="true"
                ></textarea>
                <button
                    :class="'send-btn ' + (inputValue && inputValue.length > 0 ? 'active' : '')"
                    @tap="sendMessage"
                    :disabled="loading || !(inputValue && inputValue.length > 0)"
                ></button>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            messages: [],
            inputValue: '',
            loading: false,
            scrollTop: 0,
            followupQueries: [],
            showFollowup: false,
            session_id: null,
            expandedRefs: {},

            // 控制整个参考知识区域的展开状态
            expandedDocs: {},

            // 控制单个文档的展开状态
            followupAnimation: null,

            baseUrl: 'http://113.44.52.217:5000',
            isInputFocused: false,
            docIndex: 0,

            doc: {
                document_name: '',
                scoreFormatted: '',
                content: ''
            }
        };
    },
    // onLoad() {
    //     const app = getApp();
    //     this.setData(
    //         {
    //             session_id: app.globalData.session_id
    //         },
    //         () => {
    //             console.log('initing chat');
    //             this.initChat()
    //                 .then(() => {
    //                     console.log('chat ok');
    //                     return this.getHistoryMessages();
    //                 })
    //                 .then(() => {
    //                     console.log('messages ok');
    //                 })
    //                 .catch((error) => {
    //                     console.error('Error in initialization:', error);
    //                 });
    //         }
    //     );
    // },
	async onLoad() {
	    const app = getApp();
	    this.setData({
	        session_id: app.globalData.session_id
	    });
	    
	    try {
	        console.log('initing chat');
	        await this.initChat();
	        console.log('chat ok');
	        
	        await this.getHistoryMessages();
	        console.log('messages ok');
	    } catch (error) {
	        console.error('Error in initialization:', error);
	    }
	},
    methods: {
        initChat() {
            uni.request({
                url: `${this.baseUrl}/chat/${this.session_id}/init`,
                method: 'POST',
                data: {
                    content: '明白了。'
                },
                header: {
                    'content-type': 'application/json'
                },
                success: (res) => {
                    console.log('Chat initialized:', res.data);
                },
                fail: (error) => {
                    console.error('Init chat failed:', error);
                    uni.showToast({
                        title: '初始化失败',
                        icon: 'none'
                    });
                }
            });
        },

        processMessages(messages) {
            let msg1 = JSON.parse(JSON.stringify(messages));
            return msg1.map((msg) => {
                if (msg.type === 'AI' && msg.references && msg.references.hint_documents) {
                    msg.references.hint_documents = msg.references.hint_documents.map((doc) => ({
                        ...doc,
                        scoreFormatted: (doc.score * 100).toFixed(1),
                        title: doc.document_name || '参考文档'
                    }));
                }
                return msg;
            });

            // this.setData(
            //   {
            //     messages: messages
            //   }
            // )
        },

        getHistoryMessages() {
            let that = this;
            uni.request({
                url: `${this.baseUrl}/chat/${this.session_id}/messages`,
                method: 'GET',
                header: {
                    'content-type': 'application/json'
                },
                success: (res) => {
                    if (res.data && res.data.messages) {
                        const processedMessages = that.processMessages(res.data.messages);
                        that.setData(
                            {
                                messages: processedMessages
                            },
                            () => {
                                that.scrollToBottom();
                            }
                        );
                    }
                },
                fail: (error) => {
                    console.error('Get history failed:', error);
                    uni.showToast({
                        title: '获取历史记录失败',
                        icon: 'none'
                    });
                }
            });
        },

        onInput(e) {
            console.log(e.detail.value);
            this.setData({
                inputValue: e.detail.value
            });
        },

        toggleReferences(e) {
            const { messageIndex } = e.currentTarget.dataset;
            const expandedRefs = {
                ...this.expandedRefs
            };
            expandedRefs[messageIndex] = !expandedRefs[messageIndex];
            this.setData({
                expandedRefs
            });
        },

        toggleDocument(e) {
            const { messageIndex, docIndex } = e.currentTarget.dataset;
            const key = `${messageIndex}-${docIndex}`;
            const expandedDocs = {
                ...this.expandedDocs
            };
            expandedDocs[key] = !expandedDocs[key];
            this.setData({
                expandedDocs
            });
        },


        sendMessage(content = null) {
			const sendStreamRequest = (url, messageContent, callbacks) => {
			    const xhr = new XMLHttpRequest();
			    let buffer = '';

			    xhr.open('POST', url, true);
			    xhr.setRequestHeader('Content-Type', 'application/json');

			    // 处理数据流
			    xhr.onprogress = function(event) {
			        const chunk = xhr.responseText.substr(xhr.seenBytes || 0);
			        xhr.seenBytes = xhr.responseText.length;

			        buffer += chunk;
			        while (buffer.includes('\n\n')) {
			            const [message, ...rest] = buffer.split('\n\n');
			            buffer = rest.join('\n\n');

			            if (message.startsWith('data: ')) {
			                const data = message.slice(6);
			                if (data === '[DONE]') {
			                    let msg = callbacks.processMessages(callbacks.messages);
			                    callbacks.setData({
			                        messages: msg
			                    });
			                    return;
			                }

			                try {
			                    const parsedData = JSON.parse(data);
			                    const messages = [...callbacks.messages];
			                    switch (parsedData.type) {
			                        case 'references':
			                            messages[callbacks.lastIndex].references = parsedData.references;
			                            callbacks.updateMessage(messages);
			                            break;
			                        case 'content':
			                            messages[callbacks.lastIndex].content += parsedData.content;
			                            callbacks.updateMessage(messages);
			                            break;
			                        default:
			                            console.log('Unknown message type:', parsedData.type);
			                            break;
			                    }
			                } catch (e) {
			                    console.log('CatchClause', e);
			                    buffer = message.slice(6) + '\n\n' + buffer;
			                    break;
			                }
			            }
			        }
			    };

			    // 请求完成
			    xhr.onload = function() {
			        if (xhr.status >= 200 && xhr.status < 300) {
			            callbacks.success();
			        } else {
			            callbacks.fail({
			                status: xhr.status,
			                statusText: xhr.statusText
			            });
			        }
			    };

			    // 请求错误
			    xhr.onerror = function() {
			        callbacks.fail({
			            status: xhr.status,
			            statusText: xhr.statusText
			        });
			    };

			    // 请求完成（无论成功失败）
			    xhr.onloadend = function() {
			        callbacks.complete();
			    };

			    // 发送请求
			    xhr.send(JSON.stringify({
			        content: messageContent
			    }));

			    // 返回xhr对象，以便可以在需要时中断请求
			    return xhr;
			}
            if (this.loading) {
                return;
            }
            let messageContent = '';
            if (typeof content === 'string') {
                messageContent = content;
            } else if (typeof this.inputValue === 'string') {
                messageContent = this.inputValue;
            }
            if (!messageContent || messageContent.length === 0) {
                return;
            }
            const userMessage = {
                content: messageContent,
                type: 'Human'
            };
            const aiMessage = {
                content: '',
                type: 'AI',
                references: null
            };
            this.setData({
                messages: [...this.messages, userMessage, aiMessage],
                inputValue: '',
                loading: true,
                showFollowup: false,
                followupQueries: [] // 重置followupQueries
            });

            this.scrollToBottom();
            const lastIndex = this.messages.length - 1;
            let buffer = ''; // 用于累积不完整的JSON

            const arrayBufferToString = (buffer) => {
                const uint8Array = new Uint8Array(buffer);
                return String.fromCharCode.apply(null, uint8Array);
            };
            const updateMessage = (messages) => {
                this.setData(
                    {
                        messages
                    },
                    () => {
                        if (this.scrollThrottle) {
                            clearTimeout(this.scrollThrottle);
                        }
                        this.scrollThrottle = setTimeout(() => {
                            this.scrollToBottom();
                        }, 100);
                    }
                );
            };

			// 使用示例：
			const fetchFollowupQueries = () => {
				const requestTask = fetchFollowupStream(
					`${this.baseUrl}/chat/${this.session_id}/followup/stream`,
					{
						followupQueries: this.followupQueries,
						setData: this.setData.bind(this),
						success: () => {
							// 可选的成功回调
						},
						fail: (error) => {
							console.error('Fetch followup queries failed:', error);
						}
					}
				);
			};

			// 使用示例：
			const that = this;
			const requestTask = sendStreamRequest(
				`${this.baseUrl}/chat/${this.session_id}/messages/stream`,
				messageContent,
				{
					messages: this.messages,
					lastIndex: lastIndex,
					processMessages: this.processMessages,
					updateMessage: (messages) => {
						that.setData({
							messages: messages
						});
					},
					setData: this.setData.bind(this),
					success: () => {
						fetchFollowupQueries();
					},
					fail: (error) => {
						console.error('Send message failed:', error);
						uni.showToast({
							title: '发送失败',
							icon: 'none',
							duration: 2000
						});
						that.setData({
							loading: false
						});
					},
					complete: () => {
						that.setData({
							loading: false
						});
					}
				}
			);
        },

        handleFollowup(e) {
            const query = e.currentTarget.dataset.query;
            if (typeof query === 'string' && query.length > 0) {
                this.sendMessage(query);
            }
        },

        scrollToBottom() {
            this.$nextTick(() => {
                // 使用新的消息ID直接滚动到最新消息
                const lastIndex = this.messages.length - 1;
                if (lastIndex >= 0) {
                    uni.createSelectorQuery()
                        .in(uni)
                        .select(`#msg${lastIndex}`)
                        .boundingClientRect()
                        .exec((res) => {
                            if (res[0]) {
                                this.setData({
                                    // scrollTop: res[0].top
                                });
                            }
                        });
                }
            });
        },

        animateFollowup() {
            const animation = uni.createAnimation({
                duration: 300,
                timingFunction: 'ease'
            });
            animation.translateY(0).opacity(1).step();
            this.setData({
                followupAnimation: animation.export()
            });
        },

        onInputFocus() {
            console.log('onInputFocus');
            this.setData({
                showFollowup: false
            });
        },

        onInputBlur() {
            console.log('onInputBlur');
            if (this.followupQueries.length > 0) {
                this.setData({
                    showFollowup: true
                });
            }
            console.log(this.followupQueries);
        }
    }
};
</script>
<style>
@import './aiconsult.css';
</style>
