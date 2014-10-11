---
layout: post
status: publish
published: true
title: Les NullPointerException doivent-elles mourir ?
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "La lecture de cet billet : <a href=\"http://radar.oreilly.com/2010/11/developer-week-in-review-6.html\">Editorial:
  NPEs must die</a>, m'a posé une nouvelle fois la question de la programmation défensive.
  Dans son éditorial, l'auteur nous explique qu'en java une <code>NullPointerException</code>
  ne casse pas le système, ce qui pousse les programmeurs fainéants (et trop le sont
  :( ), à ne rien faire. Il nous dit ensuite :\r\n<blockquote>\r\nThis is just plain
  bad coding. An NPE tells you almost nothing about what really went wrong. Instead,
  Java developers should check objects before invoking methods on them, and throw
  a more specific and meaningful runtime exception, such as an IllegalArgumentException,
  with details about what value was incorrect.\r\n</blockquote>\r\n\r\nRien à dire
  sur le principe de guidage en indiquant précisément le problème (quelle valeur n'est
  pas bonne et pourquoi). En revanche, \"check objects before invoking methods on
  them\" amène à la programmation défensive. \r\n"
wordpress_id: 649
wordpress_url: /?p=649
date: !binary |-
  MjAxMC0xMS0yOCAyMDozOToyNCArMDEwMA==
date_gmt: !binary |-
  MjAxMC0xMS0yOCAxODozOToyNCArMDEwMA==
categories:
- java
tags: []
comments:
- id: 27
  author: Philippe Blayo
  author_email: philippebmail-book@yahoo.fr
  author_url: ''
  date: !binary |-
    MjAxMC0xMi0wMSAxMTozOTo1NiArMDEwMA==
  date_gmt: !binary |-
    MjAxMC0xMi0wMSAwOTozOTo1NiArMDEwMA==
  content: Content que tu cites le pattern null object ;-) qui constitue une alternative
    à la programmation défensive... Un an après que je l'ai introduit sur le projet,
    quelle est ton opinion à son sujet ?
---
<p>La lecture de cet billet : <a href="http://radar.oreilly.com/2010/11/developer-week-in-review-6.html">Editorial: NPEs must die</a>, m'a posé une nouvelle fois la question de la programmation défensive. Dans son éditorial, l'auteur nous explique qu'en java une <code>NullPointerException</code> ne casse pas le système, ce qui pousse les programmeurs fainéants (et trop le sont :( ), à ne rien faire. Il nous dit ensuite :</p>
<blockquote><p>
This is just plain bad coding. An NPE tells you almost nothing about what really went wrong. Instead, Java developers should check objects before invoking methods on them, and throw a more specific and meaningful runtime exception, such as an IllegalArgumentException, with details about what value was incorrect.
</p></blockquote>
<p>Rien à dire sur le principe de guidage en indiquant précisément le problème (quelle valeur n'est pas bonne et pourquoi). En revanche, "check objects before invoking methods on them" amène à la programmation défensive.<br />
<a id="more"></a><a id="more-649"></a><br />
Prenons une fonction qui indique si une chaine de caractères est contenue deux fois dans une autre. Une implémentation possible serait :</p>
<pre lang="java">
public static boolean contientDeuxFois(
     String contenant, 
     String contenueDeuxFois) {
     return contenant.indexOf(contenueDeuxFois, 
            contenant.indexOf(contenueDeuxFois)) != -1;
}
</pre>
<p>Si je suis ce que préconise l'auteur, j'ajoute un bloc : </p>
<pre lang="java">
if (contenant == null) {
     throw new IllegalArgumentException("contenant blah blah...");
}
if (contenueDeuxFois == null) {
     throw new IllegalArgumentException("contenueDeuxFois blah...");
}
</pre>
<p><strong>Où est le problème ?</strong><br />
1) on <strong>augmente le nombre de lignes</strong>, sans avoir beaucoup de valeur ajoutée. Car nous aurons une <code>IllegalArgumentException</code> avec une stacktrace :</p>
<pre lang="java">
java.lang.IllegalArgumentException: contenant blah..
	at MaClasse.contientDeuxFois(MaClasse.java:35)
	at MaClasseTest.testContient(MaClasseTest.java:39)
