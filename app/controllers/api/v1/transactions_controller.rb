# frozen_string_literal: true

class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate
  before_action :set_api_user, only: :create

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def create
    @transaction = @api_user.transactions.build transaction_params

    if @transaction.save
      @coin = Coin.find(params[:transaction][:coin_id])
      params[:transaction][:transaction_type] == 'deposit' ?
                                          deposit : withdraw
    else
      render json: @transaction.errors
    end
  end

  private

  def deposit
    @coin.value += 1
    @coin.save
    render json: @transaction
  end

  def withdraw
    if @coin.value > 0
      # send email if @coin.value <= 4 we need coin name
      @coin.value -= 1
      @coin.save
      render json: @transaction
    else
      render(json: { error: 'There is no coin to withdraw' })
    end
  end

  def transaction_params
    params.require(:transaction).permit(:coin_id, :transaction_type)
  end
end
