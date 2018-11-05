App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # 查看是否有当前聊天窗口元素，如果false则在左边栏的聊天室名字颜色变"red"
    if document.querySelector("div[data-chatroom-id=\'#{data.chatroom_id}\']")
      # 看看网页是否处于隐藏状态，true则加上一条提示线并添加通知框，false则更新last_read_at
      if document.hidden
        # 查看是否已经有一条提醒红线， 如果没有则插入一条提示红线
        if document.querySelector('.strike') == null #.strike类的元素数量为0 ， $('.strike').length == 0
          div = document.createElement("div")
          span = document.createElement("span")
          text = document.createTextNode("未读消息！")
          span.appendChild(text)
          div.appendChild(span)
          div.className = "strike"
          document.getElementById("chatroom-#{data.chatroom_id}").appendChild(div)
        #  添加通知框
        if Notification.permission == "granted"
          new Notification("通知", {body: "您有新的消息！"})
      else
        # 发送message to server of last_read_at timestamp
        App.last_read.update(data.chatroom_id)

      # 插入message
      y = document.createElement("div")
      document.getElementById("chatroom-#{data.chatroom_id}").appendChild(y)
      document.getElementById("chatroom-#{data.chatroom_id}").lastChild.innerHTML = data.message
    else
      document.querySelector("a[data-chatroom-id=\'#{data.chatroom_id}\']").style.color = "red"

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}

App.cable = ActionCable.createConsumer("/chatrooms")
