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
---

Nous venons de terminer la migration de Barre Verte : auparavant, nous nous hébergions nous-mêmes sous Wordpress chez Online.net, désormais, nous utilisons Jekyll hébergé (gratuitement) par Github.

Si vous êtes abonné à notre flux RSS, peut-être a-t-il été republié en intégralité : nous nous excusons pour cette gêne, mais c'est un effet de bord du passage à Jekyll.

Ce que nous y gagnons :

- simplicité (une des valeurs cardinale de l'Extreme Programming)
- uniquenement statique (donc plus léger, hébergeable partout, git-able)
- plus besoin de payer un serveur
- plus de soucis avec la base MySQL qui tombait régulièrement, ce qui rendait Barre Verte inaccessible (avec une vilaine page d'erreur). C'était devenu à un tel point que nous avions mis en place un cron pour redémarrer MySQL toutes les nuits... Notre hypothèse la plus forte était que cela venait du plugin StatsPress qui nous permettait d'avoir des tas d'informations comme dans Google Analytics, mais en moins et en faisant tomber le service...
- pour corriger une faute d'orthographe, vous pouvez forker le blog et nous proposer une pull request

# Utilisation de Jekyll

Installer jekyll, c'est très simple, une simple commande gem suffit. Ainsi, pour install jekyll et créer le 

{% gist jpcaruana/de5e0bc0702028dbaef5 %}

# Migrer un Wordpress vers Jekyll
