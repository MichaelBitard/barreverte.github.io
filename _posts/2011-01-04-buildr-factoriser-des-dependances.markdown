---
layout: post
status: publish
published: true
title: ! 'Buildr : factoriser des dépendances'
author:
  display_name: Philippe Blayo
  login: philippe
  email: philippe.blayo@gmail.com
  url: ''
author_login: philippe
author_email: philippe.blayo@gmail.com
excerpt: "<a href=\"http://buildr.apache.org\">Buildr</a> utilise les conventions
  et les repos maven. Pour un projet spring-mvc qui utilise également spring-jdbc,
  cela fait beaucoup de dépendances. Heureusement, <code>Buildr::group</code> permet
  de les rassembler par groupId :\r\n<pre lang=\"ruby\">SPRING_3 = Buildr::group('spring-core',
  'spring-asm', 'spring-web',\r\n'spring-webmvc', 'spring-context', 'spring-beans',\r\n'spring-expression',
  'spring-jdbc',\r\n'spring-tx',\r\n:under=&gt;'org.springframework', :version=&gt;'3.0.5.RELEASE')</pre>\r\n(<code>:under=&gt;'org.springframework'</code>
  factorise le groupid)\r\n\r\n"
wordpress_id: 869
wordpress_url: http://www.barreverte.fr/?p=869
date: !binary |-
  MjAxMS0wMS0wNCAxNDozODoxNSArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMS0wNCAxMzozODoxNSArMDEwMA==
categories:
- java
- buildr
tags:
- buildr
- buildfile
comments:
- id: 35
  author: Philippe Blayo
  author_email: philippe.blayo@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wMS0wNiAxNzo1MDoxNiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMS0wNiAxNjo1MDoxNiArMDEwMA==
  content: Après une migration de buildr, cet alias permet de travailler en parralèle
    sur une branche en buildr 1.3 et une branche en buildr 1.4.
- id: 144
  author: Conférence Agile France 2011 | Barre Verte !
  author_email: ''
  author_url: http://www.barreverte.fr/conference-agile-france-2011
  date: !binary |-
    MjAxMS0wNS0yNCAxOTowNDowOSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0yNCAxODowNDowOSArMDIwMA==
  content: ! '[...] Buildr : factoriser des dépendances [...]'
---
<p><a href="http://buildr.apache.org">Buildr</a> utilise les conventions et les repos maven. Pour un projet spring-mvc qui utilise également spring-jdbc, cela fait beaucoup de dépendances. Heureusement, <code>Buildr::group</code> permet de les rassembler par groupId :</p>
<pre lang="ruby">SPRING_3 = Buildr::group('spring-core', 'spring-asm', 'spring-web',
'spring-webmvc', 'spring-context', 'spring-beans',
'spring-expression', 'spring-jdbc',
'spring-tx',
:under=&gt;'org.springframework', :version=&gt;'3.0.5.RELEASE')</pre>
<p>(<code>:under=&gt;'org.springframework'</code> factorise le groupid)</p>
<p><a id="more"></a><a id="more-869"></a>Cette factorisation facilite le changement de version dans le buildfile : pour repasser à spring 2.5.6, il suffit de changer <code>:version=&gt;'3.0.5.RELEASE'</code> en</p>
<pre lang="ruby">:version=&gt;'2.5.6'</pre>
