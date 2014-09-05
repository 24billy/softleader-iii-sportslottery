<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
var map;
var Lating = new google.maps.LatLng(25.033769,121.543398);
function initialize() {
  var mapOptions = {
    zoom: 17,  
    center:Lating
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  var marker = new google.maps.Marker({
	position:Lating,
	map:map,
	title:'¸êµ¦·|'
  });
  var flightPlanCoordinates=[
	new google.maps.LatLng(25.033769,121.543398),
	new google.maps.LatLng(25.023769,121.533398),
	new google.maps.LatLng(25.013769,121.523398),
	new google.maps.LatLng(25.063769,121.513398)
  ];
  var flightPath=new google.maps.Polyline({
	path:flightPlanCoordinates,
	geodesic:true,
	strokeColor:'Blue',
	strokeOpacity:1.0,
	strokeWeight:2
  });
  
  flightPath.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>