require "rails_helper"

RSpec.describe "Landing", type: :system do
  describe "GET /" do
    it "renders the landing page" do
      visit "/"
      expect(page).to have_text("Zeptonet")
    end
  end
end
