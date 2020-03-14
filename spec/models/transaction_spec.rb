# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let (:transaction) { build :transaction }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:transaction_type) }
    it 'returns true if transaction type is deposit' do
      expect(transaction.valid?).to be(true)
    end
    it 'returns true if transaction type is withdraw' do
      transaction.transaction_type = 'withdraw'
      expect(transaction.valid?).to be(true)
    end
    it 'returns false if transaction type is not deposit/withdrawal' do
      transaction.transaction_type = 'hbdjbhjb'
      expect(transaction.valid?).to be(false)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:api_user) }
    it { is_expected.to belong_to(:coin) }
  end
end
