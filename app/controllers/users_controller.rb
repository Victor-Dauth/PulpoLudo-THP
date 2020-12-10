class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :good_user?

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Bien joué ! Ton profil a été modifié 🎉"
      redirect_to(user_path(@user))
    else
      flash.now[:alert] = "Oups ! On ne peut pas modifier ton profil pour les raisons suivantes :"
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :phone_number, :gender, :date_of_birth)
  end

  def good_user?
    user_id = params[:id]
    check_user(user_id)
  end
end
