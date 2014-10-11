---
layout: post
status: publish
published: true
title: Etre alerté quand une nouvelle erreur squatte nos logs
author:
  display_name: Florence Chabanois
  login: florence
  email: flocha2000-agile@yahoo.fr
  url: ''
author_login: florence
author_email: flocha2000-agile@yahoo.fr
excerpt: ! "Nous avons des releases de JSP assez fréquentes. Elles n'ont pas d'impact
  la plupart du temps. Une fois pourtant, on nous signale qu'un candidat n'arrive
  pas à déposer un fichier. Les logs révèlent que ce n'est pas la première fois mais
  impossible de savoir à quand cela remonte. En mettant le nez dedans, on se rend
  compte en plus qu'il y a des deadlocks en série depuis cinq jours, la dernière MEP
  web. Arf.\r\n\r\nOk, dans un monde de rêve, une erreur dans les logs devrait être
  un évènement grave, qui mobiliserait toute l'équipe. Dans la réalité, les logs parfaites
  sont rares et les erreurs \"connues\" sont monnaie courante. \r\n"
wordpress_id: 2083
wordpress_url: /?p=2083
date: !binary |-
  MjAxMS0wNy0yNCAyMjoxMjo0NiArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNy0yNCAyMToxMjo0NiArMDIwMA==
categories:
- shell
- admin
tags:
- feedback
- devops
- monitoring
comments: []
---
<p>Nous avons des releases de JSP assez fréquentes. Elles n'ont pas d'impact la plupart du temps. Une fois pourtant, on nous signale qu'un candidat n'arrive pas à déposer un fichier. Les logs révèlent que ce n'est pas la première fois mais impossible de savoir à quand cela remonte. En mettant le nez dedans, on se rend compte en plus qu'il y a des deadlocks en série depuis cinq jours, la dernière MEP web. Arf.</p>
<p>Ok, dans un monde de rêve, une erreur dans les logs devrait être un évènement grave, qui mobiliserait toute l'équipe. Dans la réalité, les logs parfaites sont rares et les erreurs "connues" sont monnaie courante.<br />
<a id="more"></a><a id="more-2083"></a><br />
<code>[05/07/2011 03:41:32.196-http-a-8080-7$21292131] <ERROR> Unable to create account for candidat with email=bonjourMail@joujou.com<br />
</code></p>
<p>C'est ainsi qu'est né le script de monitoring d'erreurs distinctes :</p>
<p><script type="text/javascript" src="https://gist.github.com/1076892.js?file=display.out"></script></p>
<p>Cette version se contente de compter le nombre d'erreurs dans un fichier de logs. </p>
<p><script type="text/javascript" src="https://gist.github.com/1076861.js?file= erreurs_distinctes.sh"></script></p>
<p>Comme vous pouvez le voir, les informations de contexte comme les mails et ids, très pratiques pour le débogguage, ont été aplaties afin de pouvoir s'en affranchir dans le comptage des erreurs. En lançant le script sur les logs d'un autre projet, j'ai dû ajouter les abstractions des dates et documents. </p>
<p>Le script a tourné quelques jours sur Hudson pour avoir une idée du seuil d'erreurs. Voici un exemple d'utilisation :</p>
<p><script type="text/javascript" src="https://gist.github.com/1076892.js?file=exemple.sh"></script></p>
<p>Ce n'est pas parfait mais la boucle de feedback est déjà plus courte. Il y a probablement un peu de tuning à faire en fonction des projets. La prochaine étape serait d'avoir une liste des exceptions connues, que l'on pourrait réduire au fil de l'eau. </p>
<p>Bruno m'a aussi suggéré de le grapher dans Hudson/Jenkins, ce qui effectivement nous épargne d'avoir à cliquer sur la console de chaque job. J'essaierai avec <a href="http://wiki.hudson-ci.org/display/HUDSON/Plot+Plugin">Plot</a>.</p>
<p><a href="https://raw.github.com/figarocms/monitoring/" title="Sources et tests" target="_blank">Sources + tests ShUnit2</a>.</p>
