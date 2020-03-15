# frozen_string_literal: true

class Api::V1::AdminsController < ApplicationController
  def index
    @admins = Admin.pluck(:email)
    render json: @admins
  end

  def create
    @admin = Admin.new admin_params

    if @admin.save
      render json: @admin
    else
      render json: @admin.errors
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email)
  end
end
