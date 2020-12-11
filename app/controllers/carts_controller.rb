class CartsController < ApplicationController

  include CurrentCart
  before_action :authenticate_user!
  before_action :good_user?
  before_action :subscribed?

  def show
    @user = current_user
    @cart = Cart.find(params[:id])
  end

  def update
    @game_sheet = GameSheet.find(params[:game_sheet_id])
    @cart = Cart.find(params[:id])
    @game = @game_sheet.games.in_stock.sample

    if @cart.full_cart?
      flash[:alert] = "Tu as déjà ajouté 5 jeux à ton abonnement"
      redirect_to root_path
    elsif @cart.already_present(@game)
      flash[:alert] = "Tu ne peux pas louer deux exemplaires du même jeu"
      redirect_to root_path
    else
      @game.update(cart: current_cart)
      @game.leased!
      flash[:notice] = "Ton jeu a bien été ajouté à ton abonnement. Pense à valider ton panier !"
      redirect_to root_path
    end
  end


  private

  def good_user?
    user_id = Cart.find(params[:id]).user_id
    check_user(user_id)
  end

  def subscribed?
    @user = Cart.find(params[:id]).user
    unless @user.already_subscribed?
      flash[:notice] = "Pour pouvoir ajouter un jeu à ton panier tu dois être abonné"
      redirect_to user_subscriptions_path(@user)
    end
  end

end
