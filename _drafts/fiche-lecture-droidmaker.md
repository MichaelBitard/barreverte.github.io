---
layout: post
title: Fiche de lecture - DroidMaker par Michael Rubin
author:
  display_name: Jean-Philippe Caruana
login: jp
email: jp@barreverte.fr
categories:
- fiche de lecture
tags:
- cinéma
- musique
- livre
- star wars
- histoire de l'informatique
- unix
- off topic
comments: true
---

Je vous propose une petite fiche de lecture sur un livre que j'ai lu récement et qui m'a beaucoup plu. Ce n'est pas directement lié au sujet de ce blog (en gros, le développement logiciel), mais j'ai trouvé le sujet suffisament proche et intéressant pour que cet article figure ici. Vous me direz ce que vous en pensez.

# _DroidMaker_ par Michael Rubin

![Couverture de DroidMaker]({{ site.url }}/images/droidmaker/droidmaker.jpg)

_DroidMaker: George Lucas and the Digital Revolution_ (quel titre !) écrit par [Michael Rubin](https://about.me/rubin), a été publié en anglais en 2005 par Triad Pub Co. Il n'existe à ma connaissance pas de traduction en français à ce jour. À noter : un site web ([droidmaker.com](http://www.droidmaker.com/index.html)) a même été créé autour de ce livre, pour pouvoir aller plus loin.

## De quoi est-ce que ça parle ?

_DroidMaker_ parle de la révolution **totale** amenée par George Lucas (et Francis Ford Coppola) dans le cinema moderne, le passage du monde des studios tout puissants (à l'ancienne) au cinéma moderne et indépendant (désormais _mainstream_). Où se situe cette révolution ? 

* dans le passage d'un corporatisme des studios hollywoodiens et des syndicats à plus de liberté et de créativité
* le réalisateur en maître tout puissant (auparavant, c'était le règne des studios)
* la révolution des effets spéciaux réalistes, en particulier par ordinateur
* les films entiérement générés par ordinateur (avec la création de Pixar et le premier long métrage 100% réalisé par ordinateur, Toy Story)
* les logiciels de montage vidéo et sonore
* l'exigence pour la qualité des cinémas aux États-Unis, avec le standard THX

C'est le rêve d'indépendance d'un petit réalisateur prêt à investir durablement pour se créer les outils dont il a besoin. C'est l'histoire d'un patron qui traite ses employés comme sa famille, en leur laissant une autonomie incroyable, en leur faisant confiance.

## Cinéma
On démarre avec Francis Coppola et George Lucas qui se battent contre le système hollywoodien de l'époque. On y croise également leurs comparses de la côte Est, Steven Spielberg et Martin Scorcese. Tous ont participé à cette émancipation des studios hollywoodiens.

Auparavant, la pression des syndicats était telle que non seulement il était impossible d'obtenir un poste sans recourir au piston (par son oncle déjà présent au studio par exemple), mais il fallait vraiment partir du bas de l'échelle avant de pouvoir obtenir un poste qui correspond plus à ses passions et à ses compétences (en gros, ça donnait du *Nous on en a chié pour arriver là, pas de raison qu'il n'en soit pas autant pour toi. Va me chercher un café !*). De quoi en dégouter plus d'un très rapidement. Également, par la pression des syndicats, il était presque impossible de réaliser le moindre film sans avoir l'obligation d'engager toute une floppée d'assistants-réal ou chef-op, même pour un petit film. Ainsi, le cinéma indépendant ne pouvait quasiment pas exister car le budget minimum rien qu'en termes de salaires était exorbitant.

Un aspect intéressant de la démarche de Coppola/Lucas, c'est d'avoir quitté la région de Los Angeles pour aller plus au nord, vers San Francisco et la Silicon Valley. On comprend bien que la proximité avec la Silicon Valley aura des conséquences sur leur façon d'aborder le cinéma et cela mènera à la création d'outils numériques inédits et à l'informatisation du cinéma.

Tous ces réalisateurs ont pu obtenir leur indépendance (financière, puis artistique) en utilisant les studios existants, quitte à faire des oeuvres de commande, alimentaires (comme le Parrain !). Avec le succès est arrivé l'argent, et avec l'argent, un nouveau système a pu naître des cendres moribondes du cinéma hollywoodien de l'époque. Ainsi, ce sont les films de ces réalisateurs qui ont les premiers dépassé la barre symbolique des 100 millions de dollars de recette ; ceci n'était pas arrivé depuis Autant en emporte le vent, un film de 1939 ! Désormais, ce seront eux les acteurs les plus importants du cinéma américain.

## Lucasfilm Computer Division

![Lucasfilm]({{ site.url }}/images/droidmaker/Lucasfilm_Ltd._logo.svg)

Le livre décrit de manière très détaillée (ce que nous ne ferons pas ici) l'histoire de la génération d'images par ordinateurs, tout le chemin parcouru en particulier par Ed Catmull et Alvy Ray Smith depuis le [NYIT](http://www.nyit.edu/), le New York Institute of Technology, jusqu'à leur travail au sein de la Lucasfilm Computer Division, en passant par le travail réalisé à l'Université de l'Utah, sans oublier la naissance de Pixar. On en apprend d'ailleurs de belles sur la vente de Pixar à Steve Jobs...

Une grande partie de ce voyage s'est constitué autour des grands défis pour créer un film entièrement réalisé sur ordinateur, en particulier celui du *motion blur* sans lequel les images trop nettes ne nous parraissent pas naturelles, l'invention du canal alpha dans les images et la vidéo pour gérer l'information de transparence, l'invention du frame buffer et ses limites, toutes les techniques d'ombrage, de textures, de calcul de suface, en bref toute la difficulté de réaliser dans un temps acceptable des images impossibles à filmer en studio.

Cela m'a donné envie de voir certaines de ces réalisations, en particulier le court film [Vol Libre](https://vimeo.com/5810737) présenté par Loren Carpenter au [SIGGRAPH](http://www.siggraph.org/) de 1980 (le Special Interest Group in Graphics) : c'est le premier film réalisé à partir d'algorithmes fractals et ce fut une révolution ; désormais, plus besoin de calculer tous les points d'un paysage à l'avance, il suffit de n'afficher que ceux nécessaires à un moment donné selon la distance sujet-caméra, sans avoir besoin de tout calculer à l'avance (un gain de temps précieux et un réalisme extraordinaire). Suite à ce coup de force, Loren Carpenter rejoindra la Lucasfilm Computer Division qui deviendra plus tard Pixar.

Des chapitres très denses, en particulier la partie New Yorkaise un peu rébarbative par moments, mais très riches en apprentissages malgré tout.

## THX et le son des salles de cinéma

J'ai été surpris d'apprendre que les salles de cinéma de l'époque (fin des années 1970) étaient toutes dans un piteux état ; j'avais une image de l'âge d'or du cinéma et pensais que la technique avait suivi, mais il n'en n'était en fait rien ! Les systèmes de diffusion des images et du son dataient souvent de 20 ou 30 ans, dans un état d'entretien déplorable avec un son mauvais (haut parleurs perforés, gauche/droite inversé). Quand un réalisateur s'échine coeur et âme pour réaliser un film et qu'il le visualise dans une salle "normale", la déception était immense. On imagine George Lucas allez voir son Star Wars avec une image floue et mal éclairée, un son stéréo inversé dans lequel il manque toutes les basses ou les aigus, alors qu'il disposait chez lui d'une salle dernier cri pour pouvoir apprécier le travail de ses équipes.

Il fallait prendre les choses en main, et George Lucas a travaillé énormément pour tirer vers le haut l'ensemble des salles de cinéma des États-Unis en proposant le label THX, quitte  à financer certaines salles prestigieuses avec ses fonds propres. Cela a d'abord commencé dans la région de Los Angeles, afin de convaincre/démontrer aux huiles d'Hollywood à quel point cet aspect de la diffusion est important, puis toutes les grandes villes ont suivi et George Lucas a pu s'aider des studios hollywoodiens pour y parvenir.

Aujourd'hui, d'immenses progrès ont été réalisés dans ce domaine, et c'est à George Lucas qu'on doit cela. Cela n'excuse pas la course en avant actuelle vers toujours plus de technologie dans nos salles de cinéma (3D, 100 images/s) pour vendre des billets toujours plus chers ou pour présenter une expérience du cinéma impossible à recréer chez soi, mais ce n'est pas le sujet ici, ni celui du livre d'ailleurs.

## L'édition non linéaire (film et son)

Une grande partie du livre est également consacrée à la création des logiciels de montage "non linéaires" dont Adobe Premiere ou Apple Final Cut pro sont aujourd'hui des hériters dans le domaine de l'image, Pro Tools dans le domaine du son. Cela a pris des années pour les équipes de la Lucasfilm Computer Division pour créer ces deux logiciels et métamorphoser complètement le montage d'un film ou l'enregistrement d'un album. Malgré un échec commercial cuisant, ils ont ouvert la voie à tous les logiciels qu'on utilise désormais dans ces milieux.

### EditDroid et l'image

Pour le montage d'un film, il fallait auparavant noter dans des carnets quelle portion de film (au numéro d'image près) de quelle bobine parmi les centaines disponibles il fallait physiquement *couper* puis *coller* pour faire le montage final (tiens ! voilà d'où viennent ces termes de *copier/coller* !). Cela pouvait représenter des centaines de chiffes qu'il fallait noter consciencieusement et chaque monteur avait son propre système de notation. Impossible dans ce cas de reprendre son travail après coup ou même de collaborer ! Il fallait ensuite synchroniser la piste son avec l'image pour que l'illusion du cinéma opère. Un travail de titan. Tout était noté à la main, il faillait chercher la bobine, la mettre dans le projecteur, noter les identifiants d'image, passer à la découpe, coller les images avec du scotch, recommencer. Pour chaque plan. De tous les films.

Francis Coppola avait expérimenté une solution à base de vidéo. Les bandes vidéo sont beaucoup moins chères que les bandes 35mm utilisées dans le cinéma. L'idée était d'avoir plusieurs copies du film cinéma, d'essayer plusieurs montages pour choisir le meilleur pour ensuite réaliser le montage sur le film 35mm. Mais les différences de résolution (la vidéo a une très faible résolution quand on la compare à la pellicule 35mm) mais surtout la différence du nombre d'images par secondes entre les deux supports ont été fatales pour la création d'un tel outil (pour aller vite, la télévision va à 25 images par secondes et le cinéma de l'époque à 24 images par secondes).

Il fallait donc pouvoir travailler de manière numérique. J'admire la vision exceptionnelle de ces chercheurs qui ont cru à l'augmentation exponentielle des capacités de stockage des ordinateurs (avec un prix en baisse) sans lequel il était tout simplement impossible du numériser un film en entier et de le faire tenir sur un disque dur (un disque dur dans les années 1980 faisait 20 Mo). Pendant longtemps, les équipe ont travaillé sur des LaserDisc. Il s'agissait de la même idée que pour la vidéo, à savoir avoir plusieurs copies du film pour accéder en temps réel à l'extrait que l'on désire, mais sans les soucis de difference du nombre d'images par seconde.

Le produit qui en a résulté se nommait [EditDroid](https://en.wikipedia.org/wiki/EditDroid). Voici une photo de la console de travail, nommée "Darth Vador" :

![La console EditDroid]({{ site.url }}/images/droidmaker/ph_EditDroid.jpg)

### SoundDroid et... le son

[SoundDroid](https://en.wikipedia.org/wiki/SoundDroid), l'éditeur non linéaire pour le son. C'est avec ce logiciel qu'a été créé le fameux son THX (nommé [Deep Note](https://en.wikipedia.org/wiki/Deep_Note)), cette montée incroyable d'un son grave vers un son aïgu, quelque chose d'auparavant impossible à réaliser avec des instruments traditionnels. SoundDroid permettait de faire du montage audio, mais aussi de la synthèse sonore, d'ajouter numériquement des effets de réverbération, de faire du mixage et de l'enregistrement, de cataloguer tous les effets sonores possibles sans avoir besoin de se déplacer dans la salle des archives : l'ancêtre de tous les ProTools et autres DAW (Digital Audio Workstation) du marché actuel, tels que Cubase, ACID, SONAR ou encore Garage Band.

Voici une impression d'écran de logiciel en cours de fonctionnement :

![Un screenshot de SoundDroid]({{ site.url }}/images/droidmaker/ph_SoundDroid.jpg)

## Les jeux vidéos et Atari

Toute une partie de l'ouvrage concerne l'aventure d'[Atari](https://fr.wikipedia.org/wiki/Atari), "premier" éditeur de jeux vidéos à l'échelle mondiale jusqu'au crash des jeux vidéos de 1983 avec le tristement célèbre [E.T.](https://fr.wikipedia.org/wiki/E.T._the_Extra-Terrestrial_%28jeu_vid%C3%A9o%29), le "pire jeu vidéo de l'histoire".

![ET par Atari]({{ site.url }}/images/droidmaker/ET2600-Pit.gif)

Je ne rentre pas ici dans les détails, mais c'est une partie vraiment très interressante, surtout si comme moi on s'intéresse aussi à l'histoire des jeux vidéos.

## Ce que j'ai plus ou moins aimé

### J'ai plutôt bien aimé

* ce livre n'est pas une ode au génie visionnaire de Lucas (il le présente au contraire comme quelqu'un de très humain), mais plutôt un long hommage appuyé à toutes ses équipes et à tous ceux qui ont fait la magie Lucasfilms
* les notes de page qui fourmillent
* la qualité de la recherche réalisée
* ouvrir le rideau des grands films pour voir dans les coulisses
* le bon dosage histoire / technique / informatique
* les titres de chapitres énigmatiques ou ultra référencés dont on comprend le sens en fin de chapitre
* de manière générale, le fait d'avoir appris autant sur tant du sujets différents en un seul livre

### J'ai plutot moins aimé

* certains chapitres un peu longs par rapport aux autres plus excitants (en particulier toute la partie sur New York est un peu rébarbative)
* le tarif élevé (même d'occasion)


## Conclusion

Voilà ! Évidement, le livre couvre encore de nombreux autres aspects qu'on ne peut aborder ici (sinon ce post ferait 3 km de long), mais j'espère vous avoir donné envie de lire ce livre qui est véritablement passionnant.

---

Des liens à retenir ou pour aller plus loin avec Michael Rubin :

* [droidmaker.com](http://www.droidmaker.com/index.html) : le site-"satellite" (plutôt mal fait) autour du livre ; je vous conseille en particulier  [la bibliographie complète](http://www.droidmaker.com/biblio.htm)
* [la page personnelle de l'auteur](https://about.me/rubin) et [son profil LinkedIn](https://www.linkedin.com/in/mrubin)
* [le blog de l'auteur](http://www.droidmaker.blogspot.fr/)
* [le porfolio photo de l'auteur](http://www.byrubin.com/) (plutôt doué le gars)
