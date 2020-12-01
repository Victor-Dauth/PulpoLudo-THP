class CreateGameSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sheets do |t|
      t.string  :title,              null:false
      t.text    :description,        null:false
      t.integer :nb_players_max,     null:false
      t.integer :nb_players_min,     null:false
      t.integer :playing_time,       null:false
      t.integer :age_min,            null:false
      t.string  :languages,          null:false
      t.date    :publication_date,   null:false
      t.integer :difficulty,         null:false

      t.timestamps
    end
  end
end
