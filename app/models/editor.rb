class Editor < ApplicationRecord
	has_many :tags_for_game_sheets
	has_many :game_sheets, through: :tags_for_game_sheets
end
