---
layout: post
status: publish
published: true
title: Lenteurs MySQL sous linux (ext4)
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
wordpress_id: 463
wordpress_url: http://www.lagrappe.net/?p=463
date: !binary |-
  MjAxMC0wOC0xMSAxNToyNDo0NiArMDIwMA==
date_gmt: !binary |-
  MjAxMC0wOC0xMSAxMzoyNDo0NiArMDIwMA==
categories:
- mysql
- linux
- admin
tags: []
comments:
- id: 42
  author: PA
  author_email: poulpillusion@free.fr
  author_url: ''
  date: !binary |-
    MjAxMS0wMS0yMSAxODoyNDowNyArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMS0yMSAxNzoyNDowNyArMDEwMA==
  content: Hum, je ne suis pas sur d'avoir tout compris, mais n'est il pas plus intéressant
    de rester en ext3 du coup ?
- id: 43
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wMS0yMSAxOTowMzo0OSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMS0yMSAxODowMzo0OSArMDEwMA==
  content: ! "Non, je pense qu'il vaut mieux passer en ext4 (qui est tout de même
    bien meilleur de ext3) mais de faire attention à la partition incriminée. \nJ'ai
    pour ma part une partition séparée pour MySQL que j'ai paramétrée correctement,
    tout mon système est en ext4 \"normal\"."
- id: 77
  author: Philippe Blayo
  author_email: philippe.blayo@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNS0wMSAyMDowOTo0NyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0wMSAxOTowOTo0NyArMDIwMA==
  content: ! 'Les parenthèses autour des options peuvent poser problème : j''ai du
    faire un "mount -o remount,rw /dev/sda5 /" car / ne se montait plus au démarage
    (ce qui pose problème pour retirer les parenthèses fautives de /etc/fstab).'
- id: 312
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0xMS0yMiAxNzo0MToxOSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMS0yMiAxNjo0MToxOSArMDEwMA==
  content: ! 'je reviens sur mon affirmation précédente : mon poste va beaucoup plus
    vite depuis que je suis revenu en ext3...'
---
<p>Il y a quelques temps, nous avons constaté dans notre équipe des lenteurs très importantes lorsque nous faisions tourner nos tests unitaires. Le déroulement global qui prend entre 5 et 8 minutes (selon les machines), passait à 30 minutes voire plus.</p>
<p>La cause de ces lenteurs était l'utilisation d'un sytème de fichier en ext4 avec mysql suite à de nouvelles installations d'ubuntu. En effet, en ext4, une fonctionnalité ayant pour but de maintenir une meilleure intégrité des données a été activée par défaut, il s'agit des "write barriers". Pour contourner le problème il suffit de désactiver ces write barriers sur les montages utilisés par mysql (ici /opt) dans /etc/fstab : </p>
<pre language="bash">
/dev/sda2 on /opt type ext4 rw,barrier=0
</pre>
<p>Cf : </p>
<ul>
<li><a href="http://bugs.mysql.com/bug.php?id=46959">http://bugs.mysql.com/bug.php?id=46959</a></li>
<li><a href="http://www.tedman.com/techie-notes/fedora12onthinkpadx61s">http://www.tedman.com/techie-notes/fedora12onthinkpadx61s</a></li>
</ul>
<p>Edit : suppression des parenthèses après la remarque de Philippe</p>
