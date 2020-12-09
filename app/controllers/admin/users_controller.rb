class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
    @column_names = ["id", "email", "confirmed_at", "confirmation_sent_at", "first_name", "last_name", "date_of_birth", "phone_number", "gender", "stripe_id", "is_admin?"]
    @column_names_non_visible = ["encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "confirmation_token","unconfirmed_email", "created_at", "updated_at"] 
  end

  def create

  end

  def update

  end

  def destroy

  end
end