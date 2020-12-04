class CartsController < ApplicationController
  
  include CurrentCart
  before_action :authenticate_user!
  before_action :is_my_cart?, only: [:show]

  def show
    @cart = Cart.find(params[:id])
  end

  def update

    @game_sheet = GameSheet.find(params[:game_sheet_id])
    @cart = Cart.find(params[:id])
    @game = @game_sheet.games.in_stock.sample

    if @cart.full_cart?
      flash[:alert] = "Tu as déjà ajouter 5 jeux a ton abonnement"
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

   def is_my_cart?
    if Cart.find(params[:id]).user_id != current_user.id
      flash[:warning] = "Ah bon on va sur les paniers des autres pour vérifier que le controller est sécure 😁 ?"
      redirect_to root_path
    end
  end

end
