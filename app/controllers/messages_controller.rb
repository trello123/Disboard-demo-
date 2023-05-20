class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.includes(:user)
  end

  def new
    @message = Message.new
  end

  def create
    current_user.messages.create(message_params)
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id, :room_id)
    end
end
