import { Controller } from "@hotwired/stimulus"
import AOS from "aos"
// Connects to data-controller="modal"
export default class extends Controller {
  open(){
    AOS.init();
    this.element.setAttribute("class", "overflow-hidden homepage-bg")
  }
  close(e){
    e.preventDefault()
    this.element.classList.remove("overflow-hidden")
    this.element.querySelector(".logn-modal").setAttribute("class", "hidden")
  }
}
