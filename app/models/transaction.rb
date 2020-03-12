# frozen_string_literal: true

class Transaction < ApplicationRecord
  before_save { type.downcase! }
  validates :type, presence: true

  belongs_to :coin
  belongs_to :api_user
end
