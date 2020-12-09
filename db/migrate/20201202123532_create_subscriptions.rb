class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :stripe_id
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.decimal :price, null:false
      t.datetime :start_date, null:false
      t.timestamps
    end
  end
end
