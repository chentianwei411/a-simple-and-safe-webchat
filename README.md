# 一个超简单的聊天WeChat
使用Rails的actionaction的WebSocket双通信能力，建立实时聊天page。

##开发目的
一个私密的聊天网站，聊天很爽但要防止私密信息泄露。
用户可以选择从服务器删除个人message，可以把个人message下载到本地。

##基本架构
Chatroom: 聊天室。
User: 用户。
Chatroom_user: 用于储存Chatroom和User的信息。关联Chatroom和User。
Message: 用于储存用户发送的信息。关联Chatroom和User。

##2个Channel
1. Chatrooms: 主要频道，所有新建的chatrooms都是一个频道。
2. LastRead: 独立出来的feature，用于实时更新未读messages。
