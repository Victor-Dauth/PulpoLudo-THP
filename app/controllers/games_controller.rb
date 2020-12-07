class GamesController < ApplicationController

  before_action :authenticate_user!
  before_action :good_user?
  
  def update
    @game = Game.find(params[:id])
    @cart = @game.cart
    @cart.games.delete(@game)
    @game.in_stock!

    flash[:info] = "Ton jeu a bien été retiré de ton abonnement"
    redirect_to @cart
  end

  private 

  def good_user?
    user_id = Game.find(params[:id]).cart.user.id
    check_user(user_id)
  end
end
