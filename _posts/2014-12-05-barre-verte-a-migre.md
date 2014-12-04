---
layout: post
title: Barre Verte a migré
author:
  display_name: Jean-Philippe Caruana
tags:
- blog
- wordpress
- jekyll
- github
categories:
- blog
---

Nous venons de terminer la migration de [Barre Verte](http://www.barreverte.fr) : auparavant, nous nous hébergions nous-mêmes sous [Wordpress](https://fr.wordpress.org/) chez [Gandi](https://www.gandi.net/), désormais, nous utilisons [Jekyll](http://jekyllrb.com/) hébergé (gratuitement) par [Github](https://github.com/).

Si vous êtes abonné à notre [flux RSS](http://www.barreverte.fr/feed), peut-être a-t-il été republié en intégralité : nous nous excusons pour cette gêne, mais c'est un effet de bord du passage à Jekyll.

Ce que nous y gagnons :

- simplicité (une des valeurs cardinale de l'Extreme Programming)
- uniquenement statique (donc plus léger, hébergeable partout, git-able)
- plus besoin de payer un serveur
- plus de soucis avec la base MySQL qui tombait régulièrement, ce qui rendait Barre Verte inaccessible (avec une vilaine page d'erreur). C'était devenu à un tel point que nous avions mis en place un *cron* pour redémarrer MySQL toutes les nuits... Notre hypothèse la plus forte était que cela venait du plugin [StatsPress](https://wordpress.org/plugins/statpress/) qui nous permettait d'avoir des tas d'informations comme dans Google Analytics, mais en moins bien et en faisant tomber le service...
- pour corriger une faute d'orthographe, vous pouvez forker le blog et nous proposer une *[pull request](https://help.github.com/articles/using-pull-requests/)*

Au passage, nous avons entièrement revu et modernisé notre thème qui commençait à accuser son âge (5 ans !)...

Dans un très prochain article, nous verrons comment cette migration s'est opérée : ainsi, vous pourrez peut-être en faire autant, qui sait ?
