class GamesController < ApplicationController
  def update
    @game = Game.find(params[:id])
    @cart = @game.cart
    @cart.games.delete(@game)
    @game.in_stock!

    redirect_to @cart
  end
end
