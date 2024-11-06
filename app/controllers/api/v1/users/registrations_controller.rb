# frozen_string_literal: true

# app/controllers/api/v1/users/registrations_controller.rb
module Api
  module V1
    module Users
      # app/controllers/api/v1/users/registrations_controller.rb
      class RegistrationsController < Devise::RegistrationsController
        include RackSessionsFix
        respond_to :json

        def create
          user_params = params.require(:user).permit(:email, :password, :name)
          user = User.new(user_params)

          if user.save
            render_success(user)
          else
            render_error(user)
          end
        end

        private

        def render_success(user)
          render json: {
            status: { code: 200, message: 'Signed up successfully.' },
            data: UserSerializer.new(user).serializable_hash[:data][:attributes]
          }
        end

        def render_error(user)
          render json: {
            status: { message: "User couldn't be created successfully. #{user.errors.full_messages.to_sentence}" }
          }, status: :unprocessable_entity
        end

        def respond_with(resource, _opts = {})
          Rails.logger.debug "Resource errors: #{resource.errors.full_messages}"

          if resource.persisted?
            render_success(resource)
          else
            render_error(resource)
          end
        end
      end
    end
  end
end
