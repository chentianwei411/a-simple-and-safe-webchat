class ChatroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    if @chatroom.chatroom_users.exists?(user_id: current_user.id)
      @chatroom_user = @chatroom.chatroom_users.find_by(user_id:current_user.id)
    else
      @chatroom_user = @chatroom.chatroom_users.new(user_id: current_user.id, last_read_at: Time.zone.now)
      @chatroom_user.save!
    end

    redirect_to @chatroom
  end

  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    redirect_to chatrooms_path
  end

  private

  def set_chatroom
    # 传入的参数有chatroom_id,这是从link_to方法的path参数中解析出来的
    # chatroom_chatroom_users_path(chatroom) 对应的url是 /chatrooms/:chatroom_id/chatroom_users(.:format)
    # 如："chatroom_id"=>"1"
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
