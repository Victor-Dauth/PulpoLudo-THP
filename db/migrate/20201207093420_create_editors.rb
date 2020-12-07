class CreateEditors < ActiveRecord::Migration[5.2]
  def change
    create_table :editors do |t|
    	t.string :name
      t.timestamps
    end
  end
end
