---
layout: post
status: publish
published: true
title: Charger les sources avec maven
author:
  display_name: Philippe Blayo
  login: philippe
  email: philippe.blayo@gmail.com
  url: ''
author_login: philippe
author_email: philippe.blayo@gmail.com
excerpt: ! "Quand j'ai besoin d'essayer une lib sans impacter du code existant, je
  crée rapidement un projet jetable avec mvn :\r\n\r\n<code>mvn archetype:generate</code>\r\n\r\n"
wordpress_id: 975
wordpress_url: /?p=975
date: !binary |-
  MjAxMS0wMi0xOCAxNDoxNDoyNiArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMi0xOCAxMzoxNDoyNiArMDEwMA==
categories:
- java
tags:
- buildr
- eclipse
- maven
- classpath
comments:
- id: 59
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0wMi0yMSAxNDoxMDowNSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0yMSAxMzoxMDowNSArMDEwMA==
  content: Ah une raison d'utiliser maven. Sympa pour l'aspect sources.
- id: 61
  author: Philippe Blayo
  author_email: philippe.blayo@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wMy0xMyAyMDo0MzozNCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMy0xMyAxOTo0MzozNCArMDEwMA==
  content: L'option que j'ai donnée (-DdownloadSources) vaut pour maven 3. Pour maven
    2 c'est -Declipse.downloadSources (plus long, plus difficile à retenir). Une avancée
    au crédit de maven 3.
- id: 147
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wNS0yNSAxNjowODozOSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0yNSAxNTowODozOSArMDIwMA==
  content: ! "pour télécharger les sources avec buildr, rien de plus simple :\r\n<pre
    lang=\"shell\">buidlr artifacts:sources</pre>\r\npuis buildr eclipse pour y accéder
    depuis son IDE"
---
<p>Quand j'ai besoin d'essayer une lib sans impacter du code existant, je crée rapidement un projet jetable avec mvn :</p>
<p><code>mvn archetype:generate</code></p>
<p><a id="more"></a><a id="more-975"></a>Le projet par défaut, quickstart, convient : j'appuie directement sur return. Quelques questions génèrent un pom.xml auquel j'ajoute la librairie à expérimenter (<a href="http://mvnrepository.com/">mvnrepository.com</a> fournit groupId et artifactId) :</p>
<pre lang="xml">
<dependency>
    <groupId>org.easytesting</groupId>
    <artifactId>fest-assert</artifactId>
    <version>1.3</version>
</dependency></pre>
<p>Puis je génère le .classpath d'eclipse avec</p>
<p><code>mvn eclipse:eclipse</code></p>
<p>Toutes les dépendances sont téléchargées au passage. C'est un cas où les dépendances transitives aident, alors que sur du code de production cette transitivité nous a causé des soucis. Il ne reste qu'à importer le projet dans eclipse (Alt-f i "Existing Projects into Workspace").</p>
<p>Quand j'ai envie de rentrer dans le code source des lib, je régénère le .classpath avec <code>-DdownloadSources=true</code> :</p>
<p><code>mvn eclipse:clean eclipse:eclipse -DdownloadSources=true</code></p>
<p>Les sources sont récupérées et le .classpath se voit enrichit du <code>sourcepath</code> de chaque dépendance :</p>
<pre lang='xml'><classpathentry kind="var" path="M2_REPO/.../fest-util-1.1.4.jar"
 sourcepath="M2_REPO/.../fest-util-1.1.4-sources.jar" /></pre>
<p>Attention à ne pas oublier <code>eclipse:clean</code> sinon le .classpath n'est pas enrichit.</p>
<p><strong>Et buildr ?</strong></p>
<p>Buildr permet de réaliser une partie de ces opérations, moyennant la création d'une arborescence minimale à la norme maven :</p>
<ol>
<li><code>mkdir -p src/main/java src/test/java</code></li>
<li>créer une première classe</li>
<li><code>buildr</code> propose ensuite de générer un buildfile à partir de cette arborescence :
<pre>To use Buildr you need a buildfile. Do you want me to create one?:
1. From directory structure</pre>
<p>Répondre <code>1</code> amène à :</p>
<pre lang="ruby">define "creerRapidementUnProjet" do
  ...
  compile.with # Add classpath dependencies
  test.compile.with # Add classpath dependencies
  ...
end</pre>
<p>Sur cette première partie, buildr est beaucoup plus rapide que maven, mais il faut ensuite ajouter les dépendances une par une. Même si mvnrepository.com donne le format buildr, la recherche de chaque dépendance est vite rédhibitoire.</li>
<li>pour finir, <code>buildr eclipse</code> génère le .classpath</li>
</ol>
<p><em>Update: le titre renforce l'aspect sources suite au commentaire de Bruno (remplace Essayer une lib dans un projet jetable).</em></p>
