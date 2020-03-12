# frozen_string_literal: true

class Api::V1::CoinsController < ApplicationController
  before_action :authenticate, except: [:index]
  before_action :set_coin, except: %i[create index]

  def create
    @api_user = ApiUser.find_by(access_token: token)
    @coin = @api_user.coins.build coin_params

    if @coin.save
      render json: @coin
    else
      render json: @coin.errors
    end
  end

  def show
    render json: @coin
  end

  def update
    if @coin.update coin_params
      render json: @coin
    else
      render json: @coin.errors
    end
  end

  def index
    @coins = Coin.all
    render json: @coins
  end

  def destroy
    @coin.destroy
    render json: { message: 'Coin sucessfully deleted!' }
  end

  private

  def coin_params
    params.require(:coin).permit(:name)
  end

  def token
    request.headers.env['HTTP_AUTHORIZATION'].split[1]
  end

  def set_coin
    @coin = Coin.find(params[:id])
  end
end
