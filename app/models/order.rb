class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines, dependent: :destroy
  has_many :shippings, dependent: :destroy
  has_many :games, throught: :order_lines, dependent: :nullify
end
