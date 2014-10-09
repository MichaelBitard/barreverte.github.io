---
layout: post
status: publish
published: true
title: WordPress chez gandi.net
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Depuis que je me suis fait spammer mes commentaires de wordpress chez
  free, et que, ayant bien rempli ma table wp_comments, ils me l'ont simplement supprimé
  (en mettant aussi le site hors ligne), j'ai décidé de passer chez gandi et d'utiliser
  un filtre anti-spam de type Akismet.\r\n\r\nC'est payant certes, mais cela m'évitera
  les ennuis du gratuit. Néanmoins, je comprends bien qu'ils ne puissent pas faire
  dans le détail pour maintenir leurs plateformes.\r\n\r\nJ'ai donc pris un abonnement
  \"expert\" car j'ai lu dans des blogs/forums, notamment sur le <a href=\"http://wiki.gandi.net/questions/fr/hosting/troubleshooting/lenteur-catastrophique\">wiki</a>
  de gandi qu'avec une part, c'était juste en installation automatique (AI) pour l'hébergement
  d'un site wordpress. Je ne veux pas mettre deux part pour mon blog qui accueille
  3 personnes. Et puis ça me permet de comprendre un peu mieux comment administrer
  une toute petite plateforme web.\r\n\r\nComme je n'ai pas vu de post indiquant la
  marche à suivre en mode expert, voila ce que j'ai fait.\r\n"
wordpress_id: 42
wordpress_url: http://www.lagrappe.net/?p=42
date: !binary |-
  MjAxMC0wNC0wNCAyMzowNDozMCArMDIwMA==
date_gmt: !binary |-
  MjAxMC0wNC0wNCAyMTowNDozMCArMDIwMA==
categories:
- linux
- admin
tags: []
comments: []
---
<p>Depuis que je me suis fait spammer mes commentaires de wordpress chez free, et que, ayant bien rempli ma table wp_comments, ils me l'ont simplement supprimé (en mettant aussi le site hors ligne), j'ai décidé de passer chez gandi et d'utiliser un filtre anti-spam de type Akismet.</p>
<p>C'est payant certes, mais cela m'évitera les ennuis du gratuit. Néanmoins, je comprends bien qu'ils ne puissent pas faire dans le détail pour maintenir leurs plateformes.</p>
<p>J'ai donc pris un abonnement "expert" car j'ai lu dans des blogs/forums, notamment sur le <a href="http://wiki.gandi.net/questions/fr/hosting/troubleshooting/lenteur-catastrophique">wiki</a> de gandi qu'avec une part, c'était juste en installation automatique (AI) pour l'hébergement d'un site wordpress. Je ne veux pas mettre deux part pour mon blog qui accueille 3 personnes. Et puis ça me permet de comprendre un peu mieux comment administrer une toute petite plateforme web.</p>
<p>Comme je n'ai pas vu de post indiquant la marche à suivre en mode expert, voila ce que j'ai fait.<br />
<a id="more"></a><a id="more-42"></a><br />
Après avoir créé mon serveur avec l'interface gandi, je me connecte avec mon utilisateur d'administration (disons "admin") en ssh. Ca y est je suis connecté. J'essaye d'installer un serveur web apache :</p>
<pre lang="bash">admin@machine:~$ sudo apt-get install apache2
</pre>
<p>Je me fais jeter car mon utilisateur n'est pas dans les utilisateurs autorisés à faire des sudo (sudoers). Je me dis alors que l'utilisateur root doit avoir le même mot de passe que mon admin, sinon c'est mort. Effectivement, je peux faire un "su - " et passer en root. Alors j'édite le fichier /etc/sudoers et j'ajoute la ligne :</p>
<pre lang="bash">admin ALL=(ALL) ALL
</pre>
<p>Afin de donner tous les privilèges à mon utilisateur d'administration, je n'aime pas rester toujours en root :)</p>
<p>Ensuite je peux installer apache/php/mysql :</p>
<pre lang="bash">$ sudo apt-get install apache2
$ sudo apt-get install libapache2-mod-php5
$ sudo apt-get install mysql-server-core-5.1 mysql-server-5.1 \
 mysql-client-5.1
$ sudo apt-get install php5-mysql
</pre>
<p><strong>Note</strong> : plus tard j'ai eu des soucis d'encodage. Comme je suis dans la partie SQL, je précise ici que j'ai passé l'encodage par défaut de la base mysql en UTF-8, plus standard que latin1. Pour ce faire il faut ajouter dans la section [mysqld] du fichier /etc/mysql/my.cnf les lignes suivantes :</p>
<pre lang="bash">character-set-server=utf8
skip-character-set-client-handshake
</pre>
<p>Et puis faire un</p>
<pre lang="bash">$ /etc/init.d/mysql restart
</pre>
<p>A présent, nous avons une base mysql qui tourne en utf-8. Nous pouvons alors créer la base qui servira à wordpress :</p>
<pre lang="bash">$ mysql -uroot -p
</pre>
<pre lang="sql">mysql> create database db_wordpress;
mysql> grant all on db_wordpress.*
   > to 'utilisateur_wordpress'@'localhost'
    > identified by 'motdepasse';
</pre>
<p>...et tester que ça fonctionne :</p>
<pre lang="bash">$ mysql -uutilisateur_wordpress -pmotdepasse db_wordpress
</pre>
<p>Ensuite il faut configurer apache, c'est indiqué partout et notamment <a href="http://wiki.gandi.net/fr/hosting/using-linux/tutorials/ubuntu/virtualhosts">ici</a>. Ainsi que les zones DNS du nom de domaine si vous en avez un comme <a href="http://wiki.gandi.net/fr/hosting/manage-quota/manage-website">ici également</a>.</p>
<p>Voila. Reste à installer wordpress dans le répertoire pointé par votre apache :</p>
<pre lang="bash">$ sudo wget http://fr.wordpress.org/wordpress-2.9.2-fr_FR.zip
$ # ah pas de unzip dans les packages
$ sudo apt-get install unzip
$ sudo unzip wordpress-2.9.2-fr_FR.zip
</pre>
<p>Et configurer wp-config.php pour que wordpress pointe vers la base wordpress :</p>
<pre lang="bash">$ cd wordpress
$ sudo cp wp-config-sample.php wp-config.php
$ sudo vi wp-config.php
</pre>
<pre lang="php">define('DB_NAME', 'db_wordpress');
define('DB_USER', 'utilisateur_wordpress');
define('DB_PASSWORD', 'motdepasse');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
</pre>
<p>Dernière chose, pour que le mail fonctionne (utile pour les mots de passes, et les notifications de wordpress), il faut installer un agent de transfert de mail (MTA). J'ai installé postfix qui inclut sendmail.</p>
<pre lang="bash">$ sudo apt-get install postfix
$ sudo cp /usr/share/postfix/main.cf.debian /etc/postfix/main.cf
$ sudo /etc/init.d/postfix reload
</pre>
<p>Ensuite, vous pouvez vous connecter sur l'url de votre site, qui vous redirigera automatiquement vers l'installation de wordpress (initialisation de la base de données).</p>
<p>En ce qui me concerne, je suis très satisfait des interfaces et des possibilités offertes par gandi. Une part pour l'instant me suffit amplement pour gérer les utilisateurs qui viennent sur le site, et si jamais leur nombre augmente, je sais que je peux monter en nombre de parts. J'utilise après cette installation et l'import de mes anciennes données wordpress 778Mo de disque, 200Mo de mémoire environ et j'ai un load average de 0.06.</p>
