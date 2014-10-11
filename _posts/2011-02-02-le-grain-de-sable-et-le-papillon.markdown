---
layout: post
status: publish
published: true
title: Le grain de sable et le papillon
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Ou comment nous nous sommes plantés sur une mise en production simple,
  provocant des réactions complètement disproportionnées de notre client. Ou plutôt
  un de nos clients. Nous fournissons un service complet intégrant l'hébergement et
  le développement logiciel. Chez le client, nous avons également un pôle responsable
  du \"run\", et un autre, avec le marketing, qui définit les évolutions du logiciel
  et de la plateforme. Chez nous, nous avons deux équipes aussi, une équipe \"dev\"
  et une équipe \"système\".\r\n"
wordpress_id: 1350
wordpress_url: /?p=1350
date: !binary |-
  MjAxMS0wMi0wMiAwOTowMzoxNCArMDEwMA==
date_gmt: !binary |-
  MjAxMS0wMi0wMiAwODowMzoxNCArMDEwMA==
categories:
- agilité
- admin
- architecture
tags:
- bus de données
- devops
- management
comments:
- id: 51
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wMi0wMiAxMDoyNjoxNCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0wMiAwOToyNjoxNCArMDEwMA==
  content: ! "Très bon article !\r\nUn petit clip pour expliciter le titre : http://www.youtube.com/watch?v=bAs8gN0j2Z8"
- id: 52
  author: Bernard Notarianni
  author_email: bernard.notarianni@gmail.com
  author_url: http://www.ut7.fr
  date: !binary |-
    MjAxMS0wMi0wMiAxMjoxMjoyMiArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0wMiAxMToxMjoyMiArMDEwMA==
  content: ! "Excellent article!!! La description du problème et l'analyse de la manière
    il est possible de réagir efficacement ou pas est exceptionnelle. Les leçons apprises
    sont limpides.\r\n\r\nUn des meilleur article que j'ai eu la chance de lire depuis
    longtemps.\r\n\r\nMerci :-)"
- id: 54
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wMi0wMiAxNDo1NjowOCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0wMiAxMzo1NjowOCArMDEwMA==
  content: Et cette nuit, re-MEP...
- id: 55
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMS0wMi0wMiAxODoxNjoxOCArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0wMiAxNzoxNjoxOCArMDEwMA==
  content: ! "Merci à toi pour ton commentaire ! \r\nCet article m'est venu sur la
    frustration de ce loupé. Un peu fourre-tout au départ, il a été perfectionné par
    Florence, JP, Philippe et Pascal."
- id: 56
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMS0wMi0wMyAwNDowMzozMyArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0wMyAwMzowMzozMyArMDEwMA==
  content: so far, so good...
- id: 57
  author: Antoine Contal
  author_email: antoine.contal@gmail.com
  author_url: ''
  date: !binary |-
    MjAxMS0wMi0yMCAxODoxNjo1NyArMDEwMA==
  date_gmt: !binary |-
    MjAxMS0wMi0yMCAxNzoxNjo1NyArMDEwMA==
  content: ! "Article très intéressant. C'est presque le début d'un A3.\r\n\r\nDans
    l'esprit des <a href=\"http://fr.wikipedia.org/wiki/Cinq_pourquoi\" rel=\"nofollow\">5
    Pourquoi</a>, j'aurais envie de demander pourquoi \"Il se trouve que pour des
    raisons de monitoring une modification a été faite sur la plateforme de production
    il y a un mois. Cette modification n’a pas été reportée sur la pré-production.\"
    ?"
- id: 78
  author: ! 'Bus de données : les failles dans l&#8217;architecture | Barre Verte
    !'
  author_email: ''
  author_url: /bus-de-donnees-les-failles-dans-larchitecture
  date: !binary |-
    MjAxMS0wNS0xMiAxNTozMzozNSArMDIwMA==
  date_gmt: !binary |-
    MjAxMS0wNS0xMiAxNDozMzozNSArMDIwMA==
  content: ! '[...] 2010 nous basculions vers une infrastructure en bus de données
    source de rebondissements. La saga continue. Fin février, le clustering de ce
    bus rabbitMQ est supprimé. Source potentielle [...]'
