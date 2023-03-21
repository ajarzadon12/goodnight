class ApplicationController < ActionController::API
  def get_current_user
    @current_user = User.find(params[:id])
  end
end
