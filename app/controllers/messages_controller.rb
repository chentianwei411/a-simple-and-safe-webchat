class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  # 改用actioncable创建数据：
  # def create
  #   message = @chatroom.messages.new(params_message)
  #   message.user_id = current_user.id
  #   message.save!
  #   MessageRelayJobJob.perform_later(message)
  # end

  def clear
    @chatroom.messages.where(user_id: current_user.id).destroy_all
    redirect_to chatrooms_path
  end

  private

  def set_chatroom
    # 设置的是嵌套routes,从url可以得到这个参数
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def params_message
    params.require(:message).permit(:body)
  end
end
