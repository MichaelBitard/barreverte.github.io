---
layout: post
status: publish
published: true
title: Quelques commandes SVN utiles
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: http://www.barreverte.fr/
author_login: jp
author_email: jp@barreverte.fr
author_url: http://www.barreverte.fr/
excerpt: ! '<span style="font-size: 16px; color: #444444; line-height: 24px;">Eh oui,
  la grande mode est à <a href="http://git-scm.com/" target="_blank">git</a>, mais
  nous sommes encore nombreux à (être obligés d'')utiliser <a href="http://subversion.apache.org/"
  target="_blank">subversion</a>, au travail par exemple. C''est mon cas. Comme j''ai
  une toute petite tête et que je préfère utiliser mes outils en ligne de commande,
  je note régulièrement les petites <em>astuces</em> avec svn. En voici certaines
  :'
wordpress_id: 1803
wordpress_url: http://www.barreverte.fr/?p=1803
date: !binary |-
  MjAxMS0wNC0xNSAxNDo0OTozNCArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNC0xNSAxMzo0OTozNCArMDIwMA==
categories:
- shell
tags:
- svn
- astuce
comments:
- id: 72
  author: Jean-Baptiste Potonnier
  author_email: jean.baptiste.potonnier@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNC0xNSAxOTozMDozMyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0xNSAxODozMDozMyArMDIwMA==
  content: ! "Merci Jean-Philippe de nous rappeler les base d'un outils que l'on utilise
    tous les jours.\r\nIl me semble effectivement important de maitriser ce que l'on
    fait!\r\n\r\nAu fait, j'en profite pour rappeler qu'il est dangereux de renommer
    des fichiers en changeant juste la casse, sous certains OS...\r\n\r\nIl est également
    périlleux de renommer/déplacer plusieurs fois le même fichier, sans commit intermédiaire.\r\n\r\nComme
    moi ce matin , vous décrocherez le gros lot en faisant de même avec des répertoires
    entiers. Et découvrirez alors les joies des \"conflicts\", \"tree conflict\"  etc.\r\n\r\nVous
    serez alors contraint de (re) decouvrir certaines commandes à base de \"resolve\",
    \ \"cleanup\", ou bien de supprimer vos fichiers en espérant retrouver un état
    stable. \r\n\r\nPersonnellement la leçon que je retiendrai est que parfois, il
    est plus simple de jeter sa working copy, de refaire un checkout, puis de refaire
    ses modifications de manière plus intelligente."
- id: 73
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: http://www.barreverte.fr/
  date: !binary |-
    MjAxMS0wNC0xNSAyMzoxMToxOCArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0xNSAyMjoxMToxOCArMDIwMA==
  content: ! "Jean-Baptiste, ta dernière remarque est tout a fait pertinente, et on
    oublie parfois que c'est très simple de procéder ainsi (rm -rf; svn co).\r\nSous
    git, c'est encore plus facile : à partir du moment où tu fais toutes tes modifications
    dans une branche, il est facile et sans impact de jeter cette branche en cas d'erreur.
    Luxe supplémentaire, la plupart des opérations que tu as citées et qui posent
    problème sous svn se déroulent très bien sous git. Mais 10 ans séparent ces 2
    technologies."
---
<p><span style="font-size: 16px; color: #444444; line-height: 24px;">Eh oui, la grande mode est à <a href="http://git-scm.com/" target="_blank">git</a>, mais nous sommes encore nombreux à (être obligés d')utiliser <a href="http://subversion.apache.org/" target="_blank">subversion</a>, au travail par exemple. C'est mon cas. Comme j'ai une toute petite tête et que je préfère utiliser mes outils en ligne de commande, je note régulièrement les petites <em>astuces</em> avec svn. En voici certaines :<a id="more"></a><a id="more-1803"></a></span></p>
<h2>Checkout à une date donnée</h2>
<pre>svn checkout --revision {2002-02-17} url</pre>
<h2>Merge d'un commit depuis une branche</h2>
<p>Pourn réaliser cela, il faut disposer :</p>
<ul>
<li> du ou des numéros de commit (avec <em>svn log</em>)</li>
<li> de l'url de la branche d'origine où le commit a été réalisé (<em>svn info</em>)</li>
<li>... de patience car les merge sont souvent un parcours semé d’embûches sous svn</li>
</ul>
<p>Par exemple, pour merger le commit 1000.</p>
<pre>cd ~/destination/du/merge
svn merge -r999:1000 http://url/de/la/branche/ .</pre>
<p>Pour un seul commit, on peut préférer l'option -c (comme <em>change</em>) :</p>
<pre>svn merge -c1000 http://url/de/la/branche/ .</pre>
<p>Pour plusieurs commit, c'est presque pareil. Ainsi, pour le merge du commit 1000 à 1010 :</p>
<pre>svn merge -r999:1010 http://url/de/la/branche/ .</pre>
<h2>Revert d'un commit</h2>
<p>C'est un merge inversé. Pour cela, il faut disposer du numéro de commit (<em>svn log</em>).</p>
<p>Par exemple, pour faire un revert du commit numéro 12 :</p>
<pre> svn merge -r12:11 .</pre>
<p>SVN nous informe qu'il s'agit d'une fusion inverse :</p>
<pre>--- Fusion inverse de r12 dans '.' :
M   chemin/fichier/modifie/fichier.txt</pre>
<p>Il ne vous reste plus qu'à vérifier ce qui change (<em>svn status</em>) et de le commiter.</p>
<h2>Find en évitant les .svn</h2>
<pre>find . -name "pattern" -not -path "*svn" -exec maCommande {} \;</pre>
<p>Sinon, il y a <a href="http://betterthangrep.com/" target="_blank">ack</a> qui est bien meilleur de grep. Il évite tout seul les .svn et autres fichiers embêtants.</p>
<p><span style="font-family: Georgia, 'Times New Roman', 'Bitstream Charter', Times, serif; font-size: 13px; line-height: 19px;"> </span></p>
<hr />
<p>Et vous, quelles sont vos astuces svn ?</p>
