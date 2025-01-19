module Console
  class MachinesController < ConsoleController
    def index
      @machines = current_user.machines
    end
  end
end
