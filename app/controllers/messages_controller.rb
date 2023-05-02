class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save


    SendMessageJob.perform_later(@message)
  end

  private
    def message_params
      params.require(:message).permit(:content, :user_id, :room_id)
    end
end
