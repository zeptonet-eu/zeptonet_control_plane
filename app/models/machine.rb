class Machine < ApplicationRecord
  belongs_to :user

  validates :name, :public_key, :ip_address, presence: true
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }
  validates :ip_address, uniqueness: { scope: :user }

  before_validation :setup, on: :create

  private

  def setup
    # TODO: use a real management IP address
    self.ip_address = SecureRandom.hex(8)
  end
end
