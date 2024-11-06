# spec/requests/crypto_spec.rb
require 'swagger_helper'

RSpec.describe 'Crypto API', type: :request do
  path '/crypto/price' do
    get 'Get the current price of a cryptocurrency' do
      tags 'Crypto'
      produces 'application/json'
      parameter name: :crypto, in: :query, type: :string, description: 'Cryptocurrency name (e.g., bitcoin)'
      parameter name: :currency, in: :query, type: :string, description: 'Currency for the price (e.g., usd)'

      response '200', 'price found' do
        schema type: :object,
               properties: {
                 crypto: { type: :string },
                 currency: { type: :string },
                 price: { type: :number }
               },
               required: %w[crypto currency price]

        let(:crypto) { 'bitcoin' }
        let(:currency) { 'usd' }
        run_test!
      end

      response '404', 'price data not available' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: %w[error]

        let(:crypto) { 'unknowncrypto' }  # Non-existent cryptocurrency to trigger error
        let(:currency) { 'usd' }
        run_test!
      end
    end
  end
end

