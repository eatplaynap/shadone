# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider { 'google_oauth2' }
    uid { Faker::Number.number.to_s }
    name { Faker::Name.name }
    image_url { Faker::Avatar.image }
  end
end
