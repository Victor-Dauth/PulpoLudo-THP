class SubscriptionsController < ApplicationController
  
  def index
    @subscriptions = current_user.subscriptions    
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
  def post_params
    post_params = params.require(:subscription).permit(:price)
  end

end
