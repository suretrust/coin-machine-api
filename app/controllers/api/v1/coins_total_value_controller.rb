# frozen_string_literal: true

class Api::V1::CoinsTotalValueController < ApplicationController
  before_action :authenticate

  def index
    @total = Coin.sum(:value)
    render json: { total_value_of_all_coins: @total }
  end
end
