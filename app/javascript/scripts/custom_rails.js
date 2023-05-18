import Rails from "@rails/ujs";
import Swal from "sweetalert2"

Rails.confirm = (message, element) => {
  const swal = Swal.mixin({
    buttonsStyling: true,
  });

  swal.fire({
      html: message,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "確定",
      cancelButtonText: "取消",
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
    })
    .then((result) => {
      if (result.value) {
        element.removeAttribute("data-confirm");
        element.click();
      }
    });
};