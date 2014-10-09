---
layout: post
status: publish
published: true
title: ! 'Bus de données : les failles dans l''architecture'
author:
  display_name: Philippe Blayo
  login: philippe
  email: philippe.blayo@gmail.com
  url: ''
author_login: philippe
author_email: philippe.blayo@gmail.com
excerpt: ! "Après avoir <a href=\"http://www.barreverte.fr/le-grain-de-sable-et-le-papillon\">basculé</a>
  vers un bus de données rabbitMQ, nous décidons de supprimer son clustering, source
  potentielle de blocages en version 1.8, et qui posait, d'après un expert, des soucis
  à la base de données mnesia sur laquelle il s'appuie.\r\n<a href=\"http://www.barreverte.fr/wp-content/uploads/2011/04/clusterRabbitPhilippeBlayo1.png\"><img
  class=\"alignnone size-full wp-image-1882\" title=\"clusterRabbitPhilippeBlayo\"
  src=\"http://www.barreverte.fr/wp-content/uploads/2011/04/clusterRabbitPhilippeBlayo1.png\"
  alt=\"\" width=\"445\" height=\"176\" /></a>\r\n\r\nNotre espoir était grand que
  cette source d'instabilité éliminée, l'architecture du bus serait enfin stable.
  Que neni !\r\n\r\nDe vils fantômes hantent les server.xml : des contextes tomcat
  inutilisés mais encore déployés leurrent la VIP (<a href=\"http://fr.wikipedia.org/wiki/Virtual_Ip_Adress\">Virtual
  IP</a>). En voulant équilibrer la charge des 14 serveurs (6 vivants et 8 fantômes)
  elle envoie 5 vivants sur un bus et 1 seul sur l'autre. Résultat : le bus surchargé
  s'effondre, nouvel incident."
wordpress_id: 1857
wordpress_url: http://www.barreverte.fr/?p=1857
date: !binary |-
  MjAxMS0wNS0xMiAxNTozMzozMiArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNS0xMiAxNDozMzozMiArMDIwMA==
categories:
- linux
- java
- architecture
tags:
- bus de données
- tcp
- pool
comments:
- id: 79
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: http://www.barreverte.fr/
  date: !binary |-
    MjAxMS0wNS0xMyAxMTo0ODoyMSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0xMyAxMDo0ODoyMSArMDIwMA==
  content: ou comment nous avons ré-appris l'utilité des pools de connexion pour parler
    à un serveur MySQL.
- id: 80
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0wNS0xNCAwODo0ODo1NSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0xNCAwNzo0ODo1NSArMDIwMA==
  content: ! "Merci pour cet article résumant bien nos problèmes de production au
    niveau du bus, avec de bonnes illustrations. \r\n\r\nNous avons à présent un bus
    stable. \r\n\r\nIl reste la haute disponibilité qui est \"manuelle\", puisque
    si un bus tombe, il faut rééquilibrer les connexions à la main. Ce sera l'occasion
    d'autres articles..."
