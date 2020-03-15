# frozen_string_literal: true

FactoryBot.define do
  factory :coin do
    value { 1 }
    name { 'MyString' }
    api_user
  end
end
