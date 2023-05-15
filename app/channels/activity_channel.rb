class ActivityChannel < ApplicationCable::Channel
  def subscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.sadd "online", current_user.id

    stream_from "online:rooms"

    html = ApplicationController.render(partial: "rooms/online", locals: { user: current_user })
    broadcast_to "users", { id: current_user.id, status: "online", html: html }
  end

  def unsubscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.srem "online", current_user.id

    broadcast_to "users", { id: current_user.id, status: "offline" }
    stop_all_streams
  end
end
