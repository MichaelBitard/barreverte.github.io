---
layout: post
status: publish
published: true
title: Sauvegardes mysql/wordpress avec git
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Pour assurer les sauvegardes des données de ce site, j'avais commencé
  à faire un script bash qui faisait un dump uniquement si des données avaient changées.
  Mais il était insuffisant, car chaque changement provoquait la sauvegarde de toute
  la base de données. Pas vraiment incrémentale la démarche.\r\n\r\n<a href=\"/author/jp\">JP</a>
  m'a indiqué <a href=\"http://www.patpro.net/blog/index.php/2010/01/11/1347-sauvegarde-de-bases-mysql-via-svn/\">un
  article</a> qui mentionnait l'utilisation de SVN pour des sauvegardes d'une base
  mysql. Mais bien sûr ! Un gestionnaire de version, c'est ce vers quoi le script
  allait m'acheminer pour :\r\n<ul>\r\n\t<li>ne garder que les deltas des changements</li>\r\n\t<li>être
  capable de retrouver la dernière version du site en cas de crash serveur</li>\r\n\t<li>pouvoir
  retrouver une version donnée du site dans le cas d'un problème de configuration
  par exemple</li>\r\n\t<li>pouvoir dupliquer la sauvegarde à plusieurs endroits facilement
  avec l'historique</li>\r\n</ul>\r\nAutant réutiliser des outils éprouvés.\r\n\r\n"
wordpress_id: 1647
wordpress_url: /?p=1647
date: !binary |-
  MjAxMS0wNC0wMSAxNToxMzoyOCArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNC0wMSAxNDoxMzoyOCArMDIwMA==
categories:
- shell
- admin
tags:
- backup
- sauvegarde
- git
- gestion de version
- mysql
comments:
- id: 65
  author: Pascal
  author_email: pascal@grange.nom.fr
  author_url: http://pgrange1.blogspot.com/
  date: !binary |-
    MjAxMS0wNC0wNCAxNDoxMDo1OSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0wNCAxMzoxMDo1OSArMDIwMA==
  content: ! "J'aime bien cette solution. Elle semble super simple. Je n'aurais pas
    pensé à tout simplement mettre le dump sql dans un gestionnaire de version. \r\n\r\nJe
    m'en veux de ne pas y avoir pensé avant.\r\n\r\nMerci.\r\n\r\nP.S. bon par contre
    le dump lui-même s'effectue en entier à chaque fois. Donc je suppose qu'au bout
    d'un moment, ça peut mettre un peu de temps :("
- id: 66
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wNC0wNSAxMzoyOTowNyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0wNSAxMjoyOTowNyArMDIwMA==
  content: ! "\"Je m’en veux de ne pas y avoir pensé avant.\"\r\n--> pareil..."
- id: 67
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0wNC0wNSAxMzozMToyOCArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0wNSAxMjozMToyOCArMDIwMA==
  content: Effectivement, le dump est entier. Cela dit, pour l'instant ça représente
    2-3 secondes pour ce site.
- id: 146
  author: Didier S
  author_email: sampaolo@gmail.com
  author_url: http://dsampaolo.com/
  date: !binary |-
    MjAxMS0wNS0yNSAxMjo0ODo1NyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0yNSAxMTo0ODo1NyArMDIwMA==
  content: Très pratique et très propre. Je cherchais à retaper mon système de backup
    (multi-blogs), l'utilisation d'un gestionnaire de version est en effet une grosse
    bonne idée que j'aurais dû avoir (Facepalm). Merci bien! ;)
---
<p>Pour assurer les sauvegardes des données de ce site, j'avais commencé à faire un script bash qui faisait un dump uniquement si des données avaient changées. Mais il était insuffisant, car chaque changement provoquait la sauvegarde de toute la base de données. Pas vraiment incrémentale la démarche.</p>
<p><a href="/author/jp">JP</a> m'a indiqué <a href="http://www.patpro.net/blog/index.php/2010/01/11/1347-sauvegarde-de-bases-mysql-via-svn/">un article</a> qui mentionnait l'utilisation de SVN pour des sauvegardes d'une base mysql. Mais bien sûr ! Un gestionnaire de version, c'est ce vers quoi le script allait m'acheminer pour :</p>
<ul>
<li>ne garder que les deltas des changements</li>
<li>être capable de retrouver la dernière version du site en cas de crash serveur</li>
<li>pouvoir retrouver une version donnée du site dans le cas d'un problème de configuration par exemple</li>
<li>pouvoir dupliquer la sauvegarde à plusieurs endroits facilement avec l'historique</li>
</ul>
<p>Autant réutiliser des outils éprouvés.</p>
<p><a id="more"></a><a id="more-1647"></a>Pour pouvoir faire des sauvegardes incrémentales il faut que ce soit avec des lignes insert distinctes par enregistrement. Mysqldump permet les deux :</p>
<pre lang="sql"># mysqldump par défaut
insert into table values (a1, b1, c1),..., (an, bn, cn);
# ou avec les options
# --complete-insert=FALSE --extended-insert=FALSE
insert into table values ( a1, b1, c1);
# ...
insert into table values ( an, bn, cn);</pre>
<p>Pour ne pas faire des sauvegardes tous les jours, mais uniquement lorsqu'il y a des contenus nouveaux ou modifiés, il faut supprimer les insert dans la table wp_stats qui est modifiée régulièrement, et supprimer la ligne de fin qui donne le timestamp du dump. J'ai aussi ajouté le thème que nous utilisons car nous le modifions et à chaque mise à jour de wordpress, il est écrasé par l'original (cf script backup_wordpress.sh à la fin).</p>
<p>En ce qui concerne la gestion de version, git est plus simple à mettre en place (pas de serveur de référentiel nécessaire), mon choix s'est porté vers ce dernier. L'installation sous débian/ubuntu et l'initialisation de la sauvegarde est très simple :</p>
<pre lang="bash">$ sudo apt-get install git-core
$ mkdir -p /dir/to/backup
$ cd /dir/to/backup
$ git init
$ # apres avoir créé le script ./backup_wordpress.sh
$ ./backup_wordpress.sh
$ git add backup_wordpress.sh backup.sql
$ git commit -am "init backup"</pre>
<p>Il reste ensuite à appeler le script régulièrement par crontab (nous le faisons tous les jours).</p>
<p>Pour répliquer la sauvegarde ailleurs avec git et ssh nous pouvons faire sur une machine avec git :</p>
<pre lang="bash">$ git clone ssh://user@host:port/dir/to/backup</pre>
<p>et lancer un "git pull" par crontab dans ce répertoire.</p>
<p>Et vous comment faites-vous pour vos sauvegardes de blogs ?</p>
<p>Un autre article qui utilise svn :<br />
<a href="http://www.sylvaindeloux.com/geek/sauvegarder-des-bases-mysql-avec-svn">http://www.sylvaindeloux.com/geek/sauvegarder-des-bases-mysql-avec-svn</a></p>
<hr />
<p>backup_wordpress.sh :</p>
<p><script src="https://gist.github.com/898085.js"> </script>&nbsp;</p>
