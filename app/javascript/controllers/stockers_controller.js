import { Controller } from "@hotwired/stimulus"
import { Loader } from '@googlemaps/js-api-loader'

export default class extends Controller {
  apiKey(){
    return document.querySelector("meta[name=gm_js_ak]").content
  }

  connect() {
    const loader = new Loader({
      apiKey: this.apiKey(),
      version: "weekly",
      libraries: ["places"]
    });

    const mapOptions = {
      center: {
        lat: 0,
        lng: 0
      },
      zoom: 4
    };
    console.log(this.apiKey())
    loader
      .load()
      .then((google) => {
        new google.maps.Map(document.getElementById("map"), mapOptions);
      })
      .catch(e => {
        // do something
        console.log('fuggg', e)
      });

    // // Load the Google Map
    // console.log('stockerzz')
    // this.map = new google.maps.Map(this.element, {
    //   center: { lat: 37.7749, lng: -122.4194 }, // Set your initial map center
    //   zoom: 12 // Set the initial zoom level
    // });
  }
}
