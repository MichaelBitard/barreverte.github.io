---
layout: post
status: publish
published: true
title: Une courte introduction à Haskell
author:
  display_name: Jean-Baptiste Potonnier
  login: jb
  email: jb@barreverte.fr
  url: /
author_login: jb
author_email: jb@barreverte.fr
author_url: /
excerpt: ! "J'ai entendu parler d'Haskell pour la première fois à l'université. J'entendais
  que c'était un langage très élégant, amusant et bien plus avancé qu'OCaml. Mais
  OCaml me donnait déjà bien du mal, et c'était ce dernier qui était demandé pour
  les examens et les projets de programmation. Je n'étais donc pas prêt à apprendre
  Haskell à ce moment.\r\n\r\nPlus tard, par curiosité, j'ai regardé quelques projets
  écrits en Haskell. Je suis alors tombé sur <a href=\"http://xmonad.org/\">xmonad</a>,
  un gestionnaire de fenêtres spartiate, mais avec des idées intéressantes, comme
  l'agencement automatique. J'ai aussi découvert la bibliothèque <a href=\"http://legacy.cs.uu.nl/daan/download/parsec/parsec.html\">Parsec</a>,
  qui permet d'écrire des parseurs très simplement, et dont la lecture du code m'a
  convaincu que la notion de fonction était une abstraction vraiment puissante.\r\n"
wordpress_id: 2314
wordpress_url: /?p=2314
date: !binary |-
  MjAxMS0xMi0wNSAxMzo0MDozMCArMDEwMA==
date_gmt: !binary |-
  MjAxMS0xMi0wNSAxMjo0MDozMCArMDEwMA==
categories:
- haskell
tags:
- haskell
- fonctionnel
- introduction
comments:
- id: 329
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0xMi0wNSAxNDoxNzoxMyArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNSAxMzoxNzoxMyArMDEwMA==
  content: ! 'Merci et bienvenue à Jean-Baptiste pour ce 1er article très intéressant
    : j''ai hâte de lire la suite..'
- id: 330
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0xMi0wNSAxNDoyMjoxMSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNSAxMzoyMjoxMSArMDEwMA==
  content: A noter une bonne présentation intitulée "L'échelle de Jacob" par Arnaud
    Bailly et Christophe Thibault, vue aux xpdays Bénélux sur les concepts des <a
    href="http://en.wikipedia.org/wiki/Category_%28mathematics%29" rel="nofollow">Catégories</a>,
    qui ont largement inspiré le langage.
- id: 331
  author: Jean-Baptiste Potonnier
  author_email: jb@barreverte.fr
  author_url: ''
  date: !binary |-
    MjAxMS0xMi0wNSAxNToyMDozNyArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNSAxNDoyMDozNyArMDEwMA==
  content: ! "Je n'ai malheureusement pas assisté à cette présentation, mais je pense
    qu'introduire Haskell par la théorie des catégories est un peu abrupte et peut
    faire peur à la majorité  des gens (ceux qui ne sont pas mathématiciens!)\r\nCe
    langage est effectivement très inspiré par ces notions,  mais il n'est heureusement
    pas utile de les connaître pour être productif en Haskell."
- id: 333
  author: Arnaud Bailly
  author_email: arnaud.oqube@gmail.com
  author_url: http://www.polyspot.com
  date: !binary |-
    MjAxMS0xMi0wNSAxNzozNzozNyArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNSAxNjozNzozNyArMDEwMA==
  content: ! "Bon, en fait c'était plutôt l'inverse que je voulais faire : introduire
    la théorie des catégories en utilisant Haskell comme exemple, dans le but de démystifier
    le truc. Evidemment, c'est un peu hardcore et j'ai fait une erreur de débutant
    : vouloir trop en mettre dans la présentation. \r\n\r\nEn tout cas, bravo pour
    l'introduction, cela fait plaisir de rencontrer d'autres personnes intéressées
    par cette plate-forme hors du commun. Une petite remarque : \"pointless\" en anglais
    veut dire \"vain\", \"inutile\" et c'est effectivement un jeu de mot sur \"pointfree\"
    qui est le terme technique désignant une définition de fonction sans son ou ses
    arguments. Sans vouloir être trop pointilleux (ah ! ah !),  il me semble que la
    traduction de point serait plutôt  \"élément\" sous-entendu d'un ensemble, généralement
    distingué comme dans un \"ensemble pointé\" (pointed set : http://en.wikipedia.org/wiki/Pointed_set)."
