---
layout: post
title: Être alerté en cas de OutOfMemoryException
author:
  display_name: Jean-Philippe Caruana
login: jp
email: jp@barreverte.fr
categories:
- astuces
tags:
- java
- production
- monitoring
- unix
- shell
comments: true
---

Un des plus grands dangers quand on exploite un service en production, c'est de ne pas être au courant qu'un problème a eu lieu. Un des problèmes graves que l'on peut rencontrer est l'arrêt d'une JVM qui n'a plus assez de mémoire disponible. D'innombrables causes peuvent en être l'origine, mais ce n'est pas le sujet de ce billet. Ici, nous allons voir comment en être alerté, afin de pouvoir réagir (relancer le service par exemple). Il faudra ensuite que l'équipe se penche sur le problème pour éviter que cela ne se reproduise.

Depuis la version 1.4.2 de java, il est possible de demander à la JVM d'appeler un script shell quand elle rencontre une OutOfMemoryException. Il suffit de passer l'option `-XX:OnOutOfMemoryError=/mon/chemin/mon_script.sh` au démarrage de la JVM. C'est une option qui fait partie de la catégorie _debug_ ce qui fait qu'on ne pense pas à l'utiliser en production.

Pour notre part, nous avons choisi d'alerter sur 2 canaux distincts :

- un envoi d'email à la liste des personnes intéressées (les développeurs) - nous allons probablement abandonner ce canal
- une notification sur notre chan `#prod` sur [slack](https://slack.com/) avec un simple `POST` curl (bravo à slack pour l'ouverture de toutes ses API)

Les informations que nous envoyons sont le nom de l'application et le serveur sur lequel la JVM est morte.

Voici notre script, ou en tout cas son template jinja2 (à vous de remplacer les variables slack_webhooks_url, mail_admin_user, mail_monitoring_user et application à votre guise) :


````bash
#!/usr/bin/env bash

message="OutOfMemory detected for {{ application }} on $HOSTNAME."

slack() {
    chan=$1
    message=$2
    curl -X POST --data-urlencode "payload={\"channel\": \"$chan\", \"username\": \"monitoring\", \"text\": \"$message\", \"icon_emoji\": \":sos:\"}" {{ slack_webhooks_url }}
}

cat << EOF  | sendmail -it
From: {{ mail_admin_user }}
To: {{ mail_monitoring_user }}
Subject: [{{ application }}] JVM Out of memory
MIME-Version: 1.0
Content-Type: text/plain

$message

EOF

slack "#prod" "$message"
````

Depuis que nous avons mis cela en place sur tous nos services, nous avons pu réagir rapidement en production et avons du travail devant nous pour éviter que cela ne se reproduise à nouveau.

---

Pour information, voici la [liste des options de la JVM](http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html)

