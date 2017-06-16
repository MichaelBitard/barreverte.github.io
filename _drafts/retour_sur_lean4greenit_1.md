---
layout: post
title: L'écoconception, qu'est-ce que c'est ?
author:
  display_name: Bruno Thomas
tags:
- greenIT
comments: true
---

Il y a un an environ, j'ai débuté [un projet d'entreprise](https://classe.io) avec deux amis associés. Ils voulaient intégrer une démarche éco-responsable dans la construction d'un service en ligne pour classer ses mails dans des dossiers dématérialisés. Comme je ne suis pas réfractaire au principe de l'écologie, et que je n'en avait presque pas entendu parler pour l'IT, j'ai essayé de me renseigner sur l'écoconception logicielle et de l'appliquer pour l'architecture du site.

Pour faire court, dans mes recherches sur ce domaine je n'ai pas trouvé grand chose. Je me suis demandé :

> L'écoconception est-elle un sujet pour le développement logiciel ?

Afin d'apporter des éléments de réponse à cette question, j'ai proposé un sujet à l'[Agile Open France](http://agileopenfrance.com/) et présenté une session au [Lean IT Summit](http://www.lean-it-summit.com/7178-bruno-thomas). Je fais un petit pas de côté pour voir ce que j'en ai retiré. Je le partage ici avec vous, n'hésitez pas à participer.

## Eco-truc, greenIT wot ?

GreenIT, éco-reponsabilité des services informatiques, écoconception, ["conception responsable des services numériques"](https://collectif.greenit.fr/), j'ai compris que derrière ces termes se cachaient deux aspects :

1. prendre conscience que les services numériques ont un impact sur l'environnement, d'autant plus que les enjeux environnementaux sont globaux, comme internet. Il y a une certaine congruence entre les deux ;
2. adopter une approche de rationalisation de l'usage des infrastructures informatiques, en intégrant une réflexion dès la conception des logiciels et du matériel

Cette démarche est complexe car elle n'est pas uniquement liée à l'exploitation des machines (par exemple la consommation électrique des centres d'hébergement), mais elle doit englober tout le cycle de vie des produits :

![Cycle de vie produit]({{ site.url }}/images/ecoconception/product_lifecycle.png)

En regardant l'ensemble du cycle pour les produits manufacturés impliqués dans la mise en oeuvre et l'utilisation d'un service en ligne, nous réalisons l'étendue de l'impacts des technologies de l'information : production, acheminement, utilisation, recyclage des mobiles, serveurs, routeurs, ordinateurs portables, ordinateurs fixes, tablettes, switches, répéteurs, antennes, cables, fibre optique, climatiseurs, onduleurs, etc.

> "OK, ça représente 2% des émissions de CO2, occupons-nous des 98%"

Oui mais ces 2% ne représentent que l'exploitation des infrastructures du web et cette statistique est statique.
 
La production de ces produits électroniques nécessite des matières premières non renouvelables et pour certaines en voie d'épuisement. L'OCDE [donne encore 30 ans d'exploitation](http://www.statistiques.developpement-durable.gouv.fr/fileadmin/documents/Produits_editoriaux/Publications/Etudes_et_documents/2009/etudes_documentsN6_02.pdf) pour le cuivre, plomb, nickel, argent, étain, zinc. Cette production dégage également des déchets environnementaux et des gaz à effet de serre. 

Le recyclage est une gageure car de plus en plus de matières sont employées pour la miniaturisation, et beaucoup sont toxiques : mercure, cadnium, chrome, diphényls polybromés, PVC, baryum, beryllium, phosphore, etc. Pour certaines de ces matières, ce ne sont pas des quantités négligeables : en 2000 les équipements électroniques et informatiques utilisaient 22% de la consommation annuelle de mercure [1]. Par ailleurs, ces matières se retrouvent souvent traitées dans des pays en voie de développement dans des conditions plus que précaires.

Enfin, nous émettons des gaz à effet de serre par le biais de ces produits tout au long de leur cycle de vie. L'empreinte carbone des infrastructures du web était de 0,91 Giga tonnes d'équivalent CO2 (1,9% de l'empreinte mondiale) en 2011. le [Boston Consulting Group prévoit](http://gesi.org/assets/js/lib/tinymce/jscripts/tiny_mce/plugins/ajaxfilemanager/uploaded/SMARTer%202020%20-%20The%20Role%20of%20ICT%20in%20Driving%20a%20Sustainable%20Future%20-%20December%202012.pdf) qu'elle sera de 1,27 Giga tonnes en 2020 (2,3% du global) soit une augmentation de près de 40% en 9 ans. Dans le rapport ci-dessus, il est expliqué (p22) que ces projections ne prennent pas en compte les impacts incertains du recyclage. Je n'y ai pas trouvé non plus de références à l'explosion des objets connectés qui vont passer de 15 milliards en 2014 à 50 milliards en 2020.

Alors que les constructeurs d'infrastructures (centre serveurs, réseaux mobiles, réseau mondial) ont déjà pris des mesures pour améliorer leur efficacité écologique (en général pour des raisons économiques), le monde du logiciel ne semble pas beaucoup concerné.

Pourtant à la lumière de ces cycles de vie, en tant que développeur je m'aperçois que mes décisions techniques ne sont pas neutres : quelles sont les conséquences pour les internautes si je choisis d'utiliser une présentation "flexbox" ? Quelle va être la différence de consommation du serveur si je fais du polling toutes les secondes sur une valeur ? Que se passe-t-il si le navigateur de l'internaute n'exécute pas le javascript ? Quelle est la différence en performance et en consommation si je fais un service multithreadé ou asynchrone ? Quelle va être la part de charge et consommation si mon service est gratuit, et que je fais du big data/intelligence artificielle pour vendre de la publicité de manière profitable ? Quelle différence si je fais du payant sans exploitation de données ? Quelle part du framework *lambda* j'utilise ? Puis-je m'en passer ?

Bref, si je souhaite participer à l'efficacité écologique, cela implique :

* une réflexion sur mon service et son modèle économique
* une sobriété du nombre de fonctions implémentées
* une simplicité de développement du code informatique
* des choix technologiques adaptés
* la lutte contre l'obsolescence programmée des versions logicielles

et concerne bien plus que le périmètre des équipes de développement. Cependant, ces dernières peuvent apporter leurs éclairages techniques sur la manière dont les machines vont exécuter leur code.

Nous continuerons cet article avec un focus plus précis sur le développement logiciel.

1: la face cachée du numérique - Fabrice Flipo, Michelle Dobré et Marion Michot