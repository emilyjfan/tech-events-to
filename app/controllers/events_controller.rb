class EventsController < ApplicationController

	def index
		@events = Event.today
		@today = Time.now.strftime("%A, %B %e, %Y")
		
	end

	def show
		@event = Event.find(params[:id])
	end

end
