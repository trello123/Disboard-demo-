import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "modal" , "cardEdit"]
  closeCard(){
    this.cardEditTarget.classList.add('animate-sideout')
    setTimeout(() => {      
      this.cardEditTarget.remove()
    }, 600);
  }
}
