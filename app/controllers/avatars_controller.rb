class AvatarsController < ApplicationController

  before_action :authenticate_user!
  before_action :good_user?
  
  
  def create
    @user = current_user
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end

  private

  def good_user?
    user_id = params[:user_id]
    check_user(user_id)
  end
end
