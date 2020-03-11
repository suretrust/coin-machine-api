# frozen_string_literal: true

FactoryBot.define do
  factory :coin do
    value { 1 }
    name { 'MyString' }
    association :api_user
  end
end
