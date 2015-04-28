class Event

	attr_reader :event, :name

	def self.all(options = {})
		response = @client.fetch(:open_events, {:city => "Toronto", :country => "CA", :topic => "technology" })
	  
	  response.map do |r|
	  	r.event
	  end
	end
  
  @client = RMeetup::Client.new do |config|
    config.api_key = Figaro.env.meetup_api_key
  end

end
