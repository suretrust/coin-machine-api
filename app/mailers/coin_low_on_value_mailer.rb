# frozen_string_literal: true

class CoinLowOnValueMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def coin_low_notification(name, value)
    @total_value = Coin.sum(:value)
    @value = value
    @name = name
    mail(subject: "#{name.upcase} is low in value")
  end
end
