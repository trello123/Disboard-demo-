import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import 'flatpickr/dist/flatpickr.min.css';

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    flatpickr(".daybegin", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      time_24hr: true
    })
    flatpickr(".deadline", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      time_24hr: true
    })
  }
}
