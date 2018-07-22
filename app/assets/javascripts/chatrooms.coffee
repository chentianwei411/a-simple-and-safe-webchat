document.addEventListener 'turbolinks:load', ->
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
