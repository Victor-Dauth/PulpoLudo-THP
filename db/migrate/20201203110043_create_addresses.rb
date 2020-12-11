class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :title,           null:false
      t.string :street,          null:false
      t.string :zipcode,         null:false
      t.string :city,            null:false
      t.string :country,         null:false

      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
