class Event
	
  @client = RMeetup::Client.new do |config|
    config.api_key = Figaro.env.meetup_api_key
  end

	def self.all(options = {})
		results = @client.fetch(:open_events, { city: 'Toronto', country: 'CA' })
	  
	  results.map do |result|
	  	new
	  end
	end


end
