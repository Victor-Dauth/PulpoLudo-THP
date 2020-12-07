class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines, dependent: :destroy
  has_many :shippings, dependent: :destroy
  has_many :games, through: :order_lines, dependent: :nullify 

  after_create :order_create_send

  enum status: {waiting_to_be_send: "en attente d'envoi aller", in_transit_send: "livraison aller", arrived: "bien arrivé",waiting_to_be_back: "en attente d'envoi retour", in_transit_back: "livraison retour", finished: "terminer", lost: "perdu", issue: "problème"}

  validates :status,
    presence: true,
    inclusion: {in: statuses.keys}

  def order_create_send
    UserMailer.create_order_email(self).deliver_now
  end
end
