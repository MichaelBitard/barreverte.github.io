---
layout: post
title: ROI des tests automatiques
author:
  display_name: Florence Chabanois
tags:
- tdd
- opinion
- bonnes pratiques
categories:
- agilité
- tests
comments: true
---

L'industrie du logiciel est encore loin d'avoir systématiquement des tests automatiques. Le coût est tout de suite visible et rédhibitoire, contrairement à son gain. Personnellement, j'en fais dans mon développement car il me donne de la confiance et m'aide à construire le produit. Pourtant, certaines personnes restent hermétiques à mon enthousiasme. Entre deux réponses à un appel d'offres, un client lambda privilégiera la plus "compétitive" (= la moins chère), quitte à en payer le prix plus tard.

Les clients les plus sensibles à la cause se demandent jusqu'où il faut aller. Est-ce qu'il faut absolument tout tester? Est-ce que la valeur apportée vaut son coût ? Il y a un pallier où la qualité supplémentaire n'a plus de ROI. Je peux fabriquer des biscuits parfaitement rectangulaires mais il n'est pas dit que ma fille de dix ans apprécie le geste outre mesure. Elle ne s'en rendra probablement même pas compte. Je ne sais pas non plus apprécier un couteau damassé 32 couches avec un manche imputrescible à [350 €](http://www.couteaujaponais.com/PBSCCatalog.asp). Il n'existe pas de ressources illimitées, qu'il s'agisse de temps ou d'argent. Nous ne souhaitons pas que nos produits soient parfaits à tous les niveaux, car cela couterait trop cher. Alors, où s'arrêter ?

## Quelques pistes pour aider
###Définir l'objectif

Avant de décider si l'on est prêt à y mettre le coût, nous pouvons déjà nous recentrer sur l'objectif. On oublie temporairement les autres offres, on évite de se dire qu'on peut juste avoir moins cher ailleurs.

Alors, qu'est ce qu'on veut ?

Un produit qui fonctionne (presque) parfaitement ? Des délais tenus ? Un lancement plus tôt ? Un produit innovant ?

Les **offres annexes** nous détournent parfois de nos objectifs. Revenons au couteau de luxe : je n'ai pas l'habitude d'y mettre un budget de 300€. J'en ai plein d'autres dix fois moins chers qui remplissent mes besoins. C'est pour cette raison que le prix me parait juste exorbitant.

Paradoxalement, acheter un Monet 300€ me parait une bonne affaire.

Le couteau méga tranchant et résistant sera utilisé deux fois par jour pendant des années tandis que le tableau se fondra dans le décor de mon appartement au bout de quelques jours seulement. Finalement, j'ai peut être tort de ne pas vouloir y mettre le prix... Ne laissez pas les coûts relativement moindres de la concurrence flouter vos objectifs.


### Rendre les coûts visibles

Les organisations ont souvent des mesures toutes faites, calculées automatiquement par des outils. Il y a beaucoup de travail souterrain non visibles qu'il faut rendre visible si on veut pouvoir le mesurer. Dans une de mes missions par exemple, le temps de déboguage effectué après le passage à la validation n'était pas réimputé au temps de développement de la fonctionnalité. On n'y pensait pas alors que ce coût invisible pouvait être très important en temps.


### Mesurer les coûts annexes

Ensuite, il faut comparer des choses comparables. Avant de dire que les tests coutent trop chers, combien coutent actuellement l'absence de tests automatiques ?

