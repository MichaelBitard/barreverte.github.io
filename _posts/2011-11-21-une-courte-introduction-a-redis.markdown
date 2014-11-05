---
layout: post
status: publish
published: true
title: Une courte introduction à Redis
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: /
author_login: jp
author_email: jp@barreverte.fr
author_url: /
excerpt: ! "Quand il s'agit de faire persister ses données, la seule option qui semble
  disponible est d'utiliser un SGBDR (une base de données relationnelle, telle que
  MySQL ou Oracle). Mais on se rend parfois compte qu'un seul outil ne peut résoudre
  tous les problèmes. Ainsi, si on ne dispose que de marteaux, on aura tendance à
  voir des clous partout.\r\n\r\nLe mouvement NoSQL (comme Not Only SQL), nous propose
  des alternatives : bases clefs-valeurs, bases orientées document, bases orientées
  colonnes, bases orientées graphe ; <a href=\"http://cassandra.apache.org/\">Cassandra</a>,
  <a href=\"http://www.mongodb.org/\">MongoDB</a>, <a href=\"http://redis.io/\">Redis</a>,
  <a href=\"http://www.allthingsdistributed.com/2007/10/amazons_dynamo.html\">Dynamo</a>,
  <a href=\"http://wiki.basho.com/Riak.html\">Riak</a>, <a href=\"http://labs.google.com/papers/bigtable.html\">Big
  Table</a>, <a href=\"http://project-voldemort.com/\">Voldemort</a> sont souvent
  utilisés par les sites à gros trafic et à tendance \"sociale\" qui font le buzz
  : Google, Amazon, Facebook, Twitter, LinkedIn.\r\n\r\nAujourd'hui, nous allons explorer
  <strong>redis</strong>, ses principes, son API et ce qu'on peut en faire. Dans un
  prochain article, nous verrons une utilisation typique en écrivant un clone de twitter
  simple et sans prétention.\r\n"
wordpress_id: 2233
wordpress_url: /?p=2233
date: !binary |-
  MjAxMS0xMS0yMSAxMTozMzozNyArMDEwMA==
date_gmt: !binary |-
  MjAxMS0xMS0yMSAxMDozMzozNyArMDEwMA==
categories:
- ruby
- NoSQL
- Bases de données
tags:
- java
- changement de paradigme
- redis
- nosql
comments:
- id: 309
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0xMS0yMSAyMjo0NzowOSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMS0yMSAyMTo0NzowOSArMDEwMA==
  content: ! "Juste pour préciser que \r\n<pre lang=\"SQL\">\r\nZRANGE savants 0 -1\r\n</pre>\r\nsignifie
    du premier élément (0) au dernier (-1) \r\n-2 est l'avant dernier, etc."
- id: 310
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0xMS0yMiAxMTowNjoyNiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMS0yMiAxMDowNjoyNiArMDEwMA==
  content: ! "Également, pour répondre à une question \"off\" : comment faire pour
    lister toutes les clefs présentes dans la base ? \r\n<pre>KEYS *</pre>\r\nA ne
    pas faire en production. \r\n\r\nA noter qu'on peut faire une sélection plus étroite,
    par exemple, si on désire remonter tous les tags :\r\n<pre>KEYS tag:*\r\n1) \"tag:FP\"\r\n2)
    \"tag:computing\"\r\n3) \"tag:distributedcomputing\"\r\n4) \"tag:erlang\"\r\n5)
    \"tag:python\"\r\n6) \"tag:programming\"\r\n7) \"tag:haskell\"</pre>\r\n\r\nToutes
    les regex \"habituelles\" sont possibles : un seul caractère (?), plusieurs (*),
    choix entre plusieurs ([ab])."
- id: 323
  author: Persistance polymorphe | Barre Verte !
  author_email: ''
  author_url: /persistance-polymorphe
  date: !binary |-
    MjAxMS0xMS0yOSAyMjowNDozOCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMS0yOSAyMTowNDozOCArMDEwMA==
  content: ! '[...] Barre Verte !   Notes de développeurs sur le logiciel, le design,
    l&#039;agilité, l&#039;open source, les mobiles, linux&#8230;    Aller au contenu
    AccueilA propos        &larr; Une courte introduction à Redis [...]'
