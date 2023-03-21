module Api
  module V1
    class ClockInsController < ApplicationController
      before_action :get_current_user

      def index
        clock_ins = ClockInService::Index.call(@current_user)
        
        render json: clock_ins, each_serializer: ClockInSerializer
      end

      def create
        clock_in = ClockInService::Create.call(@current_user)
        
        render json: { success: true }, status: :ok
      end

      def show_weekly
        clock_ins = ClockInService::ShowWeekly.call(@current_user, params[:user_id_to_show])

        if clock_ins[:success]
          render json: clock_ins[:data]
        else
          render json: { message: clock_ins[:message] }, status: :not_found
        end
      end
    end
  end
end
