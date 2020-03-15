# frozen_string_literal: true

require 'securerandom'

class Api::V1::ApiUsersController < ApplicationController
  def create
    @api_user = ApiUser.new api_user_params
    @api_user.access_token = token
    if @api_user.save
      render json: @api_user
    else
      render json: @api_user.errors
    end
  end

  def show
    @api_user = ApiUser.find_by_email(params[:api_user][:email])
    render json: { api_key: @api_user.access_token }
  end

  private

  def token
    token = SecureRandom.hex
    token = SecureRandom.hex while ApiUser.find_by(access_token: token)
    token
  end

  def api_user_params
    params.require(:api_user).permit(:email)
  end
end
