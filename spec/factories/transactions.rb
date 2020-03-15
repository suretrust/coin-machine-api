# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    transaction_type { 'deposit' }
    coin
    api_user
  end
end
