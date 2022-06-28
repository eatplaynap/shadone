FactoryBot.define do
  factory :user do
    provider { 'google_oauth2' }
    sequence(:uid) { |i| "uid#{i}" }
    sequence(:name) { |i| "name#{i}"}
  end
end
