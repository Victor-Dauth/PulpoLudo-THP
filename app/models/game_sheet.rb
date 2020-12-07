class GameSheet < ApplicationRecord
  has_many :games

  enum language: { french: "Français", english: "Anglais"}

  validates :title,
            presence: true,
            uniqueness: true

  validates :description,
            presence: true

  validates :nb_players_max,     
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :nb_players_min,     
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validate :nb_players_min_inf?

  validates :playing_time,       
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :age_min,            
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :language,           
            presence: true,
            inclusion: {in: languages.keys}

  validates :publication_date,   
            presence: true 

  validates :difficulty,         
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  has_one_attached :game_picture

  has_many :tags_for_game_sheets
  has_many :editors,    through: :tags_for_game_sheets
  has_many :artists,    through: :tags_for_game_sheets
  has_many :authors,    through: :tags_for_game_sheets
  has_many :categories, through: :tags_for_game_sheets
  has_many :mechanisms, through: :tags_for_game_sheets
  has_many :themes,     through: :tags_for_game_sheets



  def nb_players
    "#{self.nb_players_min}-#{self.nb_players_max}"
  end

  private

  def nb_players_min_inf?
    if nb_players_min > nb_players_max
      errors.add(:nb_players_min, "ne doit pas être supérieur au nombre de joueur max")
    end
  end
end
