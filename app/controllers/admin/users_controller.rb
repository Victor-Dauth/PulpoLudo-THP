class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all

    @column_names = ["id", "email", "confirmed_at", "confirmation_sent_at", "first_name", "last_name", "date_of_birth", "phone_number", "gender", "stripe_id", "is_admin?"]
    
    @column_names_non_visible = ["encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "confirmation_token","unconfirmed_email", "created_at", "updated_at"]

    @urls_d = []
    @urls_e = []
    @users.each do |user|
      @urls_d << admin_user_path(user)
      @urls_e << edit_admin_user_path(user)
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:id])

    if @user.save
      flash[:notice] = "le profil de l'ustilisateur n°#{@user.id} a été mis à jour"
      redirect_to(admin_users_path)
    else
      flash.now[:alert] = "Oups ! Les modifications de l'utilistateur n°#{@user.id} n'ont pas put être enregistré"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "le profil de l'ustilisateur n°#{@user.id} a été mis à jour"
      redirect_to(admin_users_path)
    else
      flash.now[:alert] = "Oups ! Les modifications de l'utilistateur n°#{@user.id} n'ont pas put être enregistré"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "l'utilisateur a bien été supprimer"
    redirect_to admin_users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :phone_number, :gender, :date_of_birth, :stripe_id, :is_admin?)
  end
end