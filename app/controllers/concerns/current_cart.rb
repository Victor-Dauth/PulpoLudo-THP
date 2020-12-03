module CurrentCart

  def current_cart
    current_user.carts.last
  end
end
