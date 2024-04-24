require 'httparty'
require 'json'

def weather_data(city, api_key)
  http = HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?q=#{city}&appid=#{api_key}&units=metric")



  if http.code == 200
    data = JSON.parse(http.body)


    temp = data["list"].map { |entry| entry["main"]["temp"] }
    humidity = data["list"].map { |entry| entry["main"]["humidity"] }
    weather = data["list"].map { |entry| entry["weather"].first["description"] }


    avg_temp = temp.sum / temp.size

    puts "Average temperature in #{city}: #{avg_temp}°C"
    puts "Average humidity in #{city}: #{humidity.sum / humidity.size}%"
    puts "Weather conditions in #{city}: #{weather.uniq.join(', ')}"


  else


    puts "The following error has occurred: #{http.code}, #{http.message}"
  end
end

weather_data("Memphis", "b56ea698d1d43d324c92af6e5e99280e")