---
<p>Après avoir <a href="http://www.barreverte.fr/le-grain-de-sable-et-le-papillon">basculé</a> vers un bus de données rabbitMQ, nous décidons de supprimer son clustering, source potentielle de blocages en version 1.8, et qui posait, d'après un expert, des soucis à la base de données mnesia sur laquelle il s'appuie.<br />
<a href="http://www.barreverte.fr/wp-content/uploads/2011/04/clusterRabbitPhilippeBlayo1.png"><img class="alignnone size-full wp-image-1882" title="clusterRabbitPhilippeBlayo" src="http://www.barreverte.fr/wp-content/uploads/2011/04/clusterRabbitPhilippeBlayo1.png" alt="" width="445" height="176" /></a></p>
<p>Notre espoir était grand que cette source d'instabilité éliminée, l'architecture du bus serait enfin stable. Que neni !</p>
<p>De vils fantômes hantent les server.xml : des contextes tomcat inutilisés mais encore déployés leurrent la VIP (<a href="http://fr.wikipedia.org/wiki/Virtual_Ip_Adress">Virtual IP</a>). En voulant équilibrer la charge des 14 serveurs (6 vivants et 8 fantômes) elle envoie 5 vivants sur un bus et 1 seul sur l'autre. Résultat : le bus surchargé s'effondre, nouvel incident.<a id="more"></a><a id="more-1857"></a><br />
<a href="http://www.barreverte.fr/wp-content/uploads/2011/04/fantomesTomcatPhilippeBlayo2.png"><img class="alignnone size-full wp-image-1899" title="fantomesTomcatPhilippeBlayo" src="http://www.barreverte.fr/wp-content/uploads/2011/04/fantomesTomcatPhilippeBlayo2.png" alt="" width="434" height="188" /></a></p>
<p>Une fois l'équilibrage de charge retrouvé la tranquillité des serveurs est troublée par une pénurie de mémoire. Le swap ne pardonne pas. Nous séparons les bus de leurs consommateurs sur des machines dédiées. Ces consommateurs java écrivent les évènements dans la base mysql. Chacun chez soi, la consommation mémoire devient exemplaire. Notre confiance n'a jamais été aussi grande.</p>
<p>Nouvelle illusion.</p>
<p><strong>Quand SQL affame les ports TCP</strong></p>
<p>Un vendredi soir où je suis d'astreinte, entre 21:35 et 21:53, j'observe 7944 exceptions :</p>
<pre>java.sql.SQLException: Unable to connect to any hosts due to exception:
java.net.SocketException: java.net.BindException: Address already in use</pre>
<p>Address already in use ? Étrange, cette erreur se produit notamment quand un port est occupé. Nous observons également via netstat un grand nombre de sockets dans l'état TIME_WAIT, état dans lequel la socket vient d'être fermée, mais n'a pas encore libéré ses ressources. Tous les ports sont-ils occupés ? Quand j'en avais parlé au responsable technique de la plateforme, il était sceptique quand à cette hypothèse : les ports dans l'état TIME_WAIT peuvent être réutilisés par de nouvelles connexions. Sauf que cette option n'est pas positionnée par défaut... En prod, la configuration du système est la suivante :</p>
<ul>
<li><code>/proc/sys/net/ipv4/tcp_tw_reuse</code> : l'option pour réutiliser les ports est désactivée</li>
<li><code>/proc/sys/net/ipv4/tcp_fin_timeout</code> : timeout de 60 secondes</li>
<li><code>/proc/sys/net/ipv4/ip_local_port_range</code> : 28000 ports disponibles (32768 à 61000)</li>
</ul>
<p>Calcul rapide : a 450 connexions par secondes, si chacune bloque en TIME_WAIT pendant 60 secondes, on atteint les 28000 ports (450 x 60) :</p>
<p><a href="http://www.barreverte.fr/wp-content/uploads/2011/04/28000connexionsPhilippeBlayo4.png"><img class="alignnone size-full wp-image-1898" title="28000connexionsPhilippeBlayo" src="http://www.barreverte.fr/wp-content/uploads/2011/04/28000connexionsPhilippeBlayo4.png" alt="" width="439" height="138" /></a><br />
Et les nouvelles connexions sql engendrent l'exception <em>Address already in use</em>.</p>
<p>Nos consommateurs ouvrent en effet une nouvelle connexion pour chaque évènement (5 millions par jours). La solution : intercaler un pool de connections sql entre consommateur et base de donnée. Le pool réutilise toujours la même connexion là où le consommateur en recréait une pour chaque requête :<br />
<a href="http://www.barreverte.fr/wp-content/uploads/2011/04/poolSqlPhilippeBlayo4.png"><img class="alignnone size-full wp-image-1900" title="poolSqlPhilippeBlayo" src="http://www.barreverte.fr/wp-content/uploads/2011/04/poolSqlPhilippeBlayo4.png" alt="" width="473" height="162" /></a><br />
En 2010, la mise en production du bus, avait fait monté la charge cpu des mysql. Nous l'avions attribué à un changement du modèle de données alors qu'il s'agissait des ouvertures / fermetures de connexions. Des tir de bench après l'ajout du pool montrent l'amélioration du temps d'insertion en base (rouge sans pool, vert avec pool) :<br />
<a href="http://www.barreverte.fr/wp-content/uploads/2011/05/impact_pool_sql_philippe_blayo1.png"><img class="alignnone size-full wp-image-1923" title="impact_pool_sql_philippe_blayo" src="http://www.barreverte.fr/wp-content/uploads/2011/05/impact_pool_sql_philippe_blayo1.png" alt="" width="640" height="300" /></a></p>
<p>Le record de traffic a été récemment pulvérisé, validant ainsi cette hypothèse sur une volumétrie de 2 millions d'évènements par heure.</p>
<p>Références : Des précisions sur les <a href="http://hea-www.harvard.edu/~fine/Tech/addrinuse.html">connexions TCP</a> dans l'état TIME_WAIT, <a href="http://www.openclipart.org/people/lemmling/lemmling_Cartoon_ghost.svg">clipart</a></p>
