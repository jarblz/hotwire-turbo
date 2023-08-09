// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.initMap = function () {
  console.log('window initMap')
  var evt = new Event("map-loaded");
  window.dispatchEvent(evt)
}