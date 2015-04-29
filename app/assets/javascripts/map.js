function Map(mapId){
	this.mapId = mapId;
}

Map.prototype.init = function(latitude, longitude) {
	var options = {
		center: {lat: latitude, lng: longitude},
		zoom: 14,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	this.canvas = new google.maps.Map(this.mapId, options);
}

$(document).on('page:load ready', function(){
	if ($('#map-canvas').length) {
		var myMap = new Map($('#map-canvas')[0]);
		myMap.init(43.6426, -79.3871);
	}
});