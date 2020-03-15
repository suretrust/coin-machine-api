# frozen_string_literal: true

include ActionController::HttpAuthentication::Basic::ControllerMethods
include ActionController::HttpAuthentication::Token::ControllerMethods
class ApplicationController < ActionController::API
  private

  def authenticate
    api_key = ApiUser.find_by_access_token(params[:api_key])
    render json: { error: 'Access denied' }, status: 401 unless api_key
  end

  def token
    ApiUser.find_by_access_token(params[:api_key]).access_token
  end

  def set_api_user
    @api_user = ApiUser.find_by_access_token(params[:api_key])
  end
end
