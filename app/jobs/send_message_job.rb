class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    mine = ApplicationController.render(
      partial: 'messages/mine',
      locals: { message: }
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs',
      locals: { message: }
    )

    ActionCable.server.broadcast(
    "room_channel_#{ message.room_id }",  { mine:, theirs:, message: })
  end
end


