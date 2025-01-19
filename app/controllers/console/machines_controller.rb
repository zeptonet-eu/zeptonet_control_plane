module Console
  class MachinesController < ApplicationController
    def index
      @machines = current_user.machines
    end
  end
end
