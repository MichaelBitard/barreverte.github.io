---
layout: post
title: Lean Startup &#58; échouer pour réussir
author:
  display_name: Philippe Blayo
tags:
- bonheur au travail
- Niko Niko
- Lean Startup
comments: true
---

Lors des conversations pédestres de la conférence [Walking Dev](http://www.barreverte.fr/walking_dev) de Toulouse,
le parcours récent de Nicolas Deverge (coach et praticien en Lean Startup) m'a parut si riche d'enseignements que je détaille nos échanges dans cet article.


# De la vertu de l'abandon ?

Après l'échec de son précédent produit, plutôt que de s'entêter, il a choisi de tester une autre idée. Un tel renoncement est plus facile quand on ne cherche pas à gagner sa vie avec.
La différence entre la génèse des deux produits est contre-intuitive :
- Résoudre un problème (échec)
- Tester une idée (réussite)

## Résoudre un problème

Le premier produit [KEYS MAG.NET](https://www.keysmag.net) permettait de retrouver des clés perdues :

<img alt="Vous avez trouvé des clés ? Saisissez le code afin de contacter le propriétaire" src="/images/keysmag.jpg"/>

- une plaquette accrochée au porte clef indiquait "Clés trouvées ? Saisir le code {codeDeLaClé} sur www.keysmag.net"
- un passant signalait avoir retrouvé les clés dans 70% des cas

On partait d'un problème à résoudre, auquel le fondateur avait lui-même été confronté. C'est l'idée de l'appli qui fait un job à ma place (retrouver mes clefs). La solution résolvait le problème avec un appréciable taux de succès de 70%.
Le problème lui-même ne semblait néanmoins suffisamment douloureux que pour une sous-population : les parents d'adolescents qui perdent leur clefs.
Cela m'a rappelé une formation en coaching où une personne accompagnée disait que son fils adolescent venait de perdre ses clefs pour la troisième fois.

Cette sous-population s'est avérée trop réduite.


# Tester une idée

Pour le second produit, [TeamMood](https://www.teammood.com) celui qui va s'avèrer une réussite, le point de départ est l'envie de tester des idées.

Partant du constat d'un [artefact](http://mattischneider.fr/anthropologie/agile/thesis/) qui fonctionnait [mal](http://blog.appstud.com/team-mood-au-service-du-happiness-management) au milieu d'un open space, l'idée d'essayer un service anonyme a émergée.

## Commencer sans code

Commencer sans investissement conséquent en terme de code est un atout.
La vente de chaussures en ligne en constitue un bon exemple. Il fût un temps où l'on pensait que vendre des chaussures en ligne était impossible car tout le monde voudrait essayer les chaussures avant de les acheter. Un des premiers vendeurs en ligne a donc commencé par prendre des photos de chaussures dans les magasins autour de chez lui.
Quand une commande lui était faite en ligne, il se rendait dans le magasin pour acheter la paire et il envoyait le colis.

En 2013, Nicolas a testé sa proposition de valeur avec une simple page web statique : un champ de pré-inscription et seulement quelques heures de travail. Un taux d'engagement de plus de 15% a validé son concept.

## Un simple mail

<img class="right" alt="Le courriel envoyé par le service de Niko Niko en ligne" src="/images/courriel_niko_niko_en_ligne.png"/> Le principe : demander tous les soirs à chaque membre d'une équipe comment s'est passée sa journée avec **une note de 1 à 5** et un **commentaire optionnel**. C'est cette pratique qui est souvent appelée "*Niko Niko*" de *Niko* - sourire en japonais - ou encore *feeling board*.

## Une valeur hors d'internet

Visibles par toute l'équipe, les réponses déclenchent des conversations à la machine à café le lendemain matin.
Cela m'a rappelé airbnb où l'essentiel de l'expérience utilisateur se situe également en dehors du site.

Le succès a été rapide : triplement du chiffre d'affaire la deuxième année et atteinte de la rentabilité. Le modèle économique ? Facturer 1 Euro par membre d'équipe. Il y a aujourd'hui plus d'une centaine de clients, principalement des manageurs et des coachs.

## International dès le premier jour

C'est un conseil que j'ai entendu martelé en hackathon pour lancer sa startup : "Si vous ne deviez retenir qu'une seule chose, c'est qu'il faut penser global dès le premier jour".

Après des premiers clients issus des cercles de connaissances et du bouche à oreille, des clients hors de France sont arrivés en cherchant "team mood" dans un moteur de recherche. Le nom du site s'avère un atout par rapport à la concurrence :
- MoodPanda n'est pas aussi évocateur, je ne me souviens jamais si Mood est avant Panda ou après.
- NikoNiko l'est beaucoup plus, mais une chaine de restaurant japonais porte le même nom. 

La présence d'une concurrence pourrait faire peur mais c'est en fait plutôt bon signe : c'est qu'il y a un marché.
Ce qui ne signifie pas qu'il y ait de la place pour tous les acteurs : un concurrent américain et un concurrent anglais ont mis la clef sous la porte en décembre 2016 après avoir échoué à lever des fonds.

## Chat as a service

S'appuyer sur des services facturés à l'usage aide à se concentrer sur le produit : hébergement sur Heroku et intégration d'Intercom comme chat en ligne personnalisé.
Cette personnalisation permet d'envoyer un mail quand le fondateur est occupé : "Je reviens vers vous dès que possible".
Les clients Australiens et Néo-Zélandais patientent ainsi jusqu'au matin Français.

## Mesurer la satisfaction client

Sur une note de 1 à 10, recommanderiez-vous notre service ?
Cette mesure, appelée *taux de recommandation*, suffit pour évaluer la satisfaction client :
- 1-6 : insatisfait (va bientôt partir)
- 7-8 : neutre.
- 9-10 : ambassadeur (va promouvoir le service)
C'est grâce à cet indicateur que Nicolas a par exemple sollicité un client dans la catégorie 9-10 pour répondre sur twitter à un internaute qui demandait quel site choisir.

## Dire merci pour les bugs

Une autre pratique de Nicolas, c'est de remercier pour chaque bug découvert : "merci d'avoir pris le temps d'ouvrir ce bug ça permettra d'améliorer le service pour tous les autres utilisateurs également."

Je devrais essayer sur les projets open sources auxquels je contribue, comme sur [aioimaplib](https://github.com/bamthomas/aioimaplib) où j'ai tendance à me dire "il faut que je pousse rapidement pour montrer qu'on est réactif... on va peut-être gagner une étoile sur github". C'est moi qui reçoit des remerciements.

Je pourrais remercier d'avoir ouvert un ticket et ajouter que l'amélioration bénéficiera à tout le monde. A voir à l'usage si cette pratique s'avère pertinente auprès d'une population de développeurs.

# L'itinérance en conférence

Cet article poursuit la série sur la valeur de l'itinérance pour augmenter les découvertes lors des conférences.
Toutes ces conversations n'auraient pas été aussi approfondies sans ce caractère itinérant de la journée Walking Dev.

