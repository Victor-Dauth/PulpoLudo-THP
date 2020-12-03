class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :stock_id,         null:false
      t.string :status,         null:false, default:"en stock"
      t.string :condition,       null:false, default:"comme neuf"
      t.float :weight
      t.float :height
      t.float :length
      t.float :width
      t.integer :nb_times_rent,   null:false, default:0

      t.belongs_to :game_sheet, index: true

      t.timestamps
    end
  end
end
