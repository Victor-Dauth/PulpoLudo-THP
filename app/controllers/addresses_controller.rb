class AddressesController < ApplicationController
  def index
    @user = current_user
    @addresses = @user.addresses
  end
  
  def new
    @user = current_user
    @address = Address.new
  end

  def create
    @user = current_user
    @address = @user.addresses.create(post_params)

    if @address.save
      flash[:notice] = "Cool, ton adresse a bien été sauvegardée 😁"
      redirect_to(user_addresses_path(@user))
    else
      puts @address.errors.messages
    end
  end

  def edit
    @user = current_user
    @address = Address.find(params[:id])
  end

  def update
    @user = current_user
    @address = Address.find(params[:id])
    if @address.update(post_params)
      flash[:notice] = "Ton adresse a bien été modifiée !"
      redirect_to(user_addresses_path(@user))
    else
      flash.now[:alert] = "On ne peut pas modifier ton adresse pour le(s) raison(s) suivante(s) :"
      render :edit
    end
  end

  def destroy
    @user = current_user
    @address = Address.find(params[:id])
    @address.destroy
    flash[:alert] = "Ton adresse a bien été supprimée."
    redirect_to(user_addresses_path(@user))
  end

  private
  def post_params
    post_params = params.require(:address).permit(:street, :zipcode, :city, :country)
  end
  
end
