---
layout: post
status: publish
published: true
title: « Rooter » android avec unrEVOked
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "<a href=\"http://unrevoked.com\"><img src=\"http://unrevoked.com/recovery/unrevoked-logo.png\"
  alt=\"Unrevoked\" width=\"490\" height=\"150\" /></a>\r\n\r\n<em>Pré Scriptum :
  les manipulations décrites ici modifient la mémoire constructeur (ou opérateur)
  du téléphone en invalidant la garantie, c'est à vous de voir si vous vous sentez
  suffisamment à l'aise pour récupérer le tir si les choses ne se passent pas comme
  prévu.</em>\r\n\r\n\"Rooter\", cet anglicisme pas très joli signifie acquérir les
  droits \"root\" soit \"racine\" à l'administration, en l'occurrence de son mobile.
  l'utilisateur \"root\" ou super-utilisateur vient du monde <a href=\"http://fr.wikipedia.org/wiki/Unix\">UNIX</a>
  qui dès le début des années 80 avait défini une politique de gestion des droits
  sur des systèmes multi-utilisateurs. Si on avait dit aux concepteurs <a href=\"http://fr.wikipedia.org/wiki/Permissions_Unix\">des
  droits utilisateurs</a> de ces machines (de type serveur) qu'ils seraient utilisés
  sur des téléphones mobiles 25 ans plus tard (à l'époque encore au stade de la recherche),
  je pense qu'ils auraient bien halluciné.\r\n"
wordpress_id: 471
wordpress_url: http://www.lagrappe.net/?p=471
date: !binary |-
  MjAxMC0xMC0xMCAyMjoyNzo0OCArMDIwMA==
date_gmt: !binary |-
  MjAxMC0xMC0xMCAyMDoyNzo0OCArMDIwMA==
categories:
- android
tags: []
comments:
- id: 19
  author: La Grappe &raquo; Changer la &laquo;&nbsp;ROM&nbsp;&raquo; de son android
  author_email: ''
  author_url: http://www.lagrappe.net/changer-la-rom-de-son-android
  date: !binary |-
    MjAxMC0xMC0xMCAyMjozMToxNiArMDIwMA==
  date_gmt: !binary |-
    MjAxMC0xMC0xMCAyMTozMToxNiArMDIwMA==
  content: ! '[...] &laquo;&nbsp;Rooter&nbsp;&raquo; android avec unrEVOked [...]'
- id: 25
  author: JP
  author_email: jp@barreverte.fr
  author_url: ''
  date: !binary |-
    MjAxMC0xMC0yMiAxNTo1ODo1OSArMDIwMA==
  date_gmt: !binary |-
    MjAxMC0xMC0yMiAxMzo1ODo1OSArMDIwMA==
  content: t'as pas essayé avec un iPhone ?
- id: 26
  author: Changer la &laquo;&nbsp;ROM&nbsp;&raquo; de son android | /dev/olu
  author_email: ''
  author_url: http://www.barreverte.fr/changer-la-rom-de-son-android
  date: !binary |-
    MjAxMC0xMC0yNCAxNTozNjoyMyArMDIwMA==
  date_gmt: !binary |-
    MjAxMC0xMC0yNCAxMzozNjoyMyArMDIwMA==
  content: ! '[...] /dev/olu   Notes de développeur sur le logiciel, le design, l&#039;agilité,
    l&#039;open source, android, linux&#8230;    Aller au contenu AccueilA propos        &larr;
    &laquo;&nbsp;Rooter&nbsp;&raquo; android avec unrEVOked [...]'
- id: 28847
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: http://www.barreverte.fr/
  date: !binary |-
    MjAxNC0wMS0zMSAxNzoyMTo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAxNC0wMS0zMSAxNjoyMTo0MiArMDEwMA==
  content: ! "Coucou, \r\nça ne marche que pour les HTC on dirait. Pour les Samsung,
    il faut passer par Cyanogen. Par exemple, pour un S4 Mini : http://wiki.cyanogenmod.org/w/Install_CM_for_serranoltexx\r\n\r\nps
    : pas encore testé"
---
<p><a href="http://unrevoked.com"><img src="/images/unrevoked-logo.png" alt="Unrevoked" width="490" height="150" /></a></p>
<p><em>Pré Scriptum : les manipulations décrites ici modifient la mémoire constructeur (ou opérateur) du téléphone en invalidant la garantie, c'est à vous de voir si vous vous sentez suffisamment à l'aise pour récupérer le tir si les choses ne se passent pas comme prévu.</em></p>
<p>"Rooter", cet anglicisme pas très joli signifie acquérir les droits "root" soit "racine" à l'administration, en l'occurrence de son mobile. l'utilisateur "root" ou super-utilisateur vient du monde <a href="http://fr.wikipedia.org/wiki/Unix">UNIX</a> qui dès le début des années 80 avait défini une politique de gestion des droits sur des systèmes multi-utilisateurs. Si on avait dit aux concepteurs <a href="http://fr.wikipedia.org/wiki/Permissions_Unix">des droits utilisateurs</a> de ces machines (de type serveur) qu'ils seraient utilisés sur des téléphones mobiles 25 ans plus tard (à l'époque encore au stade de la recherche), je pense qu'ils auraient bien halluciné.<br />
<a id="more"></a><a id="more-471"></a><br />
Sur nos téléphones dits google-phone ou encore "android" c'est un système basé sur un noyau linux qui est lui-même <a href="http://upload.wikimedia.org/wikipedia/commons/5/50/Unix_history-simple.png">apparenté à la famille des UNIX</a>. Dans ces systèmes, seul le super-utilisateur a tous les droits. Les autres utilisateurs ont les droits que veut bien leur donner le super utilisateur.</p>
<p>Sur nos téléphones, nous ne sommes pas root, nous n'avons pas tous les droits. Pour l'exécution des tâches quotidiennes, cela se comprend (c'est risqué d'exécuter des programmes avec ce super-utilisateur parce que justement, il a tous les droits, y compris celui de tout casser). Pour gérer son téléphone cela se discute.</p>
<p>Même si ces mobiles sont conçus pour ne pas êtres dévoyés de leur utilisation (encore que, là aussi on peut se demander dans quelle mesure les constructeurs ne seraient pas à l'origine de certaines fuites), des petits malins qui ne supportent pas</p>
<ul>
<li>d'être devant quelque chose qu'ils ne comprennent pas</li>
<li>d'acheter (cher), un bien dont ils n'ont pas le plein usufruit</li>
</ul>
<p>vont "craquer" ces protections. Ils vont devenir super-utilisateur et permettre à d'autres de le faire également (esprit du net).  C'est ce qu'on fait les développeurs de <a href="http://unrevoked.com">unrEVOked</a>. Derrière il y a une philosophie libertaire relative à internet cf <a href="http://www.eff.org/">http://www.eff.org/</a> pour ceux que ça intéresse. Mais ce qu'ils ont fait est bien fait :</p>
<ul>
<li>leur programme tourne très bien (pour l'utilisation que j'en ai eu). Ils sont sous git (un bon gestionnaire de version), ils indiquent au lancement le numéro de révision git du programme, ce qui permet j'imagine de corriger les bugs</li>
<li>il tourne sous linux/mac/windows</li>
<li>l'utilisation, la documentation correspond à ce qu'on promeut dans l'agilité "un logiciel opérationnel plutôt que de la documentation exhaustive"</li>
</ul>
<p>Il est possible de devenir root sur son mobile, en téléchargeant le logiciel sur le site <a href="http://unrevoked.com">unrEVOked</a> correspondant à son système d'exploitation et son mobile, puis :</p>
<ul>
<li>le lancer sur son pc : une fenêtre apparaît pour dire que le programme est en attente du mobile</li>
<li>sur le mobile :
<ul>
<li>sélectionner dans Paramètres &gt; Connexion au PC &gt; Type de connexion par défaut &gt; Charger seulement et dé-sélectionner "Me demander"</li>
<li>sélectionner Paramètres &gt; Applications &gt; Sources inconnues</li>
<li>sélectionner Paramètres &gt; Applications &gt; Développement &gt; Débogage USB</li>
</ul>
</li>
<li>brancher son mobile avec le câble USB</li>
<li>attendre (jusqu'à 10mn)</li>
<li>a la fin vous devriez être en mode "recovery" il faut sélectionner "reboot" avec volume+/volume- et valider avec le trackball</li>
</ul>
<p>Votre module de recovery a été flashé par unrEVOked et <a href="http://www.clockworkmod.com">clockworkmod</a> a été installé.</p>
<p>Vous devriez alors voir apparaître l'application "super-utilisateur" que vous n'aviez pas<br />
<img class="aligncenter size-full wp-image-520" title="Superuser" src="/images/Superuser.jpg" alt="Superuser" width="51" height="49" /></p>
<p>J'ai trouvé toutes ces informations sur les forums android comme <a href="http://forum.frandroid.com/">http://forum.frandroid.com/</a>, vous aurez toutes les ressources pour en savoir plus.</p>
