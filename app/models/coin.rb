# frozen_string_literal: true

class Coin < ApplicationRecord
  validates :value, :name, presence: true
  validates :name, uniqueness: true
end
