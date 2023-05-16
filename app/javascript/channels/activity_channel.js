// app/javascript/channels/online_users.js
import consumer from "./consumer"


document.addEventListener('turbo:load', ()=> {
  consumer.subscriptions.create("ActivityChannel", {  
    disconnected() {
      this.unsubscribe()
    },
    received(data) {
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