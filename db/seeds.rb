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

Theme.create(name: "enquête")
Theme.create(name: "énigme")
Theme.create(name: "Asie")
Theme.create(name: "Antiquité")
Theme.create(name: "science fiction")
Theme.create(name: "fantastique")
Theme.create(name: "abstrait")
Theme.create(name: "zombie")
Theme.create(name: "sciences")
Theme.create(name: "polar")
Theme.create(name: "aventure")

Mechanism.create(name: "énigme")
Mechanism.create(name: "déduction")
Mechanism.create(name: "cartes")
Mechanism.create(name: "roll and write")
Mechanism.create(name: "dés")
Mechanism.create(name: "évolutif")
Mechanism.create(name: "combinaison")
Mechanism.create(name: "draft")
Mechanism.create(name: "ambiance")
Mechanism.create(name: "mémoire")

Author.create(first_name: "Johannes", last_name: "Sich")
Author.create(first_name: "Cyril", last_name:"Demaegd")
Author.create(first_name: "Jéremy", last_name:"Fraile")
Author.create(first_name: "Vincent", last_name:"Goyat")
Author.create(first_name: "Yohann", last_name:"Servais")
Author.create(first_name: "Corentin", last_name:"Lebrat")
Author.create(first_name: "Bruno", last_name:"Cathala")
Author.create(first_name: "Thomas", last_name:"Sing")
Author.create(first_name: "Antoine", last_name:"Bauza")
Author.create(first_name: "Vlaada", last_name:"Chvátil")
Author.create(first_name: "Annick", last_name:"Lobet")
Author.create(first_name: "Jacob", last_name:"Fryxelius")
Author.create(first_name: "Wolfgang", last_name:"Warsch")
Author.create(first_name: "Oleksandr", last_name: "Nevskiy")

Artist.create(first_name: "Daniel", last_name: "Goll")
Artist.create(first_name: "Johannes", last_name: "Sich")
Artist.create(first_name: "a", last_name: "Legruth")
Artist.create(first_name: "Cyrille", last_name: "Bertin")
Artist.create(first_name: "Pierre", last_name: "Santamaria")
Artist.create(first_name: "Olivier", last_name: "Deroutteau")
Artist.create(first_name: "Jonathan", last_name: "Aucomte")
Artist.create(first_name: "Marco", last_name: "Armbruster")
Artist.create(first_name: "Xavier", last_name: "Collette")
Artist.create(first_name: "Tomáš", last_name: "Kučerovský")
Artist.create(first_name: "Rémy", last_name: "Tornior")

Editor.create(name: "Blackrock")
Editor.create(name: "Space Cowboys")
Editor.create(name: "Lumberjacks Studio")
Editor.create(name: "Oya")
Editor.create(name: "Iello")
Editor.create(name: "Libellud")
Editor.create(name: "Intrafin")
Editor.create(name: "Scorpion Masqué")
Editor.create(name: "Repos Production")




GameSheet.create(title: "MicroMacro : Crime City", 
	description: "La police de Crime City a besoin de vous pour faire face à une vague de crimes hors normes. Utilisez toutes vos compétences d'observation et de déduction pour résoudre ces affaires.", 
	nb_players_max: 4, 
	nb_players_min: 1, 
	playing_time: 30, 
	age_min: 8, 
	language: "Français", 
	publication_date: Date.new(2020, 12, 15), 
	difficulty: 2, 
	themes: [Theme.find_by(name: "enquête")], 
	mechanisms: [Mechanism.find_by(name: "énigme")], 
	authors: [Author.find_by(first_name: "Johannes", last_name: "Sich")], 
	artists: [Artist.find_by(first_name: "Daniel", last_name: "Goll"), 
		Artist.find_by(first_name: "Johannes", last_name: "Sich")], 
	editors: [Editor.find_by(name: "Blackrock")])

