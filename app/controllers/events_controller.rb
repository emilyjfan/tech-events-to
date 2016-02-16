class EventsController < ApplicationController

	def index
		@events = Event.all

    @date = Date.parse(params[:event][:date]) if params[:event]

    @events_for_date =  @events.map do |event|

                        @date == Time.at(event['time']/1000).to_date
                        end
  end

end
