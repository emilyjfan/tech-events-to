module ApplicationHelper

	def pretty_date(date)
		date.strftime("%A, %B %e, %Y")
	end

	def pretty_time(time)
		time.strftime("%l:%M %p")
	end

end
