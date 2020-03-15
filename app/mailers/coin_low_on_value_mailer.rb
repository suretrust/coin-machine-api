# frozen_string_literal: true

class CoinLowOnValueMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def coin_low_notification(name)
    mail(subject: "#{name} is low in value")
  end
end
