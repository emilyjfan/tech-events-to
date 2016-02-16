class EventsController < ApplicationController

	def index
		@events = Event.all

    @date = Date.parse(params[:event][:date]) if params[:event]
  end

end
