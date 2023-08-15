import { Controller } from "@hotwired/stimulus"
import { Loader } from '@googlemaps/js-api-loader'

export default class extends Controller {
  apiKey(){
    return document.head.querySelector("meta[name=gm_js_ak]").content
  }

  static targets = ["field", "map", "stockers"]

  connect() {
    const loader = new Loader({
      apiKey: this.apiKey(),
      version: "weekly",
      libraries: ["places"]
    });

    const mapOptions = {
      center: {
        lat: 43.0760,
        lng: -107.290283
      },
      zoom: 8
    };
    console.log(this.apiKey())
    loader
      .load()
      .then((google) => {
        console.log('loader')
        console.log('field', this.fieldTarget)
        this.map = new google.maps.Map(document.getElementById("map"), mapOptions);
        this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
        this.autocomplete.bindTo('bounds', this.map)
        this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
        this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))
    
        this.addMarkers()
    
      })
      .catch(e => {
        // do something
        console.log('fuggg', e)
      });
  }

  placeChanged() {
    console.log('changed')
    let place = this.autocomplete.getPlace()
    console.log('map-target', this.map)
    let mapElement = this.map

    if (!place.geometry) {
      window.alert(`No details available for input: ${place.name}`)
      return
    }
    if (place.geometry.viewport) {
      debugger;
      mapElement.fitBounds(place.geometry.viewport)
    } else {
      mapElement.setCenter(place.geometry.location)
      mapElement.setZoom(17)
    }

    this.marker.setPosition(place.geometry.location)
    this.marker.setVisible(true)

    // this.latitudeTarget.value = place.geometry.location.lat()
    // this.longitudeTarget.value = place.geometry.location.lng()
  }

  keydown(event) {
    if (event.key == "Enter") {
      event.preventDefault()
    }
  }

  addMarkers() {
    Array.from(this.stockersTarget.children).forEach(stocker => {
      const location =  {
        lat: parseFloat(stocker.dataset.lat),
        lng: parseFloat(stocker.dataset.lng)
      };
      this.marker = new google.maps.Marker({
        position: location,
        map: this.map,
        title: "This is a marker",
      })

      const infowindow = new google.maps.InfoWindow({
        content: this.markerLabel(stocker),
        ariaLabel: "Uluru",
      });
      const marker = new google.maps.Marker({
        position: location,
        map: this.map,
        title: "Stocked Fish",
      });
    
      marker.addListener("click", () => {  
        infowindow.open({
          anchor: marker,
          map: this.map,
        });
      });
    });
  }


  markerLabel(stocker){
    const content = '<div class="infoWindow">' +
    `<h1 id="firstHeading" class="firstHeading">${stocker.dataset.name}</h1>` +
    '<div id="bodyContent">' +
      "<ul> " +
      `<li><b>Date Stocked:</b> ${stocker.dataset.dateStocked}</li>` +
      `<li><b>Species:</b> ${stocker.dataset.species}</li>` +
      `<li><b>Quantity:</b> ${stocker.dataset.quantity}</li>` +
      "</ul> " +
    "</div>" +
    "</div>";
    return content
  }
}
