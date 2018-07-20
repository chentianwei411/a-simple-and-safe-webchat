class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom

  def create
    message = @chatroom.messages.new(params_message)
    message.user_id = current_user.id
    message.save!
    # respond_to :js
    # respond_to do |format|
    #   if message.save
    #     # (5.2提示unknownFormat?)
    #     format.js
    #     # format.html { redirect_to @chatroom }
    #     # format.json { render :show, status: :created, location: @chatroom }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @chatroom.errors, status: :unprocessable_entity }
    #   end
    # end
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
