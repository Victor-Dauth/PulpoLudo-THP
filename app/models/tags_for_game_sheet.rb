class TagsForGameSheet < ApplicationRecord
	belongs_to :game_sheet
	belongs_to :artist
	belongs_to :author
	belongs_to :category
	belongs_to :editor
	belongs_to :mechanism
	belongs_to :theme
end
