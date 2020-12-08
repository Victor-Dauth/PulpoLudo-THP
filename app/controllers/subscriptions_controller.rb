class SubscriptionsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :good_user?
    #ecrire un before action update uniquement accessible a l'admin(probablement plutot metre update dans un namespace admin)
  
  def index
    @user = User.find(params[:user_id])
    @subscriptions = @user.subscriptions
  end
  
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.create
  end

  def update
  end

  private

  def good_user?
    user_id = params[:user_id]
    check_user(user_id)
  end

end
