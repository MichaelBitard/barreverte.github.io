---
layout: post
status: publish
published: true
title: Bus de données, prototypage et infrastructures disponibles
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Une fois identifiée une catégorie de solution (un bus de données) répondant
  au besoin du client, nous abordons un problème complexe, les solutions seront structurantes
  pour le logiciel et difficiles à remettre en cause. Nous sommes devant un <em>choix
  d'architecture</em>.\r\n\r\nNous savons que ce choix nécessitera des développements
  longs, et que nous devons quand même être capable de mettre en production des changements
  fonctionnels mineurs pendant ce laps de temps. Donc soit nous sommes capable de
  faire une implémentation progressive de la solution, soit nous faisons une branche
  logicielle.\r\n"
wordpress_id: 896
wordpress_url: http://www.barreverte.fr/?p=896
date: !binary |-
  MjAxMS0wMS0yNSAxNjoxODowNSArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMS0yNSAxNToxODowNSArMDEwMA==
categories:
- agilité
- architecture
tags:
- bus de données
comments:
- id: 145
  author: Conférence Agile France 2011 | Barre Verte !
  author_email: ''
  author_url: http://www.barreverte.fr/conference-agile-france-2011
  date: !binary |-
    MjAxMS0wNS0yNCAxOTowNDoyNSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0yNCAxODowNDoyNSArMDIwMA==
  content: ! '[...] Bus de données, prototypage et infrastructures disponibles [...]'
---
<p>Une fois identifiée une catégorie de solution (un bus de données) répondant au besoin du client, nous abordons un problème complexe, les solutions seront structurantes pour le logiciel et difficiles à remettre en cause. Nous sommes devant un <em>choix d'architecture</em>.</p>
<p>Nous savons que ce choix nécessitera des développements longs, et que nous devons quand même être capable de mettre en production des changements fonctionnels mineurs pendant ce laps de temps. Donc soit nous sommes capable de faire une implémentation progressive de la solution, soit nous faisons une branche logicielle.<br />
<a id="more"></a><a id="more-896"></a><br />
Le contexte, et la volonté de limiter les risques inhérents à la décision impliquent les contraintes suivantes :</p>
<ol>
<li>Nous faisons ce choix le plus tard possible, afin de retarder le point de non retour, et éventuellement avoir de nouvelles informations qui pourraient guider notre choix</li>
<li>Nous voulons prouver que la solutions choisie répond aux exigences du client : pas d'impact sur les performances du service, pas de perte de statistiques, pas de SPOF (single point of failure), possibilité de pouvoir suivre la croissance du site (scalabilité horizontale), QoS du temps d'insertion en base &lt; 10s</li>
<li>Nous voulons avoir des alternatives, pour comparer sur des critères objectifs : difficulté de mise en œuvre, nombre de lignes de code, comportement de la solution en charge, adhérence de la technologie, contraintes d'exploitation</li>
<li>Nous avons une date limite de prise de décision fixe sans quoi le planning prévu ne sera pas tenable</li>
</ol>
<p>Nous avons aussi des atouts :</p>
<ul>
<li>une équipe qui commence à se constituer et qui est solidaire</li>
<li>des développeurs compétents</li>
<li>des infrastructures techniques nous permettant de limiter les risques :</li>
<ul>
<li>des tests d'acceptance (sous fitnesse) et d'intégration (junit) sur les statistiques, nous assureront le contrôle des non régressions</li>
<li>une plateforme de bench quasiment iso-production pour mesurer le comportement en charge des spikes</li>
</ul>
<li>une équipe système à proximité pour nous aider</li>
</ul>
<p>Nous abandonnons assez rapidement la solution "maison", d'une part car la difficulté d'implémentation est importante, et nous ne voyons pas comment arriver à la fin de la période de spike avec une solution "fonctionnelle". D'autre part, car la problématique du bus de données, est implémentée dans plusieurs produits arrivés à maturité. </p>
<p>Nous choisissons d'évaluer : </p>
<ol>
<li><a href="http://activemq.apache.org/">ActiveMQ</a>, broker JMS open source reconnu et utilisé dans notre société</li>
<li><a href="http://www.rabbitmq.com/">RabbitMQ</a>, broker AMQP en <a href="http://www.erlang.org/">erlang</a>, dont nous avions beaucoup entendu parler à la QCon</li>
<li><a href="http://qpid.apache.org/">Qpid</a>, autre boker AMQP de la fondation apache</li>
</ol>
<p><em>edit le 25/01/2011 : reformulation de la première phrase</em></p>
