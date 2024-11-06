# frozen_string_literal: true

# spec/requests/users/sessions_spec.rb
require 'rails_helper'
require 'swagger_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'User Sessions', type: :request do
  describe 'Login' do
    path '/api/v1/users/login' do
      post 'Logs in a user' do
        tags 'Users'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: { type: :string },
                password: { type: :string }
              },
              required: %w[email password]
            }
          }
        }
        # rubocop:enable Metrics/BlockLength
        response '200', 'User logged in successfully' do
          let(:user) { { user: { email: 'test@example.com', password: 'password123' } } }
          run_test!
        end

        response '401', 'Unauthorized' do
          let(:user) { { user: { email: 'test@example.com', password: 'wrongpassword' } } }
          run_test!
        end
      end
    end
  end

  describe 'Logout' do
    path '/api/v1/users/logout' do
      delete 'Logs out a user' do
        tags 'Users'
        consumes 'application/json'
        security [bearerAuth: []] # Specify the security scheme used

        response '200', 'User logged out successfully' do
          let(:Authorization) { "Bearer #{JWT_TOKEN}" } # Ensure this is a valid token
          run_test!
        end

        response '401', "Couldn't find an active session" do
          let(:Authorization) { 'Bearer invalidtoken' }
          run_test!
        end
      end
    end
  end
end
