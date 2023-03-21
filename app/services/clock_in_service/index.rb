module ClockInService
  class Index < ApplicationService
    def initialize(current_user)
      @current_user = current_user
    end

    def call
      @current_user.clock_ins.order(created_at: :desc)
    end
  end
end
