$(document).ready(function(){
     geocoder = new google.maps.Geocoder();

    $.ajax({
      beforeSend: geocode_stuff()
    }).done(function(){
        $.ajax({
        url:"/uber",
        type: 'POST',
        data: data_field()
        // data: {start_latitude: start_latitude,start_longitude:start_longitude,end_latitude:end_latitude,end_longitude:end_longitude}
        }).done(function(response){
          console.log(response)
          console.log('yes')
      });

    })

    start()

    function data_field(){
          var start_latitude = $('#start_latitude').val();
          var start_longitude = $('#start_longitude').val();
          var end_latitude = $('#end_latitude').val();
          var end_longitude = $('#end_longitude').val();
          return "{start_latitude:"+ start_latitude + ",start_longitude:"+start_longitude+",end_latitude:"+end_latitude+",end_longitude:"+end_longitude+"}"

        }
});


function geocode_stuff(){
var address = document.getElementById("address").innerHTML

      var longs = geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            console.log(results[0].geometry.location)

            document.getElementById("end_latitude").value = results[0].geometry.location.k
            document.getElementById("end_longitude").value = results[0].geometry.location.D


          } else {
            alert("Geocode was not successful for the following reason: " + status);
          }
        });
}

function success(position) {
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcontainer';
  mapcanvas.style.height = '400px';
  mapcanvas.style.width = '600px';

  document.querySelector('article').appendChild(mapcanvas);

  var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

  var options = {
    zoom: 15,
    center: coords,
    mapTypeControl: false,
    navigationControlOptions: {
      style: google.maps.NavigationControlStyle.SMALL
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("mapcontainer"), options);

  var marker = new google.maps.Marker({
      position: coords,
      map: map,
      title:"You are here!"
  });

  var start_latitude = position.coords.latitude;
  var start_longitude = position.coords.longitude;

  document.getElementById("start_latitude").value = start_latitude;
  document.getElementById("start_longitude").value = start_longitude;



}

function start(){
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success);
  } else {
    error('Geo Location is not supported');
  }
}

