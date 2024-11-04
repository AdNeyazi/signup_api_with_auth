# frozen_string_literal: true

# spec/requests/home_spec.rb
require 'swagger_helper'

RSpec.describe 'Home', type: :request do
  let(:user) { create(:user) } # Assumes you have a factory for User
  let(:jwt_token) do
    # Generate a JWT token for the test user
    Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
  end

  path '/home' do
    get 'Displays a welcome message for authenticated users' do
      tags 'Home'
      produces 'application/json'
      security [bearerAuth: []]

      response '200', 'Access granted' do
        let(:Authorization) { "Bearer #{jwt_token}" }
        run_test!
      end

      response '401', 'Unauthorized' do
        let(:Authorization) { 'Bearer invalidtoken' }
        run_test!
      end
    end
  end
end
