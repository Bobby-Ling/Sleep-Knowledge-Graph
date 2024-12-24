async function chatStream(content) {
    try {
        const response = await fetch('http://bobby.ipyingshe.net:22630/chat/547890a7-5909-41fe-9222-0e142285b39a/messages/stream', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                content: content
            })
        });

        const reader = response.body.getReader();
        const decoder = new TextDecoder();

        let fullContent = '';
        let references = null;
        let followupQueries = [];
        let buffer = '';  // 用于累积不完整的JSON

        while (true) {
            const {value, done} = await reader.read();
            if (done) break;

            const chunk = decoder.decode(value);
            buffer += chunk;

            // 处理完整的消息
            while (buffer.includes('\n\n')) {
                const [message, ...rest] = buffer.split('\n\n');
                buffer = rest.join('\n\n');  // 保存剩余部分

                if (message.startsWith('data: ')) {
                    const data = message.slice(6);

                    if (data === '[DONE]') {
                        console.log('Stream completed');
                        return;
                    }

                    try {
                        const parsedData = JSON.parse(data);

                        switch(parsedData.type) {
                            case 'references':
                                references = parsedData.references;
                                updateReferences(references);
                                break;

                            case 'content':
                                fullContent += parsedData.content;
                                updateContent(fullContent);
                                break;

                            case 'followup_query':
                                followupQueries.push(parsedData.query);
                                updateFollowupQueries(followupQueries);
                                break;
                        }
                    } catch (e) {
                        // 如果解析失败，可能是JSON不完整，将此消息放回buffer
                        buffer = message.slice(6) + '\n\n' + buffer;
                        break;  // 跳出while循环，等待更多数据
                    }
                }
            }
        }
    } catch (error) {
        console.error('Error:', error);
    }
}


function updateContent(content) {
    console.log(content)
}

function updateReferences(references) {
    console.log(references)
}

function updateFollowupQueries(queries) {
    console.log(queries)
}
// 使用示例
const testMessage = `er`;

chatStream(testMessage);