---
layout: post
status: publish
published: true
title: Faire des tests javascript avec jQuery
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Après avoir eu une <a href=\"http://www.barreverte.fr/faire-du-tdd-javascript-en-ligne-de-commande-avec-qunit\">barre
  verte en tests unitaires javascript</a>, j'ai eu besoin d'aller plus loin : nous
  réalisons une application HTML5, or cette application tourne au sein d'un navigateur,
  et utilise jQuery. \r\n\r\nJe me suis tourné alors vers <a href=\"http://code.google.com/p/js-test-driver/\">JsTestDriver</a>.
  Son fonctionnement est différent des autres outils de test : il utilise de vrais
  navigateurs \"esclaves\". Il lance un petit serveur http, puis les navigateurs sur
  une url pointant vers ce serveur qui va déclencher les tests. \r\n"
wordpress_id: 2106
wordpress_url: http://www.barreverte.fr/?p=2106
date: !binary |-
  MjAxMS0wNy0yMCAyMDo0NzozOSArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNy0yMCAxOTo0NzozOSArMDIwMA==
categories:
- tests
- javascript
tags:
- tdd
- JsTestDriver
- jQuery
comments:
- id: 226
  author: Liens informatiques du mois – août 2011 | Gestion de projet et développement
    informatique
  author_email: ''
  author_url: http://www.forumlogiciel.net/2011/08/liens-informatiques-du-mois-%e2%80%93-aout-2011/
  date: !binary |-
    MjAxMS0wOC0wOSAwODoxNToxNyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wOC0wOSAwNzoxNToxNyArMDIwMA==
  content: ! '[...] Faire des tests javascript avec jQuery [...]'
---
<p>Après avoir eu une <a href="http://www.barreverte.fr/faire-du-tdd-javascript-en-ligne-de-commande-avec-qunit">barre verte en tests unitaires javascript</a>, j'ai eu besoin d'aller plus loin : nous réalisons une application HTML5, or cette application tourne au sein d'un navigateur, et utilise jQuery. </p>
<p>Je me suis tourné alors vers <a href="http://code.google.com/p/js-test-driver/">JsTestDriver</a>. Son fonctionnement est différent des autres outils de test : il utilise de vrais navigateurs "esclaves". Il lance un petit serveur http, puis les navigateurs sur une url pointant vers ce serveur qui va déclencher les tests.<br />
<a id="more"></a><a id="more-2106"></a><br />
Il faut définir dans un fichier jsTestDriver.conf (que j'ai mis sous src) où sont situés les fichiers source :</p>
<pre>
server: http://localhost:9876
load:
  - main/js/*.js
  - test/js/*.js
</pre>
<p>Un test s'écrit alors comme cela : </p>
<pre lang="javascript">
TestCase("MonTest", {
    setUp: function() {...} // pas obligatoire
    tearDown: function {...} // idem

    "test ajoute bonjour avec jQuery": function() {
        /*:DOC += <div id="contenu"></div> */
        ajouteBonjourAuContenu();
        assertEquals("<p>bonjour, le monde!</p>", 
                     jQuery("#contenu").html());
    }
});
</pre>
<p>Attention, les intitulés doivent commencer par "test" sinon ils ne sont pas reconnus par JsTestDriver. On lance le test avec la ligne de commande suivante :</p>
<pre lang="bash">
java -jar JsTestDriver-1.3.2.jar --port 9876 --browser /usr/bin/firefox --tests all
.E
Total 1 tests (Passed: 0; Fails: 0; Errors: 1) (1,00 ms)
  Firefox 5.0 Linux: Run 1 tests (Passed: 0; Fails: 0; Errors 1) (1,00 ms)
    MonTest.test jQuery error (1,00 ms): ReferenceError: ajouteBonjourAuContenu is not defined
      ()@http://localhost:9876/test/test/js/mon_test.js:26

Tests failed: Tests failed. See log for details.
$ echo $?
1
</pre>
<p>En implémentant le code :</p>
<pre lang="javascript">
function ajouteBonjourAuContenu() {
        jQuery("#contenu").append("<p>bonjour, le monde!</p>");
}
</pre>
<pre lang="bash">
$ ./run_tests.sh 
..
Total 1 tests (Passed: 1; Fails: 0; Errors: 0) (1,00 ms)
  Firefox 5.0 Linux: Run 1 tests (Passed: 1; Fails: 0; Errors 0) (1,00 ms)
$ echo $?
0
</pre>
<p>On peut voir que la valeur de retour vaut 1 lorsque les tests échouent et 0 lorsqu'ils réussissent. </p>
<p>Ce que j'ai aimé avec cet outil :</p>
<ul>
<li> prêt à l'emploi, je n'ai pas eu à modifier le code pour pouvoir le faire fonctionner</li>
<li>en ligne de commande</li>
<li>l'API (les assert*, la manière de déclarer des tests) très complète, et simple à utiliser</li>
<li>peut lancer les tests sur plusieurs navigateurs ou versions de navigateur</li>
<li>automatisable avec Jenkins/Hudson</li>
<li>facilement configurable en lui précisant où se trouvent les fichiers javascript (code prod et test)</li>
</ul>
<p>L'inconvénient principal que je vois c'est qu'il lance réellement les navigateurs (et les ferme):</p>
<ul>
<li>c'est relativement lent pour lancer la suite, mais paraît-il qu'après c'est très rapide. Il faudrait voir ce que ça donne avec un grand nombre de tests</li>
<li>cela demande un environnement graphique : sur un serveur jenkins c'est pas forcément nécessaire</li>
</ul>
<p>PS : Mon idée avant JsTestDriver, c'était de continuer avec QUnit, en ajoutant l'environnement du navigateur, avec <a href="http://www.envjs.com/">envjs</a>. Envjs, comme expliqué dans <a href="http://ejohn.org/blog/bringing-the-browser-to-the-server/">cet article</a> permet d'avoir un objet window, et de l'utiliser avec le DOM. Je suis parvenu à faire fonctionner jQuery et l'application comme dans l'article de John Resig, mais impossible de l'automatiser. J'avoue aussi être novice en javascript, je pense que ça doit être possible de faire ce qui est montré en ligne de commande dans un test, mais je n'y suis pas arrivé.</p>
