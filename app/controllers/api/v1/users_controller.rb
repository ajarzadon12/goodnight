module Api
  module V1
    class UsersController < ApplicationController
      before_action :get_current_user

      def follow_user
        follow = UserService::Follow.call(@current_user, params[:user_id_to_follow])
        
        if follow[:success]
          render json: { message: follow[:message] }, status: :ok
        else
          render json: { message: follow[:message] }, status: :not_found
        end
      end

      def unfollow_user
        unfollow = UserService::Unfollow.call(@current_user, params[:user_id_to_unfollow])
        
        if unfollow[:success]
          render json: { message: unfollow[:message] }, status: :ok
        else
          render json: { message: unfollow[:message] }, status: :not_found
        end
      end

      private

      def get_current_user
        @current_user = User.find(params[:id])
      end
    end
  end
end
