class ApplicationController < ActionController::Base
  include CartsHelper
  include OrdersHelper
  include GameSheetsHelper
  include CheckUser

  #Start Method to modify Devise 
  def after_sign_in_path_for(resource)
    user_subscriptions_path(current_user)
  end

  #End Method to modify Devise 

end
