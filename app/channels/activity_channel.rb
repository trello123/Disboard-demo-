class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"
    appear # 在訂閱後立即觸發 appear 方法，更新其他客戶端的使用者狀態
  end

  def unsubscribed
    broadcast_offline
  end

  def appear
    broadcast_online
  end

  private

  def broadcast_online
    ActionCable.server.broadcast("activity_channel", { user_id: current_user.id, status: 'online' })
  end

  def broadcast_offline
    ActionCable.server.broadcast("activity_channel", { user_id: current_user.id, status: 'offline' })
  end
end
