class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :stripe_id
      t.string :subscription_id
      t.decimal :price
      t.boolean :active, default: false
      t.integer :user_id
      t.datetime :current_period_ends_at
      t.timestamps
    end
  end
end
