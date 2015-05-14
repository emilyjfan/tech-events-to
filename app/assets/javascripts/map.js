function Map(mapId){
	this.mapId = mapId;
	this.markers = [];
}

Map.prototype.init = function(latitude, longitude) {
	var options = {
		center: {lat: latitude, lng: longitude},
		zoom: 12,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	this.canvas = new google.maps.Map(this.mapId, options);
}

Map.prototype.addMarker = function(latitude, longitude, eventName) {
	var options = {
		position: new google.maps.LatLng(latitude, longitude),
		map: this.canvas 
	}

	var myMarker = new google.maps.Marker(options);
		this.markers.push(myMarker);

	var contentString = eventName;
  
  var infowindow = new google.maps.InfoWindow({
   content: contentString
  });

  var that = this;

	google.maps.event.addListener(myMarker, 'click', function() {
	  infowindow.open(that.canvas,myMarker);
	});
}



$(document).on('page:load ready', function(){
	if ($('#map-canvas').length) {

		var myMap = new Map($('#map-canvas')[0]);
		myMap.init(43.668861, -79.398096);

		if (window.events) {
      events.forEach(function(coord) {
      	if (coord != null) {
  	      myMap.addMarker(parseFloat(coord.latitude), parseFloat(coord.longitude), coord.eventname);
      	} 
      });
    }
	}
});
