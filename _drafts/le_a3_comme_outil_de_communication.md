---
layout: post
title: Le A3 comme outil de communication avec le management
author:
  display_name: Bruno Thomas
tags:
- agile
- lean
- a3
categories:
- leanagile
---

Il y a peu encore, je travaillais pour un groupe de télécom qui commercialise une offre de messagerie instantannée (ou *chat*) pour que les internautes puissent entrer en communication avec des conseillers. Il comprend une distribution des *chats* dans des files d'attentes, des outils d'aide pour les conseillers et des outils de supervision/administration.

# Petite chronologie projet

Afin de mieux comprendre la situation au moment où nous décidons de faire un A3, faisons une petit éclairage de l'histoire du produit :

* `janvier 2012` : lancement du projet de chat par le marketing, nous sommes deux développeurs au départ
* `février 2012` : nous sommes 4 puis assez vite 5, 6 devs sur le projet
* `juillet 2012` : nous avons selon nous un MVP et nous proposons au PO/marketing de le tester avec des clients de confiance et dans la cible de clientèle. Le marketing refuse, car il n'y a pas suffisamment de fonctionnalités
* `juin 2013` : commercialisation du produit
* `début 2014` : pour améliorer les relations entre le PO et l'équipe, un proxy PO rejoint l'équipe. Il fait partie de l'équipe et travaille de manière étroite avec le PO
* `début mars 2014` : rétrospective projet sur 2 jours avant changement de manager dans l'équipe marketing. Deux jours laborieux, avec des dissensions au sein même de l'équipe marketing. Les décisions prises ne seront pas suivies d'effets
* `début 2015` : le nombre de client augmente régulièrement (~100) mais le nombre de *chats* reste faible (~1650/mois). Les retours clients sont plutôt bons sur l'ergonomie et le fonctionnement global de l'outil. La roadmap marketing prévoit de diminuer le nombre de "resources" sur le projet en passant de 5 à 3 ETP (Equivalent Temps Plein)

# Comprendre le problème

Dans l'équipe, nous redoutons que faute de Chiffre d'Affaire, nous enclenchions une spirale infernale :

![spirale](/images/spirale_neko.jpg)

Je décide alors d'utiliser un [A3, un outil lean](http://fr.slideshare.net/operaepartners/a3-driven-problem-solving), pour comprendre le problème du nombre de *chats* demeurant faible (le CA est proportionnel puisque nous sommes payés au *chat*). Comme son nom l'indique le A3 c'est une feuille A3 recto sur laquelle est décrit de manière objective et synthétique un problème :

* en quoi il est important pour la société
* son contexte : la réalité observée de manière quantitative
* la cible à atteindre représentant une réalité souhaitée
* ses causes
* des contre-mesures permettant de tester la validité des causes identifiées
* un suivi des résutats de ces contre-mesures
* les enseignements de ces expérimentations

Je me fais aider de l'équipe, en binômant régulièrement avec chaque personne, et en proposant des réunion courtes de brainstorming à plusieurs. Je vois un coach chaque semaine pour faire le point de la semaine écoulée et prévoir les actions à mener pour la suivante. Il me donne un cadre théorique, des réflexions et me motive pour continuer cette tâche.

![séance de travail](/images/a3_bureau.jpg)

Je travaille 2 mois sur ce A3. Avec mon coach, nous choisissons de le faire de manière manuscrite et utilisons la technique des collages successifs pour faire évoluer les différentes parties du document.

![séance de travail](/images/a3.png){:height="480px" width="600px"}


# Remonter le problème

Nous devenons peu à peu experts de ce problème. Nous comprenons rapidement que les leviers de décision sont en dehors de notre sphère d'influence : notre management "proche" (n+1, n+2) ne peut pas prendre les décisions qui permettraient de tester nos hypothèses. Mon coach lean m'indique que dans le cadre d'une démarche A3 de remontée de problème au management, deux choses sont à prendre en considération pour choisir la bonne personne :

> elle doit comprendre le problème et avoir les leviers d'action pour le suivre

> elle doit être de confiance

Dans notre cas, il faut remonter à notre N+3 pour avoir la personne qui gère le budget de développement du *chat*. Mais c'est l'entité marketing, celle de notre *product owner*, qui a la responsabilité de la roadmap :

