---
layout: post
title: Agile France 2017
author:
  display_name: Philippe Blayo
tags:
- Agile Conférence Slack Nomade UX Dette Technique
comments: true
---


# [nomadopen.eu](http://nomadopen.eu)

<img class="left" alt="La non-conférence Nomad Open devrait traverser en train des zones montagneuses" src="/images/train_small.jpg"/>Ma plus grande découverte lors de l'open space du premier jour est [Nomad Open](http://nomadopen.eu), une non-conférence sur le travail nomade : le vivre et l'expérimenter en continuant son travail depuis un train qui traverse la France, l'Espagne et l'Italie. 

Pour ceux qui seraient intéressés, les dates de cette première édition sont en cours de discussion, n'hésitez pas à envoyer un mail pour vous manifester.

J'ai moi-même vécu récemment une situation extra-professionnelle de nomadisme qui avait provoqué beaucoup d'incompréhensions et de malentendus :

- Eux: pourquoi tu nous as pas répondu sur facebook messenger ?

- Moi: mon opérateur m'a coupé l'accès quand j'ai passé la frontière italienne, malgré l'option onéreuse que j'avais souscrite dans le train pour maintenir la continuité du service.

- Eux: pourtant tu répondais à certains moments.

- Moi: c'est quand j'étais à l’hôtel, c'est le seul endroit dans Milan où j'ai réussis à avoir du wifi.


Ce défaut de connectivité a fait s'envenimer la situation.
Une situation qui ne devrait plus se reproduire puisque ce même 15 juin 2017 entrait en vigueur une directive qui a vu globalisé par l'Europe l'accès aux données/SMS/appels aux tarifs locaux.



# [beta.gouv.fr](http://beta.gouv.fr)

Comment mettre en oeuvre l'auto-organisation dans une bulle hébergée au sein d'une bureaucratie ? C'est le défi que tentent de relever les membres de beta.gouv.fr, l'incubateur des startups d'état. Deux éléments qui m'ont marqués :

- Trouver comment obtenir un badge est tellement difficile que la page [wiki](https://github.com/sgmap/beta.gouv.fr/wiki/Bienvenue#badge) de l'incubateur a été utilisée par un nouvel arrivant d'une autre entité qui était tombé dessus par hasard. Une fois éprouvée, la procédure a été automatisée dans un [robot](https://github.com/sgmap/betaGouvBot/blob/master/lib/betagouvbot/badge_request.rb) sur slack (il s'agit juste d'un [mail](https://github.com/sgmap/betaGouvBot/blob/master/data/mail_badge.md) a envoyer à la bonne personne avec les bonnes informations)

- La moitié des échanges sur slack restent privés. L'orateur, Matti Schneider, indiquait que les membres s'auto-censurent en pensant que la conversation n'intéressera pas d'autres personnes. Il s'agit d'un filtrage à priori alors que le filtrage devrait se faire à posteriori pour éviter de recréer une hiérarchie liée à la détention de certaines informations.

![Usage des canaux privés et public chez beta.gouv.fr](/images/slack-beta-gouv-fr.png)


Dans mon travail, l'utilisation de slack est massive et l'information échangée précieuse. Précieuse dans le sens où quand je rencontre un problème déjà évoqué, je me souviens que la réponse y a été donnée quelque part. Tout le problème est sur quel channel. J'ai rarement en tête des mots clefs suffisament discriminants pour une recherche globale (on parle d'une vingtaine d'équipes qui échangent sur slack depuis plusieurs années). A l'inverse si l'échange s'est déroulé en privé, je me souviens très bien avec qui et je retrouve très vite l'information. Je sais aussi que ces échanges privés sont perdus lorsque la personne quitte l'entreprise. Reste à trouver un équilibre. Il m'arrive parfois de recopier une réponse donnée en privé sur un channel publique ou dans Jira.


Une des choses que j'apprécie à Agile France se sont les conversations en marge des conférences : assit sur un banc pendant que Laurent Bossavit finalise la newsletter de beta.gouv.fr, je tente de m'y abonner sur mon mobile. L'expérience utilisateur s'y avère difficile :

- j'ai toutes les peines du monde à trouver le formulaire : il n'est révélé que quand je glisse mon doigt jusqu'à l'extrème limite de la page mais une animation le masque jusqu'au dernier moment. Laurent aurait aimé filmer ma tête.

![Je tente de trouver le formulaire pour m'abonner à la newletter](/images/beta_gouv_fr_newletter.jpg)
![Le formulaire pour s'abonner à la newletter est révélé en faisant disparaître le reste de la page](/images/beta_gouv_fr_newletter_with_form.png)

- quand je clique pour indiquer mon adresse électronique, le clavier masque le formulaire et je dois taper en aveugle.

Cela étant dit, le mobile-first serait difficilement justifiable puisque les accès par mobile ne représentent qu'un quart de leur [traffic](http://stats.data.gouv.fr/index.php?module=CoreHome&action=index&idSite=21&period=range&date=previous30#?module=Dashboard&action=embeddedIndex&idSite=21&period=range&date=previous30&idDashboard=1) (j'ai appris à cette occasion que ces données étaient publiques) :

![Part des terminaux mobiles dans le traffic 2017 de beta.gouv.fr](/images/beta_gouv_fr_traffic.png)

# La pourriture du code

Arnaud Lemaire propose d'appeler pourriture du code la dette technique subie. J'aime cette idée car le terme de dette technique (qui reste pertinent quand elle est choisie) donne à penser que des stratégies de couverture sont possibles alors qu'on est plus proche d'une entropie. Les astres étaient très alignés en ce 15 Juin 2017 puisque le même jour était soutenue en Finlande une [thèse](http://www.doria.fi/bitstream/handle/10024/136260/Jesse%20Yli-Huumo%20A4.pdf) sur la dette technique.

# Une conférence qui s'installe dans la durée

En conclusion je mesure tout le chemin parcouru par cette conférence depuis sa toute première édition en 2006 où elle s'appelait XP Day France (je me souviens encore avec émotion avoir été en reconnaissance avec Patrice Petit pour évaluer l'Espace Hamelin dans lequel elle s'était tenue). La conférence est maintenant tellement connue qu'elle se tient à guichet fermé sans que les organisateurs aient besoin de communiquer. Bien qu'étant devenue non marchande elle est aussi bénéficiaire tout en gardant un tarif relativement bas.
