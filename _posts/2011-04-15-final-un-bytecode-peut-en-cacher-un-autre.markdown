---
layout: post
status: publish
published: true
title: ! 'final : un bytecode peut en cacher un autre '
author:
  display_name: Philippe Blayo
  login: philippe
  email: philippe.blayo@gmail.com
  url: ''
author_login: philippe
author_email: philippe.blayo@gmail.com
excerpt: ! "Quand le résultat d'un code Java me surprend, je regarde son bytecode
  avec <strong>javap -c</strong>.\r\n\r\nPrenons un exemple. Dans notre équipe, nous
  mettons les variables à <code>final</code> par défaut pour éviter des problèmes
  de concurrence [1]. J'ai découvert[2] que <code>final</code> pouvait changer le
  comportement de l'opérateur ternaire <code>? :</code>, comme le montre ce code :"
wordpress_id: 1701
wordpress_url: http://www.barreverte.fr/?p=1701
date: !binary |-
  MjAxMS0wNC0xNSAxNTowNjowNiArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNC0xNSAxNDowNjowNiArMDIwMA==
categories:
- java
tags:
- bytecode
- final
comments:
- id: 71
  author: Jean-Baptiste Potonnier
  author_email: jean.baptiste.potonnier@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wNC0xNSAxOToxNzoxMCArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0xNSAxODoxNzoxMCArMDIwMA==
  content: ! "Surprenant en effet à première vue.\r\nCela dit comme il est suggéré
    dans l'article,  j'y vois surtout un problème de typage.\r\n\r\nUne expression
    if (l'equivalent de l'opérateur ternaire Java) devrait  toujours avoir ses deux
    branches du même type, comme c'est le cas en Haskell ou Caml par exemple (erreur
    de compilation dans le cas contraire ).\r\n\r\nUne personne débutant dans un de
    ces deux derniers langages est d'ailleurs souvent surpris de ne pas être autorisé
    à écrire un if à une branche (if, sans else)!\r\n\r\nJe vous laisse réfléchir
    à quel pourrait être le type d'une telle construction ;)"
- id: 74
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: http://www.barreverte.fr/
  date: !binary |-
    MjAxMS0wNC0xNSAyMzoyNDowNCArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0xNSAyMjoyNDowNCArMDIwMA==
  content: ! "Oui, c'est pareil en erlang également :\r\n<pre lang=\"erlang\">if\r\n
    \   Condition -> ma_jolie_fonction();\r\n    true -> ok\r\nend</pre>\r\nLe code
    ne compile pas si j'omets la ligne qui commence par true.\r\nMais tout le monde
    ne le comprend pas toujours et s'énerve sur le if en erlang : http://damienkatz.net/2008/03/what_sucks_abou.html"
- id: 75
  author: Pascal
  author_email: pascal@grange.nom.fr
  author_url: http://pgrange1.blogspot.com/
  date: !binary |-
    MjAxMS0wNC0xOCAxMDowMjozNCArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNC0xOCAwOTowMjozNCArMDIwMA==
  content: Merci pour cet article très didactique... j'ai encore un peu mal au crane
    ;)
