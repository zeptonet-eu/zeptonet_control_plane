module API
  module V1
    class APIController < ActionController::API
      before_action :doorkeeper_authorize!

      rescue_from ActionController::ParameterMissing do |error|
        render json: { status: 400, error: error.message }, status: :bad_request
      end

      rescue_from ActiveRecord::RecordNotFound do |error|
        resource_name =
          if (model_class = error.model.safe_constantize) && model_class.respond_to?(:model_name)
            ": #{I18n.with_locale(:en) { model_class.model_name.human }}"
          end
        render json: { status: 404, error: "resource not found#{resource_name}" }, status: :not_found
      end

      private

      def current_user
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
      helper_method :current_user
    end
  end
end
