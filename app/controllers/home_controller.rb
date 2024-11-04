# frozen_string_literal: true

# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: 'Welcome to the Home Page!' }
  end
end
