---
layout: post
title: Migrer un blog de Wordpress vers Jekyll
author:
  display_name: Jean-Philippe Caruana
tags:
- blog
- wordpress
- jekyll
- github
categories:
- blog
comments: true
---

Suite à la [migration](/barre-verte-a-migre/) de notre blog vers un jekyll hébergé chez github, je vous propose quelques explications sur le sujet. Dans cet article, nous verrons :

1. comment utiliser Jekyll
1. comment migrer de Wordpress vers Jekyll
1. comment héberger son blog (ou tout site statique) chez github

On y va ?

# Utilisation de Jekyll

Jekyll est un moteur de génération blog statique créé par (un ancien de chez) github. Il est écrit en ruby, donc cet article fait l'hypothèse que vous avez déjà ruby et ruby-gem d'installés sur votre poste de travail.

Installer jekyll, c'est très simple, une simple commande `gem` suffit. Ainsi, pour installer jekyll et créer le blog "from scratch" :

{% gist jpcaruana/de5e0bc0702028dbaef5 %}

Ensuite, la commande `jekyll serve` vous lance le site en local sur le port 4000 : il suffit de vous rendre sur http://0.0.0.0:4000/ pour voir votre blog en local.

L'utilisation est très simple : après avoir fait le design de votre site (en touchant le fichier `index.html` et tout ce qui se trouve dans le dossier `_layout`), la création d'un fichier dans `_posts` publie un nouvel article.

Il vous faudra respecter plusieurs conventions :

* le nommage : le fichier __doit__ comporter la date de publication dans son titre, par exemple pour un article publié le 24 décembre 2003, le fichier devra se nommer `2003-12-24-mon-article.md`
* le fichier __devra__ commencer par le _front matter_. Il s'agit de meta-informations décrivant l'article et doit comporter au minimun les champs _layout_ et _title_. Pour un article de blog, utilisez le layout __post__ (qui sera mis en forme selon les indications données dans le fichier `_layouts/post.html`) :

