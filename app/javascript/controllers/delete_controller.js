import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static targets = ["form"]

  delete(event) {
    event.preventDefault()

    const form = this.formTarget
    const url = form.getAttribute("action")

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-primary mx-2',
        cancelButton: 'btn btn-secondary mx-2'
      },
      buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'Cancel',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        Rails.ajax({
          url: url,
          type: "DELETE",
          success: function(data) {
            swalWithBootstrapButtons.fire({
              title: "Deleted!",
              text: "Your data has been deleted.",
              icon: "success",
              confirmButtonText: 'OK',
            }).then((result) => {
              if (result.isConfirmed) {
                window.location.reload()
              }
            })
          },
          error: function(data) {
            swalWithBootstrapButtons.fire({
              title: "Oops!",
              text: "Something went wrong!",
              icon: "error",
              confirmButtonText: 'OK',
            })
          }
        })
      }
    })
  }
}

