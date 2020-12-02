class Cart < ApplicationRecord
  belongs_to :user
  has_many :games

  enum statuses: {current_cart:"panier actuel"}

  validates :statuses,
    presence: true,
    inclusion: {in: statuses.keys}
end
