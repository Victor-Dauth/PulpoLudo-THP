class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.string :status,            null:false
      
      t.references :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
