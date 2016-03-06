class EventsController < ApplicationController

	def index
		@events = Event.all

    @date = Date.today
    @date = Date.parse(params[:event][:date]) if params[:event]

    @events_for_date = find_events_for_date
    @events_with_venues = find_events_with_venues
    @hash = build_markers
  end

  private

  def find_events_with_venues
    @events_for_date.delete_if { |k,v| k['venue'] == nil }
  end

  def find_events_for_date
    @events.find_all do |event|
      Time.at(event['time']/1000).to_date == @date
    end
  end

  def build_markers
    Gmaps4rails.build_markers(@events_with_venues) do |event, marker|
      marker.lat event['venue']['lat']
      marker.lng event['venue']['lon']
      marker.infowindow event['name']
    end
  end

end
