module UserService
  class Follow < ApplicationService
    def initialize(current_user, user_id_to_follow)
      @current_user = current_user
      @user_to_follow = User.where(id: user_id_to_follow).last
    end

    def call
      if @user_to_follow
        @current_user.follow(@user_to_follow)
        {
          success: true,
          message: "Successfully followed #{@user_to_follow.name}"
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
