class GamesController < ApplicationController
  def update
    @game = Game.find(params[:id])
    @cart = @game.cart
    @cart.games.delete(@game)
    @game.in_stock!

    flash[:info] = "Ton jeu a bien été retiré de ton abonnement"
    redirect_to @cart
  end
end
