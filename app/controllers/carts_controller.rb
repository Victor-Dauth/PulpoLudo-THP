class CartsController < ApplicationController
  
  include CurrentCart

  def show
    @cart = Cart.find(params[:id])
  end

  def update

    @game_sheet = GameSheet.find(params[:game_sheet_id])
    @cart = Cart.find(params[:id])
    @game = @game_sheet.games.in_stock.sample

    if @cart.games.size >= 5
      flash[:danger] = "Tu as déjà ajouter 5 jeux a ton abonnement"
      redirect_to root_path
    elsif @cart.already_present(@game)
      flash[:danger] = "Tu ne peut pas louer deux exemplaire du meme jeux"
      redirect_to root_path
    else
      @game.update(cart: current_cart)
      @game.leased!
    end
  end
end
