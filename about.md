---
layout: default
title: A propos...
---

# A propos...

Non, ce n'est pas un nouveau blog écolo sur comment construire un immeuble éco-responsable, mais une référence à la barre verte représentant une suite de tests automatiques qui ont réussi.

Nous sommes plusieurs développeurs "agiles", nous souhaitons partager nos solutions, scripts, ou autres réflexions autour de ce thème. Si ces notes peuvent servir à des lecteurs, nous en serions ravis.

Par ailleurs nous voulons parler d'informatique en français, dans un domaine où l'anglais règne, alors que beaucoup de français se passionnent pour le développement informatique.

# Qui sommes-nous ?

* [Philippe Blayo](/author/philippe)
* [David Boissier](/author/david)
* [Jean-Philippe Caruana](/author/jp)
* [Florence Chabanois](/author/florence)
* [Jean-Baptiste Potonnier](/author/jb)
* [Pascal Pratmarty](/author/pascal)
* [Bruno Thomas](/author/bruno)

<p>
Dernière mise à jour du site : le {% assign m = site.time | date: "%-m" %}
{{ site.time | date: "%-d" }}
{% case m %}
  {% when '1' %}janvier
  {% when '2' %}février
  {% when '3' %}mars
  {% when '4' %}avril
  {% when '5' %}mai
  {% when '6' %}juin
  {% when '7' %}juillet
  {% when '8' %}août
  {% when '9' %}septembre
  {% when '10' %}octobre
  {% when '11' %}novembre
  {% when '12' %}décembre
{% endcase %} {{ site.time | date: "%Y" }}
</p>
