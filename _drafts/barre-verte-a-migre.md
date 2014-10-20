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
- plus de soucis avec la base MySQL qui tombait régulièrement, ce qui rendait Barre Verte inaccessible (avec une vilaine page d'erreur). C'était devenu à un tel point que nous avions mis en place un cron pour redémarrer MySQL toutes les nuits... Notre hypothèse la plus forte était que cela venait du plugin StatsPress qui nous permettait d'avoir des tas d'informations comme dans Google Analytics, mais en moins bien et en faisant tomber le service...
- pour corriger une faute d'orthographe, vous pouvez forker le blog et nous proposer une pull request

# Utilisation de Jekyll

Installer jekyll, c'est très simple, une simple commande gem suffit. Ainsi, pour install jekyll et créer le blog "from scratch" :

{% gist jpcaruana/de5e0bc0702028dbaef5 %}

Ensuite, la commande __jekyll serve__ vous lance le site en local sur le port 4000.

L'utilisation est très simple : après avoir fait le design de votre site (en touchant les fichiers index.html et tout se trouve dans le dossier _layout), la création d'un fichier dans _posts publie un nouvel article.

Il vous faudra respecter plusieurs conventions :

* le nommage : le fichier doit comporter la date de publication dans son titre, par exemple pour un article publié le 24 décembre 2003, le fichier devra se nommer 2003-12-24-mon-article.md
* l'article devra commencer par le _front matter_. Il s'agit de meta-informations décrivant l'article et doit comporter au minimun les champs _layout_ et _title_: 

```
---
layout: post
title: JP
-- 

Ici, le contenu de votre article, dans votre format préféré
````

Quand vous faites un git push vers github, votre blog est automatiquement régénéré et visible du monde entier.

Si vous voulez travailler sur un brouillon et ne pas le publier, il vous suffit de mettre le fichier dans le dossiers _drafts : ces fichiers ne sont pas publiés. Vous pouvez en revanche les lire avant publication en local en lançant jekyll avec l'option drafts :

{% gist jpcaruana/a1189baf4ff5976cc896 %}

Ainsi, la publication d'un article se résume à déplacer un fichier de _drafts vers _posts.


# Migrer un Wordpress vers Jekyll

# Récupérer les anciens articles

Dans notre cas, nous avions déjà un blog depuis 2010. Nous voulions donc migrer tous les articles existants en conservant le maximum de contenu et sans changer les URL des articles pour des raisons évidentes de compatibilité des bookmarks ou références à nos articles.

J'avais déjà tenté une migration 1 an auparavant, mais j'étais ressorti de cette expérience avec un goût de "pas fini" dans la bouche : gros soucis d'encodage de tous le articles, imports partiels, processus très compliqué.

Mais les choses avancent ! Depuis, le processus de migration depuis un Wordpress auto-hébergé s'est grandement simplifié. Tout est documenté dans le site Jekyll Import http://import.jekyllrb.com/docs/home/. Des tas de types de blog sources sont possibles (Blogger, Joomla, Typo), mais ici nous allons nous intéresser à la migration Wordpress http://import.jekyllrb.com/docs/wordpress/

Pour la migration depuis un Wordpress auto-hébergé, nous avons la possibilité de nous connecter au MySQL et d'en extraire tous les articles publiés. Notez-cependant que les brouillons en cours ne seront pas importés, il faudra le faire à la main (ou proposer un patch)

Comme jekyll, jekyll-migration est écrit en ruby. Il y a donc quelques gems à installer sur votre poste, en particulier la gem MySQL :

{% gist jpcaruana/976f5ec53c95cc28df3e %}

Et c'est là que les choses se compliquent ! Je ne sais pas si vous êtes tous dans mon cas, mais j'ai toujours rencontré les pires difficultés pour installer la gem mysql. Ici, il y a même la gem mysql2... En tout cas, il faut que vous ayez de quoi parler MySQL sur votre poste. Sous Ubuntu, il faut installer le paquet libmysqlclient-dev avant d'installer la gem mysql2/mysql2.


Ensuite, pensez à ouvrir le port MySQL vers votre machine. Avec iptable, cela s'écrit ainsi : 

{% gist jpcaruana/adffbcc485988cf60223 %}

Je vous invite à tester la connexion vers le MySQL de votre blog depuis votre machine en utilisant le client mysql en local.

Ensuite, il faut lancer une commande magique. La commande est magique, car la documentation n'est pas à jour, certaines options sont devenues obligatoires, d'autres ont carrément disparu. Je suis arrié à la commande suivante : 

TODO GIST

Tous vos articles sont présents ! Ils sont au format HTML ; vous attendrez d'écrire un nouvel article pour utiliser un langage de Markup plus simple, comme Markdown par exemple.

## Réglages fins

Il vous reste à résoudre le problème des URL. Par défaut, jekyll met la date de l'article dans l'URL, contrairement à ce que faisait Wordpress. C'est un point qui m'angoissait particulièremnt, car j'avais peur de ne pouvoir y parvenir, et des URL incompatibles avec les anciennes était synonyme de "no go" comme on dit : tous les liens pointant vers notre sites cassés, tout l('excellent) référencement de nos articles chez les moteurs de rercherche cassé... bref ! une catastrophe.

Mais je me suis noyé dans un verre d'eau.

En fait, c'est tellement simple quand j'ai failli en pleurer : à la racine du blog se trouve un fichier dant l'importance est capitale : _config.yml. C'est le fichier qui regroupe toute la configurion du blog. Il suffit de changer la ligne 

````
permalink: /:year/:month/:title
````

en 

````
permalink: /:title
````


Et tout est l'avenant ! Configurer un compte Google Analytics ? La variable gaaccount est là pour ça ! Mettre en place des commentaires avec disqus ? Il y a aussi une variable pour cela.

