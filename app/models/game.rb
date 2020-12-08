class Game < ApplicationRecord

  belongs_to :game_sheet
  belongs_to :cart, optional: true
  has_many :order_lines, dependent: :nullify
  has_many :orders, through: :order_lines, dependent: :nullify

  enum status: {in_stock: "en stock", leased: "en location", lost: "perdu", sold: "vendu"}
  enum condition: {like_new: "comme neuf", excellent: "excellent", fine: "correct", damaged: "abimé", incomplete: "incomplet", broken: "detruit"}
  
  validates :stock_id,
            presence: true,
            format: {with: /[0-9]{1,6}_[0-9]{1,3}/}

  validates :status,
            presence: true,
            inclusion: {in: statuses.keys}

  validates :condition,
            presence: true,
            inclusion: {in: conditions.keys}

  validates :weight,
            allow_nil: true,
            numericality: {greater_than_or_equal_to: 0}

  validates :height,
            allow_nil: true,
            numericality: {greater_than_or_equal_to: 0}

  validates :length,
            allow_nil: true,
            numericality: {greater_than_or_equal_to: 0}

  validates :width,
            allow_nil: true,
            numericality: {greater_than_or_equal_to: 0}

  validates :nb_times_rent,
            numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def new_rent
    self.nb_times_rent +=1
  end
end
