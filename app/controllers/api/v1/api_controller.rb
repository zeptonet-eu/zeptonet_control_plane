module API
  module V1
    class APIController < ActionController::API
      before_action :doorkeeper_authorize!

      private

      def current_user
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
      helper_method :current_user
    end
  end
end