...
</pre>
<p>au lieu d'une <code>NullPointerException</code> : </p>
<pre lang="java">
java.lang.NullPointerException
	at java.lang.String.indexOf(String.java:1733)
	at java.lang.String.indexOf(String.java:1715)
	at MaClasse.contientDeuxFois(MaClasse.java:35)
	at MaClasseTest.testcontientDeuxFois(MaClasseTest.java:39)
...
</pre>
<p>Le soucis n'est pas tant l'exception que ce qu'on indique dans le message. On aurait pu aussi lancer une <code>NullPointerException</code> avec le même message on aurait eu la fonction, la ligne, et on avait une information supplémentaire par le nom de l'exception. </p>
<p>Il est bon également de savoir lire une stacktrace pour en extraire l'information nécessaire à comprendre rétrospectivement ce qu'il s'est passé. Ici, c'est comprendre que nous sommes dans les deux premières lignes de la stacktrace dans la classe <code>String.indexOf()</code> de java. Donc c'est bien la chaine <code>contenueDeuxFois</code> qui était nulle. Sinon nous aurions eu une <code>NullPointerException</code> directement sur la ligne 35 de <code>MaClasse</code>, et pas dans <code>indexOf</code> de <code>String</code>.</p>
<p>2) <strong>Risques de duplication</strong> : dans un programme important, il est tout à fait possible que le cas du null ait été traité plus haut, on n'a pas forcément la connaissance de tous les chemins parcourus jusqu'à cette méthode. Par conséquent, si cette pratique défensive est généralisée dans une équipe, il est fortement probable qu'à de multiples endroits dans le code on retrouve des tests de nullité similaires. </p>
<p>3) il n'y a <strong>pas de réflexion métier</strong>. Quand on développe en TDD une fonction comme celle-ci, à un moment on va se demander "<em>et si contenant est nulle, et si <code>contenueDeuxFois</code> est nulle, que doit renvoyer la fonction ?</em>". Par exemple si l'une ou l'autre des chaines est nulle, d'un point de vue métier la fonction peut renvoyer false (l'implémentation est plus simple dans ce cas, car on a qu'un seul <code>if</code>).</p>
<p><strong>Quelles sont les solutions</strong> ?</p>
<ul>
<li>la fonction peut renvoyer une valeur qui du point de vue métier est cohérente avec le cas d'une entrée nulle</li>
<li>la fonction peut renvoyer un NullPointer envoyée explicitement avec un message clair</li>
<li>la fonction peut renvoyer une exception métier explicite qui hérite de <code>NullPointerException</code> ou <code>IllegalArgumentException</code> et qui donnera une information métier</li>
<li>dans l'ensemble du programme on peut choisir pour des objets complexes le <a href="http://en.wikipedia.org/wiki/Null_Object_pattern">pattern null object</a></li>
<li>la fonction peut envoyer une autre exception java qui donne une meilleure information (cas de l'<code>IllegalArgumentException</code>, <code>IllegalStateException</code> si l'état d'un objet est corrompu par une valeur nulle, etc.)</li>
<li>éventuellement, la fonction peut laisser remonter une <code>NullPointerException</code> si le développeur pense qu'elle sera facile à interpréter et qu'elle est suffisamment explicite</li>
</ul>
<p>Et j'en oublie surement.</p>
<p>On peut constater qu'il y a beaucoup de possibilités de traitement du cas de la référence d'un objet nulle pour pouvoir tirer une règle générale. Chaque éventualité de référence nulle doit amener le(s) programmeur(s) à se poser des questions. Les réponses doivent mener à la solution la plus adaptée.</p>
