---
layout: post
title: Le bagot du jour de l'an ou l'assert laxe
author:
  display_name: Bruno Thomas
tags:
- heros du bagot
- python
categories:
- tests
---
Le 2 janvier est propice à la chasse au bagot : il est fréquent de rentrer encore un peu barbouillé des fêtes de fin d'années et d'être accueilli par une intégration continue rouge. Tests qui ne fonctionnent qu'en année bissextile, année codée en dur, numéro de mois qui va de 0 à 11, toutes les raisons sont bonnes.

Cela m'est arrivé une nouvelle fois vendredi dernier. En regardant l'historique des réussites/échecs des tests d'acceptance, j'en vois un qui bagote beaucoup depuis le 1er janvier. Il se trouve que ce test est déjà repéré dans notre liste de bagots non résolus, mais la fréquence m'interpelle.

C'est le test d'un export de statistique en fichier CSV. Sélénium entre une date début et une date fin dans les champs d'un formulaire et clique sur le bouton exporter. La fixture [lettuce](http://lettuce.it/) va chercher le fichier dans /tmp, le lit et compare le contenu avec les valeurs attendues. Je suis le code :

{% gist bamthomas/b9213bd712d85aa4f3f6 %}

OK, la ligne attendue est la suivante :

````
{'event': 'login', 'user': 'foo', 'max_chats': 4}
````

et le fichier contient :

````
date,queue,event,user,max_chats
...
02-01-2015T02:12:43,,login,foo,3
...
````

Donc d'après le code, je prends chaque ligne, du fichier et si toutes les **valeurs** attendues ('login', 'foo', 4) sont **contenues** dans une des lignes du fichier CSV alors le test de cette ligne est vert. *WTF ??*

Il se trouve que nous avions passé le nombre de chats maximum de 4 à 3 pour les tests d'acceptance. Ce test devrait être toujours rouge alors. Ouéééé !! Comme il y a un 4 dans 2014 le test était toujours vert *l'année dernière*, mais pour 2015, il suffit qu'il n'y ait pas de 4 dans la date ou l'heure et il passe rouge.

Morale de l'histoire, attention aux assertions trop laxes, de temps en temps cela peut donner des résultats étonnants. Quand j'ai ajouté des TU's et que j'ai relancé les tests d'acceptance, plusieurs d'entre eux sont passés rouge. Toujours ;)
