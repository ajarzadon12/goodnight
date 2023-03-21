module ClockInService
  class ShowWeekly < ApplicationService
    def initialize(current_user, user_id_to_show)
      @current_user = current_user
      @user_to_show = User.where(id: user_id_to_show).last
    end

    def call
      if @user_to_show && @current_user.following?(@user_to_show)
        date = Time.zone.today
        {
          success: true,
          data: pair_dates(@user_to_show.week_clock_ins(date))
        }
      else
        {
          success: false,
          message: 'User is not found or not following user'
        }
      end
    end

    private

    def pair_dates(clock_ins)
      return [] if clock_ins.empty?

      sleep_clock_ins = clock_ins.sleep
      wake_clock_ins = clock_ins.wake_up

      wake_start_idx = clock_ins.first.clock_type == 'sleep' ? 0 : 1

      sleep_clock_ins.map.with_index do |sli, idx|
        stime = sli.created_at
        wtime = wake_clock_ins[idx + wake_start_idx]&.created_at
        {
          sleep_time: stime,
          wake_up_time: wtime,
          duration: (wtime ? (wtime - stime) : 0).to_i
        }
      end.sort_by do |obj|
        obj[:duration]
      end
    end
  end
end
