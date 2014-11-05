---
layout: post
title: Automatiser une pratique dans un alias
author:
  display_name: Philippe  Blayo
tags:
- bash
- alias
categories:
- linux
---

Je me déplace sur une machine distante dans un but bien précis. Si je vais sur la machine qui héberge les logs, c'est pour les consulter et je reproduis la même séquence :

````bash
ssh user@machine
cd /repertoire/log/
ls
````

Au début, j'avais automatisé la première opération :

````bash
alias recette-log='ssh user@machine'
````

Comme je perdais ensuite du temps à chercher le bon répertoire (diffèrent suivant les environnements), j'ai ajouté le cd :

````bash
alias recette-log='ssh user@machine -t "cd /repertoire/log/ ; bash" '
````

Et comme je fais toujours un ls en arrivant :

````bash
alias recette-log='ssh user@machine -t "cd /repertoire/log/" ; ls ; bash'

web_service    site_web    batch_quartz    bus_de_donnees
````

Ensuite, parmi ces réperoires je me rends dans celui qui abrite les log de l'application qui m'intéressent.

Quand je répète souvent la même séquence, elle gagne à être automatisée (ssh + cd + ls). Lorsque j'arrive au moment où l'opération que je fais dépend du contexte, j'affiche toutes les alternatives possibles.

Par exemple, quand je vais sur un serveur d'application, je ne fais pas toujours la même opération : parfois je relance le serveur, parfois je recharge le contexte. Un message d'accueil m'indique alors ce que je peux exécuter :

````bash
restart_tomcat
restart_context
````

Les alias évolue en même temps que l'architecture. Par exemple avions un cluster rabbitMQ sur lequel nous faisions rabbitmqctl list_connections

````bash
alias itg-bus01='ssh barreverte@bus01.fr -t "rabbitmqctl list_connections; bash"'
````

Puis nous avons ajouté un système de reprise sur erreur (failover) qui s'appuie sur heartbeat. L'alias a alors évolué :

````bash
alias itg-bus01='ssh barreverte@bus01.fr -t "sudo crm status; bash"'
````
