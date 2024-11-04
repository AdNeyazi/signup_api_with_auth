# frozen_string_literal: true

# app/controllers/concerns/rack_sessions_fix.rb
module RackSessionsFix
  extend ActiveSupport::Concern

  included do
    before_action :set_cookie_header
  end

  private

  def set_cookie_header
    request.session_options[:skip] = false
  end
end
