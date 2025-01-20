require "rails_helper"

RSpec.describe Machine, type: :model do
  subject { create(:machine) }

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:public_key) }
    it { should validate_presence_of(:ip_address) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive }
  end
end
