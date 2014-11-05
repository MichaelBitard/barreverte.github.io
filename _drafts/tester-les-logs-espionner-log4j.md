---
layout: post
title: Tester les log, espionner log4j
author:
  display_name: Philippe  Blayo
tags:
- tests
categories:
- java
---

Pour capturer les logs, nous utilisons l'approche de plus en plus répandue de l'espionnage. Log4j permet d'ajouter un appender au rootLogger. On va donc créer le notre en implementant l'interface Appender :

````java
public static class AppenderEspion implements Appender {
  List logs = Collections.synchronizedList(new ArrayList());

  public void doAppend(LoggingEvent event) {
    logs.add(event);
  }
  ...
}
````

Chaque message de log est ajouté à une liste (synchronisée pour la concurrence d'accès).
Les assertions recherchent les log dans cette liste.

Ensuite, on ajoute cet appender au rootLogger en passant par un test_logger :

````
proprietes.setProperty("log4j.rootLogger", "TRACE, test_logger");
proprietes.setProperty("log4j.appender.test_logger", AppenderEspion.class.getName());
PropertyConfigurator.configure(proprietes);
```

Pour les assertions, la précision du feedback est fondamentale. Ce sera l'objet d'un prochain billet.
