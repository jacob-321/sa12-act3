require 'httparty'
require 'json'



def event_finder(city, api_key)
  http = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?location.address=#{city}&token=#{api_key}")



  if http.code == 200
    data = JSON.parse(http.body)



    if data["events"].empty?
      puts "There are no events in #{area} currently..."


    else
      puts "These are the following events happening in #{area}:"

      data["events"].each do |event|

        current_event = event["name"]["text"]
        area = event["venue"]["name"]
        date = event["start"]["local"]

        puts "Event: #{current_event}"
        puts "Venue: #{area}"
        puts "Date: #{date}"
      end
    end
  else


    puts "The following error has occurred: #{http.code}, #{http.message}"
  end
end

event_finder("Memphis", "PDUO4JY6UP26IODW5SBAE")
