class Shipping < ApplicationRecord
  belongs_to :order

  enum status: {waiting_to_be_send: "en attente d'envoi", in_transit_send: "livraison aller", arrived: "bien arrivé", in_transit_back: "livraison retour", lost: "perdu", issue: "problème"}

  enum provider: {mondial_relay: "Mondial Relay", poste: "la poste"}

  validates :status,
            presence: true,
            inclusion: {in: statuses.keys}
  
  validates :provider,
            presence: true,
            inclusion: {in: providers.keys}


  validates :playing_time,       
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0}
  
end
