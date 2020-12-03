module CartsHelper

  def current_cart
    current_user.carts.last
  end
end
