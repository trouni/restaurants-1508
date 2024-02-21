import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    // With Stimulus, `this.element` returns the HTML element that is connected
    // using `data-controller="datepicker"`
    // console.log(this.element)
    flatpickr(this.element, {
      // mode: "range",
      // dateFormat: "Y-m-d"
    })
  }
}
