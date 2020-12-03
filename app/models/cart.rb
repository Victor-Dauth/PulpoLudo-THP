class Cart < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :nullify

  enum statuses: {current_cart:"panier actuel"}

  validates :statuses,
    presence: true,
    inclusion: {in: statuses.keys}

  def already_present(game_to_test)
    self.games.each do |game|
      return true if game.game_sheet.id == game_to_test.game_sheet.id
    end
    return false
  end
end
