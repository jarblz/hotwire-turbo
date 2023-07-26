import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stockers"
export default class extends Controller {
  connect() {
    // Load the Google Map
    this.map = new google.maps.Map(this.element, {
      center: { lat: 37.7749, lng: -122.4194 }, // Set your initial map center
      zoom: 12 // Set the initial zoom level
    });
  }
}
