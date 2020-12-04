class Shipping < ApplicationRecord
  belongs_to :order

  enum status: {waiting_to_be_send: "en attente d'envoi aller", in_transit_send: "livraison aller", arrived: "bien arrivé",waiting_to_be_back: "en attente d'envoi retour", in_transit_back: "livraison retour", lost: "perdu", issue: "problème"}

  enum provider: {mondial_relay: "Mondial Relay", poste: "la poste", send_at: Time.new}

  validates :status,
            presence: true,
            inclusion: {in: statuses.keys}
  
  validates :provider,
            presence: true,
            inclusion: {in: providers.keys}


  validates :price,       
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0}
  
end
