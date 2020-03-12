# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:type) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:api_user) }
    it { is_expected.to belong_to(:coin) }
  end
end
