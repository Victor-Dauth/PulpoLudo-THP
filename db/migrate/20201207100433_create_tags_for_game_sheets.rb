class CreateTagsForGameSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_for_game_sheets do |t|

      t.timestamps
    end
  end
end
