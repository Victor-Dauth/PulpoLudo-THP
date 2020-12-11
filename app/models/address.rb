class Address < ApplicationRecord
  belongs_to :user

  validates :street, :city, presence: true
  	presence: true

  validates :zipcode
  	presence: true
  	numericality: {greater_than_or_equal_to: 0}

  validates :city, 
  	presence: true
  	format: { with: /\A[a-zA-Z]+\z/, message: "ne peut contenir que des lettres" }

  validates :country, 
  	presence: true
  	format: { with: /\A[a-zA-Z]+\z/, message: "ne peut contenir que des lettres" }


end
