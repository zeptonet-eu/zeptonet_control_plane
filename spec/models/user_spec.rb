require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe "associations" do
    it { should have_many(:sessions).dependent(:destroy) }
    it { should have_many(:access_tokens).dependent(:delete_all) }
    it { should have_many(:access_grants).dependent(:delete_all) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end
end
