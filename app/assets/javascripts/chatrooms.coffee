handleVisibilityChange = ->
  strike = document.querySelector(".strike")
  if strike != null
    chatroom_id = document.querySelector("div[data-behavior='messages']").getAttribute("data-chatroom-id")
    App.last_read.update(chatroom_id)
    strike.remove()

document.addEventListener 'turbolinks:load', ->
  # 增加一个点击事件, 如果提示红线存在，更新chatroom_user的last_read_time并去掉提示红线。
  document.addEventListener 'click', handleVisibilityChange

  document.getElementById("new_message").addEventListener 'keypress', (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      # url = this.action
      # data = new FormData(this)
      # Rails.ajax({
      #   type: "POST"
      #   url: url
      #   data: data
      #   dataType: "json"
      #   })
      chatroom_id = document.querySelector("div[data-chatroom-id]").getAttribute("data-chatroom-id")    #获得当前聊天室的id。
      body        = document.getElementById("message_body").value #获得textarea中的的值.
      document.getElementById("message_body").value = ""  #这是清空textarea
      App.chatrooms.send_message(chatroom_id, body)

  document.getElementById("button-message").addEventListener "click", (e) ->
    chatroom_id = document.querySelector("div[data-chatroom-id]").getAttribute("data-chatroom-id")
    body        = document.getElementById("message_body").value
    document.getElementById("message_body").value = ""
    App.chatrooms.send_message(chatroom_id, body)
