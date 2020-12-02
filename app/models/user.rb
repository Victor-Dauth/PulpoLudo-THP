class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  #validates :first_name
  #validates :last_name

  has_one_attached :avatar, dependent: :destroy
  has_many :carts, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
