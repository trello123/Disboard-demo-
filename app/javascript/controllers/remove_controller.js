import { Controller } from "@hotwired/stimulus"
import { destroy } from '@rails/request.js'
import Swal from "sweetalert2"


// Connects to data-controller="remove"
export default class extends Controller {

  wipeOut(e) {
    e.preventDefault()
    Swal.fire({
      title: '確定嗎?',
      text: "列表刪除後將無法復原!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '刪除',
      cancelButtonText: '取消'
    }).then((result) => {
      if (result.isConfirmed) {
        const { containerId } = this.element.dataset
        const url = `/api/v1/containers/${containerId}/remove`
        destroy(url)
        .then((resp)=> {
          if (resp.ok) {
            Swal.fire(
              '已刪除!',
              '您的列表已刪除完成',
              'success'
            )
            this.element.remove()
          }
        })
      }
    })  
  }
  
}
    
  

