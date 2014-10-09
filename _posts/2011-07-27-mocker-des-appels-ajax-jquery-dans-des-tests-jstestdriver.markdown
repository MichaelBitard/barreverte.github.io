---
layout: post
status: publish
published: true
title: Mocker des appels ajax jQuery dans des tests JsTestDriver
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Dans le précédent article sur les tests javascript, nous avons vu <a href=\"faire-des-tests-javascript-avec-jquery\">comment
  tester jQuery avec JsTestDriver</a>. Le souci c'est lorsqu'une fonction va chercher
  des fragments de html, ou du json, ou d'autres données par ajax, dans ce cas l'appel
  de la fonction va réellement déclencher une requête http. En soi ce n'est pas un
  problème, on peut faire un test d'intégration en écrasant l'url de production vers
  une url en localhost.\r\n\r\nSeulement, il y a 3 écueils :\r\n<ul>\r\n\t<li>avec
  JsTestDriver, l'url de base a changé (c'est celle du serveur de test qui est dynamique
  et pointe vers par exemple <code>http://localhost:9876/slave/id/1311194023939/page/CONSOLE/mode/quirks/timeout/30000/upload_size/50/rt/CLIENT</code>),
  donc il est nécessaire de faire une requête avec une url absolue (<code>http://localhost/test/monJsonDeTest.json</code>)</li>\r\n\t<li>pour
  exécuter les tests il faut alors un serveur http en local avec la ressource déployée
  et le contexte configuré</li>\r\n\t<li>avec JsTestDriver, on obtient une exception
  javascript (alors que le code de production fonctionne) que je ne suis pas arrivé
  à expliquer ou à contourner :\r\n<pre>[Exception... \\\"Component returned failure
  code: 0x80004005\r\n(NS_ERROR_FAILURE)\\\"  nsresult: \\\"0x80004005 (NS_ERROR_FAILURE)\\\"\r\nlocation:
  \\\"JS frame :: jquery.min.js\\\"</pre>\r\n</li>\r\n</ul>\r\n"
wordpress_id: 2129
wordpress_url: http://www.barreverte.fr/?p=2129
date: !binary |-
  MjAxMS0wNy0yNyAxNjo0NDoyMCArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNy0yNyAxNTo0NDoyMCArMDIwMA==
categories:
- tests
- javascript
tags:
- tdd
- JsTestDriver
- jQuery
comments:
- id: 212
  author: Philippe Blayo
  author_email: philippe.blayo@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNy0yNyAyMDoxMjo1OSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNy0yNyAxOToxMjo1OSArMDIwMA==
  content: A quoi correspond la valeur 4 du readyState qui masque xhr.send ?
- id: 214
  author: Jean-Baptiste Potonnier
  author_email: jean.baptiste.potonnier@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNy0yOCAwMDozMzo0NSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNy0yNyAyMzozMzo0NSArMDIwMA==
  content: ! "Voici ce que j'ai trouvé sur le site du W3C\r\n<blockquote>\r\nreadyState
    of type unsigned short, readonly\r\n\r\n    The state of the object. The attribute
    MUSt be one of the following values:\r\n\r\n    0 Uninitialized\r\n        The
    initial value.\r\n    1 Open\r\n        The open() method has been successfully
    called.\r\n    2 Sent\r\n        The UA successfully completed the request, but
    no data has yet been received.\r\n    3 Receiving\r\n        Immediately before
    receiving the message body (if any). All HTTP headers have been received.\r\n
    \   4 Loaded\r\n        The data transfer has been completed.\r\n</blockquote>"
- id: 215
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0wNy0yOCAxMzo1NjoyNiArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNy0yOCAxMjo1NjoyNiArMDIwMA==
  content: ! "Merci JB pour les valeurs readyState. En effet dans la closure ajaxTransport,
    il y a le code qui appelle les callbacks, qui dépend de l'état readyState. Si
    la valeur ne vaut pas \"loaded\" (4), le callback n'est pas appelé.\r\n\r\n<pre
    lang=\"javascript\">\r\nif ( isAbort || !script.readyState || \r\n     /loaded|complete/.test(
    script.readyState ) ) {\r\n  // (...) code \r\n  if ( !isAbort ) {\r\n    callback(
    200, \"success\" );\r\n  }\r\n}\r\n</pre>"
- id: 216
  author: Philippe Blayo
  author_email: philippe.blayo@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNy0yOCAxNToyOTozMyArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNy0yOCAxNDoyOTozMyArMDIwMA==
  content: Et <code>this.xhr</code> limite la portée de xhr à la classe de test...
    Sinon ce serait une variable globale.
- id: 282
  author: Xavier Nopre
  author_email: xnopre@gmail.com
  author_url: http://xnopre.blogspot.com/
  date: !binary |-
    MjAxMS0xMC0wNyAwOToyMDozOCArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0xMC0wNyAwODoyMDozOCArMDIwMA==
  content: ! "Bonjour,\r\n\r\nJe découvre ce blog qui m'intéresse, pas le temps de
    lire tout de suite, mais je voudrais ajouter un suivi RSS dans mon reader : aïe,
    je ne trouve rien, dommage ....\r\n\r\nBon, je vais contacter l'auteur : re-aïe,
    un page \"A propos\" avec la liste des auteurs qui renvoie vers .... les articles,
    aucun moyen de vous contacter autrement que par ce commentaire.\r\n\r\nDonc désolé
    pour cette prise de contact détournée, mes remarques ci-dessus et merci pour vos
    réponses ;-)\r\n\r\nXavier"