- id: 337
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0xMi0wNiAwOToyMDowMiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNiAwODoyMDowMiArMDEwMA==
  content: ! 'Faire une webapp avec Haskell : http://jekor.com/article/is-haskell-a-good-choice-for-web-applications'
- id: 338
  author: Jean-Baptiste Potonnier
  author_email: jb@barreverte.fr
  author_url: ''
  date: !binary |-
    MjAxMS0xMi0wNiAxMDo1NTo0MiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNiAwOTo1NTo0MiArMDEwMA==
  content: ! "Merci Arnaud pour tes encouragement, et tes précision sur les termes
    \"pointfree\"/\"pointless\".\r\nEst-ce que ta présentation est accessible quelque
    par en ligne?"
- id: 339
  author: Jean-Baptiste Potonnier
  author_email: jb@barreverte.fr
  author_url: ''
  date: !binary |-
    MjAxMS0xMi0wNiAxMTowMDozMyArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNiAxMDowMDozMyArMDEwMA==
  content: ! "Ce lien est intéressant, mais me semble un peu dépassé à l'heure actuelle.\r\nIl
    existe aujourd'hui des outils pour faire du web, tel que Yesod ou Snap, cités
    dans l'article.\r\nSnap est un framework web classique pour Haskell.\r\nSi vous
    être ouverts à plus de nouveanté, telles que les Urls vérifiées à la compilation
    grâce aux quasiquotings, je vous conseille de regarder Yesod, qui est bien documenté.\r\n\r\nPour
    vous faire une idée:\r\nhttp://www.yesodweb.com/book/example-blog\r\nhttp://snapframework.com/docs/tutorials/snap-api"
- id: 340
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0xMi0wNiAxNzoxNTozNiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0wNiAxNjoxNTozNiArMDEwMA==
  content: ! 'en cherchant un peu : https://github.com/abailly/jacobs-ladder'
- id: 354
  author: Ywen
  author_email: limestrael@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0xMi0yMiAxNzoxMToxMSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0yMiAxNjoxMToxMSArMDEwMA==
  content: ! "C'est surtout que 'point' en anglais ça se dit \"dot\".\r\nLe terme
    \"point-free\" n'a donc *rien* à voir avec l'opérateur '.' qui compose les fonctions."
- id: 358
  author: Adrien M.
  author_email: adrien.mogenet@gmail.com
  author_url: http://www.ze-technology.com
  date: !binary |-
    MjAxMS0xMi0yNyAyMjo1OTo0MSArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0xMi0yNyAyMTo1OTo0MSArMDEwMA==
  content: ! "Hello,\r\nBelle entrée en matière !! J'ai aussi écris sur Haskell ces
    derniers jours, un langage que je découvre ; c'est comme ça que je suis tombé
    sur ton site.\r\nJe me suis procuré le livre de O'Reilly et j'ai bien l'intention
    de farfouiller un peu plus, notamment dans le domaine de la concurrence.\r\n\r\nDu
    coup, tu as un nouvel abonné à ton blog :)\r\nBon courage, et rdv à tes prochains
    articles !!"
