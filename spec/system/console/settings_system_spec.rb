require "rails_helper"

RSpec.describe "Console::Settings", type: :system do
  describe "GET /console/settings" do
    context "when authenticated" do
      before { sign_in }

      it "renders the settings page" do
        visit "/console/settings"
        expect(page).to have_text("Settings")
      end

      it "allows to go to machines" do
        visit "/console/settings"
        expect(page).to have_link("Machines")
      end

      it "allows to go to log out" do
        visit "/console/settings"
        expect(page).to have_button("Log out")
      end
    end
  end
end
