class TagsForGameSheet < ApplicationRecord
	belongs_to :game_sheet, optional: true
	belongs_to :artist, 	optional: true
	belongs_to :author, 	optional: true
	belongs_to :category, 	optional: true
	belongs_to :editor, 	optional: true
	belongs_to :mechanism, 	optional: true
	belongs_to :theme, 		optional: true
end
