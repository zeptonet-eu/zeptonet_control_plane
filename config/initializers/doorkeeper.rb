# frozen_string_literal: true

Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (requires ORM extensions installed).
  # Check the list of supported ORMs here: https://github.com/doorkeeper-gem/doorkeeper#orms
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    current_user = Session.find_by(id: cookies.signed[:session_id])&.user
    current_user || redirect_to(new_session_path)
  end

  # If you didn't skip applications controller from Doorkeeper routes in your application routes.rb
  # file then you need to declare this block in order to restrict access to the web interface for
  # adding oauth authorized applications. In other case it will return 403 Forbidden response
  # every time somebody will try to access the admin web interface.
  # admin_authenticator do
  #   if current_user = Session.find_by(id: cookies.signed[:session_id])&.user
  #     head :forbidden unless current_user.admin?
  #   else
  #     redirect_to(new_session_path)
  #   end
  # end

  # Require non-confidential clients to use PKCE when using an authorization code
  # to obtain an access_token (disabled by default)
  #
  force_pkce

  # Issue access tokens with refresh token (disabled by default), you may also
  # pass a block which accepts `context` to customize when to give a refresh
  # token or not. Similar to +custom_access_token_expires_in+, `context` has
  # the following properties:
  #
  # `client` - the OAuth client application (see Doorkeeper::OAuth::Client)
  # `grant_type` - the grant type of the request (see Doorkeeper::OAuth)
  # `scopes` - the requested scopes (see Doorkeeper::OAuth::Scopes)
  #
  use_refresh_token

  # Forces the usage of the HTTPS protocol in non-native redirect uris (enabled
  # by default in non-development environments). OAuth2 delegates security in
  # communication to the HTTPS protocol so it is wise to keep this enabled.
  #
  # Callable objects such as proc, lambda, block or any object that responds to
  # #call can be used in order to allow conditional checks (to allow non-SSL
  # redirects to localhost for example).
  #
  force_ssl_in_redirect_uri !Rails.env.development?
  #
  # force_ssl_in_redirect_uri { |uri| uri.host != 'localhost' }

  # Specify what grant flows are enabled in array of Strings. The valid
  # strings and the flows they enable are:
  #
  # "authorization_code" => Authorization Code Grant Flow
  # "implicit"           => Implicit Grant Flow
  # "password"           => Resource Owner Password Credentials Grant Flow
  # "client_credentials" => Client Credentials Grant Flow
  #
  # If not specified, Doorkeeper enables authorization_code and
  # client_credentials.
  #
  # implicit and password grant flows have risks that you should understand
  # before enabling:
  #   https://datatracker.ietf.org/doc/html/rfc6819#section-4.4.2
  #   https://datatracker.ietf.org/doc/html/rfc6819#section-4.4.3
  #
  grant_flows %w[authorization_code client_credentials]
end
