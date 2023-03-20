module UserService
  class Unfollow < ApplicationService
    def initialize(current_user, user_id_to_unfollow)
      @current_user = current_user
      @user_to_unfollow = User.where(id: user_id_to_unfollow).last
    end

    def call
      if @user_to_unfollow
        @current_user.stop_following(@user_to_unfollow)
        {
          success: true,
          message: "Successfully unfollowed #{@user_to_unfollow.name}"
        }
      else
        {
          success: false,
          message: 'User not found'
        }
      end
    end
  end
end
