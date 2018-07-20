class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    message = @chatroom.messages.new(params_message)
    message.user_id = current_user.id
    message.save!
    redirect_to chatroom_path(@chatroom)
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
