class CheckoutController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
        mode: 'subscription',
        line_items: [{
          # For metered billing, do not pass quantity
          quantity: 1,
          price: 'price_1Hw2XoL1Cw86LE2tOtVVb7TL',
        }],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    @paid_subscription = build_subscription
    new_subscription_email(@paid_subscription)
  end

  def cancel
    @not_paid_subscription = build_subscription_error
    failure_subscription_email(@not_paid_subscription)
  end

  private
  
  def build_subscription
    Subscription.create(user: current_user, status: 'actif', price: 9.99, start_date: Time.now, duration: 1)
  end

  def build_subscription_error
    Subscription.create(user: current_user, status: "en attente", price: 9.99, start_date: Time.now, duration: 1)
  end

  def failure_subscription_email(subscription)
    UserMailer.issue_subscription_email(subscription).deliver_now
    AdminMailer.issue_subscription_email_admin(subscription).deliver_now
  end

  def new_subscription_email(subscription)
    UserMailer.new_subscription_email(subscription).deliver_now
  end
end
