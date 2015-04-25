<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kmlMap.aspx.cs" Inherits="Demonstration.kmlMap" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">		
	<script src="https://maps.googleapis.com/maps/api/js"></script>
		
	<script>
		function initialize() {
		    var mapCanvas = document.getElementById('map-canvas');
		    var mapOptions = {
		        center: new google.maps.LatLng(44.5403, -78.5463),
		        zoom: 8,
		        mapTypeId: google.maps.MapTypeId.ROADMAP
		    }
		    var map = new google.maps.Map(mapCanvas, mapOptions);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
    <title>Map</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contentplaceholder1" runat="server">		
			<div id="content">
				<div id="content-innerKML">
				
					<main id="article">
						<div id="map-canvas">
						
						</div>
					</main>
					
					<div class="clr"></div>
				</div>
				
			</div>
</asp:Content>
