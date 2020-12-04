class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines, dependent: :destroy
  has_many :shippings, dependent: :destroy
  has_many :games, through: :order_lines, dependent: :nullify 

  after_create :order_create_send

  def order_create_send
    UserMailer.create_order_email(self).deliver_now
  end
end
