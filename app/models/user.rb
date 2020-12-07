class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  #validates :phone_number, length: { in: 2..20 }
  #validates :last_name



  has_many :addresses, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  has_one_attached :avatar, dependent: :destroy

  after_create :create_cart

  def thumbnail
    return self.avatar.variant(resize: '300x300!').processed 
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def already_subscribed?
    self.subscriptions.each do |subscription|
      return true if subscription.active?
    end
    return false
  end

  private

  def create_cart
    self.carts.create
  end


end
