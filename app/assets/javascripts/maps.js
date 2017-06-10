function initMap(){

  var geoloc=new google.maps.Geocoder();
  // var logo = "/assets/favicon_32.png";
  var street;
  var info;
  var marker="marker";
  var blvd = {lat: 40.5839092, lng: -73.8175987};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: blvd
  });
  var loc=$("#map").data("locations");

  for(var cnt=0; cnt<loc.length; cnt++){
    //  Note field may contain more specific location info
    var note=loc[cnt].notes;
    //  Convert address to LatLong
    (function(note){geoloc.geocode(
      {'address': loc[cnt].address},
      function(results, status){
        //  format note to add to title field which is map tooltip
        if (status == "OK"){
          if (note != ""){
            info="by the "+ note;
          } else{
            info=note;
          }
          marker+=cnt;
          // console.log("This is info-"+ info);
          var logoMarker=marker;
          //  Create custom marker and place it on map
          logoMarker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            icon: logo,
            title: "Catch Me If You Can" + "\n" +info
          });
          //  Create infowindow for marker and add address
          var infowindow = new google.maps.InfoWindow({
            content: results[0].formatted_address
          });
          logoMarker.addListener('click', function() {
            infowindow.open(map, logoMarker);
          });
        } else{
            console.log("No good"+ loc[cnt].address);
        }
      }
    );
  })(note);
  }
}
