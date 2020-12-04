class AdminMailer < ApplicationMailer
  default from: "dautheville@hotmail.com"

  def issue_order_email_admin(order)

    @order = order
    @user = order.user

    mail(to: admin_pulpoludo@yopmail.com, subject: "Echec d'order!")
  end

  def issue_shipping_email_admin(shipping_send, shipping_back, user)

    @shipping_send = shipping_send
    @shipping_back = shipping_back
    @user = user

    mail(to: admin_pulpoludo@yopmail.com, subject: "Echec de shipping!")
  end

  def issue_subscription_email_admin(subscription)

    @subscription = subscription
    @user = subscription.user

    mail(to: admin_pulpoludo@yopmail.com, subject: "Echec de subscription!")
  end
end
