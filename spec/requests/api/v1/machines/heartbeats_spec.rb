require "swagger_helper"

RSpec.describe "Heartbeats", type: :request do
  path "/api/v1/machines/{machine_id}/heartbeats" do
    post "Creates a new heartbeat" do
      security [oauth2: []]
      tags "Machines"
      consumes "application/json"
      produces "application/json"

      parameter name: :Authorization, in: :header, type: :string, required: true, description: "Bearer token"
      parameter name: :machine_id, in: :path, type: :string, required: true, description: "Machine ID"
      parameter name: :last_handshake, in: :body, schema: {
        type: :object,
        properties: {
          last_handshake: { type: :string }
        },
        required: %w[last_handshake]
      }

      response "200", "Success" do
        let(:Authorization) { "Bearer #{oauth_access_token.token}" }
        let(:machine_id) { machine.id }

        let(:last_handshake) do
          {
            last_handshake: "2020-01-01T00:00:00Z"
          }
        end

        let(:user) { create(:user) }
        let(:machine) { create(:machine, user:) }
        let(:oauth_access_token) { create(:oauth_access_token, resource_owner_id: user.id) }

        run_test!
      end

      response "401", "Unauthorized" do
        let(:Authorization) { "Bearer invalid_token" }
        let(:machine_id) { create(:machine).id }

        let(:last_handshake) do
          {
            last_handshake: "2020-01-01T00:00:00Z"
          }
        end

        run_test!
      end
    end
  end
end
