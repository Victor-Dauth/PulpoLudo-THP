class CreateTagsForGameSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_for_game_sheets do |t|

    	t.references :author
    	t.references :theme
    	t.references :mechanism
    	t.references :category
    	t.references :artist
    	t.references :editor
    	t.references :game_sheet

      t.timestamps
    end


  end
end
