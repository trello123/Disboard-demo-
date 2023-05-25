import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ "submenu", "menu", "triangle" ]
  
  appear() {
    this.triangleTarget.classList.toggle("rotate-180")
    this.element.classList.toggle("navbar-out")
    this.element.classList.toggle("navbar-in")
  }


  show() {
    this.submenuTarget.classList.toggle("hidden")
    this.submenuTarget.classList.toggle("menu-list")
  }
}
