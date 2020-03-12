# frozen_string_literal: true

include ActionController::HttpAuthentication::Basic::ControllerMethods
include ActionController::HttpAuthentication::Token::ControllerMethods
class ApplicationController < ActionController::API
  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      # Compare the tokens in a time-constant manner, to mitigate
      # timing attacks.
      db_token = ApiUser.find_by(access_token: token)
      db_token = db_token ? db_token.access_token : ''
      ActiveSupport::SecurityUtils.secure_compare(token, db_token)
    end
  end
end
