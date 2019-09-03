---
layout: post
title: Utiliser docker-compose avec le réseau docker
author:
  display_name: Bruno Thomas
tags:
- devops
- docker
categories:
- linux
comments: true
---

Depuis la version 1.6 de [docker-compose](https://docs.docker.com/compose/) et la version 1.10 de [docker](https://docs.docker.com/), une gestion nouvelle du réseau dans les conteneurs docker a été implémentée. Quand vous avez des dépendances entre plusieurs conteneurs, plus besoin de faire des liens (*links*) entre eux. Pour les environnements de dévelopement c'est très pratique, notamment pour le problème des liens bidirectionnels.

Il y a peu, sur mon projet, nous avions un docker-compose (v1) qui mettait en concert un environnement de dev, un front nginx, un backend python/pyramid, et une base de données postgresql. Pour qu'un container puisse en voir un autre, il fallait déclarer un lien de A -> B. Dans ce cas, docker met à jour le fichier `/etc/hosts` de la machine A qui contient l'ip de la machine B avec son nom d'hôte.

````
dev:
  image: dev
  hostname: docker_dev
  volumes:
    - /tmp/.X11-unix:/tmp/.X11-unix:rw
    - /usr/bin/docker:/bin/docker:rw
    - /var/run/docker.sock:/run/docker.sock:rw
    - ${SSH_AUTH_SOCK}:/ssh-agent
  environment:
    - DISPLAY=${DISPLAY}
    - SSH_AUTH_SOCK=/ssh-agent
  links:
    - backend
    - postgresql
    - nginx

nginx:
  build: nginx
  hostname: frontend
  ports:
    - "80:80"
    - "443:443"
  links:
    - backend

backend:
  build: myback
  hostname: myback
  volumes:
    - ${PRJ_HOME}/deploy_local/conf:/home/dev/conf
    - ${PRJ_HOME}/deploy_local/dist:/home/dev/dist
  ports:
    - "5000:5000"
    - "8000:8000"
  links:
    - postgresql

postgresql:
  build: postgresql
  ports:
    - "5432:5432"

````

Ce qui donne graphiquement :

![docker compose](/images/docker-compose.jpg)

Nous avons du ajouter une fonction d'envoi de mails à notre backend. Pour nos tests d'acceptances nous avons implémenté un petit stub SMTP qui écoute sur le port 1125 et permet de vérifier que les mails sont bien envoyés.

***Problème*** : ces tests tournent sur le container de dev qui est lié au container backend (pour pouvoir s'y connecter, faire des vérifications, du débogage), et du coup nous ne pouvons pas faire le lien inverse :

![docker compose erreur](/images/docker-compose2.jpg)

C'est là que la nouvelle version avec résolution de nom de docker va nous aider. Nous mettons à jour notre packet docker 1.9 -> 1.12 et réinstallons l'exécutable docker-compose 1.5 -> 1.8. Il nous faut modifier notre fichier `docker-compose.yaml` :

Les changements consistent :

* à déclarer la version 2 en début de fichier
* à ajouter un niveau de déclaration avec la liste des services
* à supprimer les liens

````
version: '2'
services:
  dev:
    image: dev
    hostname: docker_dev
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix:rw
      - /usr/bin/docker:/bin/docker:rw
      - /var/run/docker.sock:/run/docker.sock:rw
      - ${SSH_AUTH_SOCK}:/ssh-agent
    environment:
      - DISPLAY=${DISPLAY}
      - SSH_AUTH_SOCK=/ssh-agent

  nginx:
    build: nginx
    hostname: frontend
    ports:
      - "80:80"
      - "443:443"

  backend:
    build: myback
    hostname: myback
    volumes:
      - ${PRJ_HOME}/deploy_local/conf:/home/dev/conf
      - ${PRJ_HOME}/deploy_local/dist:/home/dev/dist
    ports:
      - "5000:5000"
      - "8000:8000"

  postgresql:
    build: postgresql
    ports:
      - "5432:5432"
````

Si vous êtes dans un répertoire qui s'appelle `monprojet`, docker compose va créer un réseau qui s'appelle `monprojet`. Et puis il va créer les containers indiqués dans le fichier, et les ajouter à ce réseau avec le nom d'hôte du service (ici `dev`, `nginx`, `backend`, `postgresql`).

Vous pouvez visualiser les réseau docker en faisant :

````
$ docker network ls

NETWORK ID          NAME                DRIVER            SCOPE
5b73c8bb1f51        bridge              bridge            local
32ef6f695144        monprojet_default   bridge            local
eb9941273761        host                host              local
c4193ae576fb        none                null              local
````

Le réseau `bridge` est le réseau par défaut de docker, celui que vous voyez sous l'interface docker0 si vous faites un `ifconfig`. Vous pouvez ensuite obtenir plus de précisions en faisant `docker network inspect monprojet_default`. Vous aurez les machines rattachées à ce réseau, leurs IP's, la passerelle, etc.

Mais revenons à notre projet. Lorsque dans mon container de dev je lançais un navigateur pointant sur https://frontend j'avais la page d'accueil de mon site. Maitenant, la page se trouve sur https://nginx. Je peux changer le nom de service en `frontend`. Mais si je souhaite conserver le nom de service nginx, je peux toujours utiliser la directive `link` en précisant un alias dans le container `dev` :

````
dev:
  image: dev
  hostname: docker_dev
  ...
  links:
    - nginx:frontend
````

A présent, le host `frontend` sera résolu de la même manière que `nginx` et je retrouve mes tests d'acceptance verts. Avec cette fois la possibilité de pointer de mon backend vers dev:1125 pour mon serveur SMTP.

**Le bonus** : avant si vous modifiiez un container autre que celui de dev, lorsque vous le redémarriez avec docker-compose, comme dev était lié à ce container, il redémarrait dev aussi. Avec le mécanisme du réseau, ce n'est plus nécessaire.

Bien sûr, si vous lancez un docker compose avec un autre nom de projet, il va vous faire un nouveau réseau, et du coup vos deux environnements seront étanches :

````
$ docker-compose -p prj2 up
Creating network "prj2_default" with the default driver
...
Creating prj2_dev_1
Creating prj2_nginx_1
Creating prj2_backend_1
Creating prj2_postgresql_1
$ docker network ls

NETWORK ID          NAME                DRIVER            SCOPE
5b73c8bb1f51        bridge              bridge            local
32ef6f695144        monprojet_default   bridge            local
eb9941273761        host                host              local
c4193ae576fb        none                null              local
e20d13fe2b5c        prj2_default        bridge            local
````

Il est possible ensuite de ne pas utiliser le réseau par défaut et définir ses propres réseaux, de paramétrer ses réseaux (passerelle, driver), les possibilités sont très larges. Pour plus d’infos sur le fonctionnement du réseau docker, je vous invite à vous reporter à [la documentation chez
docker](https://docs.docker.com/engine/userguide/networking/)
