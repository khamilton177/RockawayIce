function initMap(){

  var geoloc=new google.maps.Geocoder();
  var logoMarker;
  var logo = "/assets/favicon_32.png";

  var blvd = {lat: 40.5839092, lng: -73.8175987};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: blvd
  });

  var loc=$("#map").data("locations");
  // var tlt;
  for(var cnt=0; cnt<loc.length; cnt++){
    var tip=loc[cnt].notes;
    console.log("tip "+ tip);
    geoloc.geocode(
      {'address': loc[cnt].address},
      function(results, status, tip){
        if (status == "OK"){
          logoMarker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            icon: logo,
            title: tip
          });
        } else{
            console.log("No good"+ loc[cnt].address);
        }
      }
    );
  }
}
