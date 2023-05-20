import { Controller } from "@hotwired/stimulus"
import AOS from "aos"
// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]
  open(){
    AOS.init();
    this.element.setAttribute("class", "overflow-hidden homepage-bg")
  }
  close(e){
    e.preventDefault()
    this.element.classList.remove("overflow-hidden")
    this.modalTarget.classList.add("hidden")
  }
}
