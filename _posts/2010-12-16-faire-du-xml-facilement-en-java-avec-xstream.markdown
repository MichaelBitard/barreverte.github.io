---
layout: post
status: publish
published: true
title: Faire du xml facilement en java avec XStream
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
wordpress_id: 727
wordpress_url: /?p=727
date: !binary |-
  MjAxMC0xMi0xNiAyMzo1NzowOSArMDEwMA==
date_gmt: !binary |-
  MjAxMC0xMi0xNiAyMTo1NzowOSArMDEwMA==
categories:
- java
tags:
- xml
- java
- marshalling
- unmarshalling
- librairie
comments:
- id: 32
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMC0xMi0yMiAxNToxNDo1MSArMDEwMA==
  date_gmt: !binary |-
    MjAxMC0xMi0yMiAxNDoxNDo1MSArMDEwMA==
  content: cf https://gist.github.com/751556
- id: 33
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMC0xMi0yMiAxNToyMzoxNyArMDEwMA==
  date_gmt: !binary |-
    MjAxMC0xMi0yMiAxNDoyMzoxNyArMDEwMA==
  content: ! "inclure XStream dans son build : \r\ncode buildr :\r\n\r\nXSTREAM =
    'xstream:xstream:jar:1.2'"
---
<p>Récemment nous avons du sérialiser des objets dans des fichiers, et une des personnes dans l'équipe a proposé XStream. C'est une librairie développée par <a href="http://www.thoughtworks.com/">ThoughtWorks</a> (la société de <a href="http://martinfowler.com/">Martin Fowler</a>) qui permet de faire du marshalling/unmarshalling d'objet en XML. J'avais eu beaucoup de mauvaises expériences avec les librairies XML Java (soit trop intrusives niveau métier comme par exemple JAXB soit trop bas niveau comme DOM/SAX). XStream répond à toutes les attentes :</p>
<pre lang="java">public class MonObjet {
    private int monAttributEntier = 3;
    private String monAttributString = "attribut";

    public static void main(String[] args) {
        System.out.println(new XStream().toXML(new MonObjet()));
    }
}</pre>
<p>Ce qui donne :</p>
<pre lang="xml">
  <MonObjet> 
     <monAttributEntier>3</monAttributEntier>
     <monAttributString>attribut</monAttributString>
  </MonObjet> 
</pre>
<p>PS : merci <a title="Pascal" href="http://blog.extremepill.com/" target="_blank">Pascal</a> :-)</p>
