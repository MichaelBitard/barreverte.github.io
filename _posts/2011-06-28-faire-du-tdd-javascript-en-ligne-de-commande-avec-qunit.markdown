---
layout: post
status: publish
published: true
title: faire du TDD javascript en ligne de commande avec QUnit
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Récemment, j'ai voulu faire du TDD en ligne de commande (sans utiliser
  de navigateur), en javascript. J'ai eu beaucoup de mal à trouver une solution simple.\r\n\r\nJ'ai
  voulu utiliser <a href=\"http://www.jsunit.net/\">JSUnit</a> qui m'avait l'air assez
  répandu, mais il ne fait pas (simplement) de ligne de commande. Ou bien je n'ai
  pas trouvé, ou bien il fallait redévelopper une petite couche javascript par dessus.
  J'ai aussi voulu tester doh (<a href=\"http://dojotoolkit.org/reference-guide/util/doh.html\">Dojo
  Objective Harness</a>), qui normalement est plutôt prévu pour faire des tests de
  <a href=\"http://dojotoolkit.org/\">dojo</a>.\r\n"
wordpress_id: 1994
wordpress_url: /?p=1994
date: !binary |-
  MjAxMS0wNi0yOCAxMjo0MzoyOCArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNi0yOCAxMTo0MzoyOCArMDIwMA==
categories:
- tests
- javascript
tags:
- tdd
comments:
- id: 172
  author: Philippe Blayo
  author_email: philippe.blayo@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNi0yOCAxMzoyNDowMyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNi0yOCAxMjoyNDowMyArMDIwMA==
  content: Je verrais de la valeur à rendre disponible une version de suite.js améliorée
    comme tu l'indiques.
- id: 173
  author: Jean-Baptiste Potonnier
  author_email: jean.baptiste.potonnier@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNi0yOCAyMDoyMjoyOSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNi0yOCAxOToyMjoyOSArMDIwMA==
  content: ! "Il n'y aurait pas une petite inversion expected/actual?\r\nC'est vrai
    que ça n'est pas vraiment l'ordre habituel des frameworks de test.\r\n\r\nSinon
    très bon article. Merci de partager cette expérience."
- id: 174
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wNi0yOCAyMDozMjo0OSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNi0yOCAxOTozMjo0OSArMDIwMA==
  content: ! "On dirait pas :\r\n<pre>equals(\"coucou\", coucou());</pre>\r\nc'est
    bien (expected, actual) là, non ?"
- id: 175
  author: Jean-Baptiste Potonnier
  author_email: jean.baptiste.potonnier@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNi0yOCAyMTozOToxNyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNi0yOCAyMDozOToxNyArMDIwMA==
  content: ! "http://docs.jquery.com/QUnit/equals\r\n\r\nd'ailleurs le message le
    montre bien\r\n<code> FAIL|EQ||Expected: , Actual: coucou</code>"
- id: 176
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0wNi0yOCAyMTo0MjowNSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNi0yOCAyMDo0MjowNSArMDIwMA==
  content: ! "J'ai fait un fork ici : \r\nhttps://github.com/barreverte/QUnit-CLI\r\n\r\nAvec
    un README. Il suffit de copier le répertoire qunit-cli dans le répertoire de test
    et de faire un fichier suite.js qui charge la lib et lance la suite."
- id: 178
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0wNi0yOCAyMTo0NzozOSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNi0yOCAyMDo0NzozOSArMDIwMA==
  content: Ah oui c'est inversé. Je corrige mais faudrait faire un autre fork pour
    qunit ;)
- id: 179
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wNi0yOCAyMjozMjo1NyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNi0yOCAyMTozMjo1NyArMDIwMA==
  content: ! "ah ben m*rd* alors.\r\nRTFM JP..."
