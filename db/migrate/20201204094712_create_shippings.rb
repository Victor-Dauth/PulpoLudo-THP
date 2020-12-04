class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.decimal :price,            null:false
      t.string :provider,          null:false
      t.string :trakcing_number
      t.datetime :send_at
      t.string :status,            null:false, default: "en attente d'envoi"
      t.float :total_weight
      t.float :total_height
      t.float :total_lenght
      t.float :total_width

      t.references :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
