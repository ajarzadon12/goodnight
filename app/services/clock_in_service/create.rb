module ClockInService
  class Create < ApplicationService
    def initialize(current_user)
      @current_user = current_user
    end

    def call
      ctype = @current_user.clock_ins.last.clock_type == 'sleep' ? 1 : 0
      ClockIn.create(user: @current_user, clock_type: ctype)
    end
  end
end