- id: 325
  author: Jean-baptiste Potonnier
  author_email: jean.baptiste.potonnier@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0xMS0zMCAxOToyNzozNiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMS0zMCAxODoyNzozNiArMDEwMA==
  content: Je pense qu'il s'agit plus de "glob pattern" à la Shell que de regex
- id: 28648
  author: Redis, travailler en NoSQL pour pas un radis | A Prévôt-Leygonie
  author_email: ''
  author_url: http://aprevotleygonie.wordpress.com/2014/01/14/redis-travailler-en-nosql-pour-pas-un-radis/
  date: !binary |-
    MjAxNC0wMS0xNCAxNDoyODoyMyArMDEwMA==
  date_gmt: !binary |-
    MjAxNC0wMS0xNCAxMzoyODoyMyArMDEwMA==
  content: ! '[&#8230;] On peut faire joujou en ligne avec une base NoSQL pour pas
    un Kopek!Ni une ni deux, je cherche un tutoriel sur le sujet, et tombe sur un
    truc vraiement simpe et accessible.Convaincu par l&rsquo;ensemble, je ne peux
    pas m&rsquo;empêcher de partager.Enojy:/une-courte-introduction-a-redis
    [&#8230;]'
---
<p>Quand il s'agit de faire persister ses données, la seule option qui semble disponible est d'utiliser un SGBDR (une base de données relationnelle, telle que MySQL ou Oracle). Mais on se rend parfois compte qu'un seul outil ne peut résoudre tous les problèmes. Ainsi, si on ne dispose que de marteaux, on aura tendance à voir des clous partout.</p>
<p>Le mouvement NoSQL (comme Not Only SQL), nous propose des alternatives : bases clefs-valeurs, bases orientées document, bases orientées colonnes, bases orientées graphe ; <a href="http://cassandra.apache.org/">Cassandra</a>, <a href="http://www.mongodb.org/">MongoDB</a>, <a href="http://redis.io/">Redis</a>, <a href="http://www.allthingsdistributed.com/2007/10/amazons_dynamo.html">Dynamo</a>, <a href="http://wiki.basho.com/Riak.html">Riak</a>, <a href="http://labs.google.com/papers/bigtable.html">Big Table</a>, <a href="http://project-voldemort.com/">Voldemort</a> sont souvent utilisés par les sites à gros trafic et à tendance "sociale" qui font le buzz : Google, Amazon, Facebook, Twitter, LinkedIn.</p>
<p>Aujourd'hui, nous allons explorer <strong>redis</strong>, ses principes, son API et ce qu'on peut en faire. Dans un prochain article, nous verrons une utilisation typique en écrivant un clone de twitter simple et sans prétention.<br />
<a id="more"></a><a id="more-2233"></a><br />
Redis est une base de données open source de type clefs-valeurs mono-threadée. C'est en gros une grosse HashMap, mais avec des données structurées que nous allons détailler : des chaînes de caractères, des listes, des hash, des set, des set triés. L'utilisation de redis est très simple et la vitesse de lecture et d'écriture est vertigineuse (plus de 100 000 insertions par seconde sur mon petit poste de travail). Toutes les opérations sont atomiques, vous ne risquez pas d'avoir des soucis de concurrence d'accès à vos données. Par contre, il est impossible de requêter les valeurs comme on le fait habituellement avec un WHERE en MySQL, mais avec un peu d'astuce, d'habitude et de dénormalisation de vos données, on arrive très vite à nos fins en demandant "la bonne clef". Il faut également savoir que vous êtes limités par la taille de votre RAM car redis garde toutes ses données en mémoire (c'est aussi pour cela que c'est très rapide). Ne vous effrayez cependant pas, redis sauvegarde régulièrement (avec la possibilité d'un paramétrage poussé) ses données sur le disque et supporte également la réplication sur de multiples serveurs.</p>
<p>Si vous avez besoin de sauvegarder de grands volumes de données, vous pouvez stocker les données les moins lues dans un MySQL et garder les données volatiles et fréquemment lues dans redis, c'est même une configuration souvent rencontrée actuellement</p>
<p>Enfin, l'installation de redis est très simple : sur Ubuntu, le paquet s'appelle <em>redis-server</em>. Le serveur démarre immédiatement l'installation et un client en ligne de commande est  disponible : <em>redis-cli</em>. C'est avec cette interface que nous allons faire nos tests et découvrir redis. Vous pouvez également utiliser <em>redis-bench </em>pour constater la vitesse de redis sur votre machine. Parcourons dès à présent les différents types de données de stockage.</p>
<h2>String</h2>
<p>C'est le type le plus simple : à une clef, on peut y associer une valeur. Cette valeur peut-être une string de tout type (json, valeur d'une image jpeg), mais aussi un entier. La limite est de 1 Go. Les principales commandes associées sont SET, GET, INCR, DECR, et GETSET.</p>
<pre>redis 127.0.0.1:6379&gt; SET compteur 10
OK
redis 127.0.0.1:6379&gt; INCR compteur
(integer) 11
redis 127.0.0.1:6379&gt; INCR compteur
(integer) 12
redis 127.0.0.1:6379&gt; GET compteur
"12"
redis 127.0.0.1:6379&gt; GETSET compteur 123
"12"
redis 127.0.0.1:6379&gt; GET compteur
"123"</pre>
<pre>redis 127.0.0.1:6379&gt; SET clef valeur
OK
redis 127.0.0.1:6379&gt; GET clef
"valeur"</pre>
<h2>Listes</h2>
<p>Les listes de redis sont des listes liées (linked list). Cela veut dire que même si vous avez des millions d'enregistrement dans une liste, cela sera toujours aussi rapide d'insérer un élément en tête ou en queue de liste. La contrepartie de cette vitesse est l'accès à un élément dans la liste par son index. Les utilisateurs de ArrayList ou LinkedList en java connaissent bien cette différence. Les principales commandes commencent en général par <strong>L</strong> comme List et sont RPUSH et LPUSH (et leurs amies xPOP) qui permettent respectivement d'ajouter un élément en fin ou en début de liste, LRANGE pour obtenir une partie des éléments de la liste, LINDEX pour obtenir un seul élément de la liste, LLEN pour obtenir la taille de la liste.</p>
<p><script type="text/javascript" src="https://gist.github.com/1373390.js">// <![CDATA[</p>
<p>// ]]></script>Comme vous pouvez le remarquer, le résultat sort dans l'ordre dans lequel les données ont été rentrées, par besoin de ORDER BY de MySQL.</p>
<h2>Hash</h2>
<p>Une hash permet de stocker dans un même enregistrement plusieurs couples de clef/valeurs. Les commande de hash commencent... par un <strong>H</strong> comme Hash. On y trouve (vous avez déjà deviné je parie) HSET, HGET, HLEN, mais aussi HGETALL pour obtenir tous les couples clef-valeur, HINCRBY pour incrémenter un compteur dans la hash, HKEYS et HVALS pour obtenir toutes les clefs ou valeurs et HDEL pour faire le ménage.</p>
<pre>redis 127.0.0.1:6379&gt; HSET nosql redis "clef/valeur"
(integer) 1
redis 127.0.0.1:6379&gt; HSET nosql mongodb document
(integer) 1
redis 127.0.0.1:6379&gt; HSET nosql riak "fault tolerant"
(integer) 1
redis 127.0.0.1:6379&gt; HGET nosql redis
"clef/valeur"
redis 127.0.0.1:6379&gt; HGETALL nosql
1) "redis"
2) "clef/valeur"
3) "mongodb"
4) "document"
5) "riak"
6) "fault tolerant"
redis 127.0.0.1:6379&gt; HKEYS nosql
1) "redis"
2) "mongodb"
3) "riak"
redis 127.0.0.1:6379&gt; HVALS nosql
1) "clef/valeur"
2) "document"
3) "fault tolerant"
redis 127.0.0.1:6379&gt; HLEN nosql
(integer) 3</pre>
<h2>Sets</h2>
<p>Les Sets sont des collections d'objets non ordonnées. Les commandes commencent toutes avec un <strong>S</strong> comme Set, parmi celles-ci on trouve SADD pour ajouter une valeur à un set, SCARD pour obtenir la taille (cardinalité) d'un set, et surtout les commandes SINTER, SUNION, SDIFF qui permettent respectivement d'obtenir l'intersection, l'union et la différences entre 2 sets. Ces commandes existent en version "STORE" ; ainsi SINTERSTORE permet de stocker dans un nouveau set l'intersection de 2 autres. Dans l'exemple suivant, nous allons modéliser ce qui se trouve au supermarché du coin et ce que j'ai dans mon frigo (oui, certains éléments peuvent surprendre) :</p>
<pre>redis 127.0.0.1:6379&gt; SADD supermarche pommes
(integer) 1
redis 127.0.0.1:6379&gt; SADD supermarche poires
(integer) 1
redis 127.0.0.1:6379&gt; SADD supermarche scoubidous
(integer) 1
redis 127.0.0.1:6379&gt; SADD monFrigo beurre
(integer) 1
redis 127.0.0.1:6379&gt; SADD monFrigo pommes
(integer) 1
redis 127.0.0.1:6379&gt; SADD monFrigo TddByExample
(integer) 1
redis 127.0.0.1:6379&gt; SCARD monFrigo
(integer) 3
redis 127.0.0.1:6379&gt; SINTER supermarche monFrigo
1) "pommes"
redis 127.0.0.1:6379&gt; SUNION supermarche monFrigo
1) "scoubidous"
2) "pommes"
3) "poires"
4) "TddByExample"
5) "beurre"
redis 127.0.0.1:6379&gt; SDIFF supermarche monFrigo
1) "scoubidous"
2) "poires"</pre>
<h2>Sets triés</h2>
<p>Les sets triés (Sorted Set) sont similaires à des Sets mais ajoutent une notion de score aux valeurs ajoutées aux Set, ce qui permet de faire des tris. Les commandes commencent toutes par <strong>Z </strong>comme Zorted Set. On trouve donc les Zéquivalents des commandes précédentes, à savoir ZADD, ZCARD, ZINTER, ZUNION, ZDIFF mais aussi ZRANGE, ZRANGEBYSCORE et ZRANK qui tirent parti des scores des données stockées.</p>
<pre>redis 127.0.0.1:6379&gt; ZADD savants 1564 "Galilee"
(integer) 1
redis 127.0.0.1:6379&gt; ZADD savants 1643 "Isaac Newton"
(integer) 1
redis 127.0.0.1:6379&gt; ZADD savants 1571 "Johannes Kepler"
(integer) 1
redis 127.0.0.1:6379&gt; ZADD savants 1879 "Albert Einstein"
(integer) 1
redis 127.0.0.1:6379&gt; ZADD savants 1858 "Max Planck"
(integer) 1
redis 127.0.0.1:6379&gt; ZADD savants 1887 "Erwin Schrodinger"
(integer) 1
redis 127.0.0.1:6379&gt; ZRANGE savants 0 -1
1) "Galilee"
2) "Johannes Kepler"
3) "Isaac Newton"
4) "Max Planck"
5) "Albert Einstein"
6) "Erwin Schrodinger"
redis 127.0.0.1:6379&gt; ZREVRANGE savants 0 -1
1) "Erwin Schrodinger"
2) "Albert Einstein"
3) "Max Planck"
4) "Isaac Newton"
5) "Johannes Kepler"
6) "Galilee"
redis 127.0.0.1:6379&gt; ZREVRANGE savants 0 -1 WITHSCORES
 1) "Erwin Schrodinger"
 2) "1887"
 3) "Albert Einstein"
 4) "1879"
 5) "Max Planck"
 6) "1858"
 7) "Isaac Newton"