```
---
layout: post
title: Titre de votre article
-- 

Ici, le contenu de votre article, dans votre format préféré
(personnellement, j'ai choisi markdown)
````

Si vous voulez travailler sur un brouillon et ne pas le publier, il vous suffit de mettre le fichier dans le dossiers `_drafts` : ces fichiers ne sont pas publiés. Vous pouvez en revanche les lire avant publication en local en lançant jekyll avec l'option _drafts_ :

{% gist jpcaruana/a1189baf4ff5976cc896 %}


L'option _watch_ ordonne à jekyll de surveiller le répertoire du site et de le regénérer à chaque changement de contenu.

Ainsi, la publication d'un article se résume à déplacer un fichier de `_drafts` vers `_posts` tout en respectant les normes de nommage.


# Migrer un Wordpress vers Jekyll

## Récupérer les anciens articles

Dans notre cas, nous avions déjà un blog depuis 2010. Nous voulions donc migrer tous les articles existants en conservant le maximum de contenu et sans changer les URL des articles pour des raisons évidentes de compatibilité des bookmarks ou références à nos articles.

J'avais déjà tenté une migration 1 an auparavant, mais j'étais ressorti de cette expérience avec un goût de "pas fini" dans la bouche : gros soucis d'encodage de tous les articles, imports partiels, processus très compliqué.

Mais les choses avancent ! Depuis, le processus de migration depuis un Wordpress auto-hébergé s'est grandement simplifié. Tout est documenté dans le site [Jekyll Import](http://import.jekyllrb.com/docs/home/). Des tas de types de blog sources sont possibles (Blogger, Joomla, Typo...), mais ici nous allons nous intéresser à la migration depuis un Wordpress autohébergé : http://import.jekyllrb.com/docs/wordpress/

Pour la migration depuis un Wordpress auto-hébergé, nous avons la possibilité de nous connecter au MySQL et d'en extraire tous les articles publiés. Notez-cependant que les brouillons en cours ne seront pas importés, il faudra le faire à la main (ou proposer un patch).

Comme jekyll, __jekyll-migration__ est écrit en ruby. Il y a donc quelques gems à installer sur votre poste, en particulier la gem MySQL :

{% gist jpcaruana/976f5ec53c95cc28df3e %}

Et c'est là que les choses se compliquent ! Je ne sais pas si vous êtes tous dans mon cas, mais j'ai toujours rencontré les pires difficultés pour installer la gem mysql. Ici, il y a même la gem mysql2... En tout cas, il faut que vous ayez de quoi parler MySQL depuis votre poste. Sous Ubuntu, il faut installer le paquet `libmysqlclient-dev` avant d'installer la gem mysql/mysql2.


Ensuite, pensez à ouvrir le port MySQL vers votre machine. Avec iptable, cela s'écrit ainsi : 

{% gist jpcaruana/adffbcc485988cf60223 %}

Je vous invite à tester la connexion vers le MySQL de votre blog depuis votre machine en utilisant le client mysql en local.

Ensuite, il faut lancer une commande magique. La commande est magique, car la documentation n'est pas à jour, certaines options sont devenues obligatoires, d'autres ont carrément disparu. Je suis arrivé (de mémoire) à la commande suivante : 

{% gist jpcaruana/876be68091e11f4781ec %}

Tous vos articles sont présents ! Ils sont au format HTML ; vous attendrez d'écrire un nouvel article pour utiliser un langage de Markup plus simple, comme Markdown par exemple.

## Réglages fins

Il vous reste à résoudre le problème des URL. Par défaut, jekyll met la date de l'article dans l'URL, contrairement à ce que faisait Wordpress. C'est un point qui m'angoissait particulièrement, car j'avais peur de ne pouvoir y parvenir, et des URL incompatibles avec les anciennes était synonyme de "no go" comme on dit : tous les liens pointant vers notre sites cassés, tout l('excellent) référencement de nos articles chez les moteurs de recherche cassé... bref ! une catastrophe.

Mais je me suis noyé dans un verre d'eau.

En fait, c'est tellement simple quand j'ai failli en pleurer : à la racine du blog se trouve un fichier dont l'importance est capitale : `_config.yml`. C'est le fichier qui regroupe toute la configuration du blog. Il suffit de changer la ligne :

````
permalink: /:year/:month/:title
````

en 

````
permalink: /:title
````


Et tout est l'avenant ! Configurer un compte Google Analytics ? La variable `gaaccount` est là pour ça ! Mettre en place des commentaires avec disqus ? Il y a aussi une variable pour cela (nommée... `disqus`).

Pour les commentaires disqus, il faut ajouter un `comments: true` dans le _front matter_.

On peut aller beaucoup plus loin, en fouillant un peu dans le code source si vous êtes développeur. À titre d'exemple, il m'a été assez très facile de faire apparaître des tags et des catégories en fin d'article.


# Héberger son blog chez Github
Enfin, il est facile d'héberger votre blog chez github. Par héberger, j'entends "c'est github qui sert le contenu de votre blog".

Pour cela, vous aves 2 options :

- utiliser une URL github, du type http://monblog.github.io
- utiliser une URL que vous possédez, par exemple http://www.barreverte.fr (au hasard)

Voyons cela point par point :

## Utiliser une URL en github.io
Pour cette option, c'est très simple. Il faut respecter quelques conventions  et ensuite cela marche tout seul (chapeau bas aux équipes de github) :

- votre repository __doit__ s'appeller `monuser.github.io`
- le site __doit__ être dans la branche `master`
- c'est tout !

À chaque `git push` sur votre branche `master`, github génère le site statique et le rend disponible partout.

Notez que github permet d'héberger également un site statique pour votre projet open source. Dans ce cas, le code de votre site doit se situer dans une branche nommée `gh-pages`. Ainsi, pour un utilisateur nommé _monuser_ et un projet nommé _monprojet_, le site sera disponible à l'adresse http(s)://monuser.github.io/monprojet. Voir par exemple http://jpcaruana.github.io/presentation_buildr/. 

## Utiliser une URL personnelle
Pour cette option, c'est un petit peu plus compliqué, mais pas tellement :

- __toutes__ les règles précédement énnoncées s'appliquent :
    - votre repository __doit__ s'appeller `monuser.github.io`
    - le site __doit__ être dans la branche `master`
- il __faut__ créer à la racine de votre projet un fichier nommé `CNAME` qui ne contient que l'URL de votre site, sans _wildcard_
- il __faut__ ajouter dans votre DNS un enregistrement de type `CNAME` qui pointe vers `monuser.github.io`
- __attendre__ que le DNS se propage.

Dans [notre cas](http://www.barreverte.fr/), le fichier `CNAME` est [accessible à tous](https://github.com/barreverte/barreverte.github.io/blob/master/CNAME) pour vous en inspirer et le DNS est configuré ainsi (le point final est _très_ important : il représente le serveur DNS racine, et cela ne fonctionnera pas sans) :

````
www 10800 IN CNAME barreverte.github.io.
````

Une fois tout ceci en place, votre site __ne sera plus__ accessible sur l'URL `monuser.github.io` : par exemple, http://barreverte.github.io/ redirige vers http://www.barreverte.fr/

# Conclusion
Ouf ! Nous sommes arrivés au bout !

Ce n'était finalement pas très difficile, même si j'ai trouvé la documentation souvent éparpillée et parfois imprécise ; c'est pourquoi j'ai voulu rédiger cette page pour permettre à d'autres de gagner du temps si ils désirent ouvrir un blog gratuitement. J'espère que cela pourra rendre service.

N'hésitez pas à me suggérer des corrections, améliorations, que ce soit en commentaires en fin d'article ou en proposant une _[pull request](https://github.com/barreverte/barreverte.github.io/pulls)_.


## Références
- [La documentation de Jekyll](http://jekyllrb.com/)
    - [celle de jekyll-import](http://import.jekyllrb.com/)
    - [celle qui concerne les imports depuis Wordpress](http://import.jekyllrb.com/docs/wordpress/)
- [La documentation de github sur l'hébergement des pages](https://help.github.com/articles/user-organization-and-project-pages/)
- [La documentation de github sur l'utilisation de noms de domaines personnels](https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/)
    - [sur le fichier CNAME dans votre repo](https://help.github.com/articles/adding-a-cname-file-to-your-repository/)
    - [sur le paramétrage de votre DNS](https://help.github.com/articles/tips-for-configuring-a-cname-record-with-your-dns-provider/)
- [Une bonne explication sur le DNS](http://openclassrooms.com/courses/gerer-son-nom-de-domaine), claire et complète
