import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ "submenu", "menu", "triangle" ]
  
  appear() {
    this.menuTarget.classList.toggle("hidden")
    this.triangleTarget.classList.toggle("rotate-180")
  }


  show() {
      this.submenuTarget.classList.toggle("hidden")
  }
}
