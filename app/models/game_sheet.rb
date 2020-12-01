class GameSheet < ApplicationRecord
  has_many :Games

  enum language: { french: "Français", english: "Anglais"}

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :description,
            presence: true

  validates :nb_players_max,     
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :nb_players_min,     
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :nb_players_min_inf?

  validates :playing_time,       
            presence: true
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :age_min,            
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}

  validates :language,           
            presence: true,
            inclusion: {in: language.keys}

  validates :publication_date,   
            presence: true 

  validates :difficulty,         
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  

  def nb_players
    self.nb_players_min + "-" + self.nb_players_max
  end

  private

  def nb_players_min_inf?
    if nb_players_min > nb_players_max
      errors.add(:nb_players_min, "ne doit pas être supérieur au nombre de joueur max")
    end
  end
end
