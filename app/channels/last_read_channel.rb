class LastReadChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update(data)
    chatroom_user = current_user.chatroom_users.find_by(chatroom_id: data["chatroom_id"])
    chatroom_user.update(last_read_at: Time.zone.now)
  end
end
