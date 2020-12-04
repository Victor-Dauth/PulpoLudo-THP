class OrdersController < ApplicationController
  def index
  end

  def create

    @order = Order.new(user: current_user)
    @order.games = current_cart.games
    
    if @order.save
      @shipping_send = Shipping.new(price: 0, provider: "Mondial Relay", send_at: Time.new, status: "bien arrivé", order: @order, trakcing_number: "????")

      @shipping_back = Shipping.new(price: 0, provider: "Mondial Relay", send_at: Time.new, status: "en attente d'envoi retour", order: @order, trakcing_number: "????")

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
end
