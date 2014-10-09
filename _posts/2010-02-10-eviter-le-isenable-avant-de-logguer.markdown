---
layout: post
status: publish
published: true
title: Eviter le is*Enable avant de logguer
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Sortant d'un atelier Scala, je me replonge plein d'entrain dans le livre
  Programming in Scala de Martin Odersky, et je trouve une solution bête à un soucis
  récurrent que l'on rencontre lorqu'on loggue sans vouloir que la machine passe du
  temps à évaluer la chaine de caractère.\r\n\r\nUn exemple vaut mieux qu'un long
  discours :\r\n<pre lang=\"Java\">\r\n// declaration\r\nLog logger = LogFactory.getLog(getClass());\r\n//
  .... plus loin\r\nlogger.debug(\"je veux debuger le resultat d'une \" + \r\n         methodeQuiPrendDuTemps());
  // ne pas faire ça !\r\n</pre>\r\n\r\nlorsque la ligne logger.debug est évaluée,
  le paramètre est construit avant l'appel de la méthode. Ce qui fait que même si
  le niveau de log est en info, la methodeQuiPrendDuTemps() va être appelée alors
  que la log ne sera pas visible. Pour éviter ce problème nous avions l'habitude en
  java de faire :\r\n\r\n<pre lang=\"Java\">\r\nif (logger.isDebugEnabled()) {\r\n
  \   logger.debug(\"je veux debuger le resultat d'une \" + \r\n             methodeQuiPrendDuTemps());
  \r\n    // c'est mieux mais c'est verbeux\r\n}\r\n</pre>\r\n\r\nEn effet, si vous
  avez de multiples chaînes construites avec des paramètres c'est très lourd d'échapper
  la log à chaque appel. Il existe pas mal de sucres syntaxiques (méthodes statiques
  par exemple) pour faire plus court, mais il restait de la duplication. \r\n"
wordpress_id: 26
wordpress_url: http://tomatoparty.free.fr/?p=26
date: !binary |-
  MjAxMC0wMi0xMCAyMzozNTo1OCArMDEwMA==
date_gmt: !binary |-
  MjAxMC0wMi0xMCAyMTozNTo1OCArMDEwMA==
categories:
- scala
- java
tags:
- scala
- programmation
comments: []
---
<p>Sortant d'un atelier Scala, je me replonge plein d'entrain dans le livre Programming in Scala de Martin Odersky, et je trouve une solution bête à un soucis récurrent que l'on rencontre lorqu'on loggue sans vouloir que la machine passe du temps à évaluer la chaine de caractère.</p>
<p>Un exemple vaut mieux qu'un long discours :</p>
<pre lang="Java">
// declaration
Log logger = LogFactory.getLog(getClass());
// .... plus loin
logger.debug("je veux debuger le resultat d'une " + 
         methodeQuiPrendDuTemps()); // ne pas faire ça !
</pre>
<p>lorsque la ligne logger.debug est évaluée, le paramètre est construit avant l'appel de la méthode. Ce qui fait que même si le niveau de log est en info, la methodeQuiPrendDuTemps() va être appelée alors que la log ne sera pas visible. Pour éviter ce problème nous avions l'habitude en java de faire :</p>
<pre lang="Java">
if (logger.isDebugEnabled()) {
    logger.debug("je veux debuger le resultat d'une " + 
             methodeQuiPrendDuTemps()); 
    // c'est mieux mais c'est verbeux
}
</pre>
<p>En effet, si vous avez de multiples chaînes construites avec des paramètres c'est très lourd d'échapper la log à chaque appel. Il existe pas mal de sucres syntaxiques (méthodes statiques par exemple) pour faire plus court, mais il restait de la duplication.<br />
<a id="more"></a><a id="more-26"></a><br />
En scala, la possibilité de passer des paramètres "par nom" (by name parameter) permet d'éviter cela. Comme en scala on peut définir des fonctions anonymes de cette manière :</p>
<pre lang="Scala">
() => String
</pre>
<p>Nous avons définit une fonction anonyme qui ne prend aucun paramètre et qui renvoie une chaîne. Nous pouvons alors écrire :</p>
<pre lang="Scala">
def debug (constructeurDeChaine: () => String) = 
    if (logger.isDebugEnabled()) 
        logger.debug(constructeurDeChaine())
</pre>
<p>Et l'appeler comme ceci :</p>
<pre lang="Scala">
debug(() => "je veux debuger le resultat d'une " + methode())
</pre>
<p>La construction de la chaîne n'est appelée que si le logger est en mode debug. La chose un peu moche c'est le () =&gt; devant la chaîne. C'est pour cela que le "by-name parameter" existe en scala. On peut écrire :</p>
<pre lang="Scala">
def debug (constructeurDeChaine:  => String) = 
    if (logger.isDebugEnabled()) 
        logger.debug(constructeurDeChaine)
</pre>
<p>Et l'appeler simplement :</p>
<pre lang="Scala">
debug("je veux debuger le resultat d'une " + methode())
</pre>
<p>Il suffit ensuite de mettre les fonctions dans un trait par exemple :</p>
<pre lang="Scala">
trait Logging {
    Log logger = LogFactory.getLog(getClass())

    def debug (chaine:  => String) = 
        if (logger.isDebugEnabled()) logger.debug(chaine)
    
    def info (chaine:  => String) = 
        if (logger.isInfoEnabled()) logger.info(chaine)
    // etc
}
</pre>
<p>Ici, chaine est une fonction et non une chaine de caractères. Et dans une classe qui doit logguer :</p>
<pre lang="Scala">
class MaClasse extends BlahBlah with Logging {
    def uneMethode() = {
        // ...
        debug "je loggue facilement avec " + unContexteQuiPrendDuTemps
    }
}
</pre>
<p>On peut voir la puissance du langage en matière de chasse à la duplication et contrôles. Pour plus de précisions, se référer au chapitre 9 Control Abstraction de Programming in Scala.</p>
