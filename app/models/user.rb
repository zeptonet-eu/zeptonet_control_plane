class User < ApplicationRecord
  include DoorkeeperResourceOwner

  normalizes :email, with: ->(email) { email.strip.downcase }
  normalizes :provider, with: ->(provider) { provider.downcase }

  encrypts :email, deterministic: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :provider, :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }

  has_many :sessions, dependent: :destroy
end
