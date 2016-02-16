$(document).on('page:load ready', function(){

  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'multi_markers'}}, function(){
    var markers = handler.addMarkers(eventMarkers);

    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });

});
