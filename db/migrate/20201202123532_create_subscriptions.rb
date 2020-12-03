class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :stripe_id
      t.string :subscription_id
      t.string :plan_id
      t.integer :user_id
      t.string :status
      t.decimal :price
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :current_period_ends_at
      t.timestamps
    end
  end
end