---
<p>Ou comment nous nous sommes plantés sur une mise en production simple, provocant des réactions complètement disproportionnées de notre client. Ou plutôt un de nos clients. Nous fournissons un service complet intégrant l'hébergement et le développement logiciel. Chez le client, nous avons également un pôle responsable du "run", et un autre, avec le marketing, qui définit les évolutions du logiciel et de la plateforme. Chez nous, nous avons deux équipes aussi, une équipe "dev" et une équipe "système".<br />
<a id="more"></a><a id="more-1350"></a><br />
Cette mise en production améliorait la haute disponibilité de l’application et incluait un upgrade de la version du <a href="/un-bus-de-donnees-pour-les-statistiques">bus de données</a>. Nous faisons une répétition avec une personne de l'équipe système, sur la plateforme de pré-production. Cette répétition se passe si bien qu'il est décidé que la mise en production se fera à distance à 5h du matin (plutôt que 2h sur place lorsqu'il y a du risque), et qu'il ne sera pas nécessaire d'avoir l'assistance d'un développeur.<br />
<em><br />
Erreur.<br />
</em><br />
Il se trouve que pour des raisons de monitoring une modification a été faite sur la plateforme de production il y a un mois. Cette modification n'a pas été reportée sur la pré-production.<br />
<em><br />
Erreur.<br />
</em><br />
Cela explique le bon déroulement de la répétition. Or, notre outil de déploiement délègue à un script la création de liens symboliques. Ce script fait d'autres contrôles.<br />
<em><br />
Erreur.<br />
</em><br />
Lors du déploiement en production, la modification effectuée a eu pour effet d'arrêter ce script. Les liens symboliques entre les fichiers de configuration de production et le répertoire de configuration utilisé par les consommateurs ne sont pas faits. Nous avons trois types de consommateurs qui utilisent la même base de code. Pour distinguer les logs, nous modifions au lancement la couche log4j et nous n'avions pas prévu que le fichier de configuration des logs ne soit pas trouvé.<br />
<em><br />
Erreur.<br />
</em><br />
Les consommateurs sortent en NullPointerException, et ne se lancent pas. Le retour n'étant pas suffisamment explicite, l'ingénieur système ne sait pas pourquoi ils ne redémarrent pas.</p>
<p>Vous me direz :</p>
<blockquote><p>ce sont les consommateurs des messages de statistiques, la plateforme peut fonctionner sans, le bus va accumuler les messages, puis il les distribuera lorsque ces consommateurs seront lancés un peu plus tard</p></blockquote>
<p>Mais voila, nous avons préconisé des seuils alertant de 10000 messages dans les queues de production, or après une heure ou deux, il y en a déjà 40000. Les ingénieurs système ne savent pas que les bus peuvent tenir jusqu'à l'arrivée de l'équipe de développement.</p>
<p><em>Erreur.</em></p>
<p>Donc le service est toujours en maintenance après plus de 2h depuis le début de l'intervention, l'équipe système présente décide de faire un retour-arrière sur le bus et sur les correctifs.</p>
<p><em>Erreur.</em></p>
<p>Les consommateurs ne démarrent toujours pas car de la même manière, l'outil de déploiement fait le rollback en appelant de nouveau le script qui échoue. Il manque les liens vers les fichiers de configuration. Des développeurs arrivent un peu avant 9h et il leur faut 10mn pour corriger le problème.</p>
<p><em>Et maintenant ?</em></p>
<p>Le pôle exploitation client est passé en incident majeur en suivant leur process (plus de 2h d'interruption de service + retour arrière). L'incident est remonté à des niveaux qui sont à des lieues des recherches de causes racines, mais qui sont attachés à des procédures définies par eux ou leurs prédécesseurs. Suivant ces procédures, ils veulent passer en niveau de <strong>vigilance maximum</strong> sur la prochaine mise en production de ces correctifs, et de la version N+5 du bus. C'est à dire au minimum avec 19 jours de préavis, avec présentation des changements, solutions de retour-arrière, le tout à grand renfort de slides.</p>
<p>Parallèlement à cela, le pôle marketing-fonctionnel veut réaliser <strong>une mise en production d'une importance inégalée depuis 7 ans sur cette plateforme début mars</strong>. Entre temps nous devons faire 4 mises en production (mineures pour nous), pour assurer cette grosse évolution. Avec les 19 jours de délai, nous sommes le 21 février, il reste 6 jours pour faire ces 4 mises en production.</p>
<p>Il nous est aussi demandé de ne conserver depuis un mois (la dernière mise en production) que ce qui est <strong>strictement nécessaire du point de vue fonctionnel</strong> à ce prochain palier. A nous de trouver ce qui relève du bugfix suite à une recette qui a durée plusieurs mois -- qui est aussi à refaire --  ce qui relève du bugfix de production, des évolutions fonctionnelles mineures faites depuis. Cela représente 732 commits svn pour les connaisseurs, ou disons 732 petites modifications du logiciel. Le tout sur une branche logicielle spécifique alors que dans quelques mois, nous remettrons en production toutes ces modifications qui ont été validées par le client et par tous nos tests automatiques ou manuels.</p>
<p>Il est même évoqué la possibilité de faire un retour arrière sur le bus de données (6 mois de développement d'environ la moitié de l'équipe).</p>
<p>Ce qui est marquant c'est l'écart entre l'intention de réduction des risques, et ce qui est proposé :</p>
<ul>
<li>l'importance du préavis sensé limiter les risques des mises en production futures, menace d'avoir l'effet inverse en compressant 4 mises en production nécessaires au palier de début mars. Soit l'échéance de cette mise en production majeure est reculée, soit ces 4 mises en productions devront être faites en 6 jours, soit les procédures seront violées</li>
<li>le fait de "retirer" des développements non pertinents afin aussi de limiter le nombre de changements, va aussi à l'encontre de l'objectif recherché. Nous avons pendant ce dernier mois de recette client, terminé 3 stories à livrer, fait d'autres évolutions fonctionnelles, corrigé des bugs de production ou liés à la recette. Il s'agit de retrouver dans le travail quotidien de 9 développeurs, pendant un mois ce qui doit être livré ou non, le risque de régression est important</li>
<li>d'autant plus que la recette ne pourra pas être refaite totalement sur la nouvelle branche "élaguée" d'ici début mars</li>
</ul>
<p>Dans tous les cas, cela promet un temps important en communication (échange de mails, réunions, luttes politiques...) passé par des gens sur un problème qu'ils ne comprennent pas.</p>
<p>Leçons apprises :</p>
<ol>
<li><strong>ne jamais présumer de la bénignité d'une mise en production</strong> avant d'avoir défini des procédures précises, et les avoir éprouvées</li>
<li>la communication entre les équipes système et développement, même si elle est en grande amélioration depuis quelque temps est encore largement insuffisante. Plus globalement, <strong>la collaboration <a href="http://en.wikipedia.org/wiki/DevOps">devops</a> est un vrai puits de progression</strong></li>
<li>la pertinence des décisions prises par le management est inversement proportionnelle au nombre d'échelons le séparant d'un problème, lorsqu'il n'essaye pas de venir sur le terrain (<a href="http://fr.wikipedia.org/wiki/Gemba">gemba</a>). Ici, la distance est grande, <strong>elles deviennent ubuesques</strong></li>
<li>ce dernier point est d'autant plus <strong>aggravé par l'importance des enjeux</strong> d'une échéance</li>
<li><a href="http://www.michaelnygard.com/">Michael Nygard</a> dans <a href="http://www.pragprog.com/titles/mnee/release-it">Release It!</a> nous présente des <a href="http://en.wikipedia.org/wiki/Pattern">patterns</a> d'exploitabilité. Fail Fast en fait partie. <strong>Transparency est un chapitre entier</strong>. Nous avons oublié qu'avant même de pouvoir être transparents grâce à leurs logs, <strong>les consommateurs pouvaient ne pas trouver la configuration de ces logs</strong>. Dans ce cas ils faut qu'ils l'indiquent clairement ainsi qu'une action corrective : <code>"vérifiez que le lien etc/log4j.properties-&gt;etc/prod/log4j.properties existe"</code></li>
</ol>
<p><em>Et pourtant elle tournait... la version déployée en production ce matin là. Il suffisait de refaire 5 liens. Un grain de sable... qui s'est envolé et a atterri sur une aile de papillon...<br />
</em></p>
<p>PS : ces propos n'engagent que l'auteur de l'article</p>
