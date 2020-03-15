# frozen_string_literal: true

class Transaction < ApplicationRecord
  before_save { transaction_type.downcase! }
  validates :transaction_type, presence: true
  validate :type_can_only_be_deposit_or_withdraw

  def deposit?
    transaction_type == 'deposit'
  end

  def withdrawal?
    transaction_type == 'withdraw'
  end

  def type_can_only_be_deposit_or_withdraw
    unless deposit? || withdrawal?
      errors.add(:transaction_type, 'can only be deposit or withdrawal')
    end
  end

  belongs_to :coin
  belongs_to :api_user
end
