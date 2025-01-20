require "swagger_helper"

RSpec.describe "Machines", type: :request do
  path "/api/v1/machines" do
    post "Creates a new machine" do
      security [oauth2: []]
      tags "Machines"
      consumes "application/json"
      produces "application/json"

      parameter name: :Authorization, in: :header, type: :string, required: true, description: "Bearer token"
      parameter name: :machine, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          public_key: { type: :string }
        },
        required: %w[name public_key]
      }

      response "200", "Success" do
        let(:Authorization) { "Bearer #{oauth_access_token.token}" }

        let(:machine) do
          {
            name: "machine1",
            public_key: "abc"
          }
        end

        let(:oauth_access_token) { create(:oauth_access_token) }

        run_test!
      end

      response "401", "Unauthorized" do
        let(:Authorization) { "Bearer invalid_token" }

        let(:machine) do
          {
            name: "machine1",
            public_key: "abc"
          }
        end

        run_test!
      end
    end
  end
end
