---
layout: post
title: Une idée d'organisation... apprenante
author:
  display_name: Pascal Pratmarty
---

Tant de langages, de paradigmes, de techniques inexplorées... en sondant l'état de la science informatique, j'ai souvent le sentiment d'observer un véritable puits sans fond, qui tantôt m'effraie, tantôt me fascine. Pour l'avoir ressenti au moins une fois, nous pouvons tous comprendre le plaisir intellectuel, presque jouissif,  généré par la découverte et la maîtrise de l'un ou l'autre de ces joujoux.

Pourtant, notre métier demande bien plus que la maitrise de cette palette toujours en expanson d'outils de création ; le problème de notre profession ne se limite pas à cela. Pour reprendre l'expression d'un cher ami et mentor, comment construire une solution "qui déchire", car répondant directement et au mieux à un problème, un besoin ou une attente, avec la qualité adéquate?  Le voici, notre challenge commun. Chaque nouvelle génération de techno peut créer du buzz, bousculer les idées reçues...  elle peut constituer une corde de plus à notre arc. Mais, s'il vous plait, n'espérons pas béatement y trouver la réponse à cette question.

Je continue aujourd'hui de tatonner pour comprendre la démarche qui favorise de manière consistante et répétable le succès des projets. J'ai quitté récemment la région parisienne et mon réseau, très majoritairement inscrit dans les mouvements Agile et Lean. Dans mon nouveau décor, la population est jeune, enthousiaste et très pragmatique ; étant moi même très j'ai décidé de ne proposer de mes expériences passées que quelques fondamentaux d'organisation qui me paraissent le plus favoriser notre succès.

Voici un mail que j'ai donc envoyé à mon collaborateur en début de cette année, avant qu'il ne rentre de vacances :

