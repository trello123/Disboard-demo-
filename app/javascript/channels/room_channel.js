import consumer from "./consumer"
import Swal from "sweetalert2"


document.addEventListener('turbolinks:load', ()=> {
 
})


function successNotify(position = "top-end", timer = 2000) {
  const Toast = Swal.mixin({
    toast: true,
    position,
    showConfirmButton: false,
    timer,
    timerProgressBar: true,
    showCloseButton: true,
    didOpen: (toast) => {
      toast.addEventListener("mouseenter", Swal.stopTimer)
      toast.addEventListener("mouseleave", Swal.resumeTimer)
    },
  })

  Toast.fire({
    title: '您有新訊息',
  })
}



