# app/services/crypto_price_service.rb
require 'net/http'
require 'json'

class CryptoPriceService
  BASE_URL = "https://api.coingecko.com/api/v3/simple/price"

  def initialize(crypto, currency = 'usd')
    @crypto = crypto
    @currency = currency
  end

  def fetch_price
    url = URI("#{BASE_URL}?ids=#{@crypto}&vs_currencies=#{@currency}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end
end
