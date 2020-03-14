# frozen_string_literal: true

class Admin < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
