import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["street", "city", "state", "zip"];

  connect() {
    // Can also initialize this with a CustomEvent
    const event = new Event('google-maps-callback', {
      bubbles: true,
      cancelable: true,
    })
    window.dispatchEvent(event);
  }

  // additional actions
}