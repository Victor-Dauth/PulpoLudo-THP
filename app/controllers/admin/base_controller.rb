class Admin::BaseController < ApplicationController

  before_action :check_if_admin

  layout 'admin/layouts/admin'

  private

  def check_if_admin
    unless authenticate_user! || current_user.is_admin == true
      flash[:danger] = "Désoler, vous n'avais pas l'autorisation"
      redirect_to root_path
    end
  end
end
