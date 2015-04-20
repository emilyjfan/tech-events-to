class EventsController < ApplicationController

	def index
		@events = Event.all.includes(:group).order(:date)
	end

	def show
		@event = Event.find(params[:id])
	end

end
