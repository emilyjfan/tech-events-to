class EventsController < ApplicationController

	def index
		@events = Event.all

    @date = Date.today
    @date = Date.parse(params[:event][:date]) if params[:event]

    @events_for_date = @events.find_all do |event|
      Time.at(event['time']/1000).to_date == @date
    end

    @hash = Gmaps4rails.build_markers(@events_for_date) do |event, marker|
      marker.lat event['venue']['lat'] if event['venue']
      marker.lng event['venue']['lon'] if event['venue']
      marker.infowindow event['name']
    end

  end

end
