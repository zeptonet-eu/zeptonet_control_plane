module AuthenticationHelpers
  def sign_in(user = build(:user))
    allow(Current).to receive(:session).and_return(build(:session, user:))
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end
