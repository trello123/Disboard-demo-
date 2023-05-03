import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

// Connects to data-controller="chatroom"
export default class extends Controller {
  connect() {
    const room_element = document.getElementById('room-id')
    if (!room_element) {
      return
    }
    const room_id = room_element.getAttribute('data-room-id')

    window.subscriptions = consumer.subscriptions
    consumer.subscriptions.subscriptions.forEach((subscription) => {
      if (JSON.parse(subscription.identifier).channel == 'RoomChannel')
        consumer.subscriptions.remove(subscription)
    })

    consumer.subscriptions.create({channel:"RoomChannel", room_id: room_id},{
      connected() {
        // Called when the subscription is ready for use on the server
      },
    
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
    
      received(data) {
        // Called when there's incoming data on the websocket for this channel
        const user_element = document.getElementById('user-id')
        const user_id = Number(user_element.getAttribute('data-user-id'))
        
        let html
        
        if(user_id === data.message.user_id){
          html = data.mine 
        }else{
          html = data.theirs
          successNotify()
        }
        
        const messageContainer = document.getElementById('messages')
        messageContainer.innerHTML = messageContainer.innerHTML + html

        const chatWindow = document.getElementById('chat-window')
        chatWindow.scrollTop = chatWindow.scrollHeight
      }
    })
  }
}
