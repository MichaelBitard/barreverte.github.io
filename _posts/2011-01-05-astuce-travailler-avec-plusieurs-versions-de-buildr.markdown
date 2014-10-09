---
layout: post
status: publish
published: true
title: ! 'Astuce : travailler avec plusieurs versions de buildr'
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: http://www.barreverte.fr/
author_login: jp
author_email: jp@barreverte.fr
author_url: http://www.barreverte.fr/
excerpt: ! "<a href=\"http://buildr.apache.org/\">Buildr</a> est un outil écrit en
  ruby qui se substitue à maven. L'installation passe par ruby-gems, aussi il est
  facile de changer la version d'une gem qu'on utilise en lui passant la version entre
  deux underscores :\r\n<code>maGem _uneAutreVersion_ faitQuelqueChose</code>.\r\n\r\n"
wordpress_id: 913
wordpress_url: http://www.barreverte.fr/?p=913
date: !binary |-
  MjAxMS0wMS0wNSAxMDoxMDo0OSArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMS0wNSAwOToxMDo0OSArMDEwMA==
categories:
- shell
- buildr
tags:
- buildr
- ruby
- gems
- build
comments:
- id: 81
  author: Conférence Agile France 2011 | Barre Verte !
  author_email: ''
  author_url: http://www.barreverte.fr/conference-agile-france-2011
  date: !binary |-
    MjAxMS0wNS0xNSAxNjoxNDo1MyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0xNSAxNToxNDo1MyArMDIwMA==
  content: ! '[...] Astuce : travailler avec plusieurs versions de buildr [...]'
---
<p><a href="http://buildr.apache.org/">Buildr</a> est un outil écrit en ruby qui se substitue à maven. L'installation passe par ruby-gems, aussi il est facile de changer la version d'une gem qu'on utilise en lui passant la version entre deux underscores :<br />
<code>maGem _uneAutreVersion_ faitQuelqueChose</code>.</p>
<p><a id="more"></a><a id="more-913"></a>En combinant cette facilité avec la possibilité offerte par les alias du shell, c'est très rapide pour changer rapidement la version de buildr utilisée. Ainsi, je suis actuellement en cours de migration de notre build de buildr 1.3.5 vers buildr 1.4.4, mais je n'ai pas fini mon travail et j'ai besoin de changer de version pour faire une release rapide sur une branche :</p>
<pre lang="bash">$ buildr --version
Buildr 1.4.4
$ alias buildr='buildr _1.3.5_'
$ buildr --version
Buildr 1.3.5</pre>
<p>Le retour arrière se fait par la destruction pure et simple de l'alias :</p>
<pre lang="bash">$ buildr --version
Buildr 1.3.5
$ unalias buildr
$ buildr --version
Buildr 1.4.4</pre>
<p>Et voilà ! Vous êtes paré pour de nouvelles expérimentations.</p>
