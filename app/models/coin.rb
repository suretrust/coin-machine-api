# frozen_string_literal: true

class Coin < ApplicationRecord
  before_save { name.downcase! }

  validates :name, presence: true, uniqueness: true

  belongs_to :api_user
  has_many :transactions, dependent: :destroy
end
