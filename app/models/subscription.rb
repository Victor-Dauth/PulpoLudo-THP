class Subscription < ApplicationRecord

  belongs_to :user

  enum status: {inactive: "inactif", active: "actif", pending: "en attente", finished: "terminé"}

  validates :status,
    presence: true,
    inclusion: {in: statuses.keys}

  validates :price,
    presence: true,
    numericality: {greater_than_or_equal_to: 1}

  def clean_start_date
    self.start_date.strftime("%d/%m/%Y")
  end

  def interrupt
    Stripe::Subscription.delete(stripe_id)
    self.status = "terminé"
    save
  end

end
