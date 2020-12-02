# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



GameSheet.destroy_all
User.destroy_all
Game.destroy_all

GameSheet.create(title: "MicroMacro : Crime City", description: "La police de Crime City a besoin de vous pour faire face à une vague de crimes hors normes. Utilisez toutes vos compétences d'observation et de déduction pour résoudre ces affaires.", nb_players_max: 4, nb_players_min: 1, playing_time: 30, age_min: 8, languages: "Français", publication_date: Date.new(2020, 12, 15), difficulty: 2)

GameSheet.create(title: "Unlock ! Mythic Adventures", description: "Avec ce 8ème opus de la saga Unlock, découvrez 3 nouvelles aventures palpitantes : un tour du monde en 80 jours, une plongée dans l'antiquité grecque et une nouvelle aventure avec Noside.", nb_players_max: 6, nb_players_min: 2, playing_time: 90, age_min: 10, languages: "Français",publication_date: Date.new(2020, 10, 03), difficulty: 3)

GameSheet.create(title: "The Crew", description: "The Crew est un jeu de plis coopératif dans lequel les joueurs incarnent les membres d'un équipage spatial en voyage vers une mystérieuse planète. Le jeu se compose de 50 missions à accomplir avant de pouvoir atteindre la destination finale.", nb_players_max: 5, nb_players_min: 2, playing_time: 15 ,age_min: 10, languages: "Français",publication_date: Date.new(2020, 02, 03), difficulty: 4)

GameSheet.create(title: "Trek 12", description: "Trek 12 est un roll and write évolutif dans lequel les joueurs partent à l'assaut de paysages aussi envoûtants que dangereux. Le massif de l'Himalaya vous attend pour être cartographié sous toutes ses coutures.", nb_players_max: 5, nb_players_min: 1, playing_time: 30, age_min: 8, languages: "Français",publication_date: Date.new(2020, 10, 03), difficulty: 3)

GameSheet.create(title: "7 Wonders Duel", description: "Triomphez de votre adversaire en développant et améliorant votre civilisation sur les plans civil, scientifique et militaire. 7 Wonders Duel est l'adaptation 2 joueurs de 7 Wonders.", nb_players_max: 2, nb_players_min: 2, playing_time: 45, age_min: 10, languages: "Français", publication_date: Date.new(2019, 12, 03), difficulty: 5)


20.times do |id|
  gs = GameSheet.all.sample
  if gs.games.empty?
    n = 1
  else
    n = gs.games.size + 1
  end
  
  Game.create(game_sheet: gs, stock_id: "#{gs.id}_#{n}")
end

user = User.create(email: 'pulpoludo@yopmail.com', first_name: 'pulpo', last_name: 'ludo', password: 'mdp123')