---
<p>Quand le résultat d'un code Java me surprend, je regarde son bytecode avec <strong>javap -c</strong>.</p>
<p>Prenons un exemple. Dans notre équipe, nous mettons les variables à <code>final</code> par défaut pour éviter des problèmes de concurrence [1]. J'ai découvert[2] que <code>final</code> pouvait changer le comportement de l'opérateur ternaire <code>? :</code>, comme le montre ce code :<a id="more"></a><a id="more-1701"></a></p>
<pre lang="java">public static void main(String[] args) {

    final int s1 = 6;
    int s2 = 6;

    System.out.println(false ? s1 : 'X');
    System.out.println(false ? s2 : 'X');
}</pre>
<p>qui affiche :</p>
<pre>X
88</pre>
<p>Comment diable 'X' a-t-il été convertit en entier alors que le résultat est connu à la compilation ? Quand je ne comprends pas, je lis le bytecode (<strong>javap -c</strong>) :</p>
<p><code>public static void main(java.lang.String[]);<br />
Code:<br />
Stack=2, Locals=3, Args_size=1<br />
0:	bipush	6<br />
1:	istore_2<br />
2:	getstatic	#2; //Field java/lang/System.out:Ljava/io/PrintStream;<br />
5:	bipush	88<br />
7:	invokevirtual	#3; //Method java/io/PrintStream.println:(C)V<br />
10:	getstatic	#2; //Field java/lang/System.out:Ljava/io/PrintStream;<br />
13:	bipush	88<br />
15:	invokevirtual	#4; //Method java/io/PrintStream.println:(I)V<br />
18:	return</code><br />
<a href="/images/bytecodePhilippeBlayo22.png"><img class="alignnone size-full wp-image-1794" title="bytecodePhilippeBlayo" src="/images/bytecodePhilippeBlayo22.png" alt="" width="573" height="169" /></a>Décomposons les instructions du premier println (<code>2:</code> à <code>7:</code>) :</p>
<pre>   2:	getstatic	récupère le champs static System.out
   5:	bipush	88      empile 88, valeur ascii de X
   7:	invokevirtual   invoque la méthode println</pre>
<p>De <code>10: à 15:</code> le second println a l'air identique, mais à y regarder de plus près le type du paramètre diffère : (I) au lieu de (C) :</p>
<ul>
<li>7:  invokevirtual #3; //Method java/io/PrintStream.<strong>println:(C)</strong>V</li>
<li>15: invokevirtual	#4; //Method java/io/PrintStream.<strong>println:(I)</strong>V</li>
</ul>
<p>Le virtual de invokevirtual indique un appel polymorphe... et la méthode println va s'appliquer à un type int (I) alors que la première invocation prends pour type char (C)</p>
<p>L'énigme #8 de <em>Java Puzzlers</em>[3] nous fournit l'explication par les spécifications de l'opération ternaire <code lang="java">?s1:'X'</code></p>
<ul>
<li>le résultat est de type int quand parmi les deux opérandes (s1 et 'X') on a
<ul>
<li>un de type char</li>
<li>l'autre une constante int représentable en char</li>
</ul>
</li>
<li>sinon la promotion numérique s'applique</li>
</ul>
<p>Le point déterminant est que la constante soit <strong>représentable</strong> sous forme de char. Si l'entier constant est trop grand ou trop petit, la promotion entière vers 88 s'applique :</p>
<pre lang="java">final int tropGrand = Character.MAX_VALUE + 1;
final int tropPetit = Character.MIN_VALUE - 1;

System.out.println(false ? tropGrand : 'X');     // Affiche 88
System.out.println(false ? tropPetit : 'X');     // Affiche 88</pre>
<p>Le conseil donné dans <em>Java Puzzlers</em> : avoir deux opérandes du même type, ce qui évite tout problème.</p>
<p>Références :</p>
<ul>
<li>[1] <em>Java concurrency in practice</em> de Brian Goetz et al</li>
<li>[2] <a href="http://blog.javabien.net">Java bien!</a></li>
<li>[3] <em>Java Puzzlers</em> de Joshua Bloch and Neal Gafter</li>
</ul>
<p>Note sur le bytecode bipush :<br />
Contrairement au puzzle #8, j'affecte 6 aux entiers plutôt que zéro car le bytecode dépend de l'entier affecté :</p>
<ul>
<li>de -1 à 5 : iconst (<code>int i = 0</code> devient <code>iconst_0</code>)</li>
<li>de 6 à 127 : bipush (<code>int i = 6</code> devient <code>bipush 6</code>)</li>
<li>à partir de 128 : sipush (<code>int i = 128</code> devient <code>sipush 128</code>)</li>
</ul>
<p>Pour faciliter la compréhension des non-initiés, je préfère garder le même bytecode pour les affectations de 6 et 88.</p>
