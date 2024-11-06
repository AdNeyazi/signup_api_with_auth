# frozen_string_literal: true

# spec/requests/users/registrations_spec.rb
require 'swagger_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'User Registration', type: :request do
  path '/api/v1/users/signup' do
    post 'Registers a new user' do
      tags 'Users'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              name: { type: :string }
            },
            required: %w[email password]
          }
        }
      }
      # rubocop:enable Metrics/BlockLength
      context 'when the request is valid' do
        let(:user) { { user: { email: 'test@example.com', password: 'password123', name: 'Test User' } } }

        response '201', 'User registered successfully' do
          run_test!
        end
      end

      context 'when the request is invalid' do
        let(:user) { { user: { email: '', password: '' } } }

        response '422', "User couldn't be created" do
          run_test!
        end
      end
    end
  end
end
