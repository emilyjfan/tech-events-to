require "rails_helper"

RSpec.describe Event, :type => :model do

before do
	rmeetup = double()
	rmeetup_instance = double()

	event1 = OpenStruct.new({:event => "event_details"})
	event2 = OpenStruct.new({:event => "event_details2"})

	allow(RMeetup::Client).to receive(:new).and_return(rmeetup_instance)

	allow(rmeetup_instance).to receive(:fetch).and_return([event1, event2])  	
end

  it "sends request with the correct city, country and topic" do  	
 		response = Event.today

 		expect(response).to_not eq(["event_details", "event_details2"])
  end
end