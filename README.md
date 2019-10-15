#1. Présentation (Projet en cours)
JoinMe est un projet sur lequel je travaille depuis un an. C’est une application mobile (disponible sur IOS et Android) qui permet de créer des événements spontanés au travers d’invitations vidéo. http://onelink.to/8zwcfs

**JoinMe version THP**, est un site web permettant de découvrir, partager et rejoindre les ambiances “live” des lieux événementiels autour de soi.

Chaque bar ou boite de nuit pourra diffuser l’ambiance de son lieu au travers de vidéos courtes (10 secondes max) à tous les utilisateurs autour d’eux.

Les utilisateurs pourront visionner ces vidéos, les partager avec leurs amis et s’y donner rendez-vous.

J’ai réalisé un sondage auprès d’une trentaine de bars dans des quartiers phares de Paris, et 93,1% ont répondu être intéressé voir très intéressé par l'idée de promouvoir leur lieu au travers de leur ambiance. J’ai pu aussi confirmer un premier business model avec eux.

#2. Parcours utilisateur
**Facebook login:** import de photo de profil, adresse mail / tél, amis (s’ils sont aussi sur JoinMe).

**Page d'accueil:** permet de découvrir tous les lieux autour de soi.

**Page lieu:** affichera son ambiance “live”, ou ses ambiances passées favorites, son adresse, gamme de prix, description, horaires… En cliquant sur “partager”, cela crée une invitation qui apparaît dans l’inbox de tous les invités.

**Inbox:** affiche toutes les invitations.

**Invitation:** Similaire à la page lieu, mais avec la liste d’invités et leurs statuts (s’ils vont “join” ou non l'événement). Possibilité aussi de chatter à l'intérieur de l'événement.

**Page profil:** Photos, infos standard + gamification : Invitation à un lieu, donne des points. Au bout d’un certain nombre de points → verre offert.

#3. Concrètement et techniquement

Points à implémenter :

*  AWS : vidéos
* Géolocalisation (pour afficher les événements autour de soi)

##3.1. Base de données
* Table `User`
* `User` has n `Events` through `Invitations`
* `User` has n `Friends` ClassName: `User` through `Friendships`
* Table `Business`
* `Business` has n `Events`
* Table `Event`
* `Event` has n `Users` through `Invitations `
* Table `Invitations `
* JoinTable of `Event` and `User`
* Table `Friendship`
* `JoinTable` of `User` and `Friend` ClassName: User
* Table `Message`
* `JoinTable` de `Sender` ClassName: User et `Receiver` ClassName: User

##3.2. Front
Pour le front, je pense à quelque chose similaire à [Airbnb - Experience](https://www.airbnb.com/experiences/282710?currentTab=experience_tab&federatedSearchId=186da109-9c3e-47ad-9b76-2e5d2e11367e&searchId=d5fe1fd7-2385-4a70-ae15-5fb8c621be0b&sectionId=b1e04eea-596a-495f-8e72-dc5b37315400&source=p2).

##3.3. Backend
* Facebook login
* AWS (videos)

##3.4. Mes besoins techniques

* **2 fronters:** front responsive (mobile et desktop).
* **2 backers:** gestion du back à trois.

#4. Version minimaliste mais fonctionnelle

Pour l'utilisateur :

* Possibilité de s'enregistrer sur le site et de créer un profil.
* Accès au feed des événements.

Pour le professionnel :

* La possibilité de poster des photos et des vidéos.
* Un dashboard du nombre de "join" sur ses événements.

#5. Version finalisée

* Si l'utilisateur est inscrit, il peut partager les événements avec ses amis et voir s'ils participent ou non.
* Front fini avec des fonctionnalités pour rendre le site attractif (no spoil) ^^. Pour le compte Premium, active mailer pour envoyer une synthèse du nombre de "join".

#6. Notre mentor
Notre mentor est Lucien Passera.
