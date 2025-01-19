FactoryBot.define do
  factory :machine do
    user
    sequence(:name) { |i| "machine#{i}" }
    public_key { "abcd" }
    sequence(:ip_address) { |i| "192.168.0.#{i}" }
    last_seen_at { "2025-01-19 20:39:43" }
  end
end