---
<p>J'ai entendu parler d'Haskell pour la première fois à l'université. J'entendais que c'était un langage très élégant, amusant et bien plus avancé qu'OCaml. Mais OCaml me donnait déjà bien du mal, et c'était ce dernier qui était demandé pour les examens et les projets de programmation. Je n'étais donc pas prêt à apprendre Haskell à ce moment.</p>
<p>Plus tard, par curiosité, j'ai regardé quelques projets écrits en Haskell. Je suis alors tombé sur <a href="http://xmonad.org/">xmonad</a>, un gestionnaire de fenêtres spartiate, mais avec des idées intéressantes, comme l'agencement automatique. J'ai aussi découvert la bibliothèque <a href="http://legacy.cs.uu.nl/daan/download/parsec/parsec.html">Parsec</a>, qui permet d'écrire des parseurs très simplement, et dont la lecture du code m'a convaincu que la notion de fonction était une abstraction vraiment puissante.<br />
<a id="more"></a><a id="more-2314"></a><br />
Lors de mon premier contact avec du code Haskell, je n'ai pas été très enthousiaste :</p>
<ul>
<li>Cela ne ressemblait à aucun langage que je connaissais, on aurait dit une peu de l'anglais mathématique.</li>
<li>Après quelques tentatives de modification du code, je me faisais insulter par le compilateur...</li>
</ul>
<p>Mais ma curiosité était piquée. J'ai toujours été intrigué par les langages que je ne comprends pas. De plus, il y avait une promesse de concision, vu qu'il me semblait que l'on puisse faire beaucoup avec peu de lignes.</p>
<h2>Qu'est-ce que Haskell ?</h2>
<p>Haskell est d'abord un langage de comité, composé de mathématiciens et d'informaticiens désireux de faire des expériences en programmation fonctionnelle, et aussi de créer un langage utilisable pour écrire des applications. Le langage étant en quelque sorte expérimental, il est en perpétuelle évolution. Impossible donc d'écrire une documentation ou un livre sans être instantanément démodé. Haskell est donc stabilisé en 1998 en tant que Haskell 98. Ce qui met fin également au comité, mais pas à la vie du langage, bien au contraire.</p>
<p>Quelques traits caractéristiques du langage :</p>
<ul>
<li>Fonctionnel : l'abstraction de base est la fonction.</li>
<li>Pur : pas d'effets de bord.</li>
<li>Paresseux (<em>lazy</em>) : l'évaluation se fait lorsque l'on a besoin d'une valeur, à la différence de la plupart des autres langages, où les arguments d'une fonction sont évalués avant l'appel de celle-ci. Ceci permet par exemple de manipuler des structures de données de taille infinie.</li>
</ul>
<p>Ces caractéristiques en font un langage singulier, pas forcément facile à appréhender. Le coté fonctionnel pur en font un langage de choix pour la programmation parallèle, bien qu'il n'ai pas été conçu pour cela au départ. Certaines start-up choisissent également ce langage en misant sur un avantage décisif par rapport à la concurrence. Ainsi, <a href="http://www.tsurucapital.com/en/">Tsurucapital</a> annonce sur sa page d'accueil:<br />
<cite><br />
We use the Haskell programming language almost exclusively since we believe it gives the best combination of high-level cleanliness, execution safety and high performance.<br />
</cite><br />
Haskell est bien entendu aussi utilisé par des mathématiciens, mais excelle dans des taches plus communes, comme l'écriture de DSL, ou plus récemment dans la programmation web (<a href="http://www.yesodweb.com/">Yesod</a>, <a href="http://snapframework.com/">Snap</a>)</p>
<h2>Environnement de développement</h2>
<p>J'utilise <a href="http://www.haskell.org/ghc/"><code>ghc</code></a>, le compilateur Haskell le plus utilisé et les plus avancé à l'heure actuelle. Ghci est livré avec <code>ghci</code>, un interpréteur Haskell bâti autour de ghc. Il existe très certainement un package pour votre OS.</p>
<p>Si vous le souhaitez, vous pouvez essayer d'autres environnements:</p>
<ul>
<li><a href="http://hackage.haskell.org/platform/">Haskell Platform</a> qui est constitué de ghc et d'un ensemble de bibliothèques d'usage fréquent.</li>
<li><a href="http://www.haskell.org/hugs/">Hugs</a> est un environnement qui est aussi populaire dans le monde des débutants en Haskell.</li>
</ul>
<p>Après avoir installé ghc (ou Haskell Platform), vous pourrez exécuter un fichier en utilisant la commande <code>runhaskell</code>, ou bien le charger dans d'interpréteur en utilisant la commande <code>ghci</code>.</p>
<p>Une fois dans l'interpréteur, le <em>Prelude</em> (ensemble des bibliothèques de base) est chargé et vous vous retrouvez en mode interactif.</p>
<h2>Fonctions</h2>
<p>En Haskell, une fonction prend en entrée des valeurs, et retourne une<br />
valeur (qui peut bien entendu être une fonction). Une fonction ne peut pas provoquer d'effets de bord. Par conséquent, le résultat d'une fonction ne dépend que de ses paramètres. En d'autres termes, la notion d'état n'existe pas. La déclaration d'une fonction consiste en une <em>équation</em>, signifiant que la partie à gauche du signe <code>=</code> est équivalent à la partie droite.</p>
<p>La commande <code>:t</code> vous sera certainement utile dans l’interpréteur. Elle permet d'afficher le type d'une expression. Par exemple, si je veux connaître le type de la fonction <code>length</code> :<br />
<script type="text/javascript" src="https://gist.github.com/1388622.js?file=type-length.hs"></script><br />
 Cela se lit comme suit: "Quel que soit le type a, la fonction length prend en argument une liste de a, et retourne un entier".</p>
