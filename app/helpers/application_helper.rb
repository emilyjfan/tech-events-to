module ApplicationHelper

	def pretty_date(date)
		date.strftime("%A, %B %e, %Y") if date
	end

	def pretty_time(time)
		time.strftime("%l:%M %p") if time
	end

end
