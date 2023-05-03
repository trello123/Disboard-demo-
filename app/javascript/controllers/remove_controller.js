import { Controller } from "@hotwired/stimulus"
import { destroy } from '@rails/request.js'
import Swal from "sweetalert2"


// Connects to data-controller="remove"
export default class extends Controller {
  static targets = [ "card" ]

  connect() {
    // this.element.setAttribute("data-action", "click->remove#drop")
    // this.element.drop()
    // this.drop()
  }

  drop() {
    const { cardId } = this.element.dataset
    console.log(this.element)
    const url = `/api/v1/cards/${cardId}/remove`
    destroy(url)
      .then((resp)=> {
        if (resp.ok) {
          console.log(this.cardTarget);
          Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
          }).then((result) => {
            if (result.isConfirmed) {
              Swal.fire(
                'Deleted!',
                'Your file has been deleted.',
                'success'
              )
              this.cardTarget.remove()
            }
          })  
        }
        
      })
    
  }
}
