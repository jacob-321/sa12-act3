require 'httparty'

def event_finder(area, api_key)
  response = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?location.address=#{area}&token=#{api_key}")

  data = JSON.parse(response.body)

  puts data

end

event_finder("Memphis", "PDUO4JY6UP26IODW5SBA")
