class Cart < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :nullify

  enum status: {current_cart:"panier actuel", send_cart:"panier en location", issus:"probleme"}

  validates :status,
    presence: true,
    inclusion: {in: statuses.keys}

  def already_present(game_to_test)
    self.games.each do |game|
      return true if game.game_sheet.id == game_to_test.game_sheet.id
    end
    return false
  end

  def full_cart?
    self.games.size >= 5
  end
end
