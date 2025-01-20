module API
  module V1
    module Machines
      class HeartbeatsController < APIController
        def create
          machine = current_user.machines.find(params[:machine_id])
          machine.update!(last_seen_at: params[:last_handshake])

          head :ok
        end
      end
    end
  end
end
