require 'httparty'

def currency_conversion (currency1, currency2, api)

  http = HTTParty.get("")

  if http.code == 200

    json_extract = JSON.parse(http.body)
