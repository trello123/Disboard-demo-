import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  open(){
    this.element.setAttribute("class", "overflow-hidden")
  }
  close(e){
    e.preventDefault()
    this.element.classList.remove("overflow-hidden")
    this.element.querySelector(".logn-modal").setAttribute("class", "hidden")
  }
}
