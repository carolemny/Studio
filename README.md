# Projet Final: STUDIO

Le premier Airbnb artistique : Location d'espaces dédiés à la création artistique, entre particuliers.

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

## Présentation du projet

L’idée est de mettre en relation des **artistes amateurs** à la recherche d’un **espace de création**, avec des particuliers disposant d’un local adapté, moyennant une rémunération. Les disciplines artistiques visées sont variées : peinture, sculpture, danse, musique, photographie …

STUDIO est un projet ayant pour but de **valoriser et développer les pratiques artistiques** en mettant à disposition des lieux adaptés. Nous voulons connecter les artistes avec des amateurs d’Art pour former une **communauté** réunie autour d’une même passion.

## Schéma de la base de données

[![db-studio.jpg](https://i.postimg.cc/qvNyzBZV/db-studio.jpg)](https://postimg.cc/HrCVNmgB)

## Versions utilisées 

* Ruby: 2.7.1
* Rails: 5.2.4

## La version minimaliste mais fonctionnelle

Ce que contient le **Minimum Viable Product** :

* Système d’authentification
* Landing page
* Base de données
* Barre de recherche fonctionnelle
* Mailing automatique

## Lien du site en production

[STUDIO](https://studiofinalproject.herokuapp.com/)

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