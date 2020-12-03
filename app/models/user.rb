class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  #validates :phone_number, length: { in: 2..20 }
  #validates :last_name

  has_many :addresses

  after_create :create_cart

  has_one_attached :avatar, dependent: :destroy
  
  has_many :carts, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def create_cart
    self.carts.create
  end
end
