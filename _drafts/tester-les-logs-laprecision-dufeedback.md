---
layout: post
title: Tester les logs, la précision du feedback
author:
  display_name: Philippe  Blayo
tags:
- log
- log4j
- tests
categories:
- java
- tests
comments: true
---

Lors d'une barre rouge sur l'assertion d'un log, un message du style Pas trouvé "Mon log" parmi les logs de niveau info n'aide pas beaucoup. J'aimerais davantage de contexte : si ce log n'a pas été trouvé, quels sont les autres logs présents ?

````
Pas trouvé "Mon log" parmi les logs info :
  Un premier log
  Monn log
  Un dernier log
````

Quand je lis ce feedback, j'identifie une faute d'orthographe dans mon message de log (Monn log au lieu de Mon log). Sinon je me demande si mon log a bien été appelé... J'ai davantage d'hypothèses à vérifier.

Une autre source possible d'erreur réside dans le niveau de log. Un autre feedback qui aide m'indique si le message de log a été trouvé à un autre niveau :

````
Pas trouvé "Mon log" en info, mais trouvé en debug
```
