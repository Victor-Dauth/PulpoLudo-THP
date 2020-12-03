class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :statuses,     null:false, default:"panier actuel"

      t.belongs_to :user,    index: true

      t.timestamps
    end
  end
end
