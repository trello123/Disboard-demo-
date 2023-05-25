import Swal from "sweetalert2"
import moment from "moment"
import { patch } from '@rails/request.js'

function successNotify(message, icon = "success", position = "top-end", timer = 2000) {
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
    icon,
    title: message,
  })
}

function calendarModal(boardId, cardId, {title, start, end}, cb) {
  Swal.fire({
    title,
    html: inputDatetimeHTML(start, end),
    inputAttributes: {
      autocapitalize: 'off'
    },
    showCloseButton: true,
    showCancelButton: true,
    confirmButtonText: '更新',
    cancelButtonText: '取消',
    showLoaderOnConfirm: true,
    preConfirm: () => {
      const daybegin = moment(document.getElementById('swal-input1').value).format()
      const deadline = moment(document.getElementById('swal-input2').value).format()
      const url = '/api/v1/calendars/'
      patch(url, { query: { boardId, cardId, start: daybegin, end: deadline } })
        .then((resp)=> {
          if (resp.ok) {
            cb(daybegin, deadline)
          }
        })
    },
    allowOutsideClick: () => !Swal.isLoading()
  })
}

function inputDatetimeHTML(start, end){
  return `<div data-controller="flatpickr"><input id="swal-input1" type="datetime-local" class="daybegin swal2-input" value=${moment(start).format("YYYY-MM-DDTHH:mm")}>` +
  `<input id="swal-input2" type="datetime-local" class="deadline swal2-input" input" value=${moment(end).format("YYYY-MM-DDTHH:mm")}></div>`
}

export { successNotify, calendarModal }
