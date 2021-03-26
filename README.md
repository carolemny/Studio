# Projet Final: STUDIO

Le premier Airbnb artistique : Location d'espaces dédiés à la création artistique, entre particuliers.

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

## Présentation du projet

L’idée est de mettre en relation des **artistes amateurs** à la recherche d’un **espace de création**, avec des particuliers disposant d’un local adapté, moyennant une rémunération. Les disciplines artistiques visées sont variées : peinture, sculpture, danse, musique, photographie …

STUDIO est un projet ayant pour but de **valoriser et développer les pratiques artistiques** en mettant à disposition des lieux adaptés. Nous voulons connecter les artistes avec des amateurs d’Art pour former une **communauté** réunie autour d’une même passion.

## Schéma de la base de données

[![DATABASE-STUDIO.jpg](https://i.postimg.cc/T3f6ZTTH/DATABASE-STUDIO.jpg)](https://postimg.cc/7fsdz8Gg)

## Versions utilisées 

* Ruby: 2.7.1
* Rails: 5.2.4

## Lien du site en production

[STUDIO](https://studiofinalproject.herokuapp.com/)

## Lien du Kit UI

[Kit UI STUDIO](https://m-tessier.github.io/Kit-UI-STUDIO/)

## La version finale

Ce que contient la **version finale** :

* Système d’authentification
* Landing page
* Base de données
* Barre de recherche fonctionnelle avec auto-complétion
* Localisation des espaces sur une carte (API Leaflet)
* Réservation d'un espace et paiement (API Stripe)
* Mailing automatique (API Mailjet)
* Messagerie 
* Commentaires

## Détail des fonctionnalités

**Barre de recherche**

* Possibilité de filtrer par catégorie et/ou par localisation
* Auto-complétion pour la ville.
* Affichage des espaces correspondant en fonction de leur adresse sur la Map à droite.

**Réserver un espace**

* Le calendrier affiche les disponibilités.
* Choisir les dates d'arrivée et de départ.
* Affichage du total en fonction du prix et du nombre de journées choisies
* Le bouton "Réserver" conduit ensuite sur la page paiement.

**Messagerie**

* Le paiement de la réservation entraîne un message automatique de l'hôte et créée une conversation avec l'utilisateur.
* L'utilisateur peut ensuite échanger avec l'hôte par messages.

**Commentaires** 

* Pour ajouter des commentaires, un utilisateur doit avoir effectué une réservation pour cet espace.

**Mailer**

* Envoi d'un mail de bienvenue à l'inscription
* Envoi d'un mail de confirmation de réservation
* Demande de contact: envoi d'un mail à l'adresse team.studio.thp@gmail.com avec les coordonnées et la demande de l'utilisateur.

## Lancement du site en local

```
git clone git@github.com:carolemny/studio.git
cd studio
bundle install
```

**Database**

```
rails db:create
rails db:migrate
rails db:seed
```

**Lancer le serveur**

`rails server`

Puis aller sur : http://localhost:3000/

## L'équipe

* **Erwann Le Noac'h** _alias_ [@erwannlenoach](https://github.com/erwannlenoach)
* **Carole Meney** _alias_ [@carolemny](https://github.com/carolemny)
* **Morgane Tessier** _alias_ [@m-tessier](https://github.com/m-tessier)
* **Florence Perez** _alias_ [@flores34000](https://github.com/flores34000)
* **Perrine Toubeau** _alias_ [@perrine1611](https://github.com/perrine1611)

### Notre mentor : Luca Montaigut _alias_ [@luca-montaigut](https://github.com/luca-montaigut)