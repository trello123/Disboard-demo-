# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    "你有一条新消息：#{params[:content]}"
  end

  def recipients
    # 返回所有群组成员作为接收者
    chat_room = Board.find(params[:board_id]).room
    chat_room.users
  end

  # def url
  #   chat_room_path(params[:chat_room_id])
  # end
end


end
