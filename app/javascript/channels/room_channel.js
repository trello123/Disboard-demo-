import consumer from "./consumer"


document.addEventListener('turbolinks:load', ()=> {
  const room_element = document.getElementById('room-id')
  const room_id = room_element.getAttribute('data-room-id')


  consumer.subscriptions.subscriptions.forEach((subscription) => {
    // if(JSON.parse(subscription.identifier).channel == 'RoomChannel')
    consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({channel:"RoomChannel", room_id: room_id},{
    connected() {
      console.log("connected to room channel" + room_id);
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data);
      const user_element = document.getElementById('user-id')
      const user_id = Number(user_element.getAttribute('data-user-id'))
      
      let html
      
      if(user_id === data.message.user_id){
        html = data.mine 
      }else{
        html = data.theirs
      }
      
      const messageContainer = document.getElementById('messages')
      messageContainer.innerHTML = messageContainer.innerHTML + html

      const chatWindow = document.getElementById('chat-window')
      chatWindow.scrollTop = chatWindow.scrollHeight
    }
  });
})