<quote>
    Salut Jonathan,

    Pour te donner un avant-goût de ce qui t'attend en ce début d'année ;o), je vais essayer de résumer le fruit de mes réflexions sur le mode d'organisation que nous expérimenterons dès ton arrivée. (Nous en reparlerons calmement demain matin bien entendu)

    Le Wiki (http://192.168.1.22/wiki/doku.php/elo) sera notre base de connaissance partagée, et FogBugz (https://elo.fogbugz.com) notre bugtracker (tant que nous sommes 2, il est gratuit).

    La vision "micro" par tâche technique de développement me paraît lourde et inutile à mettre en oeuvre sur support informatique : je pense (cela n'engage que moi) qu'un tableau de bord physique au mur sera toujours largement supérieur (plus simple, flexible et visuel). J'ai déjà construit une base, mais nous pourrons la modifier avec plaisir avec ton feedback.

    Nous rythmerons la vie du projet à la semaine : je te propose un rdv tous les vendredis à 14h (sur 1 à 2h max) pour un bilan-rétro de la semaine passée, puis un engagement pour la semaine suivante.

    (Note : une réunion d'avancement hebdomadaire a lieu avec le client le même jour : nous aurons sûrement intérêt à rapidement merger les 2 rdvs)

    Comment pouvons nous savoir CHAQUE JOUR si nous avons été bons ou pas?

    C'est une question cruciale, pour savoir au plus tôt si nous dérivons. Dans ce but, on va essayer de suivre chaque fin de journée :

        le nombre de régressions/anomalies corrigées (BUT: nombre suffisant pour finir le sprint avec 0 bug),
        le nombre de régressions/anomalies nouvellement découvertes,
        le nombre de tâches finies (BUT: suffisant pour finir l'engagement initial du sprint),
        le nombre de tâches imprévues nouvellement générées

    Ces indicateurs très faciles à suivre (5 mins de mon temps à peine) nous donneront un référentiel de données brutes pour nous améliorer de semaine en semaine sur des critères objectifs.

    Classification des anomalies et régressions :

        BLOQUANT :  une fonctionnalité de base de l'outil ne fonctionne plus,
        CRITIQUE    : (fiabilité données) certaines informations présentées sont fausses,
        MAJEUR       : (utilisabilité) gêne sérieusement l'utilisabilité, sans compromettre la valeur des informations,
        MINEUR       : (clarté) défauts mineurs d'affichage, ne gênant pas l'utilisabilité.

    La qualité en production :

    Dans mon expérience passée, la première cause de souffrance des projets était d'abord le traitement des régressions (techniques ou fonctionnelles) en production, car elles polluent gravement notre capacité à produire de la nouvelle valeur.

    Pour éviter cela, je te propose que nous essayions de nous organiser et nous améliorer pour rester toujours au plus près de :

        0 défaut : métrique calculée à chaque mise en production (nombre total de régressions & anomalies associées à une MEP = 0),
        correction des anomalies majeures en production < 1 jour => calcul durée de rétention par anomalie "grave" (depuis sa découverte jusqu'à sa correction disponible en production),
        0 réoccurrence d'une anomalie une fois corrigée

    La maîtrise de notre workflow : (cette zone est en cours de réflexion, donc elle n'influera pas tout de suite notre mode de travail)

    A mesure que nous gagnerons en maturité sur le projet, nous capturerons mieux le flux complet de valeur dans notre chaîne de travail. Qu'appelle t-on 'flux de valeur complet"? Toutes les étapes du processus de transformation entre la naissance d'une idée (ou d'un besoin) et la mise à disposition d'une solution en production.

    Pour un projet Agile générique, je pense aux étapes suivantes :

        Idées & besoins bruts : capture de l'ensemble des idées pour améliorer le produit,
        => transition : associer une à plusieurs stories par idée, avec un titre et une description générale
        Stories à clarifier,
        => transition : détailler la story (périmètre précis = définir le fini-fini avec des Use Case)
        Stories à chiffrer,
        => transition : estimer avec l'équipe la complexité de la story ("point abstrait"),
        Stories à développer (priorisation du backlog régulière),
        => transition : sélectionner les stories pour l'itération qui vient
        Stories du sprint en cours
        => transition : développer les fonctionnalités et les tests automatiques associés, mettre à jour le changeLog, et déposer sur UAT
        Stories en stock (réalisées)
        => transition : versionner l'application et pousser sur l'environnement de test (UAT)
        Stories en UAT (User Acceptance Test)
        => transition : le testeur pousse la solution dans ses retranchements,
        => si aucun bug éliminatoire, l'équipe répète la MEP sur une PF de préprod (idéalement à chaque itération)
        Stories validées en pré-production
        => transition : pousser la version en production
        Stories en production (note: maintenir un ChangeLog du type : http://atmail.com/changelog/ )

    Le but du jeu : passer les pépites le plus rapidement possible vers la sortie sans introduire aucune régression ou anomalie.

    La story est l'unité de valeur (la "pépite") qui progresse d'une étape à l'autre, et à laquelle on peut attacher un historique de vie (timestamps de création, d'entrée et de sortie pour chaque étape).

    Il y a beaucoup d'étapes, mais cela peut aller extrêmement vite : dans un monde idéal, le temps total de traversée pour certaines pépites peut être inférieur à un jour.

    Dans mon expérience passée, le résultat était très visuel et simple (voir photos jointes). Nous avions vu beaucoup plus clair en mettant ces infos au mur : situation globale dispo en un coup d'oeil chaque jour, pour tout le monde, et détails de chaque story et besoin stockées dans un système d'information (en l'occurrence, nous utilisions JIRA et GreenHopper).
<quote>
     
Flux Valeur 1 : Transformation idées et besoins :
![Flux Valeur 1 : Transformation idées et besoins](/images/Flux-Valeur-1-Transformation-idees-et-besoins.jpg)

Flux Valeur 2 : Du dev à la mise en production :
![Flux Valeur 2 : Du dev à la mise en production](/images/Flux-Valeur-2-Du-dev-a-la-mise-en-production.jpg)

Résultat : nous n'avons pas respecté à la lettre tous ces points (loin de là), mais avons concocté notre propre "meilleure voie " adaptée à notre contexte. Ce mail a permis de tout de suite démarrer l'année par un échange très constructif, en prenant de la hauteur par rapport à nos ambitions pour l'année, et définissant les contours précis d'une organisation de départ à partir de laquelle nous pourrions nous améliorer sereinement.

 