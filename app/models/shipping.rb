class Shipping < ApplicationRecord
  belongs_to :order

  enum status: {shipping_send: "livraison aller", shipping_back: "livraison retour"}

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
