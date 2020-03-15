# frozen_string_literal: true

FactoryBot.define do
  factory :api_user do
    access_token { 'MyString' }
    email { 'MyString' }
  end
end
