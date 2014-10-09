---
layout: post
status: publish
published: true
title: Changement de vocabulaire grâce à Midje pour Clojure
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: http://www.barreverte.fr/
author_login: jp
author_email: jp@barreverte.fr
author_url: http://www.barreverte.fr/
excerpt: ! "Un framework de test pour <a href=\"http://clojure.org/\">Clojure</a>,
  <a href=\"https://github.com/marick/Midje#readme\">midje</a>, apporte un nouvel
  éclairage sur la façon de penser son logiciel et d'écrire des tests : il s'agit
  de la notion de <strong>faits</strong>. Voici un exemple de test :\r\n<pre>  (fact
  \"un exemple de test tout simple\"\r\n     (numerical-reverser 103) =&gt; 301)</pre>\r\nVoici
  ce qu'en dit l'auteur :"
wordpress_id: 1215
wordpress_url: http://www.barreverte.fr/?p=1215
date: !binary |-
  MjAxMS0wMS0xNyAxODoxMDoxNCArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMS0xNyAxNzoxMDoxNCArMDEwMA==
categories:
- tests
tags:
- tdd
- clojure
- midge
- opinion
- changement de paradigme
comments: []
---
<p>Un framework de test pour <a href="http://clojure.org/">Clojure</a>, <a href="https://github.com/marick/Midje#readme">midje</a>, apporte un nouvel éclairage sur la façon de penser son logiciel et d'écrire des tests : il s'agit de la notion de <strong>faits</strong>. Voici un exemple de test :</p>
<pre>  (fact "un exemple de test tout simple"
     (numerical-reverser 103) =&gt; 301)</pre>
<p>Voici ce qu'en dit l'auteur :<a id="more"></a><a id="more-1215"></a></p>
<blockquote><p>I call this a "fact" because, in a world without mutability, it just is a fact that the numerical-reverser of 103 is 301. Since I work test-first, I like to think of programming as making false claims about the world of the program, then changing that world to make the claims true.</p></blockquote>
<p>J'aime beaucoup cette idée de faits (des nouvelles fonctionnalités) que l'on clame haut et fort au sujet du monde représenté par son logiciel. Le travail consiste ensuite à modifier cet univers pour que ce fait devienne vrai.</p>
<p>Clojure permet également une syntaxe bien sympathique à base de flèches, et je trouve  tout a fait pertinent de décrire les tests comme des exemples qui illustrent et documentent le code. Malheureusement, le langage java ne nous permets pas de faire cela, mais j'imagine que ce serait possible avec d'autres langages (scala ? erlang ? ruby ?)</p>
<blockquote><p>I use the arrow because I think of tests as examples. When people show snippets of code as examples, they often use an arrow to separate what you type from what you should expect to see.</p></blockquote>
<p>Je trouve cette approche du TDD tout à fait rafraichissante et novatrice et je crois que cela va changer ma façon d'aborder mes tests et mon code dès maintenant ! Cela met l'accent sur le côté démiurge lié à la création de code, de se concentrer sur l'univers qu'il nous reste à créer.</p>
<p>Et vous, qu'en pensez-vous ?<br />
<!--more--></p>
<hr />Références :</p>
<ul>
<li>le framework <a href="https://github.com/marick/Midje">midje</a></li>
<li><a href="http://youtu.be/a7YtkcIiLGI">une vidéo</a> qui détaille ces concepts par l'exemple</li>
<li>le langage <a href="http://clojure.org/">clojure</a></li>
<li>le <a href="https://twitter.com/#!/unclebobmartin/status/26641023509729280">tweet</a> d'Uncle Bob à ce sujet</li>
</ul>