GameSheet.create(title: "Unlock ! Mythic Adventures", 
	description: "Avec ce 8ème opus de la saga Unlock, découvrez 3 nouvelles aventures palpitantes : un tour du monde en 80 jours, une plongée dans l'antiquité grecque et une nouvelle aventure avec Noside.", 
	nb_players_max: 6, 
	nb_players_min: 2, 
	playing_time: 90, 
	age_min: 10, 
	language: "Français",
	publication_date: Date.new(2020, 10, 03), 
	difficulty: 3, themes: [Theme.find_by(name: "énigme")], 
	mechanisms: [Mechanism.find_by(name: "déduction")], 
	authors: [Author.find_by(first_name: "Cyril", last_name: "Demaegd"), 
		Author.find_by(first_name: "Jéremy", last_name: "Fraile"), 
		Author.find_by(first_name: "Vincent", last_name: "Goyat"), 
		Author.find_by(first_name: "Yohann", last_name: "Servais")], 
	artists: [Artist.find_by(first_name: "a", last_name: "Legruth"), 
		Artist.find_by(first_name: "Cyrille", last_name: "Bertin"), 
		Artist.find_by(first_name: "Pierre", last_name: "Santamaria")], 
	editors: [Editor.find_by(name: "Space Cowboys")])

GameSheet.create(title: "The Crew", 
	description: "The Crew est un jeu de plis coopératif dans lequel les joueurs incarnent les membres d'un équipage spatial en voyage vers une mystérieuse planète. Le jeu se compose de 50 missions à accomplir avant de pouvoir atteindre la destination finale.", 
	nb_players_max: 5, 
	nb_players_min: 2, 
	playing_time: 15 ,
	age_min: 10, 
	language: "Français", 
	publication_date: Date.new(2020, 02, 03), 
	difficulty: 4, themes: [Theme.find_by(name: "science fiction")], 
	mechanisms: [Mechanism.find_by(name: "cartes")], 
	authors: [Author.find_by(first_name: "Thomas", last_name: "Sing")], 
	artists: [Artist.find_by(first_name: "Marco", last_name: "Armbruster")], 
	editors: [Editor.find_by(name: "Iello")])

GameSheet.create(title: "Trek 12", 
	description: "Trek 12 est un roll and write évolutif dans lequel les joueurs partent à l'assaut de paysages aussi envoûtants que dangereux. Le massif de l'Himalaya vous attend pour être cartographié sous toutes ses coutures.", 
	nb_players_max: 5, 
	nb_players_min: 1, 
	playing_time: 30, 
	age_min: 8, 
	language: "Français",
	publication_date: Date.new(2020, 10, 03), 
	difficulty: 3, 
	themes: [Theme.find_by(name: "aventure"), Theme.find_by(name: "Asie")], 
	mechanisms: [Mechanism.find_by(name: "roll and write")], 
	authors: [Author.find_by(first_name: "Corentin", last_name: "Lebrat"), 
		Author.find_by(first_name: "Bruno", last_name: "Cathala")], 
	artists: [Artist.find_by(first_name: "Olivier", last_name: "Deroutteau"), 
		Artist.find_by(first_name: "Jonathan", last_name: "Aucomte")], 
	editors:[Editor.find_by(name: "Lumberjacks Studio")])

GameSheet.create(title: "7 Wonders Duel", 
	description: "Triomphez de votre adversaire en développant et améliorant votre civilisation sur les plans civil, scientifique et militaire. 7 Wonders Duel est l'adaptation 2 joueurs de 7 Wonders.", 
	nb_players_max: 2, 
	nb_players_min: 2,
	playing_time: 45, 
	age_min: 10, 
	language: "Français", 
	publication_date: Date.new(2019, 12, 03), 
	difficulty: 4, themes: [Theme.find_by(name: "Antiquité")], 
	mechanisms: [Mechanism.find_by(name: "cartes")], 
	authors: [Author.find_by(first_name: "Antoine", last_name: "Bauza")], 
	editors: [Editor.find_by(name: "Repos Production")])

GameSheet.create(title: "Mysterium Park", 
	description: "Dans ce jeu coopératif et asymétrique, le fantôme envoie des visions à l'aide de cartes illustrées. Les médiums tentent de les interpréter afin d'écarter certains suspects et lieux. Ensuite, ils saisiront leur seule chance de reconstituer ce qui est arrivé au directeur. Vous n'avez que six nuits avant que le carnaval ne quitte la ville... Ouvrez vos esprits et découvrez la vérité !", 
	nb_players_max: 6, 
	nb_players_min: 2, 
	playing_time: 30, 
	age_min: 10, 
	language: "Français", 
	publication_date: Date.new(2020, 10, 03), 
	difficulty: 3, 
	themes: [Theme.find_by(name: "fantastique")], 
	mechanisms: [Mechanism.find_by(name: "ambiance")], 
	authors: [Author.find_by(first_name: "Oleksandr", last_name: "Nevskiy")], 
	artists: [Artist.find_by(first_name: "Xavier", last_name: "Collette")], 
	editors: [Editor.find_by(name: "Libellud")])

