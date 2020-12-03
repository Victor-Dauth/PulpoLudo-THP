class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :country
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
