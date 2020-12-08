class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :good_user?
  
  
  def index
    @orders = current_user.orders.finished
  end

  def show
    @order = current_order
  end

  def create

    @order = Order.new(user: current_user, status: "bien arrivé")
    @order.games = current_cart.games
    
    if @order.save
      @shipping_send = Shipping.new(price: 0, provider: "Mondial Relay", send_at: Time.new, status: "livraison aller", order: @order, trakcing_number: "????")

      @shipping_back = Shipping.new(price: 0, provider: "Mondial Relay", send_at: Time.new, status: "livraison retour", order: @order, trakcing_number: "????")

      if @shipping_send.save && @shipping_back.save

        current_cart.games.each do |game|
          game.leased!
        end
        current_cart.send_cart!
        flash[:notice] = "Vos jeux vous ont bien étés envoyés."
        redirect_to current_user
      else
        failure_new_shipping_email(@order, @shipping_send, @shipping_back)
      end
    else
      failure_new_order_email(@order)
    end
  end

  def update

    @order = Order.find(params[:id])
    @cart = User.find(params[:user_id]).carts.last

    remove_all_game(@cart)
    @cart.current_cart!
    @order.finished!

    finish_order_email(@order)
  end

  private

  def failure_new_order_email(order)
    UserMailer.issue_order_email(order).deliver_now
    AdminMailer.issue_order_email_admin(order).deliver_now

  end

  def failure_new_shipping_email(order, shipping_send, shipping_back)
    user = order.user

    UserMailer.issue_order_email(order).deliver_now
    AdminMailer.issue_shipping_email_admin(shipping_send, shipping_back, user).deliver_now
  end

  def finish_order_email(order)
    UserMailer.finish_order_email(order).deliver_now
  end

  def good_user?
    user_id = params[:user_id]
    check_user(user_id)
  end

  def remove_all_game(cart)
    cart.games.each do |game|
      game.in_stock!
    end
    cart.games.delete_all
  end
end
