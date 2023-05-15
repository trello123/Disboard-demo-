// app/javascript/channels/online_users.js
import consumer from "./consumer"


document.addEventListener('turbo:load', ()=> {
  window.subscriptions = consumer.subscriptions
  
  consumer.subscriptions.subscriptions.forEach((subscription) => {
    if (JSON.parse(subscription.identifier).channel == 'ActivityChannel')
      consumer.subscriptions.remove(subscription)
  })
  consumer.subscriptions.create("ActivityChannel", {
    connected() {

    },
    
    disconnected() {
      this.unsubscribe()
    },
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      let online = document.querySelector("#online-users")
      let el = online.querySelector(`[data-id='${data.id}']`)
      if (data.status == "online" && el == null) {
        online.insertAdjacentHTML('beforeend', data.html)

      } else if (data.status == "offline" && el != null) {
        el.remove()
      }
    },
  })
})