---
layout: post
status: publish
published: true
title: Comment ajouter un JDK 1.4 avec update-alternatives (debian like)
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: /
author_login: jp
author_email: jp@barreverte.fr
author_url: /
excerpt: Avec Ubuntu, viennnent les JDK 5 et 6. Si vous utilisez update-alternatives,
  vous pouvez d'ores et déjà changer de version à volonté. Mais comment faire si vous
  travaillez sur du code plus ancien qui nécessite une JVM 1.4  qui elle n'est pas
  installée dans votre Ubuntu ?
wordpress_id: 759
wordpress_url: /?p=759
date: !binary |-
  MjAxMC0xMi0yMiAxMDo0OTowNiArMDEwMA==
date_gmt: !binary |-
  MjAxMC0xMi0yMiAwOTo0OTowNiArMDEwMA==
categories:
- linux
tags:
- linux
- ubuntu
- debian
comments:
- id: 31
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMC0xMi0yMiAxNTowOTozMSArMDEwMA==
  date_gmt: !binary |-
    MjAxMC0xMi0yMiAxNDowOTozMSArMDEwMA==
  content: cf https://gist.github.com/751544
- id: 25727
  author: ZIADI
  author_email: medaliziedi@hotmail.com
  author_url: ''
  date: !binary |-
    MjAxMy0xMC0wOSAxMzozMTowNSArMDIwMA==
  date_gmt: !binary |-
    MjAxMy0xMC0wOSAxMjozMTowNSArMDIwMA==
  content: ! "Bonjour,\r\nOn peut aussi utiliser : sudo update-alternatives --config
    java\r\net choisir quelle version on veut (tout ça c'est bien entendu après avoir
    bien installé java)"
---
<p>Si vous utilisez une distribution Linux de type debian (comme Ubuntu), il existe un  programme formidable nommé update alternatives. Il permet de choisir  entre plusieurs versions d'un même programme, par exemple les JVM java.</p>
<p>Avec Ubuntu, viennnent les JDK 5 et 6. Si vous utilisez  <em>update-alternatives</em>, vous pouvez d'ores et déjà changer de version à  volonté. Mais comment faire si vous travaillez sur du code plus ancien  qui nécessite une JVM 1.4  qui elle n'est pas installée dans votre Ubuntu ? (c'est plus fréquent qu'on pourrait espérer). Il vous faut d'abord installer à la main cette JVM.<a id="more"></a><a id="more-759"></a></p>
<p>Je passe les étape d'installation d'une JVM Sun sur un Linux (download chez <del>Sun</del> Oracle, dépliage de l'archive, lancement du binaire etc...).</p>
<p>Le problème de java, c'est qu'il y a de nombreux binaires : <em>java</em> bien  sûr, mais aussi <em>javac</em> (le compilateur), <em>javadoc</em>, <em>rmic</em> etc… Allez faire  un tour dans le répertoire <em>bin</em> de votre installation de  <em>java</em>, il y a du monde (27 pour un JDK  1.4)</p>
<p>La commande <em>install</em> de <em>update-alternative</em>s nous indique qu'il faut  lister (avec  l'option —slave) tous les programmes qui changent. Il y en a 27,  c'est assez laborieux à faire à la main, vous en conviendrez.</p>
<p>Avant la modification :</p>
<pre>$ sudo update-alternatives --list java
/usr/lib/jvm/java-1.5.0-sun/jre/bin/java
/usr/lib/jvm/java-6-sun/jre/bin/java</pre>
<p>Rendez-vous dans le répertoire bin de votre JDK (/opt/j2sdk1.4.2_18 chez moi) et lancez-vous :</p>
<pre>sudo update-alternatives --verbose --install /usr/bin/java java
/opt/j2sdk1.4.2_18/bin/java 500 --slave /usr/share/man/man1/java.1 java.1
/opt/j2sdk1.4.2_18/man/man1/java.1
`for prog in *;  do echo --slave /usr/bin/$prog $prog
/opt/j2sdk1.4.2_18/bin/$prog; done | grep -v "java " | xargs`</pre>
<p>Nous avons donc après la modification :</p>
<pre>$ sudo update-alternatives --list java
/usr/lib/jvm/java-1.5.0-sun/jre/bin/java
/usr/lib/jvm/java-6-sun/jre/bin/java
/opt/j2sdk1.4.2_18/bin/java</pre>
<p>A l'utilisation, c'est très simple : voici comment passer en JDK 1.4 sur ma machine :</p>
<pre>sudo update-alternatives --set java /opt/j2sdk1.4.2_18/bin/java</pre>
<p>On vérifie que tout s'est bien passé en demandant à java sa version</p>
<pre>$ java -version
java version "1.4.2_18"
Java(TM) 2 Runtime Environment, Standard Edition (build 1.4.2_18-b06)
Java HotSpot(TM) Client VM (build 1.4.2_18-b06, mixed mode)</pre>
<p>On peut repasser au JDK 1.6 tout aussi facilement :</p>
<pre>sudo update-alternatives --set java /usr/lib/jvm/java-6-sun/jre/bin/java

$ java -version
java version "1.6.0_07"
Java(TM) SE Runtime Environment (build 1.6.0_07-b06)
Java HotSpot(TM) Client VM (build 10.0-b23, mixed mode, sharing)</pre>
