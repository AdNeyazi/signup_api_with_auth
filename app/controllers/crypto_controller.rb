class CryptoController < ApplicationController
	def price
        crypto = params[:crypto] # || 'bitcoin'
        currency = params[:currency] # || 'usd'

        crypto_service = CryptoPriceService.new(crypto, currency)
        price_data = crypto_service.fetch_price
        if price_data[crypto]
        	render json: { crypto: crypto, currency: currency, price: price_data[crypto][currency] }
        else
        	render json: { error: 'Price data not available' }, status: :not_found
        end
    end
end
