---
layout: post
status: publish
published: true
title: ! 'Créer un chroot (part. 2) : se connecter'
author:
  display_name: Philippe Blayo
  login: philippe
  email: philippe.blayo@gmail.com
  url: ''
author_login: philippe
author_email: philippe.blayo@gmail.com
wordpress_id: 849
wordpress_url: /?p=849
date: !binary |-
  MjAxNC0wNC0yMiAyMjozNDoxOSArMDIwMA==
date_gmt: !binary |-
  MjAxNC0wNC0yMiAyMTozNDoxOSArMDIwMA==
categories:
- linux
tags:
- chroot mount
comments:
- id: 30362
  author: ! 'Créer un chroot (part. 1) : un linux de base | Barre Verte !'
  author_email: ''
  author_url: /creer-un-chroot-part-1-un-linux-de-base
  date: !binary |-
    MjAxNC0wNC0yMyAxNTowODowMSArMDIwMA==
  date_gmt: !binary |-
    MjAxNC0wNC0yMyAxNDowODowMSArMDIwMA==
  content: ! '[&#8230;] &larr; Lean Agile Camp : la valeur avance masquée Créer un
    chroot (part. 2) : se connecter &rarr; [&#8230;]'
---
<p>Dans un précédent <a href="/creer-un-chroot-part-1-un-linux-de-base">billet</a>, nous avons créé un linux de base. Son arborescence a maintenant besoin d'être rattachée à la machine sur laquelle elle va s'exécuter. Pour cela nous allons répliquer les pseudo-systèmes de fichier /dev /proc et /sys déjà présents sur la machine :</p>
<ul>
<ul>
<li>/proc contient les infos sur les processus en train de tourner</li>
<li>/sys contient des informations système sur comment créer les périphériques (numéros de séries...)</li>
<li>/dev contient les fichiers d'accès aux périphériques eux-même (recréés dynamiquement par udev à chaque redémarage à partir des infos de /sys)</li>
</ul>
</ul>
<p>Le fichier complet</p>

{% gist bamthomas/11221780 %}
