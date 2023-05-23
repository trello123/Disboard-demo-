import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="newcard"
export default class extends Controller {
  static targets = [ "button" ]
  input(e) {
    const content = e.target.value.trim()

    if (content != "") {
      // 開
      this.buttonTarget.classList.remove("card-close")
      this.buttonTarget.classList.add("card-btn")
      this.buttonTarget.removeAttribute("disabled")
    } else {
      // 關
      this.buttonTarget.classList.remove("card-btn")
      this.buttonTarget.classList.add("card-close")
      this.buttonTarget.setAttribute("disabled", "")
    }
  }
}
