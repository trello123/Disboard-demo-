import { Controller } from "@hotwired/stimulus"
import { successNotify } from "utils/notify";

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    const { message, type } = this.element.dataset
    if (type == 'notice') {
      successNotify(message)
    } else {
      successNotify(message, "error")
    }
  }
}
