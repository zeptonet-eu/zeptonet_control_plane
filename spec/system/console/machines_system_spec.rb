require "rails_helper"

RSpec.describe "Console::Machines", type: :system do
  describe "GET /console/machines" do
    context "when authenticated" do
      before { sign_in }

      it "renders the machines page" do
        visit "/console/machines"
        expect(page).to have_text("Machines")
      end

      it "allows to go to settings" do
        visit "/console/machines"
        expect(page).to have_link("Settings")
      end

      it "allows to go to log out" do
        visit "/console/machines"
        expect(page).to have_button("Log out")
      end
    end
  end
end
