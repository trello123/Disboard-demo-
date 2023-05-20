import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatsubmit"
export default class extends Controller {
  static targets = ["submit", "input"]

  connect() {
    this.inputTarget.focus()
  }
  input(e) {
    const content = e.target.value.trim()
    if (content != "") {
      // 開
      this.submitTarget.removeAttribute("disabled")
    } else {
      // 關
      this.submitTarget.setAttribute("disabled", "")
    }
  }
  submit() {
    setTimeout(() => {
      this.inputTarget.value = ""
      this.submitTarget.setAttribute("disabled", "")
    }, 0);
  }
}
