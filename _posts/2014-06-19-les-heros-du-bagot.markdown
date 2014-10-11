---
layout: post
status: publish
published: true
title: Les héros du bagot
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
wordpress_id: 3230
wordpress_url: /?p=3230
date: !binary |-
  MjAxNC0wNi0xOSAwODowMTo1MCArMDIwMA==
date_gmt: !binary |-
  MjAxNC0wNi0xOSAwNzowMTo1MCArMDIwMA==
categories:
- agilité
- tests
tags:
- heros du bagot
comments:
- id: 31320
  author: Florence
  author_email: flocha2000-agile@yahoo.fr
  author_url: ''
  date: !binary |-
    MjAxNC0wNi0xOSAyMjo0NjoxMiArMDIwMA==
  date_gmt: !binary |-
    MjAxNC0wNi0xOSAyMTo0NjoxMiArMDIwMA==
  content: J'ai hâte de lire la suite :-)
---
<p><a href="/images/hudson_trends.png"><img class="size-full wp-image-3250 alignright" alt="hudson_trends" src="/images/hudson_trends.png" width="322" height="281" /></a></p>
<p>Cela fait 6 ans que nous faisons des tests fonctionnels (ou d'acceptance). Tests <a href="http://www.fitnesse.org/">FitNesse</a>, <a href="http://www.greenpeppersoftware.com/">GreenPepper</a>, <a href="http://www.concordion.org/">Concordion</a> avec ou sans IHM (<a href="http://docs.seleniumhq.org/">Selenium</a> par ex). Une chose reste constante, c'est la difficulté de stabiliser ces tests. Les approches sur le sujet dans les conférences sont variées, mais l'énergie mise dans la maintenance de ces tests semble toujours importante.</p>
<p>Le défi est double : avoir des tests qui s'exécutent rapidement, et dont la stabilité permet de détecter de manière certaine les régressions fonctionnelles. Ce que nous constatons sur les 4 projets qui ont mis en oeuvre des tests d'acceptance, c'est que le non-déterminisme de la plupart des tests provoque des bagotements (<em>flaky tests</em>). Tant et si bien que nous avons donné un nom à ces défauts de déterminisme : les bagots. Le soucis avec ces bagots, c'est qu'ils empêchent de décider si un test est rouge pour une bonne raison (une régression), ou pour une mauvaise raison (typiquement une mauvaise séquence d'accès concurrents du test).</p>
<p>Ces tests sont "probabilistes" : lorsque l'ordonnanceur partage équitablement le temps entre les différentes unités de calculs (process, threads), le test est vert. Avec une machine lente ces tests sont plus fréquemment rouges. Une sélection inattendue de ses maigres ressources provoquerait le même comportement. Dans une équipe avec le même environnement de développement (garanti par l'utilisation d'une image en chroot), le développeur ayant la plus mauvaise machine a le plus de chance de reproduire les bagots : un événement reste trop longtemps dans un bus de données, un réplicant mongoDB "laggue" alors que nous allons y lire une valeur... le test est rouge.</p>
<p>Il existe une multitude de manière de reconnaître ces tests. Un fort "<em>smell</em>" est constituée par l'utilisation d'un <em>sleep</em> : nous sommes alors dans le monde du test probabiliste. Le test est rouge ? Passons l'attente de 1 à 5 secondes. Allez, 10 secondes pour être sûr. Ça ne vous dit rien ? On me dit <a href="http://www.extremeprogramming.org/values.html">Courage</a> ? Non, jamais entendu parler : supprimer ces 5 lettres suivies d'un entier est souvent un "refactoring" qui aura des répercussions profondes.</p>
<p>Sur notre dernier projet, nous avons beaucoup de code javascript exécuté dans le navigateur. L'ergonomie en est largement améliorée, mais la gageure des tests d'acceptance est encore plus grande. Nous avons parfois passé plusieurs jours, plusieurs semaines avant de résoudre un bagot (et parfois même échoué). Alors pour les héros qui ont pris leur courage à deux mains, et ont stabilisé ces tests, nous allons vous raconter leurs histoires, des histoires de bagots.</p>
