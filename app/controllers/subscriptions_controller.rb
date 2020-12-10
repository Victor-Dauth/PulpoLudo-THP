class SubscriptionsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :good_user?
  
  #ecrire un before action update uniquement accessible a l'admin(probablement plutot metre update dans un namespace admin)
  
  def index
    @user = current_user
    @subscription = @user.subscription
  end

  def interrupt
    current_user.subscription.interrupt
  end

  private

  def good_user?
    user_id = params[:user_id]
    check_user(user_id)
  end

end
