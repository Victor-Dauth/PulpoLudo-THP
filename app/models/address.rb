class Address < ApplicationRecord
  belongs_to :user

  validates :title,
    presence: true

  validates :street,
    presence: true

  validates :zipcode,
    presence: true

  validates :city,
    presence: true

  validates :country,
    presence: true
end
