FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    provider { "github" }
    sequence(:uid) { |i| "user#{i}" }
  end
end
