class Stripe::CheckoutsController < ApplicationController

  def create
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'subscription',
      subscription_data: {
            items: [{ subscription: params[:subscription] }],
        },
      line_items: [{
        # For metered billing, do not pass quantity
        quantity: 1,
        price: 'price_1Hw2XoL1Cw86LE2tOtVVb7TL',
      }],
      customer: current_user.stripe_id,
      client_reference_id: current_user.id,
      success_url: stripe_checkouts_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: stripe_checkouts_cancel_url
    )
    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    #Retrieve the relevant info following a successful Checkout session
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = Stripe::Customer.retrieve(@session.customer)
    @stripe_subscription = Stripe::Subscription.retrieve(@session.subscription)
    subscriber = User.find_by(id: @session.client_reference_id)

    #Build the real subscription after a successful payment with the relevant references
    @paid_subscription = build_subscription(@stripe_subscription, subscriber)

    #Update Stripe ID on the User side
    subscriber.update!(stripe_id: @customer.id)

    #Launch confirmation email process
    new_subscription_email(@paid_subscription)
  end

  def cancel
    @not_paid_subscription = build_subscription_error
    failure_subscription_email(@not_paid_subscription)
  end

  private
  
  def build_subscription(stripe_subscription, subscriber)
    Subscription.create(user: subscriber, stripe_id: stripe_subscription.id, status: 'actif', price: 9.99, start_date: Time.now, duration: 1)
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