---
<p>Récemment, j'ai voulu faire du TDD en ligne de commande (sans utiliser de navigateur), en javascript. J'ai eu beaucoup de mal à trouver une solution simple.</p>
<p>J'ai voulu utiliser <a href="http://www.jsunit.net/">JSUnit</a> qui m'avait l'air assez répandu, mais il ne fait pas (simplement) de ligne de commande. Ou bien je n'ai pas trouvé, ou bien il fallait redévelopper une petite couche javascript par dessus. J'ai aussi voulu tester doh (<a href="http://dojotoolkit.org/reference-guide/util/doh.html">Dojo Objective Harness</a>), qui normalement est plutôt prévu pour faire des tests de <a href="http://dojotoolkit.org/">dojo</a>.<br />
<a id="more"></a><a id="more-1994"></a><br />
Et puis j'ai trouvé <a href="http://docs.jquery.com/Qunit">QUnit</a>, qui paraissait lié à jQuery. Comme nous utilisons <a href="http://jquery.com/">jQuery</a>, il semblait plus logique d'utiliser cet outil. En l'utilisant, je me suis rendu compte qu'il ne nécessitait pas jQuery.</p>
<p><a href="http://twoguysarguing.wordpress.com/2010/11/26/qunit-cli-running-qunit-with-rhino/">Cet article</a> indique une version modifiée de QUnit qui fait le lien entre QUnit et QUnit-CLI. Téléchargez les 2 projets :<br />
- <a href="https://github.com/asynchrony/qunit/tree/consistent-checks">QUnit modifié</a><br />
- <a href="https://github.com/benjaminplee/QUnit-CLI">QUnit-CLI</a></p>
<p>Je vous propose une arbo projet comme celle-ci :</p>
<pre lang="sh">`-- src
    |-- main
    |   `-- js
    |       `-- monJavascript.js
    `-- test
        `-- js
            |-- lib
            |   |-- js.jar
            |   `-- qunit.js
            |-- suite.js
            `-- testMonJavascript.js</pre>
<ul>
<li>js.jar est le jar rhino</li>
<li>qunit.js est le fichier source qunit qui est contenu dans le premier lien</li>
<li>suite.js est le source javascript qui est dans QUnit-CLI/rhino</li>
</ul>
<p>Il faut modifier <a href="https://github.com/benjaminplee/QUnit-CLI/blob/master/rhino/suite.js">suite.js</a> comme suit :</p>
<ul>
<li>supprimer la ligne <code>load("../src/myLib.js")</code>. J'ai préféré que ce soit chaque module javascript de test qui charge le code source correspondant</li>
<li>changer la ligne <code>load("../qunit/qunit/qunit.js")</code> pour pointer vers lib/qunit.js : <code>load("lib/qunit.js")</code></li>
<li>en bas de fichier il y a l'import de tous les sources de test et aussi des tests qunit. Supprimer le <code>load("../qunit/test/test.js")</code> et ajouter la ligne <code>load("testMonJavascript.js")</code></li>
</ul>
<p>J'ai ensuite créé testMonJavascript.js comme suit :</p>
<pre lang="javascript">load("../../main/js/monJavascript.js");

test("RetourneBienCoucou", function() {
	equals(coucou(), "coucou");
});</pre>
<p>et exécuté :</p>
<pre>~/src/projet_js/src/test/js$ java -jar  lib/js.jar  suite.js
js: Couldn't read source file "../../main/js/monJavascript.js:
    ../../main/js/monJavascript.js (No such file or directory)".
FAIL - RetourneBienCoucou
    FAIL|OK|Died on test #1: "coucou" n'est pas défini - ReferenceError
        { message: '"coucou" n'est pas défini', fileName: '', lineNumber: 0 }|
----------------------------------------
 PASS: 0  FAIL: 1  TOTAL: 1
 Finished in 0.045 seconds.
----------------------------------------</pre>
<p>et créé monJavascript.js dans main/js :</p>
<pre lang="javascript">function coucou() {  return "blah"; }</pre>
<p>A présent l'exécution du test donne :</p>
<pre lang="bash">~/src/projet_js/src/test/js$ java -jar  lib/js.jar  suite.js
FAIL - RetourneBienCoucou
    FAIL|EQ||Expected: coucou , Actual: blah
----------------------------------------
 PASS: 0  FAIL: 1  TOTAL: 1
 Finished in 0.035 seconds.
----------------------------------------</pre>
<p>Et finalement en remplaçant par un return "coucou" :</p>
<pre lang="bash">~/src/projet_js/src/test/js$ java -jar  lib/js.jar  suite.js
PASS - RetourneBienCoucou
----------------------------------------
 PASS: 1  FAIL: 0  TOTAL: 1
 Finished in 0.009 seconds.
----------------------------------------</pre>
<p>Ceci permet de faire des tests javascript sans DOM. Nous verrons dans un prochain post comment faire des tests en simulant le navigateur avec env.js.</p>
