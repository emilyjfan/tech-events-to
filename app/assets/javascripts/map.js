$(document).on('page:load ready', function() {

  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'multi_markers'}}, function() {
    var markers = handler.addMarkers(eventMarkers);

    if (markers.length == 0) {
      handler.map.centerOn({lat: 43.652880, lng: -79.379679});
    } else {
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }

  });

});
