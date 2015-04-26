<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="kmlMap.aspx.cs" Inherits="Demonstration.kmlMap" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <link rel="icon" href="imageFolder/zoophy.ico" />
    <meta charset="utf-8">
    <title>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</title>  
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <script>
        function initialize() {
            var latlng = new google.maps.LatLng(38.959390, -95.265483);
            var mapOptions = {
                zoom: 4,
                center: latlng
            }

            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var ctaLayer = new google.maps.KmlLayer({
                //Hard coded links must be editted for ASP sessions
                url: 'http://bamercado.com/kml/output.kml'
            });
            ctaLayer.setMap(map);
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>