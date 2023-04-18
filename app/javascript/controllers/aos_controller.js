import { Controller } from "@hotwired/stimulus"
import AOS from "aos"
// Connects to data-controller="aos"
export default class extends Controller {
  static targets = [ "element" ]

  connect() {
    AOS.init()
  }

  disconnect() {
    AOS.refresh()
  }
}
