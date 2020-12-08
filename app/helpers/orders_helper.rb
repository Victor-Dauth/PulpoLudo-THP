module OrdersHelper

  def current_order
    current_user.orders.last
  end
end