![hierarchie](/images/hierarchie_mgmt.jpg)

Cela signifie que si nous voulons rencontrer un manager qui a **tous** les leviers d'action, il faut remonter jusqu'à notre n+4. C'est une personne qui gère un CA de 150M€ et 2500 personnes. Son temps est précieux et notre problème à 3M€ semble sous-dimentionné. Nous décidons d'aller au bout de cette démarche. Un binôme de l'équipe présentera le A3. Notre management proche nous indique qu'il soutiendra cette démarche, mais il est sceptique sur son résultat, et nous demande de faire tous les échelons avant de solliciter un entretien avec notre n+4 afin de :

* ne pas heurter un manager intermédiaire qui pourrait mal prendre une escalade
* consolider toutes les informations avant de présenter une synthèse au grand manager

Bonne idée ! Cela nous permettra de compléter notre A3 avec des éléments nouveaux et de faire une répétition générale (nous répétons déjà devant d'autres personnes).

Nous prenons donc rendez-vous avec la partie marketing n+2, et avec notre n+3 puisque nous tenons régulièrement informés nos deux managers directs. Nous constatons lors de cet entretien préparatoire :

* qu'il faut attendre de présenter le problème avant de donner le document car les personnes se plongent dans le A3 et n'écoutent plus
* le manager côté marketing se sent remis en question. Il explique qu'il est au courant de cette situation et de ces chiffres. Certaines contre-mesures sont déjà prises : changement de nom (*NDLR : à ce jour il n'a toujours pas changé*), et "*coselling*" avec des *AdWords*. En somme les commerciaux vont vendre le *chat* avec une autre offre de *SEO* (*Search Engine Optimization*) chez google. Cela signifie que nous allons reproduire les mêmes effets délétères que ceux constatés auparavant : vendre le chat à des personnes n'en ayant pas besoin, ou approchées pour un autre produit. Cela produit les résultats qu'on connaît : augmentation du nombre de clients, mais stagnation du nombre de chats, donc du CA
* notre connaissance du problème nous permet de comprendre son point de vue, et de parler le ***même langage***
* nous avons été trop longs lors de la présentation

# L'entretien

## Une prise de contact par mail

A présent, il faut arriver à obtenir un entretien avec ce manager très occupé. Je fais un brouillon, le fais relire par chaque personne de l'équipe, et j'intègre les remarques. L'objectif que nous nous fixons est d'être succincts et susciter la curiosité. Nous envoyons le message suivant sans le document :

