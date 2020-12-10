class ApplicationController < ActionController::Base
  include CartsHelper
  include OrdersHelper
  include GameSheetsHelper
  include CheckUser

  #Start Method to modify Devise 
  def after_sign_up_path_for(resource)
    user_subscriptions_path(current_user)
  end

  def after_sign_in_path_for(resource)
    if current_user.already_subscribed?
      root_path
    else
      user_subscriptions_path(current_user)
    end
  end

  #End Method to modify Devise 

end
