class EventsController < ApplicationController

	def index
		@events = Event.all

    @date = Date.today
    @date = Date.parse(params[:event][:date]) if params[:event]

    @events_for_date = @events.find_all do |event|
      Time.at(event['time']/1000).to_date == @date
    end

    events_with_venues = @events_for_date.delete_if { |k,v| k['venue'] == nil }

    @hash = Gmaps4rails.build_markers(events_with_venues) do |event, marker|
      if event['venue']
        marker.lat event['venue']['lat']
        marker.lng event['venue']['lon']
        marker.infowindow event['name']
      end
    end
  end
end
