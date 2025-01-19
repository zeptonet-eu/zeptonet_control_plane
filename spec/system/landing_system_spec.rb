require "rails_helper"

RSpec.describe "Landing", type: :system do
  describe "GET /" do
    it "renders the landing page" do
      visit "/"
      expect(page).to have_text("Zeptonet")
    end

    context "when not authenticated" do
      it "allows to sign in" do
        visit "/"
        expect(page).to have_link("Log in")
      end
    end

    context "when authenticated" do
      before { sign_in }

      it "allows to go to console" do
        visit "/"
        expect(page).to have_link("Console")
      end
    end
  end
end
