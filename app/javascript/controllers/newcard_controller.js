import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="newcard"
export default class extends Controller {
  static targets = [ "button" ]
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
  }
}
