module AuthenticationHelpers
  def sign_in(user = build(:user))
    allow(Current).to receive(:session).and_return(build(:session, user:))
  end
end
