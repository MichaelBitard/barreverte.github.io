---
layout: post
title: Tester les logs, assertions
author:
  display_name: Philippe  Blayo
tags:
- junit
- log
- log4j
categories:
- agilité
- tests
- java
comments: true
---

Parce qu'ils peuvent sauver la vie quand un soucis survient en production, nous testons les log avec des assertions comme :

````java
assertLogInfo().contient("un log en info");
```

Un test complet serait :

````java
public class LogTest {

  public @Rule LoggueurEspionRule loggueur = new LoggueurEspionRule();

  @Test public void logInfo() {
    ...
    LoggueurEspion.assertLogInfo().contient("un log en info");
````

La règle junit (@Rule) espionne les logs avec la classe LoggueurEspion dont la méthode assertLogInfo() est utilisée pour vérifier la présence d'un log au niveau info.
