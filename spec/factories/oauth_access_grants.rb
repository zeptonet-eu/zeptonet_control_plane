FactoryBot.define do
  factory :oauth_access_grant, class: Doorkeeper::AccessGrant do
    expires_in { 1.hour }
    redirect_uri { "https://localhost:3000/oauth/callback" }
  end
end
