---
layout: post
status: publish
published: true
title: Contrôler le temps pour faciliter les tests
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: /
author_login: jp
author_email: jp@barreverte.fr
author_url: /
excerpt: ! "Bien souvent, il est difficile de tester du code dans lequel l'écoulement
  du temps a une grande importance :\r\n<ul>\r\n\t<li>dans la téléphonie (avec des
  durées de sonnerie, de conversation) avec des statistiques en bout de chaine</li>\r\n\t<li>pour
  des tests de statistiques liées à des évènements de manière générale</li>\r\n\t<li>pour
  des purges de fichiers qui s'appuient sur une date de validité</li>\r\n\t<li>passage
  heure d'été heure d'hiver</li>\r\n\t<li>applications avec des fuseaux horaires différents</li>\r\n\t<li>tests
  de calcul de temps</li>\r\n\t<li>... et des tas d'autres exemples que vous trouverez
  aisément dans vos bases de code</li>\r\n</ul>\r\nNe serait-il pas pratique de pouvoir
  disposer du temps tel un magicien et faire que par exemple tous les tests d'une
  classe se déroulent le 10 janvier 2010 à 10h00 parce que cette date m'arrange et
  que je suis capable d'écrire des assertions qui seront toujours valables ?\r\n\r\n"
wordpress_id: 792
wordpress_url: /?p=792
date: !binary |-
  MjAxMS0wMS0xMiAxMDo0OToxMSArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMS0xMiAwOTo0OToxMSArMDEwMA==
categories:
- java
- tests
tags:
- java
- junit
- tdd
- rule
- bonnes pratiques
comments:
- id: 38
  author: Philippe Blayo
  author_email: philippe.blayo@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wMS0xMiAxMzo1NjozMSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMS0xMiAxMjo1NjozMSArMDEwMA==
  content: Même si les @Rule sont apparus avec junit 4.7, mieux vaux les utiliser
    en version 4.8 où elles s'exécutent avant @Before et après @After. En junit 4.7,
    le champs annoté par @Rule n'est pas disponible dans setUp() et tearDown() ce
    qui surprend la plupart des gens.
- id: 39
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wMS0xMiAxNToxNDowMCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMS0xMiAxNDoxNDowMCArMDEwMA==
  content: ! "Oui merci pour cette précision.\r\nJ'utilise actuellement la version
    4.8.2"
- id: 63
  author: Comment tester les interractions avec le monde extérieur (via HTTP) | Barre
    Verte !
  author_email: ''
  author_url: /comment-tester-les-interractions-avec-le-monde-exterieur-via-http
  date: !binary |-
    MjAxMS0wMy0yNSAxODozNjowMiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMy0yNSAxNzozNjowMiArMDEwMA==
  content: ! '[...] pour la simulation du temps dans les tests, nous voudrions ouvrir
    le code de cette librairie, mais il faut que nous voyions [...]'
---
<p>Bien souvent, il est difficile de tester du code dans lequel l'écoulement du temps a une grande importance :</p>
<ul>
<li>dans la téléphonie (avec des durées de sonnerie, de conversation) avec des statistiques en bout de chaine</li>
<li>pour des tests de statistiques liées à des évènements de manière générale</li>
<li>pour des purges de fichiers qui s'appuient sur une date de validité</li>
<li>passage heure d'été heure d'hiver</li>
<li>applications avec des fuseaux horaires différents</li>
<li>tests de calcul de temps</li>
<li>... et des tas d'autres exemples que vous trouverez aisément dans vos bases de code</li>
</ul>
<p>Ne serait-il pas pratique de pouvoir disposer du temps tel un magicien et faire que par exemple tous les tests d'une classe se déroulent le 10 janvier 2010 à 10h00 parce que cette date m'arrange et que je suis capable d'écrire des assertions qui seront toujours valables ?</p>
<p><a id="more"></a><a id="more-792"></a></p>
<p>Nous avons donc développé une librairie <strong>de temps simulé</strong> que nous appelons ici <code>BarreVerteTime</code>.</p>
<p>Cette librairie est très facile d'utilisation. Il suffit de se déclarer en mode <em>temps simulé</em> et de donner la date que l'on désire pour le test. L'inconvénient de notre librairie est qu'elle a un impact dans le code de production : nous ne pouvons plus faire de <code>new Date()</code> ou jouer avec les <code>Calendar</code> (et c'est tant mieux pour cette partie là). A la place, on utilise la librairie pour obtenir la date courante. Ainsi, dans votre code de production, vous aurez des lignes de ce genre :</p>
<p><script src="https://gist.github.com/772990.js?file=appelBarreVerteTime.java"></script></p>
<p>C'est un prix à payer mais nous trouvons que cela vaut le coup car nous avons pu améliorer considérablement la testabilité de notre code.</p>
<p>Dans vos tests, il suffit de passer en mode <em>temps simulé</em> et de lui donner la date désirée dans le <code>setup</code> puis de revenir en mode normal dans le <code>teardown</code>.</p>
<p><script src="https://gist.github.com/772808.js?file=setUp_tearDown_BarreVerteTime.java"></script></p>
<p>A la longue, tous les tests se ressemblent dans les parties <code>setUp</code> et <code>tearDown</code>, et une grande duplication entre les tests utilisant  <em>BarreVerteTime</em> apparaît. Imaginez donc un instant que le code ci-dessus apparait dans tous vos tests qui utilisent <em>BarreVerteTime</em> ! Dans notre base de code, ce nombre est vraiment important.</p>
<p>Bien sûr, ceci est intolérable : mais il existe un moyen simple pour factoriser ce genre de code. En effet, depuis <a href="http://www.junit.org/">jUnit</a> 4.7, il est possible de créer des règles (appelées <a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/rules/MethodRule.html">Rules</a>). Une fois la règle créée, le code pour passer un test en temps simulé tient en une ligne :</p>
<p><script src="https://gist.github.com/772986.js?file=testAvecTimeRule.java"></script></p>
<p>Comme vous pouvez le voir, la déclaration est très simple : l'annotation <code>@Rule</code> précède la déclaration de l'objet en visibilité <code>public</code>.</p>
<p>Une règle jUnit est très facile à coder. Nous utilisons ici une <code><a href="http://kentbeck.github.com/junit/javadoc/latest/org/junit/rules/ExternalResource.html">ExtrernalResource</a></code>. Il nous suffit d'implémenter les méthodes <code>before</code> et <code>after</code> qui seront appelées respectivement avant et après chaque test de la classe outillée (comme si vous aviez ajouté des annotations <code>@Before</code> et <code>@After</code> à des méthodes de votre test) :  <script src="https://gist.github.com/772971.js?file=BarreVerteTimeRule.java"></script></p>
<p>Et voilà ! Désormais, vous avez le contrôle total sur le temps dans votre logiciel. Comme vous avez pu le constater, rien de magique là-dedans finalement. En outre, vous avez appris à utiliser une des dernières fonctionnalités proposées par jUnit et cela vous a permis d'éviter la duplication dans votre code. Moi, j'appelle cela un bon plan, pas vous ?</p>
<p>NB : nous voudrions ouvrir le code de cette librairie, mais il faut que nous voyions cela auprès de notre employeur. Si nous y parvenons, le code sera disponible sur <a href="https://github.com/organizations/barreverte">github</a>.</p>
