scope "api/v1" do
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :token_info
  end
end
