class Event
	
  @client = RMeetup::Client.new do |config|
    config.api_key = Figaro.env.meetup_api_key
  end

	def self.all(options = {})
		response = @client.fetch(:open_events, { city: 'Toronto', country: 'CA' })
	  
	  response.map do |r|
	  	r.inspect
	  end
	end

end
