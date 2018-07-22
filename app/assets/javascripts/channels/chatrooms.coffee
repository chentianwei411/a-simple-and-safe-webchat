App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # console.log data
    # $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']").append(data.message)
    y = document.createElement("div")
    document.getElementById("chatroom-#{data.chatroom_id}").appendChild(y)
    document.getElementById("chatroom-#{data.chatroom_id}").lastChild.innerHTML = data.message

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}