Toute la difficulté est de rendre visible ces [coûts cachés](http://www.barreverte.fr/index.php?post/Formules-a-volonte).

Il y a quelques temps, lors d'une formation sur les tests, il m'a été demandé :

- combien coutent la mise en place des tests unitaires et fonctionnels ?
- comment vendre ce surcout au client ?

Je n'avais pas de réponse toute faite. J'aurai pu apprendre des chiffres par coeur, citer des exemple de grandes entreprises qui y recouraient. J'ai dit que les tests permettaient de garantir que le produit fonctionnait, simplement. Que quand un problème était corrigé, il ne réapparaitrait plus jamais. Autant vous dire que personne ne semblait très convaincu par si peu de concret.

Alors j'ai cherché leur problème.

Au fil des jours qui passaient, le problème de qualité s'avérait flagrant. Il y avait énormément de gâchis. Le plus marquant était qu'il y avait en moyenne trois renvois de fonctionnalité par le service de recette aux équipes de développement. Autrement, le client imaginait le coût suivant pour un développement :

- temps de développement + livraison intégration + recette intégrale + recette spécifique
- + livraison

Nous obtenons autre chose en mettant en lumière les coûts cachés :

- temps de développement + livraison intégration + recette intégrale + recette spécifique
- + temps de renvoi (synchronisation recette/dev)
    - + synchronisation du développement pour se remettre dans le bain
    - + temps de déboguage (x10 par rapport à un bug découvert pendant le développement, avec un facteur temps aggravant)
    - + temps de résolution
    - + livraison intégration + recette spécifique
- + temps de renvoi (synchronisation recette/dev)
    - + synchronisation du développement pour se remettre dans le bain
    - + temps de déboguage (x10 par rapport à un bug découvert pendant le développement, avec un facteur temps aggravant)
    - + temps de résolution
    - + livraison intégration + recette spécifique
- + temps de renvoi (synchronisation recette/dev)
    - + synchronisation du développement pour se remettre dans le bain
    - + temps de déboguage (x10 par rapport à un bug découvert pendant le développement, avec un facteur temps aggravant)
    - + temps de résolution
    - + livraison intégration + recette spécifique
- + livraison

La recette intégrale n'est effectuée que la toute première fois car le time to market serait beaucoup trop long s'il fallait tout recommencer.

C'est bien à la deuxième formule que le client doit comparer le coût des tests que l'on souhaite mettre en place :

- temps de développement + temps de tests + livraison intégration + recette intégrale manuelle + recette spécifique manuelle
- + livraison


## Plusieurs visions du ROI
### Une question de *scope*

Afin de commencer petit, j'avais proposé de prendre comme premier objectif d'atteindre deux allers retours maximum d'ici six mois. Le temps d'apprentissage peut être rapide mais couvrir la majorité du produit est un travail de longue haleine.

De façon générale, la question du coût est une question de scope. Avant de hurler au scandale en voyant les jours d'apprentissage nécessaires, il faut calculer le coût actuel sur un **scope intégral** : de la demande de fonctionnalité à sa maintenance en production.

Un manager m'a raconté une fois qu'une de ses équipes était assez peu portée sur les tests mais qu'au final, il ne voyait pas trop de différences en termes de nombre de bugs avec une autre, très XP et TDD. Je ne sais pas si c'était un coup de chance, si les bugs étaient aussi scrupuleusement reportés des deux côtés, s'il y avait moins d'utilisateurs, s'il aurait fallu comparer avec des mesures plus précises sur une plus longue durée ou si la valeur suffisante de qualité avait été atteinte.


### Une question de calcul

Le sens le plus classique mais pas le plus simple quand l'on parle de qualité : il suffit de mesurer le cout et de le comparer au gain.

Dans [Google Innovation Factory](http://googletesting.blogspot.com/2010/04/googles-innovation-factory-and-how.html), vous pouvez voir l'évaluation cout/gain des tests unitaires et de l'intégration continue chez google.

Cout d'un test unitaire

- écriture + maintenance

Economie

- Evitement d'un bug (en production)
- Développement plus rapide (refactoring)

Ecrire les tests avant de coder permet de réfléchir à la **conception** et aux **cas limites**. Cela permet aussi de s'assurer que notre code fonctionne comme on s'y attend très **rapidement et très tôt**, sans avoir à lancer une application entière. En cas de problème, la présence de tests permet d'éliminer et/ou de valider des hypothèses concernant les causes des **bugs**.

Il ne reste "plus" qu'à chiffrer tout cela sur une période et comparer le avant/après. Le calcul a été effectué concernant les builds automatiques et les tests :

Activités d'un ingénieur en un mois

- 2 = Checkout initial
- 10 = Nettoyage de Build
- 170 = Build après modification
- 60 = Build après synchronisation
- 60 = Lancement de tests

Je vous laisse devenir le temps gagné à l'installation d'un serveur de build automatique.

### Une question de balance

Au quotidien, je fais un test unitaire avant de coder, pour savoir **tout de suite** si ce que je fais "fonctionne". Je me pose plus de questions sur les tests fonctionnels par contre, qui sont plus couteux à mettre en place et qui n'ont pas tous la même valeur. Concrètement, si le client est prêt à accepter que tel dysfonctionnement arrive sans que l'on soit prévenu, je ne fais pas de test automatique. Je ne fais pas non plus de tests pour les fonctionnalités dont le client n'est pas sur ou n'a pas conscience.

Les [tests fonctionnels](http://jamesshore.com/Blog/The-Problems-With-Acceptance-Testing.html) font [débat](http://ericlefevre.net/wordpress/2009/03/06/is-fit-dead-a-debate-on-twitter) régulèrement du fait de leur surcoût. Les tests [IHM](http://blog.objectmentor.com/articles/2009/09/29/ruining-your-test-automation-strategy) font encore moins l'unanimité. Très emballés au début, nous en sommes vites revenus car trop difficiles à maintenir.

### Une question de feeling

Je ne peux pas calculer le ROI de l'achat du dernier Radiohead, mais je peux vous assurer qu'il valait le coût et m'a apporté ce que j'en attendais. Pour les tests aussi, il y a des ROI qualitatifs difficiles à chiffrer.

Ils donnent de l'assurance et permet de savoir où l'on va, petit à petit. Il m'évite aussi d'avoir à tester dix fois la même chose à la main, et ça, ça joue sur mon humeur. Cela a peu de prix.

C'était un peu cher au début, un peu comme un bon couteau, mais une fois qu'on y a gouté, on a du mal à s'en passer.
