class AddCartToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :cart, foreign_key: true
  end
end
