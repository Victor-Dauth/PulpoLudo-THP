class CreateMechanisms < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanisms do |t|
    	t.string :name
      t.timestamps
    end
  end
end
