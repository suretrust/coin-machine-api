# frozen_string_literal: true

class Api::V1::ApiUserTransactionsController < ApplicationController
  before_action :authenticate

  def index
    @user = ApiUser.find_by(email: params[:email])
    render(json: { error: 'User not found!' }) && return unless @user
    @user_transactions = @user.transactions
    render_message_when_user_has_no_transaction
  end

  private

  def render_message_when_user_has_no_transaction
    if @user_transactions.empty?
      render json: { message: 'This user has not created any transaction' }
    else
      render json: @user_transactions
    end
  end
end
