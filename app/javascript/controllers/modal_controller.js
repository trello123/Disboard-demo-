import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal" , "title" , "cardEdit"]
  open(e){
    e.preventDefault()
    console.log(this.element.dataset);
    this.modalTarget.classList.remove("hidden")
  }
  close(e){
    e.preventDefault()
    this.modalTarget.classList.add( "hidden")
  }
  closeCard(){
    this.cardEditTarget.remove()
  }
}
