---
layout: post
title: Astuce - lancer un conteneur docker comme un service système
author:
  display_name: Jean-Philippe Caruana
tags:
- docker
- systemd
- linux
- admin
categories:
- astuces
comments: true
---

*Je ne vais pas ici vous faire une introduction à [docker](https://www.docker.com/), ce n'est pas l'objet de ce post.*

Je trouve personnellement `docker` très pratique en particulier pour essayer des logiciels dans des versions différentes (par exemple la base de données dans sa toute nouvelle version avant de la déployer en production) et de pouvoir revenir en arrière en cas de pépin. Le tout sans casser son système d'exploitation. Par contre, au début, je me suis souvent fait mordre par l'espace disque. J'ai ainsi appris dans la douleur l'option `-v` (comme _volumes_) de la commande `docker rm` (je vous invite à consulter la [documentation](https://docs.docker.com/reference/commandline/rm/)) pour tout nettoyer à la suppression d'un conteneur.

En revanche, cela m'embêtait de plus en plus de devoir démarrer à la main les conteneurs dont j'ai besoin, d'oublier de les arrêter quand j'éteinds ma machine, etc. J'ai donc voulu me plonger un peu dans [systemd](http://freedesktop.org/wiki/Software/systemd/) qui vient désormais en standard dans les dernières version d'Ubuntu, et j'ai été ébloui par sa simplicité de mise en oeuvre.

Dans cette page, nous allons prendre l'exemple de la dernière version (à ce jour) de MongoDB : la 3.0.6.

Une fois votre image `mongo` installée (avec la commande `docker pull mongo:3.0.6`) en local, voici le fichier `mongo.service` que je vous invite à copier dans `/etc/systemd/system/mongo.service` :

````
[Unit]
Description=Mongo container
Requires=docker.service
After=docker.service

[Service]
ExecStart=/usr/bin/docker run -p 27017:27017 --name mongo mongo:3.0.6 --storageEngine wiredTiger
ExecStartPost=/bin/sleep 1

ExecStop=/usr/bin/docker stop mongo
ExecStopPost=/usr/bin/docker rm -v mongo

[Install]
WantedBy=multi-user.target
````

Cela démarre l'impage mongo en version 3.0.6, fait corresspondre le port 27017 du conteneur sur le même port de ma machine, et lance mongo avec le nouveau moteur Wired Tiger. Ensuite, à l'arrêt du service, le conteneur est entièrement détruit.

Pour démarrer le service, 2 options : 

- `sudo service mongo start`
- `sudo systemctl start mongo.service`

(pour l'arrêter... c'est la même chose mais avec la commande `stop` bien sûr).

Enfin, pour lancer ce mongo au démarrage de votre machine, il faut lui dire ceci :

````
sudo systemctl enable mongo.service
````

Voilà ! Rien de plus simple comme on peut le voir. Je vous laisse pour exercice la conversion pour un MySQL, un redis ou un Cassandra...
