require "rails_helper"

RSpec.describe "Console::Machines", type: :request do
  describe "GET /console/machines" do
    context "when not authenticated" do
      it "redirects to sign in page" do
        get "/console/machines"
        expect(response).to redirect_to(new_session_path)
      end
    end

   context "when authenticated" do
      before { sign_in }

      it "returns http success" do
        get "/console/machines"
        expect(response).to have_http_status(:success)
      end
    end
 end
end
