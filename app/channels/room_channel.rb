class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # 在接收到新訊息時，透過 broadcast_to 方法將訊息發送給其他客戶端
    ActionCable.server.broadcast "room_channel_#{params['room_id']}", {message: data['message']}
  end
end
