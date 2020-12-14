# PULPO LUDO

Cette application est le futur **Netflix du jeu de société**. La première version de ce site a été réalisée dans le cadre du projet final de la formation Fullstack Web de [The Hacking Project](https://www.thehackingproject.org/). En l'espace de 2 semaines, l'équipe projet a tâché de mutualiser ses compétences pour livrer une application complète, en Backend comme en Frontend.

## ACCES

- Voici le lien heroku pour tester le site directement en production : https://dev-pulpoludo-thp.herokuapp.com/.
- Pour vous connecter, *2 choix* d'offrent à vous :
* Utiliser le compte admin de test.
 * Email --> pulpoludo@yopmail.com
 * Mot de passe --> mdp123
* Passer par le process d'inscription classique. Ceci vous permettra d'ailleurs de vivre tout le chemin d'un utilisateur du site Pulpo Ludo, de l'inscription par mail jusqu'à la confirmation de livraison des 5 jeux de société.

### OUTILS 

- Thème Bootstrap "Spaces".
- Ruby on Rails, pour la langage programmatique global.
- PostgreSQL, pour la gestion de base de données.
- Active Storage, pour le stockage de contenu image en ligne.
- Une multitude de gems Ruby diverses et variées.

### API 
Nous avons implémenté les API suivantes : 

- [Mailjet](https://fr.mailjet.com/), pour l'envoi d'emails en production.
- [Stripe](https://stripe.com/fr), pour différentes séquences de paiement en ligne conformes à la norme européenne "Strong Customer Authentication".
- [Amazon S3](https://aws.amazon.com/fr/), pour stocker les contenus image en ligne de façon pérenne.

### FONCTIONNALITÉS

- [x] S'inscrire par email sur la plateforme Pulpo Ludo.
- [x] Prendre un abonnement à 9,99€/mois au service Pulpo Ludo.
- [x] Pacourir les différents produits jeux de société de la ludothèque.
- [x] Afficher les détails de chaque produit avec un pool de suggestions affichées en bas de page.
- [x] Choisir les produits à ajouter à votre panier (depuis la page index et/ou la page détaillant un produit.)
- [x] Afficher le panier.
- [x] Supprimer des produits du panier.
- [x] Commander et payer des frais de port pour pouvoir recevoir et renvoyer les 5 jeux de société choisis.   
- [x] Voir sa page de profil personnelle renvoyant à des pages connexes (modifier ses identifiants de connexion, voir son abonnement en cours, ses commandes de jeux passées etc.)

### CREDIT 

Merci infiniment à notre mentor [Anthony Amar](https://github.com/anthonyamar) pour sa disponibilité et ses conseils prodigués tout au long de ce projet final. Que ce soit d'un point de vue purement technique ou au niveau du Business model du site, il aura su nous aiguiller et cadrer les priorités pour aboutir à ce 1er livrable. Et bien sûr merci à toute la communauté de The Hacking Project, qui a rendu possible le fait de monter une application web complexe après seulement quelques semaines de formation.

### EQUIPE PROJET 

- [Victor Hauteville](https://github.com/Victor-Dauth/PulpoLudo-THP).
- [Bénédicte Bouclon](https://github.com/benedictebcl).
- [Vera Turan](https://github.com/VeraTuran).
- [Bérangère Hermann](https://github.com/Berangereh).
- [Quentin Plaud](https://github.com/kentsbrockman).
