// app/javascript/channels/online_users.js
import consumer from "./consumer"
document.addEventListener('turbo:load', ()=> {
  consumer.subscriptions.create("ActivityChannel", {
    connected() {
      this.appear();
    },
    
    disconnected() {
      let elements = document.getElementsByClassName("user-status");
      for (var i = 0; i < elements.length; i++) {
        elements[i].classList.remove('online');
      }
     },
    received(data) {
      console.log(data);
      // Called when there's incoming data on the websocket for this channel
      let elements = document.getElementsByClassName(`user-${data.user_id}-status`);
      window.elements = elements
      for (var i = 0; i < elements.length; i++) {
        if (data.status == 'online') {
          elements[i].classList.add('online')
        } else {
          elements[i].classList.remove('online')
        }
      }
    },
    
    appear() {
      this.perform("appear")
    }
  })
})  
