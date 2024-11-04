# frozen_string_literal: true

module Users
  # app/controllers/users/sessions_controller.rb
  class SessionsController < Devise::SessionsController
    include RackSessionsFix
    respond_to :json

    private

    def respond_with(current_user, _opts = {})
      token = request.env['warden-jwt_auth.token']
      render json: success_response(current_user, token), status: :ok
    end

    def respond_to_on_destroy
      current_user = find_user_from_token
      if current_user
        render json: successful_logout_response, status: :ok
      else
        render json: failed_logout_response, status: :unauthorized
      end
    end

    def success_response(user, token)
      {
        status: {
          code: 200,
          message: 'Logged in successfully.',
          data: {
            user: UserSerializer.new(user).serializable_hash[:data][:attributes],
            token: token
          }
        }
      }
    end

    def find_user_from_token
      return unless request.headers['Authorization'].present?

      token = request.headers['Authorization'].split(' ').last
      jwt_payload = JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY']).first
      User.find(jwt_payload['sub'])
    rescue JWT::DecodeError, JWT::VerificationError
      nil
    end

    def render_invalid_token_error
      render json: { status: 401, message: 'Invalid token or signature.' }, status: :unauthorized
    end

    def successful_logout_response
      { status: 200, message: 'Logged out successfully.' }
    end

    def failed_logout_response
      { status: 401, message: "Couldn't find an active session." }
    end
  end
end
