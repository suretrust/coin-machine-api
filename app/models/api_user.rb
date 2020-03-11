# frozen_string_literal: true

class ApiUser < ApplicationRecord
  validates :access_token, :email, presence: true, uniqueness: true
  has_many :coins
end
