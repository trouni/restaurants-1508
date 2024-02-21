import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ['list'] // Gives me access to the element using this.listTarget

  connect() {
    console.log("Connected to insert_in_list controller")
  }

  send(event) {
    event.preventDefault()
    const form = event.srcElement // You can find the `srcElement` by inspecting console.log(event)
    const url = form.action // /restaurants/:id/reviews

    // const reviewContent = form.input.value
    console.log(event)
    fetch(
      url, {
        headers: { "Accept": "application/json" },
        method: form.method, // POST
        body: new FormData(form)
      }
    ).then(response => response.json())
    .then(data => {
      if (data.new_review) {
        this.listTarget.insertAdjacentHTML('afterBegin', data.new_review)
      }

      form.outerHTML = data.form
    })
  }
}



// 1. Listen to the form submit event
// 2. CREATE A NEW REVIEW ON THE SERVER (fetch)
// 3. Insert the new review in the reviews list