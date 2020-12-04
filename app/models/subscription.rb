class Subscription < ApplicationRecord

  belongs_to :user

  enum status: {inactive: "inactif", active: "actif", pending: "en attente", finished: "terminé"}

  validates :status,
    presence: true,
    inclusion: {in: statuses.keys}

  validates :price,
    presence: true,
    numericality: {greater_than_or_equal_to: 1}

  validates :duration,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 1}

  def end_date
    self.start_date + duration.month
  end

end
