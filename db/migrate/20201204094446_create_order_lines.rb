class CreateOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lines do |t|

      t.references :order, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps
    end
  end
end
