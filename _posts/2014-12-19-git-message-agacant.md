---
layout: post
title: Git - le message systématique qui agace
author:
  display_name: Jean-Philippe Caruana
tags:
- git
- coup de gueule
categories:
- outils
comments: true
---

A chaque `git fetch` ou `git pull --rebase` ou encore `git merge branche`, j'avais un message agaçant, même quand il n'y avait rien à faire (branche à jour). Par exemple :

````bash
$ git pull --rebase
Compression automatique du dépôt en tâche de fond pour optimiser les performances.
Voir "git help gc" pour toute information sur le nettoyage manuel.
Already up-to-date.
````

Super énervant.

Et `git help gc` ne me parlait pas de ce message.

J'ai quand même tenté des `git gc`, `git gc --auto` et des `git gc --aggressive` sans trop chercher à comprendre, rien n'y faisait, toujours ce même message qui apparaissait parfois 2 fois de suite.

Après [recherche](http://stackoverflow.com/questions/7392155/why-does-git-run-git-gc-auto-on-every-merge), j'ai trouvé ce qu'il fallait faire :

````bash
$ git fsck
Vérification des répertoires d'objet: 100% (256/256), fait.
Vérification des objets: 100% (123706/123706), fait.
$ git repack
Nothing new to pack.
$ git pull --rebase 
La branche courante develop est à jour.
````

*A noter que git me parle à la fois en français en en anglais. Je ne sais pas où reporter ce problème, où comment proposer un patch facile.*

À quoi était dû ce soucis ? Visiblement, la nécessité de faire un `git fsck` indique que mon repository local était dans un mauvais état, mais cela ne m'empéchait pas de travailler pour autant.

Comment mon repository s'était-il retrouvé dans cet état ? Je l'ignore.
Trop de branches tuent les branches ?

Et vous, vous avez déjà eu ce genre de soucis avec `git` ?

----
Liens

* [man page pour git-fsck](https://www.kernel.org/pub/software/scm/git/docs/git-fsck.html)
* [la réponse à mon problème](http://stackoverflow.com/questions/7392155/why-does-git-run-git-gc-auto-on-every-merge)
