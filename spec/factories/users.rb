# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider { 'google_oauth2' }
    uid { Faker::Internet.uuid }
    name { Faker::Name.name }
    image_url { Faker::Avatar.image }
  end
end