GameSheet.create(title: "Codenames", 
	description: "Codenames est un jeu de langage et de déduction dans lequel s'affrontent deux équipes d'espions. À leur tête, deux maîtres de l'espionnage rivaux sont les seuls à connaître les identités secrètes des 25 agents.", 
	nb_players_max: 8, 
	nb_players_min: 2, 
	playing_time: 30, 
	age_min: 14, 
	language: "Français", 
	publication_date: Date.new(2017, 05, 15), difficulty: 3, 
	themes: [Theme.find_by(name: "polar")], 
	mechanisms: [Mechanism.find_by(name: "mémoire")], 
	authors: [Author.find_by(first_name:"Vlaada", last_name: "Chvátil")], 
	artists: [Artist.find_by(first_name: "Tomáš", last_name: "Kučerovský")], 
	editors: [Editor.find_by(name: "Iello")])

GameSheet.create(title: "Zombie Teenz Evolution", 
	description: "Chassés de l'école, les zombies ont établi une base dans les égouts et sèment la pagaille dans toute la ville ! Le temps de se cacher est révolu... Il faut trouver 4 ingrédients pour préparer un antidote qui rendra leur forme humaine aux zombies!", 
	nb_players_max: 4, 
	nb_players_min: 2, 
	playing_time: 30, 
	age_min: 8, 
	language: "Français", 
	publication_date: Date.new(2019, 12, 03), 
	difficulty: 2, 
	themes: [Theme.find_by(name: "zombie")], 
	mechanisms: [Mechanism.find_by(name: "évolutif")], 
	authors: [Author.find_by(first_name: "Annick", last_name: "Lobet")], 
	artists: [Artist.find_by(first_name:"Rémy", last_name: "Tornior")], 
	editors: [Editor.find_by(name: "Scorpion Masqué")])

GameSheet.create(title: "Terraforming Mars", 
	description: "L'ère de la domestication de Mars a commencé. Dans Terraforming Mars, de puissantes corporations travaillent pour rendre la Planète Rouge habitable. La température, l'oxygène et les océans sont les trois axes de développement principaux. Mais pour triompher, il faudra aussi construire des infrastructures pour les générations futures.", 
	nb_players_max: 5, 
	nb_players_min: 1, 
	playing_time: 120, 
	age_min: 12, 
	language: "Français", 
	publication_date: Date.new(2017, 10, 20), 
	difficulty: 5, 
	themes: [Theme.find_by(name: "sciences")], 
	mechanisms: [Mechanism.find_by(name: "draft")], 
	authors: [Author.find_by(first_name:"Jacob", last_name: "Fryxelius")], 
	editors: [Editor.find_by(name: "Intrafin")])

GameSheet.create(title: "The Mind", 
	description: "Avec The Mind, constituez une suite croissante de numéros avec les autres joueurs. Jouez en collaboration, mais sans la moindre communication. Dans The Mind, jouez en équipe mais en silence. Sentez le jeu et faites preuve de patience !", 
	nb_players_max: 4, 
	nb_players_min: 2, 
	playing_time: 30, 
	age_min: 8, 
	language: "Français", 
	publication_date: Date.new(2018, 10, 03), 
	difficulty: 3, 
	themes: [Theme.find_by(name: "abstrait")],
	mechanisms: [Mechanism.find_by(name: "combinaison")], 
	authors: [Author.find_by(first_name: "Wolfgang", last_name: "Warsch")], 
	editors: [Editor.find_by(name: "Oya")])



20.times do |id|
  gs = GameSheet.all.sample
  if gs.games.empty?
    n = 1
  else
    n = gs.games.size + 1
  end
  
  Game.create(game_sheet: gs, stock_id: "#{gs.id}_#{n}")
end

user = User.create(email: 'pulpoludo@yopmail.com', first_name: 'Pulpo', last_name: 'Ludo', password: 'mdp123', is_admin?: true)
