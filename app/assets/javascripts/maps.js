function initMap() {
    var uluru = {lat: 40.695857, lng: -73.7769757};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: uluru
    });
    var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }

  // var map;
  // function initMap() {
  //   map = new google.maps.Map(document.getElementById('map'), {
  //     zoom: 16,
  //     center: new google.maps.LatLng(40.695857, -73.7769757),
  //     mapTypeId: 'roadmap'
  //   });
