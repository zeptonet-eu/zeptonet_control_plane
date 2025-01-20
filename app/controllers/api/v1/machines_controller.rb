module API
  module V1
    class MachinesController < APIController
      def create
        @machine = current_user.machines.create!(machine_params)
        render json: @machine
      end

      private

      def machine_params
        params.require(:machine).permit(:name, :public_key)
      end
    end
  end
end
