---
layout: post
status: publish
published: true
title: Un bus de données pour les statistiques
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Nous maintenons une application WEB grand public développée en JEE avec
  de fortes exigences en terme de volume de statistiques. Récemment, une nouvelle
  demande de modification d'architecture de la plateforme par notre client, combinée
  à de nouveaux objectifs de fréquentation nous a poussé à remettre en cause la gestion
  de ces statistiques.\r\n\r\nL'application en elle-même devait rester iso-fonctionnelle,
  il s'agissait en quelque sorte d'un<em> refactoring d'architecture</em>.\r\n"
wordpress_id: 930
wordpress_url: http://www.barreverte.fr/?p=930
date: !binary |-
  MjAxMS0wMS0wNiAwOToxMDowMSArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMS0wNiAwODoxMDowMSArMDEwMA==
categories:
- java
- refactoring
- architecture
tags:
- bus de données
- AMQP
- JMS
- statistiques
- scalabilité
comments: []
---
<p>Nous maintenons une application WEB grand public développée en JEE avec de fortes exigences en terme de volume de statistiques. Récemment, une nouvelle demande de modification d'architecture de la plateforme par notre client, combinée à de nouveaux objectifs de fréquentation nous a poussé à remettre en cause la gestion de ces statistiques.</p>
<p>L'application en elle-même devait rester iso-fonctionnelle, il s'agissait en quelque sorte d'un<em> refactoring d'architecture</em>.<br />
<a id="more"></a><a id="more-930"></a><br />
Les contraintes techniques étaient les suivantes :</p>
<ul>
<li>volumétrie importante : environ 10 millions d'événements par jour, puis 12 fois plus à moyen terme</li>
<li>aucun impact sur le service en terme de performance (traitements asynchrones)</li>
<li>aucune perte de données, même en mode dégradé (perte de la base de données par exemple)</li>
<li>exploitation aisée et transparence de la solution</li>
</ul>
<p>Les aspects suivants nous ont fait pencher pour une solution de type bus de données :</p>
<ul>
<li>les statistiques de notre service correspondent à des évènements indépendants</li>
<li>l'asynchronisme des traitements</li>
<li>le découplage nécessaire avec les applicatifs de façade (les webapps) pour les performances, ainsi qu'avec la base de données pour la haute disponibilité</li>
<li>les difficultés rencontrées lors de la refonte précédente des statistiques avec des solutions "maison", en terme de maintenance et d'administration</li>
</ul>
<p>Nous avons répertorié 3 types de bus :</p>
<ul>
<li>un bus issu de spécifications d'API : JMS (<a href="http://fr.wikipedia.org/wiki/Java_Message_Service">Java Message Service</a>)</li>
<li>un bus issu de spécifications de protocole : AMQP (<a href="http://fr.wikipedia.org/wiki/Advanced_Message_Queuing_Protocol">Advanced Message Queuing Protocol</a>)</li>
<li>un bus maison, basé sur nos besoins</li>
</ul>
<p>Ce bus de données est maintenant en production et répond aux attentes (avec des petits ajustements restant à faire). Une série d'articles vous expliquera les étapes parcourues depuis le choix de la solution jusqu'à sa mise en production.</p>
