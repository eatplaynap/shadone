# frozen_string_literal: true

FactoryBot.define do
  factory :practice_log do
    url { "https://www.youtube.com/watch?v=s3ZX2RX73_g" }
    duration { 300 }
    practice_on { Date.current }
    user
  end
end