<h2>Transformer les éléments d'une liste</h2>
<p>Une opération très fréquente lorsque l'on programme est de parcourir une liste en appliquant une fonction à chacun de ses éléments. C'est ce que permet la fonction <code>map</code>.<br />
<script type="text/javascript" src="https://gist.github.com/1388622.js?file=map.hs"></script><br />
La description du type nous montre que les arguments sont :</p>
<ol>
<li>Une fonction qui, pour toute valeur de type a, retourne une valeur de type b</li>
<li>Une liste de valeurs de type a</li>
</ol>
<p>La valeur de retour est une liste de valeurs de type b.</p>
<p>Dans notre exemple où l'on multiplie par deux les éléments d'une liste d'entiers, les types a et b se trouvent être égaux.</p>
<h2>Filtrer une liste</h2>
<p>Un autre traitement très fréquent en programmation est de filtrer les éléments d'une liste selon un prédicat. C'est ce que propose la fonction <code>filter</code>.<br />
<script type="text/javascript" src="https://gist.github.com/1388622.js?file=filter.hs"></script><br />
 La lecture du type nous informe que les arguments sont :</p>
<ol>
<li>Un prédicat, c'est à dire une fonction à un argument qui retourne un booléen</li>
<li>Une liste d'éléments</li>
</ol>
<p>On constate aussi que les éléments de la liste résultat sont de même types que les éléments de la liste en paramètre. Ce qui est conforme à ce que nous attendons : la liste est simplement filtrée, les valeurs ne sont pas transformées.</p>
<h2>Fonctions anonymes</h2>
<p>Il est possible de déclarer une fonction sans nom. Par exemple, pour une fonction qui double la valeur de son argument, on peut écrire <code>\ x -&gt; 2 * x</code>. Ce qui est pratique lorsque l'on a besoin d'une fonction, mais que l'on ne veut pas prendre la peine de la définir, parce qu'elle est très petite ou triviale.<br />
<script type="text/javascript" src="https://gist.github.com/1388622.js?file=anonyme.hs"></script><br />
A ceux qui se poseraient la question, le caractère <code>\</code> a été choisi pour la définition de fonctions anonymes car il ressemble (un peu) au caractère λ.</p>
<h2 id="style-sans-point-pointless">Style "sans point" (<em>pointless</em>)</h2>
<p>La fonction <code>(.)</code> permet de composer deux fonctions. Il faut lire le point comme le "rond" en mathématiques. Ainsi <code>f(g x)</code> est équivalent à <code>(f . g) x</code>.<br />
De plus, une fonction s’écrivant <code>h x = (f . g) x</code> peut aussi s'écrire "sans point" <code>h = f . g</code><br />
Une source de confusion (et aussi de blagues) vient du terme <em>pointless</em>. Pourquoi appelle-t-on ce style "sans point", alors que justement on utilise le point ? En réalité, dans cette expression, le point ne fait pas référence au caractère, mais à l’argument d'une fonction (en anglais mathématique, on appelle cela le point). Et effectivement, dans une expression <em>pointless</em>, on n'écrit pas les arguments d'une fonction lorsqu'on la définit.</p>
<h2 id="compréhension-de-liste-list-comprehension">Compréhension de liste (<em>list comprehension</em>)</h2>
<p>Les compréhensions de liste sont déjà connues des développeurs Python ou Erlang. Les programmeurs Scala pourront aussi trouver des similarités avec le <code>for</code> de ce langage.</p>
<p>La compréhension de liste permet de transformer et de filtrer des listes dans une même expression. On peut le voir comme une combinaison de <code>filter</code> et de <code>map</code>.</p>
<p>La syntaxe est très inspirée de la notation de définition des ensembles en mathématiques. Par exemple, nous définissons ici la "liste des élément x multipliés par 10, pour tout x dans la liste des entiers de 1 à 10 tels que x est impair":<br />
<script type="text/javascript" src="https://gist.github.com/1388622.js?file=comprehension.hs"></script><br />
Les compréhensions de liste sont un élément syntaxique très intéressant pour l'expressivité et la clarté du code. Nous n'avons fait ici qu'effleurer les possibilités qu'elles offrent.</p>
<h2>Pour aller plus loin</h2>
<ul>
<li><a href="http://book.realworldhaskell.org/read/">Real world Haskell</a>, un livre en ligne assez didactique.</li>
<li><a href="http://en.wikibooks.org/wiki/Haskell">Le wiki book Haskell</a>, une bonne référence pour apprendre.</li>
<li><a href="http://learnyouahaskell.com/chapters">Learn You a Haskell for Great Good!</a>, très progressif, mais un peu trop verbeux à mon avis.</li>
</ul>
<p>Si vous avez apprécié cet article, sachez que d'autres sont en préparation. Nous aborderons la déclaration des type de données afin de modéliser une version simplifiée de réseau social, ainsi que d'autre manière de manipuler les listes.</p>
