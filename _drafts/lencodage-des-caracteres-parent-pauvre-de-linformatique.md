---
layout: post
title: L'encodage des caractères, parent pauvre de l'informatique
author:
  display_name: Bruno Thomas
comments: true
---

Thread 'pardon pour ce stupide pb d'encodage'

Difficile pb car dépend :

- environnement utilisateur
- environnement d'exécution du programme
- entrées/sorties
- tests (qui doivent montrer le pb, et tournent dans un environnement non encoding agnostique)

- décode tôt les entrées, encode tard les sorties
cf http://www.haypocalc.com/wiki/Python_Unicode
