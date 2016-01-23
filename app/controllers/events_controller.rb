class EventsController < ApplicationController

	def index
		@events = Event.all
    @date = Date.parse(params[:event][:date])
  end

  def show
    @event = Event.find(params[:id])
  end

end
