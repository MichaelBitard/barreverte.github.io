---
layout: post
title: Des assertions plus lisibles avec FEST-assert
author:
  display_name: Philippe  Blayo
tags:
- eclipse
- intellij IDEA
- junit
categories:
- java
- tests
comments: true
---

Sur du code hérité (legacy), nous passons davantage de temps à lire du code qu'à en écrire. FEST (Feature for Easy Software Testing) aide à écrire des assertions plus lisibles.

Par exemple, pour vérifier la présence d'un élément dans une liste, avec junit, nous en sommes réduits à rédiger nous-même le message d'erreur :

{% highlight java %}
assertTrue(liste+" devrait contenir "+element,
  liste.contains(element));
{% endhighlight %}

On risque même de ne pas mettre de message du tout (dans le feu de l'action, par paresse, par manque de temps...).

Alors que fest offre une assertion dédiée :

{% highlight java %}
assertThat(liste).contains(element);
{% endhighlight %}

Le code est plus concis, plus lisible, et on obtient un message d'erreur mieux standardisé :

````
<['Philippe', 'P', 'Blayo']> does not contain element(s):<['Blaye']>
````

Les égalités apportent un bénéfice supplémentaire en levant une ComparisonFailure au lieu d'une AssertionError.

{% highlight java %}
assertThat(listeObtenue).isEqualTo(listeAttendue);
{% endhighlight %}

Lever une ComparisonFailure permet d'ouvrir la popup de comparaison des IDE (eclipse, intelliJ IDEA) quand on double-clique sur le message d'erreur :

![Fcomparaison avec Fest](/images/comparaisonAvecFest.png)

On peut aussi enchainer les assertions comme dans une phrase :

{% highlight java %}
assertThat("Philippe P Blayo").startsWith("Phil").endsWith("Blayo");
{% endhighlight %}

Avec une collection

{% highlight java %}
assertThat(noms).hasSize(2).contains("Blayo");
{% endhighlight %}

le message d'erreur donne davantage de contexte en affichant la liste lorsque la taille ne correspond pas :

````
expected size:<2> but was:<3> for <['Philippe', 'P', 'Blayo']>
````

La seule difficulté que j'ai rencontrée : l'artifactId s'appelle fest-assert et non pas fest-test.

Pour résumer, les avantages que je vois à fest-assert :

- des messages d'erreurs plus précis
- des différences plus lisibles (ComparisonFailure au lieu d'AssertionError)
- un fluent DSL
