# frozen_string_literal: true

class ApiUser < ApplicationRecord
  before_save { email.downcase! }

  validates :email, presence: true, uniqueness: true

  has_many :coins, dependent: :destroy
  has_many :transactions, dependent: :destroy
end
