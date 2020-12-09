class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_cart
  # + welcome email to replace confirmation email?

  has_many :addresses, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_one :subscription, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  has_one_attached :avatar, dependent: :destroy

  def thumbnail
    return self.avatar.variant(resize: '300x300!').processed 
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def already_completed_profile?
    if (self.first_name != nil) && (self.last_name != nil) && (self.date_of_birth != nil) && (self.phone_number != nil) && (self.gender != nil)
      return true
    end
    return false
  end

  def already_subscribed?
    if self.subscription != nil && self.subscription.status == 'active'
      return true
    end
    return false
  end

  def already_has_an_address?
    self.addresses.each do |address|
      return true if address != nil
    end
    return false
  end

  private

  def create_cart
    self.carts.create
  end

end
