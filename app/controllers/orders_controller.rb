class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :good_user?
  
  
  def index
    @orders = current_user.orders.finished
  end

  def show
    @order = current_order
  end

  def update
    @order = Order.find(params[:id])
    @cart = User.find(params[:user_id]).carts.last

    remove_all_games(@cart)
    @cart.current_cart!
    @order.finished!

    finish_order_email(@order)
  end

  private

  def finish_order_email(order)
    UserMailer.finish_order_email(order).deliver_now
  end

  def good_user?
    user_id = params[:user_id]
    check_user(user_id)
  end

  def remove_all_games(cart)
    cart.games.each do |game|
      game.in_stock!
    end
    cart.games.delete_all
  end
  
end
