# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiUser, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:access_token) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:access_token) }
  end
end
