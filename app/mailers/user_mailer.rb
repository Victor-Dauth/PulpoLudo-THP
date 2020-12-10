class UserMailer < ApplicationMailer
  default from: "dautheville@hotmail.com"

  def create_order_email(order)

    @order = order
    @user = @order.user

    mail(to: @user.email, subject: "Tes jeux arrive bientot!")
  end

  def finish_order_email(order)

    @order = order
    @user = @order.user

    mail(to: @user.email, subject: "Nous avons bien reçu tes jeux!")
  end

  def new_subscription_email(subscription)

    @subscription = subscription
    @user = @subscription.user

    mail(to: @user.email, subject: "Bienvenu parmis nos chanceux abonné!")
  end

  def issue_order_email(order)

    @order = order
    @user = @order.user

    mail(to: @user.email, subject: "Oups!")
  end

  def issue_subscription_email(subscription)

    @subscription = subscription
    @user = @subscription.user

    mail(to: @user.email, subject: "Oups!")
  end

  def welcome_email(user)
    @user = user

    @url = "http://dev-pulpoludo-thp.herokuapp.com/users/5/subscriptions"

    mail(to: @user.email, subject: "Bienvenu chez PulpoLudo!")
  end
end
