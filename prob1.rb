require 'httparty'

def data_agregator(city, api)

  http = HTTParty.get("https://pro.openweathermap.org/data/2.5/forecast/hourly?q=#{city}&appid=#{api}")

  if http.code == 200

    json_extract = JSON.parse(http.body)


  end
end


data_agregator("memphis","20b69cb497ed37536948f280754e7364")
