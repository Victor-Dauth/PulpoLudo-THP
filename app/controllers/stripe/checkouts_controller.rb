class Stripe::CheckoutsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  
  def new
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'subscription',
      subscription_data: {
            items: [{ subscription: params[:subscription] }],
        },
      line_items: [{
        # For metered billing, do not pass quantity
        quantity: 1,
        price: 'price_1HwQfzL1Cw86LE2tOpplz4z0',
      }],
      customer: current_user.stripe_id,
      client_reference_id: current_user.id,
      success_url: stripe_checkouts_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: stripe_checkouts_cancel_url
    )

    respond_to do |format|
      format.js # renders new.js.erb
    end
  end

  def webhook
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']

    begin
      event = Stripe::Webhook.construct_event(request.body.read, sig_header, ENV['STRIPE_ENDPOINT_SECRET'])
    rescue JSON::ParserError
      return head :bad_request
    rescue Stripe::SignatureVerificationError
      return head :bad_request
    end

    webhook_checkout_session_completed(event) if event['type'] == 'checkout.session.completed'

    head :ok
  end

  def success
    flash[:success] = "You subscribed to our plan!"
    redirect_to root_path
  end

  def cancel
    @not_paid_subscription = build_subscription_error
    failure_subscription_email(@not_paid_subscription)
  end

  private
  
  def webhook_checkout_session_completed(event)
    #Retrieve the relevant info following a successful Checkout session
    object = event['data']['object']
    customer = Stripe::Customer.retrieve(object['customer'])
    stripe_subscription = Stripe::Subscription.retrieve(object['subscription'])
    subscriber = User.find_by(id: object['client_reference_id'])

    #Build a subscription in DB after a successful payment with the relevant references
    @paid_subscription = build_subscription(stripe_subscription, subscriber)

    #Update Stripe ID on the User side
    subscriber.update!(stripe_id: customer.id)
    
    #Launch confirmation email process
    new_subscription_email(@paid_subscription)
  end

  def build_subscription(stripe_subscription, subscriber)
    Subscription.create(user: subscriber, stripe_id: stripe_subscription.id, status: 'actif', price: 9.99, start_date: Time.now)
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
