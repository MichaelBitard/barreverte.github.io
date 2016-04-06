---
layout: post
title: Retour sur l'Agile Conférence 2015
author:
  display_name: Bruno Thomas
login: bruno
email: bruno@barreverte.fr
categories:
- evenements
- agilité
tags:
- conférences
comments: true
---
<img src="http://2015.conference-agile.fr/img/logo.png" class="left" width="100"/>
La semaine dernière, nous avons retrouvé les oies et les canards du chalet de la porte jaune pour la [10e édition de la conférence agile](http://2015.conference-agile.fr/) (anciennement XP Days), pour une thématique "*par delà l'agilité*". Retour sur ce que nous avons retenu de l'ère post-agile, avec notre filtre forcément subjectif.

# Les nouvelles organisations

[Feature Team](http://blog.octo.com/feature-team-au-dela-du-buzzword/) arrivait dans le tiercé gagnant des buzzwords (hormis les citations de *Peter Drucker* ou *hacker*). Au delà du concept d'équipe pluridisciplinaire, auto organisée et responsable d'une fonction ou d'un composant technique, c'est bien de l'organisation du travail dans l'entreprise dont il est question.

## L'agilité étendue
Ces 10 dernières années d'enseignements et de pratiques de l'agile ont permis à des équipes de dépasser les cycles itératifs, les méthodes d'ingénierie XP, pour expérimenter ce dont nous parlions il y a plusieurs années : le passage à l'échelle de l'agilité. Ce n'est pas l'effet fractal du scrum de scrum avec des mêlées manageriales qui a fonctionné pour [Cyril Martraire](http://cyrille.martraire.com/), mais des équipes en charge d'un client, avec le développement d'une culture d'entreprise autour du *[software craftmanship](https://fr.wikipedia.org/wiki/Software_craftsmanship)*.

<img src="http://www.christian-faure.net/wp-content/uploads/swcraftmanship.jpg" class="right" width="300"/>

L'identification des développeurs se déplace du code vers le client : les équipes ne sont plus centrées sur une application avec ses règles de développent, ses frameworks, son usine logicielle, mais sur un client. Le héro, prompt à dépanner, mais bloquant l'autonomie de ses pairs devient un *craftman champion* ou artisant expert, qui développe des communautés de praticiens, des [coding dojos](https://fr.wikipedia.org/wiki/Coding_dojo), du [mob programming](http://fr.slideshare.net/InstitutLeanFrance/training-within-software-using-dojo-and-mob-programming-bernard-notarianni-at-the-lean-it-summit-2014) pour asseoir une culture commune. L'autonomie, l'initiative, l'architecture décentralisée sont promues : par exemple, les fonctions de forge logicielle ne sont pas l'apanage d'experts en build. Chaque équipe assure sa production, son run "*you build it, you run it*". L'organisation en sillos est explosée façon puzzle.

De nouveaux soucis apparaissent : la première difficulté est de se repérer parmi un écosystème de plusieurs dizaines d'applications, et de 150 personnes. Des cartographies *business* aident les équipes à se repérer, à trouver les bons interlocuteurs. L'amélioration continue ne peut pas concerner tous les pans de chaque application, il faut faire des choix. Par exemple il ne sert à rien de faire de la [livraison continue](http://continuousdelivery.com/) sur un légacy backend. Autant le modifier et le livrer le moins souvent possible. Enfin, la confiance ne semble pas suffisante : sonar, des graphes de dépendances permettent de conserver la cohésion de l'ensemble.

Au final, on peut alors se demander mais que va devenir le département IT ? [Mary et Tom Poppendieck](http://www.poppendieck.com/) vont plus loin : "Ah vous avez toujours d'un département IT ?"

## Le lean et l'Obeya

<a href="https://www.flickr.com/photos/31719094@N04/18344115044" title="IMGP0535 by bamthomas, sur Flickr">
<img src="https://c2.staticflickr.com/4/3944/18344115044_5dc1007701.jpg" class="right" width="500" height="331"></a>

Une autre piste de dépassement de l'agile, qui était très présente dans les présentations l'année dernière, c'est le lean management. Cette année, Sandrine Olivencia et Régis Médina viennent nous parler d'[Obeya](http://fr.slideshare.net/operaepartners/lobeya-agile-france-2015).

> L’Obeya ("grande salle" en japonais) est une pratique Lean de management visuel. C’est un lieu de collaboration intensive et ritualisée. L’information est  disponible et gérée collectivement via des réunions courtes et périodiques. C’est un outil simple et efficace pour répondre aux enjeux de performance.

Wot ? Ca ne vous dit rien ? C'est Christophe Coupé, Senior Manager chez Vinci Consulting, pas un agiliste hackeur de conférence qui le dit [dans l'usine nouvelle](http://www.usinenouvelle.com/article/l-obeya-une-pratique-lean-pour-dynamiser-votre-management.N302892).

Régis et Sandrine nous décrivent ce lieu du travail collaboratif, de supervision de processus, animé par un *Chief Engineer*. Pour reprendre la métaphore des arts martiaux, c'est son dojo d'entraînement. Son portrait : un visionnaire pragmatique, femme/homme de terrain, centré sur la compréhension du client, sachant aller frapper aux portes pour faire évoluer l'organisation et être un mentor pour les personnes qui travaillent avec elle/lui.

Pour partager l'information de manière aussi complète que possible, l'obeya contient :

- les objectifs et la vision : comment mesure-t-on le succès du projet ? Qu'est-ce qui est important ?
- la voix du client : comprendre la proposition de valeur faite par le logiciel (en l'occurence) : en quoi est-ce différenciant ?
- la description du produit : globalement c'est le lien entre la voix du client et la stratégie de mise en oeuvre : l'architecture, les flux de données, les flux applicatifs
- la visualisation de la performance : les éléments du projet/produit/plateforme (avancement, diagramme de satisfaction du client)
- le tracé de la feuille de route, l'anticipation des obstacles
- l'état de maîtrise de la production : taskboard agile, kanban
- la résolution de problème : par exemple le PDCA

Enfin l'animation de l'obeya est quotidienne et hebdomadaire. Pour plus de précisions, vous pouvez [vous inscrire](mailto:contact@theobeya.net) pour être mis au courant de la sortie du stater kit qui ne devrait pas tarder (sur le même modèle que celui du [lean pour les équipes agiles](http://leanagilecamp.fr)).

## Entreprises "libérées" et DIY

Anais Victor est venue nous faire un retour de son expérience en "entreprise libérée". Un reportage d'Arte ["Le bonheur au travail"](http://boutique.arte.tv/f10216-bonheur_travail) avait beaucoup fait parler à ce sujet (jusqu'à la semaine dernière avec un [téléphone sonne](http://www.franceinter.fr/emission-le-telephone-sonne-peut-on-doit-on-etre-heureux-au-travail) dans le cadre de la semaine de la qualité de vie au travail). Sa présentation était intitulée Entreprise libérée - *have a good tripes* ou encore reality check. Le format était intéressant car il confrontait sa vision de product owner avec celle de son CEO, sans complaisance. Dans les reportages ou émissions, une part belle est faite à ce modèle qui applatit la hiérarchie, laisse plus d'autonomie, fait la peau aux "Bullshit Jobs" (expression de [David Graeber](https://fr.wikipedia.org/wiki/David_Graeber)), respecte ses salariés. Son retour, oui c'est une expérience riche, mais c'est dur.

- de mettre en place la transparence des salaires. Ils sont passés par une grille intermédiaire avec une échelle de fruit : à chacun correspond un intervalle salarial.
- pour les personnes introverties : le modèle d'autorité est remplacé par un modèle d'influence...

> vous êtes la moyenne des 5 personnes que vous fréquentez le plus

Chaque personne doit élire 5 influenceurs, peut en changer à tout moment. Cela construit un graphe social d'influence. Un des travers c'est que la confusion entre popularité et influence est ténue. Les influenceurs ont un rôle important, notamment le suivi des entretiens individuels et des augmentations. Anaïs notait la difficulté pour les personnes introverties de faire leur place dans ce type d'organisation.

Corinne Werner, nous a fait également un retour d'expérience sur la conception d'un nouveau jeu pour la française des jeux. Ils ont utilisé l'intelligence collective et la culture des makers (le mouvement [DIY](https://fr.wikipedia.org/wiki/Do_it_yourself)) pour mener à bien ce projet, en passant d'un délais habituel de 2 ans à 1 an.

## La modernisation de l'action publique par le numérique

<a href="<a href="https://www.flickr.com/photos/31719094@N04/18940431016" title="IMGP0538 by bamthomas, sur Flickr"><img src="https://c1.staticflickr.com/1/385/18940431016_f1e58e12d5_n.jpg" class="right" width="212" height="320" alt="IMGP0538"></a>

[Etalab](https://www.etalab.gouv.fr) a pour mission d'ouvrir et de partager les données publiques grâce au site [data.gouv.fr](http://data.gouv.fr) dans le cadre Du secrétariat général pour la modernisation de l'action publique (SGMAP). Matti Schneider vient nous montrer qu'il n'y a pas de contradictions entre startup et système d'état, puisqu'ils "*créent des usages avec des moyens différents*". L'idée est d'utiliser les méthodes des startups pour améliorer les services d'état. En priorité pour ceux qui sont informatifs (en lecture sur les données) comme https://mes-aides.gouv.fr/, http://embauche.sgmap.fr/. C'est une stratégie d'[API](https://apientreprise.fr/) avec de petits produits qui puissent interragir, afin, dans un second temps de questionner les pratiques administratives, le tout en montrant l'exemple.

Envie de maîtriser son environnement, de comprendre son client, rendre un service public, utiliser au mieux les compétences de chacun en respectant les individus, plusieurs écoles mènent à des organisations plus humaines. C'était intéressant de constater le mouvement double d'entreprises qui se réforment par le haut et cherchent à assurer le bien-être de ses employés en comptant sur l'amélioration de leur efficacité pour maintenir ou augmenter son activité (entreprises dites "libres"). Et d'autre part, des pratiques plutôt bottom-up, centrées sur le client et le respect des personnes (lean/agile) qui bénéficient aux collaborateurs dans un second temps.

# Simplicité et feedback

Retour sur deux des valeurs fondamentales de l'extreme programming avec des sessions autour de la programmation, mais dans des domaines incongrus du test unitaire.


## Test Driven Configuration pour apache

Tester la configuration d'apache. Que celui qui n'a jamais galéré avec apache2.conf jette le premier test. C'est Antoine Contal qui est aux manettes, il nous montre comment il a aidé ses opés à modifier les fichiers de conf apache sans avoir la main qui tremble lors de la prochaine mise en production. En utilisant shUnit, screen, vim, il se met en capacité d'échanger avec les opés dans leur langage, avec leurs outils.

Il met en place des "mocks" :

- utilisation de /etc/hosts pour le DNS,
- un tomcat avec une servlet répond l'écho de l'url demandée pour tester le connecteur ajp13

Afin de se placer au bon niveau de test : sur la "couture" (the seam model de working effectively with legacy code). Manière de trouver le bon compromis entre tester l'environnement tout entier et tester directement le ficher de conf (asserts sur des parties du fichier).

De cette manière il teste les modifications demandées par les opés, et leur livre un fichier apache.conf qui marche.

## Vers l'intestabilité et au delà

Dans sa série "vous ne pourrez plus dire que votre environnement n'est pas testable", après le TDD sur assembleur atari 2600, voici le
[jeu de la vie GLSL](http://www.glslsandbox.com/e#26153.0) donc sur un environnement graphique sans console. Par petit pas, [Emmanuel](https://github.com/egaillot) et [Jonathan](https://github.com/jonathanperret) nous montrent comment faire émerger un petit framework de tests en GLSL, tout en réalisant le [jeux de la vie](https://fr.wikipedia.org/wiki/Jeu_de_la_vie). La barre verte est affichée en haut de l'écran. Le résultat est spectaculaire puisque l'efficacité d'affichage est assurée par le *shader*, chaque pixel est géré de manière pseudo parallèle par le [pixel pipeline](https://en.wikipedia.org/wiki/Graphics_pipeline) (si j'ai bien compris).

<a href="http://www.glslsandbox.com/e#26153.0"><img src="{{ site.baseurl }}/images/jeu_de_la_vie_glsl.png" width="500"/></a>

## Simulation humaine de programmation parallèle

Présentation de Pascal Van Cauwenberghe pour comprendre la programmation parallèle, notamment le modèle acteur. L'idée était de simuler ce que fait l'ordinateur avec le public. Cela a permis à notre bloggueur Philippe de comprendre la différence entre Acteur et Channel, et d'aborder la complexité de ce modèle simplement avec des acteurs humains.

# Et aussi

## Ecoute que coûte

Un petit pas de côté, nous pouvons aussi parler de feedback dans la communication humaine. L'entraînement à l'écoute que nous propose Irène Doan, est intéressant : essayez de raconter une anecdote à deux en même temps pendant 2 minutes, puis relatez à votre binôme ce que vous en avez compris. C'est un test de [Vincent Daviet](https://babagile.wordpress.com/about/) qui nous permet de voir à quel point il est dfficile d'écouter et réfléchir/parler en même temps. Puis une autre anecdote en binôme en écoutant sans parler, et enfin, à tour de rôle en trinôme avec un dessin comme support. Cela m'a permis de **ressentir** les différents canaux de communications et la difficulté d'arrêter ses pensées pour écouter pleinement l'autre.

<a href="https://www.flickr.com/photos/31719094@N04/18344071874" title="IMGP0500 by bamthomas, sur Flickr"><img src="https://c1.staticflickr.com/1/263/18344071874_8cfc5e63bf.jpg" width="500" height="331" alt="IMGP0500"></a>


## Un forum ouvert
Un peu cahotique, avec beaucoup de monde qui discute en off, mais c'est aussi le moyen de revoir des personnes qu'on a pas vu depuis longtemps et d'avoir des discussions aussi intéressantes que certaines sessions.

## Un repas surprenant
Avec un bus qui nous emmène sur une péniche, en face de la cité de la mode, histoire de changer des autres années. Une présentation longue et dense d'un professeur de français d'une classe de 5e qui pratique l'agilité (entre autres disciplines comme la thermodynamique, la systémique...) pour réaliser des cours ouverts plus adaptés aux élèves. Pour plus de précision, voir son blog : http://pedagogieagile.com/ et [sa présentation](https://drive.google.com/file/d/0B5qKr_UatV78NEpMeFowc1JMMk0/edit).

Merci donc à toute l'équipe de l'agile conf, aux présentateurs, qui ont pu rendre cette édition possible et si riche.
Merci à tout ceux qui sont impliqués bénévolement dans l'association agile France.
