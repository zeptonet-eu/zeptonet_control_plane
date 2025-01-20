FactoryBot.define do
  factory :oauth_application, class: Doorkeeper::Application do
    sequence(:name) { |n| "Application #{n}" }
    sequence(:uid) { |n| "application-#{n}" }
    secret { "123" }
    scopes { "public" }
    confidential { true }
    redirect_uri { "https://localhost:3000/oauth/callback" }
  end
end
