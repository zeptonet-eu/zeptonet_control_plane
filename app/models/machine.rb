class Machine < ApplicationRecord
  belongs_to :user

  validates :name, :public_key, :ip_address, presence: true
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :ip_address, uniqueness: { scope: :user }
end
