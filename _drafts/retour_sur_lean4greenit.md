---
layout: post
title: Retour sur l'éco-conception et le dev
author:
  display_name: Bruno Thomas
tags:
- greenIT
comments: true
---

Il y a un an environ, j'ai débuté [un projet d'entreprise](https://classe.io) avec deux amis associés. Ils voulaient intégrer une démarche éco-responsable dans la construction d'un service en ligne pour classer ses mails dans des dossiers dématérialisés. Comme j'adhère au principe de l'écologie sans m'y être intéressé (concernant l'IT), j'ai tenté

1. de l'appliquer pour l'architecture du site,
2. de me renseigner sur l'éco-conception logicielle

Pour faire court, dans mes recherches sur ce domaine je n'ai pas trouvé grand chose. Je me suis demandé :

> L'éco-conception est-elle un sujet pour le développement logiciel ?

Pour tenter d'apporter des éléments de réponse à cette question, j'ai proposé un sujet à l'[Agile Open France](http://agileopenfrance.com/) et présenté une session au [Lean IT Summit](http://www.lean-it-summit.com/7178-bruno-thomas). Je fais un petit pas de côté pour voir ce que j'en ai retiré. Je le partage ici avec vous, n'hésitez pas à participer.

## Eco-truc, greenIT wot ?

GreenIT, éco-reponsabilité des services informatiques, éco-conception, ["conception responsable des services numériques"](https://collectif.greenit.fr/), j'ai compris que derrière ces termes se cachaient deux aspects :

1. prendre conscience que les services numériques ont un impact sur l'environnement, d'autant plus que, comme internet, les enjeux environnementaux sont globaux. Il y a une certaine congruence entre les deux ;
2. adopter une approche de rationalisation de l'usage des infrastructures informatiques, en intégrant une réflexion dès la conception des logiciels

Cette démarche est complexe car elle n'est pas uniquement liée à l'exploitation des machines (par exemple la consommation électrique des centres d'hébergement), mais elle doit englober tout le cycle de vie des matériaux utilisé par les utilisateurs et exploitants d'un service :

![Cycle de vie produit]({{ site.url }}/images/ecoconception/product_lifecycle.jpg)

## du point de vue dev : c'est de l'optimisation

Lors de l'Agile Open, j'ai été déçu que mon sujet n'ait pas attiré grand monde : nous étions au plus 5. Pour ceux qui ne connaissent pas l'événement, il y a beaucoup d'indépendants, *coaches* et *software craftmen* passionnés. C'est précisément ce qui m'intéressait, l'avis d'experts du développement. Mais le peu de personnes "votant avec leur pieds" pour l'éco-conception était déjà un enseignement, et grâce aux personnes qui sont venues échanger sur le sujet (merci à elles), j'ai pu comprendre pourquoi.

> "c'est un problème d'optimisation"

Effectivement, c'est un soucis d'efficacité. Et ce problème est souvent abordé par nécessité économique. Lorsque vous faites en sorte d'utiliser 5 serveurs au lieu de 20 pour le même nombre d'utilisateurs, afin de baisser les coûts d'exploitation de votre service, vous faites de l'éco-conception.

On retrouve la proximité entre les termes **éco-nomique** (de "*[Oikos](https://fr.wikipedia.org/wiki/Oikos)*" la maison, "*[nomos](https://fr.wiktionary.org/wiki/nomos)*" l'administration) et **éco-logique** ("*[logos](https://fr.wikipedia.org/wiki/Logos)*" le récit). Ce n'est pas toujours le cas, mais en informatique, l'amélioration des performances économiques va de paire avec celle des performances écologiques.

Un bon *craftman*, artisant logiciel, gardera toujours en tête l'efficacité des programmes qu'il développe, sans en faire une priorité.

> "L'optimisation prématurée est la racine de tous les maux" -- [Donald Knuth](http://wiki.c2.com/?PrematureOptimization)

Car de l'autre côté, si on considère non plus l'efficacité de l'exploitation des programmes sur les serveurs, mais l'efficacité du développement et de la maintenance de ces programmes, l'optimisation coûte, et peut même coûter très cher. Souvent l'optimisation du code d'un programme est antinomique avec sa lisibilité et sa testabilité : l'amélioration du temps de traitement d'un programme par la machine demandera à l'humain plus d'efforts pour le comprendre. Essayez de lire de l'assembleur, ou du bytecode. Essayez également de poser des tests unitaires sur du code Java principalement statique.

Donc plus le code est optimisé, plus il sera cher à élaborer et à maintenir.

## Optimisation certes, et aussi

### des choix technologiques

En tant que développeur, on peut améliorer son code pour consommer moins de CPU, de mémoire et de réseau. C'est vrai pour un environnement donné mais qu'en est-il de l'impact sur la consommation d'énergie d'un serveur d'application en PHP, Java, python, nodeJS, ruby, etc. ?

[Un article](https://hal.inria.fr/hal-00681560v3/document) du CNRS à propos de la "[réduction de consommation énergétique des logiciels](http://www.cnrs.fr/ins2i/spip.php?article2365)" traite des différences entre plusieurs langages. En [mesurant la consommation électrique](http://powerapi.org/) d'un programme de résolution du problème de la tour de Hanoï écrit en différents langages, ils ont mis en évidence que :

> Pour une même application, un langage interprété comme Python consomme 100 fois plus qu’un langage compilé comme Java. (...) pour les langages compilés orientés objets, Java consomme moins que du C++ avec les options par défaut et autant en niveau d'optimisation O3.

Ces différences sont liées à la nature du programme utilisant quasiment exclusivement le CPU, plutôt que les entrées/sorties. Un serveur d'application faisant du web en architecture 3 tiers, sera plutôt lié aux entrées/sorties réseau. Mais ce que montre l'article, c'est que l'environnement technologique aura des conséquences importantes sur la puissance consommée par les serveurs.

La programmation asynchrone avec l'utilisation des "light threads"



### obsolescence programmée