8 ) "1643"
 9) "Johannes Kepler"
10) "1571"
11) "Galilee"
12) "1564"</pre>
<p>Ce qui est intéressant, c'est de pouvoir faire des requêtes sur les scores du set :</p>
<pre>redis 127.0.0.1:6379&gt; ZRANGEBYSCORE savants -inf 1800
1) "Galilee"
2) "Johannes Kepler"
3) "Isaac Newton"
redis 127.0.0.1:6379&gt; ZRANGEBYSCORE savants 1800 2010
1) "Max Planck"
2) "Albert Einstein"
3) "Erwin Schrodinger"</pre>
<p>On peut imaginer des tas d'applications de calcul de poids de tags dans un blog par exemple (avec in ZINCRBY du nombre d'occurrences du tag dans un corpus) ou à des fins de statistiques. Toutes ces commandes de lecture/écriture sont très rapides.</p>
<h2>Bref !</h2>
<p>A cette courte présentation, il faudrait ajouter les possibilité suivantes que nous n'explorerons pas dans le cadre de cet article :</p>
<ul>
<li>une API Pub/Sub qui permet de poster et de recevoir des messages sur des "channels" ; cela peut paraître hors sujet mais cela permet d'avoir un petit système de messaging pour pas cher (pas besoin d'installer un serveur RabbitMQ en plus de votre base Redis). Pourquoi pas ;</li>
<li>donner une durée de vie à une clef (avec les commandes EXPIRE clef secondes ou EXPIREAT clef timestamp) : permet de laisser redis purger ses données sans avoir à écrire des scripts de purge ou de l'utiliser comme cache distribué ;</li>
<li>passer une série de commandes dans une transaction (MULTI et EXEC) avec la possibilité de l'éxécuter seulement si la clef change (avec WATCH à la place de EXEC);</li>
<li>utiliser plusieurs bases de données (16 disponibles) avec SELECT n ;</li>
<li>brancher un ou plusieurs slaves (tous sur le master ou les uns à la suite des autres, en cascade) : la réplication est extrêmement rapide ;</li>
<li>scripter des commandes dans le serveur avec le langage Lua, ce qui nous permet d'apprendre un nouveau langage par la même occasion !</li>
</ul>
<p>Si vous avez de très nombreux accès en lecture par rapport à vos écritures, ce qui est le cas pour une vaste majorité de sites tel que twitter, vous pouvez multiplier les slaves pour accéder à vos données en lecture de manière très rapide et ne garder qu'un seul master pour toutes vos écritures. Ainsi, vos temps de réponses seront très faibles et vos utilisateurs seront époustouflés par la vitesse de votre site.</p>
<p>Enfin, comme redis est open source, on constate rapidement que :</p>
<ul>
<li>c'est bien écrit</li>
<li>le code est lisible</li>
<li>c'est court (moins de 20 000 lignes de C)</li>
<li>il y a des tests unitaires</li>
</ul>
<p>Tout ceci rassure, donne confiance dans un produit qui est encore amené à évoluer (scripting, clustering, réplication, performances...). La blogosphère parle souvent de redis, des tutoriaux sont publiés régulièrement et de nombreux clients sont supportés.</p>
<h2>Clients</h2>
<p>Il existe de nombreux <a href="http://redis.io/clients">clients</a> redis dans de nombreux langages, vous trouverez forcément votre bonheur :</p>
<ul>
<li><a href="https://github.com/antirez/hiredis">C</a> / <a href="https://github.com/mrpi/redis-cplusplus-client">C++ </a>/ <a href="https://github.com/ServiceStack/ServiceStack.Redis">C#</a></li>
<li><a href="https://github.com/ragnard/redis-clojure">Clojure</a></li>
<li><a href="https://github.com/xetorthio/jedis">Java</a></li>
<li><a href="https://github.com/debasishg/scala-redis">Scala</a></li>
<li><a href="https://github.com/japerk/erldis">Erlang</a></li>
<li><a href="https://github.com/ezmobius/redis-rb">Ruby</a></li>
<li><a href="https://github.com/andymccurdy/redis-py">Python</a></li>
<li><a href="http://hackage.haskell.org/package/redis">Haskell</a></li>
<li><a href="https://github.com/alphazero/Go-Redis">Go</a></li>
<li><a href="https://github.com/nrk/redis-lua">Lua</a></li>
</ul>
<hr />
<p>Quelques liens :</p>
<ul>
<li>le site de <a href="http://redis.io/">redis</a>, avec sa <a href="http://redis.io/commands">documentation</a> et son <a href="http://github.com/antirez/redis">code source</a></li>
<li><a href="http://antirez.com/post/short-term-redis-plans.html">Short term Redis plans</a> où l'auteur détaille l'avenir de Redis</li>
<li><a href="http://antirez.com/post/take-advantage-of-redis-adding-it-to-your-stack.html">How to take advantage of Redis by just adding it to your stack</a> où l'auteur de Redis donne de nombreux exemples d'utilisation</li>
<li>l'excellent article <a href="http://martinfowler.com/bliki/PolyglotPersistence.html">Polyglot Persistence</a>, par Martin Fowler</li>
<li><a href="http://openmymind.net/2012/1/23/The-Little-Redis-Book/">the little redis book</a></li>
</ul>