> Bonjour,
>
> Je suis développeur coach sur le produit "Produit" depuis 3 ans, au sein d'une équipe web de 5 développeurs web passionnés par ce projet.
>
> Nous observons depuis un an et demi de commercialisation que le chiffre d'affaire ne décolle pas (~900€ en janvier), alors que nous avons des remontées client, et de commerciaux, nous indiquant que le logiciel "n'a pas à rougir de la concurrence".
>
> Nous avons le sentiment que le produit apporte de la valeur, d'autant plus que les secteurs relation client et web sont au coeur de la stratégie du groupe.
>
> Nous avons voulu étayer cette intuition à l'aide d'un outil lean de centré sur la résolution de problème : le A3 ([a3thinking.com](http://a3thinking.com/)).
>
> Nous pensons que ces remontées terrain peuvent vous intéresser, et éclairer des décisions dont nous n'avons pas les prérogatives. Le cas échéant, j'aurais besoin de vingt minutes pour vous communiquer ce document et l'expliquer.
>
> Bien à vous,

La réponse arrive le lendemain :

> [...]
> La solution dont vous parlez, je vois bien son intérêt et son lien direct avec notre stratégie néanmoins nous avons été incapable de la vendre à notre plus gros client : le Groupe - qui l'a testée mais a préféré une autre.
>
>  Je transfère votre mail à [n+2 marketing] qui pilote l'offre ainsi qu'à [n+3 marketing] car je pense effectivement ces remontées intéressantes.
> Suis preneuse [n+2 marketing], [n+3 marketing] de vos retours.

Donc retour vers les personnes que nous avons déjà vues, et qui n'ont pas tous les leviers décisionnels. A ce stade, nous n'avons plus rien à perdre, et surtout [n+4] n'a pas vu le doc. Forts de notre expérience acquise grâce au A3, nous savons aussi que la motivation de départ n'était pas le groupe. Nous voulons au moins nous donner la chance qu'elle le voie :


> > La solution dont vous parlez, je vois bien son intérêt et son lien direct avec notre stratégie [...]
> 
> Sans vouloir être insistant, la stratégie indiquée au départ du projet ne visait pas [Le Groupe], mais le développement d'un outil de chat pour ne plus financer celui d'[un sous traitant] notamment, et pour viser le haut de marché.
> 
> > Je transfère votre mail [...]
> 
> J'ai montré ce A3 à [n+2 marketing] et [n+3]. Je voulais constater l'alignement stratégique autour de ce produit pour savoir où nous allons. Cette direction a des impacts directs sur les développements en cours, et sur l'efficacité de l'équipe.
> 
> Je vous joins le document au format électronique, si vous avez des questions, je suis à votre disposition.

Voila, nous avons au moins envoyé le document et indiqué nos motivations. Nous pensons que l'épisode est clos. Mais le lendemain, nous avons un mail de réponse. Il a été envoyé uniquement sur mon adresse, sans tout le monde en copie :

> ?

C'est tout. Nous nous demandons un moment ce que ce point d'interrogation signifie. Mais nous nous accordons sur le fait que l'envoi uniquement sur mon adresse laisse penser qu'une porte reste entre-ouverte.

A cette époque, je suis en train de lire [Never Eat Alone](http://keithferrazzi.com/products/never-eat-alone/) et dans le chapitre 17 consacré aux "*Small talks*" Keith Ferrazzi nous dit :

> la première chose que les experts en conversation ont tendence à faire c'est d'établir des règles sur ce qui peut être, ou ne peut être dit. Ils prétendent que la première fois que vous rencontrez une personne vous devriez éviter les sujets déplaisants, trop personnels ou controversés.
> 
> Faux! N'écoutez pas ces gens!

Il encourage à faire le choix d'une certaine forme de vulnérabilité, car selon lui, il y a bien plus d'avantages à partager de l'information qu'à la dissimuler, même si cela représente un risque. Alors nous suivons ses conseils, et répondons à [N+4] :

> > ?
> 
> Il est conseillé dans une démarche a3 vers le management de s'adresser à une personne pertinente (qui connaît le problème et qui a les leviers d'action), et de confiance.
>
> Les deux conditions me semblaient remplies. La pertinence car [marketing n+3] gère la roadmap produit, et [n+3] le budget. Vous êtes donc la première personne qui soit "au dessus de la mêlée".
> La confiance, par intuition.
>
> Comme j'ai vu que je n'aurais pas l'occasion de vous présenter le document, je voulais au moins l'envoyer.
>
> La roadmap est pleine, le domaine en développement. Le produit est vendable et solide, il est dans la stratégie du groupe.
> Il ne génère pas de chiffre, le budget est diminué depuis mardi.
>
> Alors que fait-on ?
> Stop ? (et pourquoi ? Qu'avons-nous appris pour la suite ?)
> Encore ? (avec quel budget ? Quelle stratégie moyen-long terme ?)
>
> Le pire des scénario serait un arrêt progressif par non-décision.
>
> Si vous pensez que ce n'est vraiment pas à vous de traiter ce problème, je ne vous dérangerai plus.

Et la réponse :

> Désolé pas compris que le précédent message contenait un fichier.
> Pouvez vous me le renvoyer ?


Nous lui avons renvoyé le A3 et avons finalement obtenu un rendez-vous.

## La réunion

A 9h du matin à son étage, il a une réunion une demi-heure plus tard, il faut décider "GO/NO-GO" pour le projet. Nous refaisons la présentation du A3. Nous attendions qu'il nous explique (ou rappelle pour les autres managers présents) la stratégie du groupe à moyen/long terme, et replace le projet dans cette perspective afin de décider sur des bases concrètes si il s'inscrivait dans ce futur. Finalement il a demandé aux managers qui étaient présents ([marketing n+2/n+3] et [n+3]) ce qu'ils en pensaient.

Nous avons compris qu'il y avait eu des désacords sur le ciblage de clientèle. Et puis, [n+4] a du partir pour sa réunion, et nous n'avons plus compris le langage employé. Pour ma part, je pense que c'était une forme prononcée de "***galimatias doré***" comme disait mon grand-père. Nous avons cependant appris les choses suivantes :

* [marketing n+2] disant dans sa barbe et le brouhaha "peut-être nous-sommes nous trompés ?"
* [n+3] indiquant qu'il voyait bien une stratégie reposant sur 2 pilliers : du développement interne pour le milieu de marché afin de maitriser les produits, défricher des marchés, et l'intégration de progiciels (Oracle, Cisco, ...) pour les grands comptes afin de rassurer les DSI
* nous représentons un tout petit projet à l'échelle de l'entité
* une contrainte réglementaire arrive 6 mois plus tard, du coup il ne faut pas compter sur une décision avant cette échéance
* malgré une réduction du temps de présentation, nous avons encore été trop longs et interpellés par [N+4] pour presser le rythme. Nous comptions 20mn, rétrospectivement, je pense que la présentation même du A3 devait tenir en 10mn, peu
t-être moins. C'est un support, pas un but.


# Ce que nous avons appris

Faire un A3 demande beaucoup d'énergie et de persévérance. C'est une course d'endurance. Ce qui m'a aidé à aller jusqu'à l'entretien, de la même manière qu'on prépare un marathon, c'est de mettre en place des entraînements rituels (les rendez-vous avec un coach, les petits points seul le matin, alors que le bureau est calme, les binômages réguliers).

Pour arriver à reccueillir les informations nécessaires à la représentation de notre problème, il a fallu faire entre 15 et 20 entretiens avec des personnes à qui nous ne parlions pas ou très peu : support produit, commerciaux, bizdev, marketing, management, et des personnes extérieures au projet voire à l'entreprise. Cette démarche est enrichissante car elle évite les réactions défensives de groupe, type "Eux v.s. Nous", et assure une prise de distance. Un peu comme si on voyait l'ouvrage vue d'avion. Temporairement, ce travail autour du A3 aura mis en concert un ensemble de personnes qui n'avaient pas l'habitude de se cottoyer :

<blockquote class="twitter-tweet" data-lang="en"><p lang="fr" dir="ltr">Le A3, c&#39;est + pour apprendre à travailler ensemble que pour le problęme lui meme. @BorisEveque <a href="https://twitter.com/hashtag/LeanSummitFR?src=hash">#LeanSummitFR</a></p>&mdash;  (@MPIgnace) <a href="https://twitter.com/MPIgnace/status/717996192592961537">April 7, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

C'est cette vision qui nous a donné l'énergie d'insister auprès de N+4. Sans le A3, au premier obstacle, nous aurions reculé. Nous avons aussi acquis les termes et finalités du management (sur notre domaine) : CA, croissance, équilibre budgétaire, modèle économique, modèle de facturation, marché... Une forme de langage nous permettant de comprendre et nous faire comprendre. 

Notre A3 était loin d'être terminé, et nous ne savons pas si son début respecte vraiment l'orthodoxie de la méthode lean. Nous avons essayé par la suite de l'utiliser pour faire un suivi des actions en comité de pilotage. Les points sont restés en suspens pendant longtemps, ils doivent toujours l'être. Il semble être nécessaire d'avoir un appui managerial pour aborder la partie "contre-mesures". 

Mais il a joué son rôle de média de communication entre notre perception opérationnelle de terrain et la vision tactique et stratégique du management. 

Que pensez-vous de la démarche ?
Avez-vous déjà entrepris ce type d'action ?
Avec quels outils, quels résultats ? 
Qu'avez-vous appris ?

# Postface

Le produit est toujours en exploitation, il n'y a plus que des petites évolutions, les 3 ETP ont été réduits à 1 ETP : un des dévelopeurs fait la maintenance et tient la boutique. Le code a été amélioré. Le nombre de clients a continué d'augmenter (il y en a 373). Le nombre de chat a un peu augmenté suite à un autre pilote réalisé avec une grosse entreprise française, il se situe autour de 4700, mais nous sommes encore loin de la cible du CA à 10K€.

En ce qui me concerne, cette expérience a contribué à me faire prendre la décision de quitter l'entreprise quelque temps plus tard. Ce qui est bien sûr positif :)





