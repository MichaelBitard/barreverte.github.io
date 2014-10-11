---
layout: post
status: publish
published: true
title: Persistance polymorphe
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Il y a quelques temps, lorsqu'un projet informatique démarrait, une question
  d'architecture qui se posait systématiquement, était \"quelle base de données (relationnelle)
  utilisons-nous ?\", et la subsidiaire (en langage objet), \"quel mapping relationnel/objet
  ?\". La réponse était d'ailleurs souvent \"hibernate/mysql\" dans le monde java.\r\n\r\nLe
  mouvement NoSQL est issu d'un besoin de stockage de données important, scalable,
  performant, et robuste sans avoir toutes les fonctionnalités d'une base relationnelle.
  Ces besoins ont été ceux de gros sites comme google, facebook, twitter, amazon,
  linkedin, sourceforge, github...\r\n\r\nSi certains discours ont été excessifs au
  départ (comme souvent lors d'une inversion de tendance), c'est en réaction à des
  années de domination du monde relationnel dans le domaine de la persistance, et
  aux difficultés des développeurs à s'interfacer avec ces systèmes. A présent <a
  href=\"http://nosql-database.org/\">beaucoup de produits</a> ont été développés
  offrant de réelles alternatives au monde des SGBDR :\r\n<ul>\r\n\t<li>le stockage
  par famille de colonnes (<a href=\"http://hbase.apache.org/\">hbase</a>, <a href=\"http://cassandra.apache.org/\">cassandra</a>,
  <a href=\"http://hypertable.org/\">hypertable</a>)</li>\r\n\t<li>bases orientées
  document (<a href=\"http://www.mongodb.org/\">MongoDB</a>, <a href=\"http://couchdb.apache.org/\">CouchDB</a>,
  <a href=\"http://code.google.com/p/terrastore/\">Terrastore</a>)</li>\r\n\t<li>bases
  clé-valeur/tuples (<a href=\"http://redis.io/\">Redis</a>, <a href=\"http://wiki.basho.com/\">Riak</a>,
  <a href=\"http://code.google.com/p/maxtable/\">Maxtable</a>)</li>\r\n\t<li>bases
  orientées graphe (<a href=\"http://neo4j.org/\">Neo4J</a>, <a href=\"http://www.kobrix.com/\">HyperGraphDB</a>)</li>\r\n</ul>\r\n"
wordpress_id: 2278
wordpress_url: /?p=2278
date: !binary |-
  MjAxMS0xMS0yOSAxMDowNjoxOSArMDEwMA==
date_gmt: !binary |-
  MjAxMS0xMS0yOSAwOTowNjoxOSArMDEwMA==
categories:
- architecture
- NoSQL
tags: []
comments:
- id: 321
  author: Jean-Baptiste Potonnier
  author_email: jean.baptiste.potonnier@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0xMS0yOSAyMToxNDozNCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMS0yOSAyMDoxNDozNCArMDEwMA==
  content: ! "Très bon article, bien documenté.\r\nPour les organisations ayant un
    peu peur de la nouveauté, iBatis fait un très bon travail de mapping avec un SGBD,
    en étant beaucoup moins invasif que Hibernate (qui est cependant un bon choix,
    pour certains projets).\r\nSpring Data est également très intéressant pour offrir
    un accès uniforme à différentes solutions de persistance.\r\nUne idée que j'aime
    et qui est assez présente dans le monde SmallTalk: retarder au maximum le choix
    du mode de persistance. Et en fait, vous en avez peut-être pas besoin. Une solution
    totalement en mémoire, avec log, est parfaitement satisfaisante pour beaucoup
    de petits et moyens projets. Ce qui est en fait assez proche du fonctionnement
    de Redis.\r\nEt si finalement vous en avez vraiment besoins, vous avez alors recueilli
    un maximum d'informationw pour faire votre choix."
- id: 562
  author: Retour sur la QCon 2012 | Barre Verte !
  author_email: ''
  author_url: /retour-sur-la-qcon-2012
  date: !binary |-
    MjAxMi0wNC0wOSAxNjoyMDo1OSArMDIwMA==
  date_gmt: !binary |-
    MjAxMi0wNC0wOSAxNToyMDo1OSArMDIwMA==
  content: ! '[...] Ces technologies ne sont plus polyvalentes comme pouvaient l&#8217;être
    des SGBDR, c&#8217;est ce qu&#8217;indiquait Siddharth Anand venu parler des infrastructures
    de données chez Linkedin. Il parlait d&#8217;&nbsp;&raquo;ADN des bases NoSQL&nbsp;&raquo;.
    C&#8217;est la raison pour laquelle, un gros site pourra être amené à en utiliser
    plusieurs. C&#8217;était la keynote d&#8217;introduction de la QCon par Martin
    Fowler et Rebecca Parson sur &laquo;&nbsp;The Data Panorama&nbsp;&raquo;, très
    proche de l&#8217;article &laquo;&nbsp;Polyglot persistence&nbsp;&raquo; dont
    nous avons déjà parlé. [...]'
---
<p>Il y a quelques temps, lorsqu'un projet informatique démarrait, une question d'architecture qui se posait systématiquement, était "quelle base de données (relationnelle) utilisons-nous ?", et la subsidiaire (en langage objet), "quel mapping relationnel/objet ?". La réponse était d'ailleurs souvent "hibernate/mysql" dans le monde java.</p>
<p>Le mouvement NoSQL est issu d'un besoin de stockage de données important, scalable, performant, et robuste sans avoir toutes les fonctionnalités d'une base relationnelle. Ces besoins ont été ceux de gros sites comme google, facebook, twitter, amazon, linkedin, sourceforge, github...</p>
<p>Si certains discours ont été excessifs au départ (comme souvent lors d'une inversion de tendance), c'est en réaction à des années de domination du monde relationnel dans le domaine de la persistance, et aux difficultés des développeurs à s'interfacer avec ces systèmes. A présent <a href="http://nosql-database.org/">beaucoup de produits</a> ont été développés offrant de réelles alternatives au monde des SGBDR :</p>
<ul>
<li>le stockage par famille de colonnes (<a href="http://hbase.apache.org/">hbase</a>, <a href="http://cassandra.apache.org/">cassandra</a>, <a href="http://hypertable.org/">hypertable</a>)</li>
<li>bases orientées document (<a href="http://www.mongodb.org/">MongoDB</a>, <a href="http://couchdb.apache.org/">CouchDB</a>, <a href="http://code.google.com/p/terrastore/">Terrastore</a>)</li>
<li>bases clé-valeur/tuples (<a href="http://redis.io/">Redis</a>, <a href="http://wiki.basho.com/">Riak</a>, <a href="http://code.google.com/p/maxtable/">Maxtable</a>)</li>
<li>bases orientées graphe (<a href="http://neo4j.org/">Neo4J</a>, <a href="http://www.kobrix.com/">HyperGraphDB</a>)</li>
</ul>
<p><a id="more"></a><a id="more-2278"></a><br />
Et les autres types de bases qui existaient avant le mouvement NoSQL comme bases objets (<a href="http://www.versant.com/">Versant</a>, <a href="http://www.objectivity.com/">Objectivity</a>), les bases XML (<a href="http://exist-db.org/">eXist</a>, <a href="http://www.xmlmind.com/qizx/">Qizx</a>), qui bénéficieront peut-être d'un regain d'intérêt. Tant mieux. Au sujet des précurseurs, nous pouvons citer d'ailleurs <a href="http://www.oracle.com/technetwork/database/berkeleydb/overview/index.html">BerkeleyDB</a> (1986), base clé-valeur utilisée sur un nombre de projet impressionnant, et <a href="http://www.erlang.org/doc/man/mnesia.html">mnésia</a>, base de tuples/records <a href="http://www.erlang.org/">erlang</a>.</p>
<p>Grâce à ce mouvement, aux nouveaux produits, aux besoins des sites internet de gros volume, au delà du mouvement NoSQL, une nouvelle vision du stockage des données apparaît : c'est le <strong>fractionnement des modes de stockage vers une persistance aux formes multiples</strong>. La programmation polyglotte représentait le choix du meilleur langage en fonction du besoin, nous avions vu cela par exemple <a title="Alors, cette QCon 2010 ?" href="/alors-cette-qcon-2010">à la Qcon en 2010</a>. La <strong>persistance polymorphe, consiste à choisir le meilleur moyen de stockage de données en fonction de son usage</strong>, et d'en avoir éventuellement plusieurs pour un seul module applicatif.</p>
<p>Par exemple twitter <a href="http://engineering.twitter.com/2011/11/spiderduck-twitters-real-time-url.html">a créé un module de chargement de page web</a> pour les urls présentes dans les tweets. Appelé SpiderDuck, il utilise HBFS construit sur Hadoop, lui-même fondé sur Hbase, et Cassandra. HBFS sert à stocker les informations récupérées sur les sites pointés par les url. Cassandra sert à stocker les métadonnées des url. A noter également qu'ils utilisent memcached (qui est une structure de données clé/valeur en mémoire), pour cacher les fichiers robots.txt des sites.</p>
<p>D'autres fonctions d'une application paraissent assez proches des modèles proposés par ces bases. Par exemple :</p>
<ul>
<li>Redis pour le stockage de paramètres de session pour ses performances, sa simplicité et le format adapté clé/valeur</li>
<li>MongoDB pour l'aggrégation de logs car il fait du <a href="http://en.wikipedia.org/wiki/Shard_%28database_architecture%29">sharding</a> (partitionnement de données par enregistrement pour les répartir sur plusieurs serveurs). Également pour le stockage de modèle (au sens MVC) en Json</li>
<li>Neo4j pour stocker des données sociales (ex facebook avec les graphes par "amis")</li>
<li>Riak pour stocker un grand nombre de données sensibles avec réplication sur plusieurs noeuds (cf la notion de <a href="http://www.allthingsdistributed.com/2008/12/eventually_consistent.html">Eventually Consistent</a>)
</ul>
<p>Cette multiplicité technologique a un coût en complexité, comme l'introduction de plusieurs langages dans un projet. Martin Fowler l'évoque dans <a href="http://martinfowler.com/bliki/PolyglotPersistence.html">Polyglot Persistence</a>, un très bon article sur le sujet. Mais cet investissement sera remboursé par l'intégration plus aisée de ces bases avec le code, la scalabilité horizontale des données, la performance, et les possibilités offertes en terme de découplage entre différentes parties du code.</p>
<p>Récemment nous avons travaillé sur la séparation de nos binaires et de nos configurations. Nous avons cherché comment stocker les paramètres extrinsèques de nos applications (ceux qui sont gérés par les opés: urls, nom d'hôtes, ports, etc.). Nous avons exploré plusieurs possibilités (fichiers sous git, cassandra, mongodb). Nous n'avons pas encore fait le choix, mais il est peu probable que nous utilisions au final notre base mysql. En effet, le mode relationnel est assez éloigné de l'état actuel des paramètres qui sont en fichiers properties. Et puis la gestion de l'historique de nos paramètres est à faire par programmation avec ce mode de stockage (alors que certaines bases apportent cette fonction en natif).</p>
<p>Nous avons testé MongoDB qui permet de stocker du json avec plusieurs clés (en javascript) :</p>
<pre lang="javascript">db.configurations.insert({
     env: "itg",
     version: "1.0.9",
     appli: "pse",
     params: {"param1":"valeur1", "param2": "valeur2"}
});</pre>
<p>et faire des requêtes :</p>
<pre lang="javascript">
db.configurations.find({'env': 'itg'});
</pre>
<p>Autre solution que nous avons exploré, c'est Redis pour conserver des structures de données comme des listes, des sets triés, etc. Nous évitons ainsi le mapping qui existait entre les paradigmes du monde des langages de programmation et du monde relationnel. Retrouvez <a title="Une courte introduction à Redis" href="/une-courte-introduction-a-redis">une courte introduction à Redis sur barreverte</a>.</p>
<p>C'est donc de nouvelles perspectives qui sont ouvertes. Il ne s'agit pas de mettre les bases relationnelles au rebut, mais de les utiliser pour des données "froides", dont les accès sont peu fréquents ; ou encore pour des données structurées, conservées sur une durée importante, et dont nous ne connaissons pas l'usage, comme le reporting, les données décisionnelles, juridiques, financières.</p>
<p>La prochaine fois que vous avez besoin de données persistantes, à vos explorations et prototypes, utilisez la meilleure base pour votre environnement (langage de programmation utilisé, structures à stocker, expressivité et souplesse offerte par le langage de requête, utilisation d'index, architecture plateforme, etc.) ! Nous essayerons de parler plus précisément de ce sujet sur ce blog.</p>
