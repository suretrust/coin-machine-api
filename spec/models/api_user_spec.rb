# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiUser, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:access_token) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_uniqueness_of(:access_token) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:coins) }
  end
end
