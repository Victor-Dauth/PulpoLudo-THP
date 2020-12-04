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
    new_subscription_email(@paid_subscription)
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    @not_paid_subscription = build_subscription_error
    failure_subscription_email(@not_paid_subscription)
  end

  private
  def build_subscription
    Subscription.create(user: current_user, status: 'actif', price: 10, start_date: Time.now, duration: 1)
  end

  def build_subscription_error
    Subscription.create(user: current_user, status: "en attente", price: 10, start_date: Time.now, duration: 1)
  end

  def failure_subscription_email(subscription)

    UserMailer.issue_subscription_email(subscription).deliver_now
    AdminMailer.issue_subscription_email_admin(subscription).deliver_now
  end

  def new_subscription_email(subscription)

    UserMailer.new_subscription_email(subscription).deliver_now
  end
end
