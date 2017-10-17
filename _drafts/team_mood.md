---
layout: post
title: Team Mood &#58; analyse d'un succès
author:
  display_name: Philippe Blayo
tags:
- bonheur au travail
- lean startup
comments: true
---

<img class="right" alt="Le courriel envoyé par teammood" src="/images/teammood_mail.png"/>Lors des conversations pédestres de la conférence [Walking Dev](http://www.barreverte.fr/walking_dev) de Toulouse,
 ma plus grande découverte a été un service en ligne dont le but est d'améliorer le bonheur au travail. Le principe : demander tous les soirs à chaque membre d'une équipe comment s'est passée sa journée avec **une note de 1 à 5** et un **commentaire optionnel**. Cette pratique est souvent appelée "*Niko Niko*" de *Niko* - sourire en japonais - ou encore *feeling board*.

Comme ces deux éléments sont visibles par toute l'équipe, ils déclenchent des conversations à la machine à café le lendemain matin. C'est dans ces conversations que réside la valeur du service. Ca m'a rappelé airbnb où l'essentiel de l'expérience utilisateur se situe en dehors du site.

Le témoignage qui m'a le plus marqué est donné sur la page des tarifs par un membre d'Air France :

> Grâce à \[cette application\], nous avons montré qu'une de nos réunions hebdomadaire n'avait de valeur ajoutée pour personne.

Un autre témoignage a attiré mon attention sur la question de la durée, question que je ne m'étais même pas posée :

> Honnêtement, je suis surpris par le taux de participation. Tout le monde était content de s'y mettre, mais, contrairement à ce que j'avais imaginé, il n'y a pas de baisse de participation significative avec le temps.

Le succès a été très rapide : triplement du chiffre d'affaire la deuxième année et atteinte de la rentabilité. Le modèle économique ? Facturer 1 Euro par membre d'équipe, après 30 jours d'accès gratuits. Il y a aujourd'hui plus d'une centaine de clients, principalement des manageurs et des coachs.


# International dès le premier jour

Nicolas (fondateur de [TeamMood](https://www.teammood.com)) a envisagé le service comme international dès le premier jour plutôt que de se limiter à un espace francophone. C'est un conseil que j'ai entendu martelé en hackathon pour lancer sa startup : "si vous ne deviez retenir qu'une seule chose c'est qu'il faut penser global dès le premier jour".

Et ça a marché : après des premiers clients issus des cercles de connaissances et du bouche à oreille, des clients internationnaux sont arrivés par Google en moins de 2 mois. Ils avaient cherché "team mood" dans Google ! Le nom du site a fait la différence. Un hasard puisque le fondateur l'a choisit en avril 2013 parce qu'il était disponible. Aucun des concurrents n'a de nom aussi pertinent : MoodPanda n'est pas aussi évocateur et si NikoNiko l'est beaucoup plus, une chaine de restaurant japonais porte le même nom. L'avantage concurrentiel du service de Nicolas c'est son modèle payant qui assure sa résilience. Un concurrent américain et un concurrent Anglais ont mis la clef sous la porte en Décembre après avoir échoué à lever des fonds.

Le site s'appuie également sur des services payants, cloud sur heroku, mailing et surtout intercom qui fournit un chat en ligne personnalisé qui est facturé à l'usage et qui représente aujourd'hui 220 Euros sur un total de 450 Euros de fraits mensuels en services payants. Ce modèle économique payant rassure les clients : "comme ça on est sûr que vous allez continuer, contrairement aux services gratuits".

A propos d'Intercom, la personnalisation du service s'avère particulièrement utile. Elle permet d'envoyer un mail quand le fondateur ne répond pas tout de suite "Je ne suis pas disponible immédiatement mais je reviens vers vous dès que possible". C'est important quand les clients sont répartis sur tous les fuseaux horaires du globe : les clients en Autralie et en Nouvelle Zélande posent leurs questions pendant la nuit. Nicolas  les découvre à son réveil.

# Le taux de recommandation

Par rapport à la satisfaction des clients un seul indicateur est utilisé : le taux de recommendations. Sur une note de 1 à 10 recommenderiez-vous notre service ?
- 1-6 : insatisfait. La personne va bientôt partir.
- 7-8 : neutre.
- 9-10 : ambassadeur. Ils vont promouvoir le service et accepter d'écrire des commentaires quand le fondateur les sollicite. Un utilisateur potentiel demandait par exemple sur twitter quel site choisir et Nicolas a écrit à un ambassadeur possédant un compte sur twitter pour qu'il lui réponde.

Cet indicateur, recueilli au bout de deux semaines d'accès gratuit peut aussi potentiellement éviter de perdre un client en revenant vers un utilisateur mitigé pour savoir si quelque chose pourrait être amélioré.


# De la vertu de l'abandon ?

Une des choses que j'apprécie dans le parcours de Nicolas c'est qu'il a échoué sur son précédent produit. Il ne s'est pas entêté, et il a choisi de tester une autre idée. Il me disait cependant qu'il est plus facile de faire cette démarche quand il s'agit d'un side project plutôt que quand on cherche à gagner sa vie avec.

Le deuxième élément que je trouve intéressant c'est la différence dans la génèse de ses deux produits :


## Résoudre un problème

Le produit [www.keysmag.net](https://www.keysmag.net) permettait de retrouver des clés perdues :

<img alt="Vous avez trouvé des clés ? Saisissez le code afin de contacter le propriétaire" src="/images/keysmag.jpg"/>

- une plaquette accrochée au porte clef indiquait "Clés trouvées ? Saisir le code {codeDeLaClé} sur www.keysmag.net"
- un passant signalait avoir retrouvé les clés dans 70% des cas

Il partait d'un problème à résoudre (auquel le fondateur avait lui-même été confronté). C'est l'idée de l'appli qui fait un job à ma place (retrouver mes clefs). La solution résolvait le problème avec un appréciable taux de succès de 70%. Le problème lui-même ne semble suffisamment pas douloureux pour la sous-population des parents d'adolescents qui perdent leur clefs, mais cette sous-population s'est avérée trop réduite.

## Tester une idée

Pour ce nouveau projet, le point de départ est l'envie de tester des idées. Nicolas avait constaté que le Niko Niko fonctionnait mal quand les gens devaient coller les gommettes dans un open space (sentiment d'être observé). D'ou l'idée d'essayer un service anonyme. A l'usage, répondre à ce mail en fin de journée invite à l'introspection. La valeur réside ensuite dans les conversation déclenchées le lendemain. Donc il s'avère que le produit fait un job : "faire un Niko Niko" de manière anonyme.

# Papier ou internet ?

J'ai moi aussi mis en place un Niko Niko dans un open space et affiché ce Niko Niko en retrospective. Je partage le constat d'échec de Nicolas, sans avoir moi-même cherché à en connaître les raisons.
Il y a un an, un utilisateur [décrivait](http://blog.appstud.com/team-mood-au-service-du-happiness-management)  des difficultés similaires :


> nous avons entrepris de connaître le degré de « Happiness » de nos collaborateurs. Facile encore une fois: Demandons leur.
>
> Outre l’aspect chronophage de cette démarche, il y a des caractères qui ne souhaitent pas se livrer ou expliquer les raisons pour lesquelles ils/elles sont de mauvaise humeur.
>
> Nous avons donc cherché un outil simple qui nous permettrait d’obtenir l’humeur globale de nos équipes anonymement."

# Commencer sans code

Nicolas revenait également sur l'importance de commencer sans investissement conséquent en terme de code.
Il me donnait l'exemple des sites de vente de chaussures en ligne. Il fût un temps où l'on pensait que vendre des chaussures en ligne était impossible car tout le monde voudrait essayer les chaussures avant de les acheter. Un des premiers vendeurs en ligne a donc commencé par prendre des photos de chaussures dans les magasins autour de chez lui.
Quand une commande lui était faite en ligne il se rendait dans le magasin pour acheter la paire et il envoyait le colis.

En 2013 Nicolas a testé sa proposition de valeur avec une simple page web statique : un champ de pré-inscription et seulement quelques heures de travail. Un taux d'engagement de plus de 15% a validé son concept (source : [http://blog.appstud.com/team-mood-au-service-du-happiness-management](http://blog.appstud.com/team-mood-au-service-du-happiness-management))


# Dire merci pour les bugs

Une autre chose que fait Nicolas, c'est dire merci pour chaque bug pertinent ouvert : merci d'avoir pris le temps d'ouvrir ce bug ça permettra d'améliorer le service pour tous les autres utilisateurs également.

Je devrais faire de même sur les projets open sources auxquels je contribue. Par exemple le dernier ticket qui a été ouvert sur [aioimaplib](https://github.com/bamthomas/aioimaplib), un utilisateur a demandé à ce que toutes nos exceptions héritent d'une même classe de base pour qu'il puisse plus facilement se reconnecter en cas de perte de connection pendant un IDLE. Moi je me disais "il faut que je pousse rapidement pour montrer qu'on est réactif, comme ça on va peut-être gagner une étoile" et c'est lui qui a dit merci. J'aurais peut-être dû le remercier pour avoir pris le temps d'ouvrir ce ticket et ajouter que tout le monde bénéficiera de l'amélioration qu'il a demandée. A voir à l'usage si cette pratique est pertinente auprès d'une population de développeurs.

# L'avenir : Slack

La fonctionnalité développée cet été à la demande des utilisateurs, c'est l'intégration dans Slack. Nicolas racontait que ce n'était pas aussi facile qu'on pouvait l'imaginer. Sur les quatres manières possible d'écrire un robot Slack, il avait dû en essayer trois avant de parvenir à ses fins.

Cette orientation vers Slack me paraît très pertinente dans la mesure où le concurrent payant qui m'a le plus marqué est le japonais [vibe.work](https://vibe.work/) qui propose en plus de mesurer le moral des conversations sur les canaux Slack moyennant 120$ par mois. Cette approche ne me paraît cependant pas dénuée de dangers dans un milieu où la bienveillance ne serait pas largement répandue.


# A la recherche des clefs perdues

Pour finir sur le précédent produit de Nicolas (dont il a arrêté la commercialisation), j'ai vu fleurir dans le métro des publicités pour un service concurrent qui promet de retrouver ses clefs perdues avec un émetteur bluetooth. Nicolas me disait que cette approche fonctionne très bien pour retrouver des clefs perdues dans un appartement. Pour des clefs perdues dans la rue, il faut qu'un téléphone équipé de l'appli passe à proximité, ce qui est très limitant. A l'inverse l'approche low-tech de Nicolas ne consommait pas d'énergie.

# L'itinérance en conférence

Cet article poursuit une série que j'ai initiée sur la valeur de l'itinérance pour augmenter les découvertes lors des conférences.
Les conversations que je relate n'auraient pas été aussi approfondies sans ce caractère itinérant de la journée Walking Dev.

