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

La semaine dernière, nous avons retrouvé les oies et les canards du chalet de la porte jaune pour la [10e édition de la conférence agile](http://2015.conference-agile.fr/) (anciennement XP Days), pour une thématique "*par delà l'agilité*". Retour sur ce que nous avons retenu de l'ère post-agile.

# Les nouvelles organisations

[Feature Team](http://blog.octo.com/feature-team-au-dela-du-buzzword/) arrivait dans le tiercé gagnant des buzzwords (hormis les citations de *Peter Drucker* ou *hacker*). Au delà du concept d'équipe pluridisciplinaire, auto organisée et responsable d'une fonction ou d'un composant technique, c'est bien de l'organisation du travail dans l'entreprise dont il est question.

Ces 10 dernières années d'enseignements et de pratiques de l'agile ont permis à des équipes de dépasser les cycles itératifs, les méthodes d'ingénierie XP, pour expérimenter ce dont nous parlions il y a plusieurs années : le passage à l'échelle de l'agilité. Ce n'est pas l'effet fractal du scrum de scrum avec des mêlées manageriales qui a fonctionné pour [Cyril Martraire](http://cyrille.martraire.com/), mais des équipes en charge d'un client, avec le développement d'une culture d'entreprise autour du *[software craftmanship](https://fr.wikipedia.org/wiki/Software_craftsmanship)*.

Le centre d'identification pour les développeurs se déplace du code vers le client : les équipes ne sont plus centrées sur une application avec ses règles de développent, ses frameworks, son usine logicielle, mais sur un client. Le héro, prompt à dépanner, mais bloquant l'autonomie de ses pairs devient un *craftman champion* ou artisant expert, qui développe des communautés de praticiens, des [coding dojos](https://fr.wikipedia.org/wiki/Coding_dojo), du [mob programming](http://fr.slideshare.net/InstitutLeanFrance/training-within-software-using-dojo-and-mob-programming-bernard-notarianni-at-the-lean-it-summit-2014) pour asseoir une culture commune. L'autonomie, l'initiative, l'architecture décentralisée sont promues : par exemple, les fonctions de forge logicielle ne sont pas l'apanage d'experts en build. Chaque équipe assure sa production, son run *you build it, you run it*. L'organisation en sillos est explosée façon puzzle.

De nouveaux soucis apparaissent : la première difficulté est de se repérer parmi un écosystème de plusieurs dizaines d'applications, et de 150 personnes. Des cartographies *business* aident les équipes à se repérer, à trouver les bons interlocuteurs. L'amélioration continue ne peut pas concerner tous les pans de chaque application, il faut faire des choix. Par exemple il ne sert à rien de faire de la [livraison continue](http://continuousdelivery.com/) sur un légacy backend, autant le modifier et le livrer le moins souvent possible. Enfin, la confiance ne semble pas suffisante, sonar, des graphes de dépendances permettent de conserver une vision d'ensemble.

Au final, on peut alors se demander mais que va devenir le département IT ? [Mary et Tom Poppendieck](http://www.poppendieck.com/) vont plus loin : "Ah vous avez toujours un département IT ?"

Une autre piste de dépassement de l'agile, qui était très présente dans les présentations l'année dernière, c'est le lean management. Cette année, Sandrine Olivencia et Régis Médina viennent nous parler d'[Obeya](http://fr.slideshare.net/operaepartners/lobeya-agile-france-2015).

> L’Obeya ("grande salle" en japonais) est une pratique Lean de management visuel. C’est un lieu de collaboration intensive et ritualisée. L’information est  disponible et gérée collectivement via des réunions courtes et périodiques. C’est un outil simple et efficace pour répondre aux enjeux de performance.

Wot ? Ca ne vous dit rien ? C'est Christophe Coupé, Senior Manager, Vinci Consulting, pas un agiliste hackeur de conférence qui le dit [dans l'usine nouvelle](http://www.usinenouvelle.com/article/l-obeya-une-pratique-lean-pour-dynamiser-votre-management.N302892). C'est le lieu du travail collaboratif, de supervision de processus, animé par un *Chief Engineer*. Pour reprendre la métaphore des arts martiaux, c'est son dojo d'entraînement. Son portrait : un visionnaire pragmatique, femme/homme de terrain, centré sur la compréhension du client, sachant aller frapper aux portes pour faire évoluer l'organisation et être un mentor pour les personnes qui travaillent avec elle/lui. Pour partager l'information de manière aussi complète que possible, l'obeya contient :
* objectifs et vision : comment mesure-t-on le succès du projet ? Qu'est-ce qui est important ?
* la voix du client : comprendre la proposition de valeur faite par le logiciel (en l'occurence) : en quoi est-ce différenciant ?
* la description du produit : globalement c'est le lien entre la voix du client et la stratégie de mise en oeuvre : l'architecture, les flux de données, les flux applicatifs
* la visualisation de la performance : les éléments du projet/produit/plateforme (avancement, diagramme de satisfaction du client)
* le tracé de la feuille de route, l'anticipation des obstacles
* l'état de maîtrise de la production : taskboard agile, kanban
* la résolution de problème : par exemple le PDCA
Enfin l'animation de l'obeya est quotidienne et hebdomadaire.

Startups d'état...

Entreprises libérées, intelligence collective, retour d'expérience (Anais Victor),
ou Française des jeux Corinne Werner, les makers ou le mouvement DIY

Envie de maîtriser son environnement, de comprendre son client, utiliser au mieux les compétences de chacun en respectant les individus, plusieurs écoles de pensées mènent à des organisations plus humaines. Je vous conseille, si ce n'est pas déjà fait de voir le reportage d'arte ["Le bonheur au travail"](http://boutique.arte.tv/f10216-bonheur_travail), peut-être un peu positif sur le sujet mais il ne faut pas bouder son plaisir.

# Simplicité

Valeur fondamentale de l'eXtreme Programming, peut-être la plus difficile.

Présentation de Pascal V Covenberg.

Test Driven Configuration pour apache