- id: 283
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: http://www.barreverte.fr/
  date: !binary |-
    MjAxMS0xMC0wNyAxNzoxMzoxMSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0xMC0wNyAxNjoxMzoxMSArMDIwMA==
  content: ! 'Bonjour,


    merci pour cette remarque : auparavant, Firefox et consorts proposaient une icône
    RSS dans la barre d''adresse. Je vais rajouter un lien vers les articles, mais
    vous la donne d''ores et déjà : http://www.barreverte.fr/feed (bon, j''ai du regarder
    dans le source de la page...)

    Pour le contact, je vais mettre à jour la page "A propos" avec un e-mail de contact.


    A bientôt !

    JP'
- id: 23608
  author: Dip
  author_email: dipdipdip84@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMy0wNS0zMCAxNDowODozMiArMDIwMA==
  date_gmt: !binary |-
    MjAxMy0wNS0zMCAxMzowODozMiArMDIwMA==
  content: ! "Salut,\r\n\r\nJe dois tester un plugin qui fait exactement cela: un
    jQuery.getJson. J'ai mis en place ton code, mais ça n'a pas lair de fonctionner.
    Le callback n'est pas appelé."
---
<p>Dans le précédent article sur les tests javascript, nous avons vu <a href="faire-des-tests-javascript-avec-jquery">comment tester jQuery avec JsTestDriver</a>. Le souci c'est lorsqu'une fonction va chercher des fragments de html, ou du json, ou d'autres données par ajax, dans ce cas l'appel de la fonction va réellement déclencher une requête http. En soi ce n'est pas un problème, on peut faire un test d'intégration en écrasant l'url de production vers une url en localhost.</p>
<p>Seulement, il y a 3 écueils :</p>
<ul>
<li>avec JsTestDriver, l'url de base a changé (c'est celle du serveur de test qui est dynamique et pointe vers par exemple <code>http://localhost:9876/slave/id/1311194023939/page/CONSOLE/mode/quirks/timeout/30000/upload_size/50/rt/CLIENT</code>), donc il est nécessaire de faire une requête avec une url absolue (<code>http://localhost/test/monJsonDeTest.json</code>)</li>
<li>pour exécuter les tests il faut alors un serveur http en local avec la ressource déployée et le contexte configuré</li>
<li>avec JsTestDriver, on obtient une exception javascript (alors que le code de production fonctionne) que je ne suis pas arrivé à expliquer ou à contourner :
<pre>[Exception... \"Component returned failure code: 0x80004005
(NS_ERROR_FAILURE)\"  nsresult: \"0x80004005 (NS_ERROR_FAILURE)\"
location: \"JS frame :: jquery.min.js\"</pre>
</li>
</ul>
<p><a id="more"></a><a id="more-2129"></a>Un excellent livre : "<a href="http://tddjs.com">Test Driven Javascript Development</a>" donne une petite librairie (le code associé au chapitre 12) et des exemples pour mocker des appels ajax avec une couche de transport développée par Christian Johansen, l'auteur. J'ai appliqué la méthode qu'il propose à jQuery. Dans notre exemple, nous allons chercher un modèle en JSON, et nous vérifions que le html produit est conforme à ce qu'on attend :</p>
<pre lang="javascript">TestCase("TestJsonAjax", {
    setUp: function() {
        // création du mock
        this.xhr = Object.create(fakeXMLHttpRequest);
        this.xhr.send=function () { readyState = 4; };
        this.xhr.getAllResponseHeaders=stubFn({});
        this.xhr.responseText="{'reponse':'réponse mockée'}";
        // masquage des fonctions jQuery
        jQuery.ajaxSettings.isLocal=stubFn(true);
        jQuery.ajaxSettings.xhr=stubFn(this.xhr);
    },

   "test getHtml() renvoie html bien formé": function () {
        var actualHtml;

        getHtml(function(html) {
            actualHtml = html;
        });

        assertEquals("

réponse mockée

", actualHtml);
    }
});</pre>
<p><code>fakeXMLHttpRequest</code> et la fonction <code>stubFn()</code> (crée une fonction qui renvoie la valeur fournie) sont dans la librairie tddjs (le repository git est <code>http://tddjs.com/code/12-abstracting-browser-differences-ajax.git</code>).</p>
<p>la ligne <code>jQuery.ajaxSettings.xhr=stubFn(this.xhr)</code> écrase la fonction de création de requête XMLHttpRequest de jQuery par celle définie dans le setUp (fakeXMLHttpRequest fournie par tddjs).</p>
<p>Le code qui fait passer le test :</p>
<pre lang="javascript">function getHtml(resultFunc) {
   jQuery.getJSON('url/vers/le/modele/JSON', function(json) {
       resultFunc('

'+ json['reponse'] + '

');
   });
}</pre>
