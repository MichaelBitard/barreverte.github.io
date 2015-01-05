---
layout: post
title: Astuce - laisser nginx répondre robots.txt
author:
  display_name: Jean-Philippe Caruana
tags:
- nginx
- robots
- google
- bot
categories:
- astuces
---

Sur le service sur lequel je travaille, j'ai observé de nombreuses erreurs `500` suite à des tentatives du [Google Bot](http://www.google.com/bot.html) de trouver le fichier `/robots.txt`. Voici par exemple une log d'erreur de nginx :

````
66.249.64.185 - - [05/Jan/2015:09:02:45 +0100] "GET /robots.txt HTTP/1.1" 500 113 "-" "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
````

Non seulement cela me fait de très nombreuses (plus de 150 000 par jour) erreurs 500 qui me cachent les vraies erreurs 500 que mon service pourrait répondre, mais aussi cela me fait un volume conséquent de logs inutiles. Bref, ça m'agace, d'autant plus que c'est très facile à réparer.

Mon service répond sur plusieurs URL, plusieurs hôtes virtuels (les *virtual hosts*) et c'est [nginx](http://nginx.org/) qui nous sert de *load balancer*. C'est donc nginx qui répond `500` aux requêtes de Google. Comme nous ne servons aucune page qu'il est nécessaire d'indexer pour les moteurs de recherche, il faudrait pouvoir dire au Google Bot de ne pas nous indexer du tout.

Pour demander à Google (et aux autres) de ne pas indexer le contenu de votre site, le fichier `/robots.txt` doit contenir ceci :

````
User-agent: *
Disallow: /
````

Une traduction approximative serait : "*Pour tous les bots (y compris celui de google), merci de ne rien indexer sous l'URL racine de ce site*".

Nginx est, je trouve, à la fois plus simple à paramétrer et plus souple à utiliser que ne l'est apache. Ainsi, on peut lui demander de répondre pour nous directement le fichier `/robots.txt` sans avoir besoin de ce fichier sur le disque dur de notre serveur :


````
location /robots.txt {
    return 200 "User-agent: *\nDisallow: /";
}
````

Et voilà ! J'ai répété cela pour les 4 hôtes virtuels que comporte notre service et depuis le calme est revenu dans mes logs (et j'ai allégé le travail des robots).
