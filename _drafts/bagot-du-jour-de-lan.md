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

C'est le test d'un export de statistique en fichier CSV. [Sélénium](http://www.seleniumhq.org/) entre une date début et une date fin dans les champs d'un formulaire et clique sur le bouton exporter. Je suis le fil du code et j'arrive ici :

{% gist bamthomas/b9213bd712d85aa4f3f6 %}

OK, la ligne attendue (la variable `expected_line_dict` ci-dessus) est la suivante :

````
{'event': 'login', 'user': 'foo', 'parametre_metier': 4}
````

et le fichier contient :

````
date,queue,event,user,parametre_metier
...
02-01-2015T02:12:43,,login,foo,3
...
````

Donc d'après le code, je prends chaque ligne du fichier. Si toutes les **valeurs** attendues ('login', 'foo', 4) sont **contenues** quelque part dans une ligne du fichier CSV alors le test de cette ligne est vert. *WTF ??*

Nous avions passé le `parametre_metier` de 4 à 3 pour tous les tests d'acceptance il y a quelques mois. La modification de ce paramètre n'a donc pas été reportée dans les valeurs attendues. Ce test devrait être rouge ! Mais qu'est-ce que... Ouéééé !! Comme il y a un 4 dans 2014 le test était toujours vert *l'année dernière*, mais pour 2015, il suffit qu'il n'y ait pas de 4 dans la date ou l'heure et il passe rouge.

Morale de l'histoire, attention aux assertions trop laxes, cela peut donner des résultats étonnants. Et encore c'est un euphémisme, car on le voit ici, c'est de la perte de temps, et aussi de confiance dans le harnais de test. Après avoir ajouté des tests unitaires montrant les deux erreurs (pas de vérification par champ et inclusion de valeur) j'ai relancé les tests d'acceptance : plusieurs d'entre eux sont passés rouge. *Toujours* ;)
