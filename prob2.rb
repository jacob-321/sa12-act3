require 'httparty'
require 'json'


def currency_converter(currency1, currency2, api_key)
  http = HTTParty.get("https://v6.exchangerate-api.com/v6/#{api_key}/latest/#{currency1}/#{currency2}")




  if http.code == 200
    data = JSON.parse(http.body)


    if data.key?("error")
      puts "The following error has occurred: #{data["error"]["info"]}"


    else
      exchange_rate = data["rates"][currency2]


      puts "#{currency1} to #{currency2} is #{exchange_rate}"


      print "Enter the total of  #{currency1}: "
      total = gets.chomp.to_f


      conversion = total * exchange_rate
      puts "#{total} #{currency1} = #{conversion} #{currency2}"
    end


  else
    puts "The following error has occurred: #{http.code}, #{http.message}"
  end
end

currency_converter("USD","EUR","950fe9e4ef43ac6ed0c3d773")
