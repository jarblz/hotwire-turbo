export function initMap() {
  const coords = document.getElementById("breweries");
  const city = {
    lat: coords.getAttribute("data-latitude"),
    lng: coords.getAttribute("data-longitude")
  };
  
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 10,
    center: city
  });
  
  const breweries = document.querySelectorAll("li.brewery-list-item");
  breweries.forEach(brewery => {
    const marker = new google.maps.Marker({
      position: {
        lat: brewery.getAttribute("data-latitude"),
        lng: brewery.getAttribute("data-longitude")
      },
      map: map
    });
  })
}
                    
window.initMap = initMap;