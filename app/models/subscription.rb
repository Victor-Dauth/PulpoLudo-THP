class Subscription < ApplicationRecord

  belongs_to :user

  enum status: {inactive: "inactif", active: "actif", pending: "en attente", finished: "terminé"}

  validates :status,
    presence: true,
    inclusion: {in: statuses.keys}

  validates :price,
    presence: true,
    numericality: {greater_than_or_equal_to: 1}

  validates :start_date,
    presence: true,
    if: :future_date

  validates :duration,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 1}

  private

  def future_date
    errors.add(:start_date, "L'abonnement ne peut pas commencer dans le passé.") unless start_date > DateTime.now
  end

end
