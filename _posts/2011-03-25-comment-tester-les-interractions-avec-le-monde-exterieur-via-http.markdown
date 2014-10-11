---
layout: post
status: publish
published: true
title: Comment tester les interractions avec le monde extérieur (via HTTP)
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: /
author_login: jp
author_email: jp@barreverte.fr
author_url: /
excerpt: ! "Il m'arrive fréquemment d'avoir à écrire du code qui doit parler avec
  un serveur HTTP externe, par exemple, sur mon projet actuel, nous interagissons avec
  :\r\n<ul>\r\n\t<li>un serveur de paiement</li>\r\n\t<li>un serveur de publicités</li>\r\n\t<li>un
  streamer vidéo</li>\r\n\t<li>un serveur d'options client</li>\r\n</ul>\r\nJ'aime
  bien écrire mon code de test avant d'écrire mon code de production, et j'imagine
  que vous en faites autant. C'est ainsi que nous avons développé au fil du temps
  une librairie de tests qui nous permet de simuler un serveur HTTP. Cet librairie
  lance un véritable serveur qui écoute sur une socket. Nous pouvons lui donner des
  <a href=\"http://fr.wikipedia.org/wiki/Liste_des_codes_HTTP\">réponses standard</a>
  (réponse 200 avec contenu OK, réponse 40x ou 50x, redirect etc) mais également lui
  donner un comportement plus avancé en lui passant un <a href=\"https://gist.github.com/879611#file_traiteur_de_reponse.java\">TraiteurDeReponse</a>.
  Cela nous permet de simuler tous les intervenants extérieurs à notre produit pour
  nos tests unitaires mais aussi pour nos tests d'acceptance.\r\n\r\n"
wordpress_id: 1615
wordpress_url: /?p=1615
date: !binary |-
  MjAxMS0wMy0yNSAxODozNTo1NCArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMy0yNSAxNzozNTo1NCArMDEwMA==
