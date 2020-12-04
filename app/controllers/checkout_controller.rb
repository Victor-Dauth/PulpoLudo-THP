class CheckoutController < ApplicationController
  def create
    @user = current_user
    @price = 10

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'Rails Stripe Checkout',
          amount: (@price*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js # renders create.js.erb
    end

  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @paid_subscription = build_subscription

    #Enclencher mailer (user)
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    #Changement status souscription
    #Enclencher mailer (admin, user)
  end

  private
  def build_subscription
    Subscription.create(user: current_user, status: 'actif', price: 10, start_date: Time.now, duration: 1)
  end

end
