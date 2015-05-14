class EventsController < ApplicationController

	def index
		@events = Event.all
		@date = Time.now.strftime("%A, %B %e, %Y")
		
	end

	def show
		@event = Event.find(params[:id])
	end

end
