class EventsController < ApplicationController

	def index
		@events = RMeetup.all
		@date = Time.now.strftime("%A, %B %e, %Y")
		
	end

	def show
		@event = Event.find(params[:id])
	end

end
