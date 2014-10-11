---
layout: post
status: publish
published: true
title: Certains assertEquals sont plus égaux que d'autres
author:
  display_name: Philippe Blayo
  login: philippe
  email: philippe.blayo@gmail.com
  url: ''
author_login: philippe
author_email: philippe.blayo@gmail.com
excerpt: ! "Une barre rouge inattendue. Je scrute le message d'échec du test dans
  le panneau junit :\r\n\r\n<a href=\"/images/philippeBlayoBarreRougeSansAide5.png\"><img
  class=\"alignnone size-full wp-image-1526\" title=\"philippeBlayoBarreRougeSansAide\"
  src=\"/images/philippeBlayoBarreRougeSansAide5.png\"
  alt=\"\" width=\"627\" height=\"107\" /></a>\r\n\r\nJe double-clique sur <em>expected:</em>
  pour obtenir le comparateur de l'IDE. Zut rien ne se passe ! Du coup je scrolle
  pour voir tout le message d'erreur, mais je ne distingue aucune différence entre
  résultats attendu et obtenu. Et là je m'interroge : pourquoi je n'obtiens pas le
  comparateur quand je double-clique :-( ?"
wordpress_id: 973
wordpress_url: http://www.barreverte.fr/?p=973
date: !binary |-
  MjAxMS0wMy0xNCAyMTo0NzoyMyArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMy0xNCAyMDo0NzoyMyArMDEwMA==
categories:
- java
- tests
tags:
- junit
- eclipse
- feedback
- intelliJ IDEA
comments:
- id: 150
  author: dibus
  author_email: dibus@dibus.org
  author_url: http://www.cascrum.dibus.org
  date: !binary |-
    MjAxMS0wNS0yNyAxMjoxMjoyNCArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0yNyAxMToxMjoyNCArMDIwMA==
  content: ! "J'ai régulièrement rencontré ce genre de soucis, notamment pour la comparaison
    de String.\r\nDe notre côté, nous avons tendance à remplacer \r\n<code>assertEquals(attendu.toString(),
    obtenu.toString());&lt;/code\r\npar\r\n<code>assertTrue(attendu.equals(obtenu));</code>\r\n\r\nTa
    technique avec la création de la fonction assertLisible me paraît beaucoup plus
    élégante : On en parle rapidement avec l'équipe ! Merci :)"
- id: 893
  author: Laurent L.
  author_email: laurentleseigneur@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMi0wNi0xMSAxMjozNDoyNSArMDIwMA==
  date_gmt: !binary |-
    MjAxMi0wNi0xMSAxMTozNDoyNSArMDIwMA==
  content: ! "Bonjour,\r\n\r\nc'est marrant de retrouver dibus içi ;) finalement on
    a encore les mêmes questionnements sur le testing !\r\n\r\nBref, chez nous, on
    est partit sur l'option FestAssert, avec l'idée de garder assertEqual(ObjetAttendu,ObjetObtenu)
    quitte à implémenter un comparateur.\r\n\r\nPrincipale justification: c'est ce
    qui m'a été spécifié par mon Product Owner dans les critères d’acceptation de
    la story que teste."
---
<p>Une barre rouge inattendue. Je scrute le message d'échec du test dans le panneau junit :</p>
<p><a href="/images/philippeBlayoBarreRougeSansAide5.png"><img class="alignnone size-full wp-image-1526" title="philippeBlayoBarreRougeSansAide" src="/images/philippeBlayoBarreRougeSansAide5.png" alt="" width="627" height="107" /></a></p>
<p>Je double-clique sur <em>expected:</em> pour obtenir le comparateur de l'IDE. Zut rien ne se passe ! Du coup je scrolle pour voir tout le message d'erreur, mais je ne distingue aucune différence entre résultats attendu et obtenu. Et là je m'interroge : pourquoi je n'obtiens pas le comparateur quand je double-clique :-( ?<a id="more"></a><a id="more-973"></a></p>
<p>Ca ne vous est jamais arrivé ? Dans mon équipe, ça arrive tout le temps.</p>
<p>Eclipse et intelliJ IDEA réagissent de la même manière. Leur comportement dépend de l'exception qu'il reçoivent :</p>
<ul>
<li>avec <code>AssertionError</code> le double-clic ne fait rien</li>
<li>avec <code>ComparisonFailure</code> le double-clic ouvre la belle popup du comparateur :</li>
</ul>
<p><a href="/images/philippeBlayoBarreRougeAvecAide2.png"><img class="alignnone size-full wp-image-1534" title="philippeBlayoBarreRougeAvecAide" src="/images/philippeBlayoBarreRougeAvecAide2.png" alt="" width="546" height="150" /></a></p>
<p>Quand ces exceptions sont-elles levées ?</p>
<ul>
<li><code>ComparisonFailure</code> est levée par assertEquals(String, String)</li>
<li><code>AssertionError</code> est levée par assertEquals(Object, Object) et assertThat</li>
</ul>
<p><code>AssertionError</code> n'est pas spécifique à junit, c'est une <code>java.lang.AssertionError</code>, elle peut provenir du code lui-même plutôt que du test. L'IDE ne l'interprète pas comme le résultat d'un test.</p>
<p>De loin, les messages semblent identiques [1] car <code>assertEquals(Object, Object)</code> affiche des <code>toString()</code>. Voilà pourquoi les variations de comportement du double-clic surprennent. Certains en viennent à ajouter des toString() pour souligner les différences :</p>
<pre lang="java">assertEquals(attendu.toString(), obtenu.toString());</pre>
<p>C'est dangereux car l'égalité n'est pas déterminée par le <code>equals()</code> de <code>Object</code>, ce qui viole un contrat Java. En plus, ça ne marche pas pour <code>assertThat</code> qui lève <code>AssertionError</code> même pour deux String (<code>assertThat("Philippe", equalTo("Blayo")</code>). J'aimerais plutôt que :</p>
<ul>
<li><code>equals()</code> détermine la réussite ou l'échec du test (rouge/vert)</li>
<li>une comparaison entre les <code>toString()</code> enrichisse l'affichage expected/actual des barres rouges, quelque soit la classe des objets comparés</li>
</ul>
<p>Suivant le contexte, je connais deux manières d'y parvenir :</p>
<ul>
<li>utiliser une lib qui lève déjà une <code>ComparisonFailure</code> comme <a href="http://code.google.com/p/fest/">FEST-assert</a></li>
<li>coder soi-même une assertion qui lève une <code>ComparisonFailure</code> (<em>custom assertion</em>). En laissant de coté la gestion des <code>null</code>, la substance d'une telle assertion serait :
<pre lang="java">static void assertLisible(Object expected, Object actual) {
    if (! expected.equals(actual))
        throw new ComparisonFailure("",
            expected.toString(), actual.toString());
}</pre>
</li>
</ul>
<p>[1] <code>ComparisonFailure</code> met entre crochets la différence <code>bl[ay]o</code> / <code>bl[ya]o</code>, là où <code>AssertionError</code> laisse <code>blayo</code> / <code>blyao</code>. Les messages ne sont donc identiques qu'en apparence. Mais ces crochets ne suffisent pas : une popup ne s'ouvre qu'avec une <code>ComparisonFailure</code>.</p>