categories:
- java
- tests
tags:
- java
- tdd
- test
- http
- mock
comments: []
---
<p>Il m'arrive fréquemment d'avoir à écrire du code qui doit parler avec un serveur HTTP externe, par exemple, sur mon projet actuel, nous interagissons avec :</p>
<ul>
<li>un serveur de paiement</li>
<li>un serveur de publicités</li>
<li>un streamer vidéo</li>
<li>un serveur d'options client</li>
</ul>
<p>J'aime bien écrire mon code de test avant d'écrire mon code de production, et j'imagine que vous en faites autant. C'est ainsi que nous avons développé au fil du temps une librairie de tests qui nous permet de simuler un serveur HTTP. Cet librairie lance un véritable serveur qui écoute sur une socket. Nous pouvons lui donner des <a href="http://fr.wikipedia.org/wiki/Liste_des_codes_HTTP">réponses standard</a> (réponse 200 avec contenu OK, réponse 40x ou 50x, redirect etc) mais également lui donner un comportement plus avancé en lui passant un <a href="https://gist.github.com/879611#file_traiteur_de_reponse.java">TraiteurDeReponse</a>. Cela nous permet de simuler tous les intervenants extérieurs à notre produit pour nos tests unitaires mais aussi pour nos tests d'acceptance.</p>
<p><a id="more"></a><a id="more-1615"></a>Voyons tout de suite un exemple de test qui utilise ce MockHttpServer. Notez que l'ouverture/fermeture d'une socket prend du temps, aussi le serveur n'est lancé une fois en début de test (@BeforeClass) et fermé après tous les tests de la classe (@AfterClass)<br />
<script src="https://gist.github.com/879611.js?file=TesterUnServiceHttp.java"></script> Dans cet exemple, je ne vérifie que l'URL appelée, mais je peux aussi vérifier les headers passés, le contenu que je lui ai envoyé. Ainsi, je fige dans mes tests le contrat d'interface entre notre produit et les produits externes.  Le serveur de test répond par défaut 200/OK :  <script src="https://gist.github.com/879611.js?file=MockHttpServer.java"></script></p>
<p>mais on peut lui passer d'autres types de réponses. Les plus communes sont 200/OK, 500/KO, 30x/redirect, aussi une <a href="http://fr.wikipedia.org/wiki/Fabrique_(patron_de_conception)">factory</a> nous permet d'accéder rapidement à ce type de réponses (et de les factoriser) :<br />
<script src="https://gist.github.com/879611.js?file=TraiteurDeReponseFactory.java"></script></p>
<p>Ainsi, on peut tester comment notre application réagit quand le service en face ne répond pas ce qui est défini dans le contrat d'interface ou si il met trop de temps à répondre. Par exemple, pour tracer les défaillances des services externes et expliquer comment cela impacte notre qualité de service, nous testons nos logs avec notre LoggueurEspion (qui fera l'objet d'un article à paraître prochainement). Oui, c'est la technique dite du <a href="http://www.1001-jeux.com/images/9316-parapluie-grenouille.jpg">parapluie</a>.  Enfin, il est possible de créer soi-même un type de réponse très spécifique et qui dépend des requêtes reçues. On peut écrire un serveur avec un peu de mémoire en implémentant un autre TraiteurDeReponse dont voici une partie du code :  <script src="https://gist.github.com/879611.js?file=TraiteurDeReponse.java"></script></p>
<p>Ces classes sont si faciles à utiliser que nos tests d'acceptance (qui tournent sous <a href="http://fitnesse.org/FitNesse.UserGuide">Fitnesse</a>) les utilisent aussi. Comme pour les tests unitaires, nous démarrons et arrêtons les serveur HTTP en début et en fin de suite : non seulement cela permet d’exécuter plus rapidement les tests, mais cela s'approche au plus de la réalité de ce que nous simulons dans laquelle ces services sont déjà présents et tournent en permanence. Pour réaliser cela avec Fitnesse, nous utilisons le setUp/tearDown de suite qui appele notre DemarreurDeSuite :<br />
<script src="https://gist.github.com/879611.js?file=DemarreurDeSuite.java"></script></p>
<p>Enfin, nous pouvons packager ces classes créées pour nos tests d'acceptance pour lancer des bouchons HTTP sur nos environnements d'intégration. Le code a donc été utilisé 3 fois :</p>
<ul>
<li>dans les tests unitaires</li>
<li>dans les tests d'acceptance</li>
<li>sur les environnement d'intégration</li>
</ul>
<p>La différence avec une approche où l'on mockerait les appels tient en trois points :</p>
<ul>
<li>le code est réutilisable à de multiples niveaux (unitaire, acceptance, intégration)</li>
<li>le test est non intrusif et n'influence pas l'implémentation. Ainsi, vous pouvez changer de client HTTP (passer de l'API standard Sun à celle proposée par HttpClient d'Apache) sans avoir à toucher vos tests (oui, bien souvent l'approche "mock" des appels fige le design)</li>
<li>il est possible de tester des cas d'erreur très difficiles à traiter autrement (un <em>read timeout</em> par exemple)</li>
</ul>
<p>Voilà ! J'espère que cet article vous a ouvert de nouvelles perspectives de tests. Nous n'avons pas de soucis de socket qui reste ouverte et qu'on ne peut réutiliser, mais avant d'en arriver là, il nous a fallu peaufiner et peaufiner encore notre code.</p>
<p>Comme pour la <a href="/controler-le-temps-pour-faciliter-les-tests">simulation du temps</a> dans les tests, nous voudrions ouvrir le code de cette librairie, mais il faut que nous voyions cela auprès de notre employeur. Restez branchés !</p>
<p>Et vous, comment testez-vous vos interractions avec le monde HTTP ?</p>
<hr />
<p>ps : Pascal Grange a également écrit sur le sujet et propose une solution très différente mais également intéressante :  <a href="http://pgrange1.blogspot.com/2011/03/tests-unitaires-http-et-java.html" target="_blank">Tests unitaires, HTTP et Java</a></p>
