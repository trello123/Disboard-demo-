import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="newcard"
export default class extends Controller {
  static targets = [ "button", "daybegin", "deadline" ]
  input(e) {
    const content = e.target.value.trim()

    if (content != "") {
      // 開
      this.buttonTarget.classList.replace("card-close", "card-btn")
      this.buttonTarget.removeAttribute("disabled")
    } else {
      // 關
      this.buttonTarget.classList.replace("card-btn", "card-close")
      this.buttonTarget.setAttribute("disabled", "")
    }

    if (this.daybeginTarget.value != 0 && this.deadlineTarget.value != 0) {
      if (this.daybeginTarget.value > this.deadlineTarget.value) {
        this.buttonTarget.classList.replace("card-btn", "card-close")
        this.buttonTarget.setAttribute("disabled", "")
      }
    }
  }
}
