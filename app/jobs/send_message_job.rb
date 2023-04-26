class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    mine = ApplicationController.render(
      partial: 'messages/mine',
      locals:{ message: message }
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs',
      locals:{ message: message }
    )
    # redirect_to request.referrer
    ActionCable.server.broadcast(
    "room_channel_#{ message.room_id }", { mine: mine , theirs: theirs , message: message })
  end
end
