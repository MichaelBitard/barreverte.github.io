---
layout: post
title: Retour sur l'Agile Conférence 2015
author:
  display_name: Bruno Thomas
login: bruno
email: bruno@barreverte.fr
url: http://www.barreverte.fr
categories:
- evenements
- agilité
tags:
- conférences
---

La semaine dernière, nous avons retrouvé les oies et les canards du chalet de la porte jaune pour la [10e édition de la conférence agile](http://2015.conference-agile.fr/) (anciennement XP Days), pour une thématique "*par delà l'agilité*". Retour sur ce que nous avons retenu de l'ère post-agile, avec notre filtre forcément subjectif.

# Les nouvelles organisations

[Feature Team](http://blog.octo.com/feature-team-au-dela-du-buzzword/) arrivait dans le tiercé gagnant des buzzwords (hormis les citations de *Peter Drucker* ou *hacker*). Au delà du concept d'équipe pluridisciplinaire, auto organisée et responsable d'une fonction ou d'un composant technique, c'est bien de l'organisation du travail dans l'entreprise dont il est question.

## l'agilité étendue
Ces 10 dernières années d'enseignements et de pratiques de l'agile ont permis à des équipes de dépasser les cycles itératifs, les méthodes d'ingénierie XP, pour expérimenter ce dont nous parlions il y a plusieurs années : le passage à l'échelle de l'agilité. Ce n'est pas l'effet fractal du scrum de scrum avec des mêlées manageriales qui a fonctionné pour [Cyril Martraire](http://cyrille.martraire.com/), mais des équipes en charge d'un client, avec le développement d'une culture d'entreprise autour du *[software craftmanship](https://fr.wikipedia.org/wiki/Software_craftsmanship)*.

Le centre d'identification pour les développeurs se déplace du code vers le client : les équipes ne sont plus centrées sur une application avec ses règles de développent, ses frameworks, son usine logicielle, mais sur un client. Le héro, prompt à dépanner, mais bloquant l'autonomie de ses pairs devient un *craftman champion* ou artisant expert, qui développe des communautés de praticiens, des [coding dojos](https://fr.wikipedia.org/wiki/Coding_dojo), du [mob programming](http://fr.slideshare.net/InstitutLeanFrance/training-within-software-using-dojo-and-mob-programming-bernard-notarianni-at-the-lean-it-summit-2014) pour asseoir une culture commune. L'autonomie, l'initiative, l'architecture décentralisée sont promues : par exemple, les fonctions de forge logicielle ne sont pas l'apanage d'experts en build. Chaque équipe assure sa production, son run *you build it, you run it*. L'organisation en sillos est explosée façon puzzle.

De nouveaux soucis apparaissent : la première difficulté est de se repérer parmi un écosystème de plusieurs dizaines d'applications, et de 150 personnes. Des cartographies *business* aident les équipes à se repérer, à trouver les bons interlocuteurs. L'amélioration continue ne peut pas concerner tous les pans de chaque application, il faut faire des choix. Par exemple il ne sert à rien de faire de la [livraison continue](http://continuousdelivery.com/) sur un légacy backend, autant le modifier et le livrer le moins souvent possible. Enfin, la confiance ne semble pas suffisante, sonar, des graphes de dépendances permettent de conserver une vision d'ensemble.

Au final, on peut alors se demander mais que va devenir le département IT ? [Mary et Tom Poppendieck](http://www.poppendieck.com/) vont plus loin : "Ah vous avez toujours un département IT ?"

## le lean et l'Obeya
Une autre piste de dépassement de l'agile, qui était très présente dans les présentations l'année dernière, c'est le lean management. Cette année, Sandrine Olivencia et Régis Médina viennent nous parler d'[Obeya](http://fr.slideshare.net/operaepartners/lobeya-agile-france-2015).

> L’Obeya ("grande salle" en japonais) est une pratique Lean de management visuel. C’est un lieu de collaboration intensive et ritualisée. L’information est  disponible et gérée collectivement via des réunions courtes et périodiques. C’est un outil simple et efficace pour répondre aux enjeux de performance.

Wot ? Ca ne vous dit rien ? C'est Christophe Coupé, Senior Manager, Vinci Consulting, pas un agiliste hackeur de conférence qui le dit [dans l'usine nouvelle](http://www.usinenouvelle.com/article/l-obeya-une-pratique-lean-pour-dynamiser-votre-management.N302892). C'est le lieu du travail collaboratif, de supervision de processus, animé par un *Chief Engineer*. Pour reprendre la métaphore des arts martiaux, c'est son dojo d'entraînement. Son portrait : un visionnaire pragmatique, femme/homme de terrain, centré sur la compréhension du client, sachant aller frapper aux portes pour faire évoluer l'organisation et être un mentor pour les personnes qui travaillent avec elle/lui. Pour partager l'information de manière aussi complète que possible, l'obeya contient :
- les objectifs et la vision : comment mesure-t-on le succès du projet ? Qu'est-ce qui est important ?
- la voix du client : comprendre la proposition de valeur faite par le logiciel (en l'occurence) : en quoi est-ce différenciant ?
- la description du produit : globalement c'est le lien entre la voix du client et la stratégie de mise en oeuvre : l'architecture, les flux de données, les flux applicatifs
- la visualisation de la performance : les éléments du projet/produit/plateforme (avancement, diagramme de satisfaction du client)
- le tracé de la feuille de route, l'anticipation des obstacles
- l'état de maîtrise de la production : taskboard agile, kanban
- la résolution de problème : par exemple le PDCA

Enfin l'animation de l'obeya est quotidienne et hebdomadaire. Pour plus de précisions, vous pouvez [vous inscrire](mailto:contact@theobeya.net) pour être mis au courant de la sortie du stater kit qui ne devrait pas tarder (sur le même modèle que celui du [lean pour les équipes agiles](http://leanagilecamp.fr)).

## entreprises "libérées" et DIY

Anais Victor est venue nous faire un retour de son expérience en "entreprise libérée". Un reportage d'Arte ["Le bonheur au travail"](http://boutique.arte.tv/f10216-bonheur_travail) avait beaucoup fait parler à ce sujet (jusqu'à la semaine dernière avec un [téléphone sonne](http://www.franceinter.fr/emission-le-telephone-sonne-peut-on-doit-on-etre-heureux-au-travail) dans le cadre de la semaine de la qualité de vie au travail). Intitulé Entreprise libérée - *have a good tripes* ou encore reality check. Le format était intéressant car il confrontait sa vision de product owner avec celle de son CEO, sans complaisance. Dans les reportages ou émissions, une part belle est faite à ce modèle qui applatit la hiérarchie, laisse plus d'autonomie, fait la peau aux "Bullshit Jobs" (expression de [David Graeber](https://fr.wikipedia.org/wiki/David_Graeber)), respecte ses salariés. Son retour oui c'est une expérience riche, mais c'est dur.
- de mettre en place la transparence des salaires. Ils sont passés par une grille intermédiaire avec une échelle de fruit : à chacun correspond un intervalle salarial.
- pour les personnes introverties : le modèle d'autorité est remplacé par un modèle d'influence.

> vous êtes la moyenne des 5 personnes que vous fréquentez le plus

Chaque personne doit élire 5 influenceurs, peut en changer à tout moment. Cela construit un graphe social d'influence. Un des travers c'est que la confusion entre popularité et influence est ténue. Les influenceurs ont un rôle important, notamment le suivi des entretiens individuels et des augmentations. Anaïs notait cette difficulté pour les personnes introverties.

Corinne Werner, nous a fait également un retour d'expérience sur la conception d'un nouveau jeu pour la française des jeux. Ils ont utilisé l'intelligence collective et la culture des makers (le mouvement DIY intelligence) pour mener à bien ce projet, en passant d'un délais habituel de 2 ans à 1 an.

## la modernisation de l'action publique par le numérique

[Etalab](https://www.etalab.gouv.fr) a pour mission d'ouvrir et de partager les données publiques grâce au site [data.gouv.fr](http://data.gouv.fr) dans le cadre Du secrétariat général pour la modernisation de l'action publique (SGMAP). Matti Schneider vient nous montrer qu'il n'y a pas de contradictions entre startup et système d'état, puisqu'ils "*créent des usages avec des moyens différents*". L'idée est d'utiliser les méthodes des startups pour améliorer les services d'état. Notamment ceux qui sont informatifs (en lecture sur les données).


Envie de maîtriser son environnement, de comprendre son client, rendre un service public, utiliser au mieux les compétences de chacun en respectant les individus, plusieurs écoles mènent à des organisations plus humaines. C'était intéressant de constater le mouvement double d'entreprises qui se réforment pour assurer le bien-être de ses employés, comptant sur l'amélioration de leur efficacité pour maintenir ou augmenter son activité (entreprises dites "libres"). Et d'autre part, des pratiques plutôt bottom-up, centrées sur le client et le respect des personnes (lean/agile) qui bénéficient aux collaborateurs.  



# Simplicité

Valeur fondamentale de l'eXtreme Programming, peut-être la plus difficile.

Présentation de Pascal V Covenberg.

Test Driven Configuration pour apache
