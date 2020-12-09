class Stripe::CheckoutordersController < ApplicationController
  def new
    @user = current_user
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: "Frais d'envoi des 5 jeux de société",
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      success_url: stripe_checkoutorders_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: stripe_checkoutorders_cancel_url
    )
    respond_to do |format|
      format.js # renders new.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
