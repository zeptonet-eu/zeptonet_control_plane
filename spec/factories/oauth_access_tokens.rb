FactoryBot.define do
  factory :oauth_access_token, class: Doorkeeper::AccessToken do
    expires_in { 1.hour }
    token { SecureRandom.hex(64) }
    application { create(:oauth_application) }
    resource_owner_id { create(:user).id }
  end
end
