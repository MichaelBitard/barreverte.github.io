---
layout: post
title: MongoDb le cluster qui bagote
author:
  display_name: Philippe Blayo
tags:
- cluster
- logs
- MongoDb
- tests
categories:
- agilité
- NoSQL
- tests
comments: true
---

<img class="left" alt="Mug MongoDB" src="/images/mongoDb_mug.jpeg"></img>
Un soir, un développeur lâche en partant : « MongoDb c’est de la merde. Leur réplication ça marche pas. Je parie qu’on a aussi le bug en prod. Pour un peu j’en jetterais ma tasse mongo par la fenêtre. »

Son binôme me confie qu’ils ont travaillé toute l’après-midi sur un test écrit récemment et qui s’avère instable : l’information disparaît entre 2 requêtes. La première remonte une liste de conversations et quand selenium en sélectionne une, elle a disparu de la base !

<br style="clear: both;"/>
<img class="center" alt="w=3" src="/images/mongoDb_2requetes1.jpg"></img>

C’est comme si l’une des requêtes lisait sur le serveur primaire et l’autre sur le secondaire, avant que la réplication ne soit achevée entre les deux.

# Premier réflexe : Stackoverflow

<img class="left" alt="Logo stackoverflow" src="/images/stackoverflow.png"></img>

Sur stackoverflow plusieurs questions concernent des problèmes de réplication, avec à chaque fois la même réponse : le nombre de réplica est positionné par défaut à 0 en version 2.4 (écriture asynchrone), il faut augmenter ce paramètre ou bien passer en version 2.6 (dans laquelle il vaut 1 par défaut)

Notre nombre de réplica est pourtant bien positionné à 2 (paramètre w=2 dans le driver mongo) ce qui correspond aux deux machines du cluster. Pour s’en assurer nous passons même ce nombre à 3.

<img alt="w=3" src="/images/mongo_w_3.jpg" width="800px"></img>

Avec w=3 mongo reste bloqué : il tente de répliquer l’écriture sur une 3ème machine qui n’existe pas et ne rends donc jamais la main.

<img class="left" alt="Logo wireshark" src="/images/wireshark_logo.jpeg"></img>

Un troisième développeur observe avec wireshark le traffic qui parvient à mongo et voit bien passer les deux requêtes de lecture.

# Deuxième réflexe : les logs

<img class="right" alt="Logo Mongo" src="/images/mongoDb_logo.jpeg"></img>

Pour aller plus loin, nous cherchons à voir les requêtes dans les logs mongo eux-mêmes en augmentant le niveau de debug :

- 0 ne montre aucune requête
- 1 montre les requêtes lentes
- 2 montre toutes les requêtes

Après plusieurs heures passées à affiner notre compréhension de ces logs, nous revenons à la case départ : les requêtes sont les mêmes pour les tests qui réussissent et pour ceux qui échouent. Le Mystère reste entier.

Nous pensons être mûr pour exposer notre cas sur stackoverflow, mais pour devancer les objections des experts, nous choisissons d’abords de valider de manière irréfutable que le clustering mongoDb est en cause. Nous désactivons le mode cluster et lançons le test sur un seul et unique serveur. Il réussit onze fois d’affilée. En mode cluster, il échoue une fois sur 3 :

<img class="center" alt="mongo: 11 reussites" src="/images/mongoDb_11_reussites1.jpg"></img>

Ce soir-là, nous quittons le travail avec une certitude : le problème vient bien du cluster. Nous verrons dans les prochains articles à quel point nous avions tord.
