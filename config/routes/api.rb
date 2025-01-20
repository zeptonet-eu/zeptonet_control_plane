scope "api/v1" do
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :token_info
  end
end

namespace "api", defaults: { format: :json } do
  namespace "v1" do
    resources :machines, only: %i[create]
  end
end
