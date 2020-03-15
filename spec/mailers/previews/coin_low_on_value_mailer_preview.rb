# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/coin_low_on_value_mailer
class CoinLowOnValueMailerPreview < ActionMailer::Preview
  def coin_low_notification
    CoinLowOnValueMailer.coin_low_notification(Coin.first.name, Coin.first.value)
  end
end
