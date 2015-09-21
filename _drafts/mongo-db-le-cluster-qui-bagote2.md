---
layout: post
title: MongoDb le cluster qui bagote, la suite
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
categories:
- agilité
- nosql
- tests
tags:
- cluster
- MongoDb
- heros du bagot
comments: true
---

Suite de notre [épisode précédent](http://www.barreverte.fr/mongodb-le-cluster-qui-bagote/) sur les bagots mongo, nous reprenons où nous nous étions arrêtés : nous avons un test d'acceptance instable et nous avons acquis la certitude que le cluster mongo en est la cause. Soit il est mal configuré soit buggué.

Dans nos précédentes investigations, nous sommes passés par la case logs, à savoir pour mongoDB, les syslogs, mais aussi les oplogs, les logs interne mongo, eux même dans la base `local`. Dans ces observations, nous avons vu des lignes qui nous ont interpelées :

```
data-cluster:PRIMARY> use local
switched to db local
data-cluster:PRIMARY> db.oplog.rs.find({ns: 'unittest,conversations'}).sort({'ts': -1}).limit(10)
(...)
{ "ts" : Timestamp(1402569269, 1), "h" : NumberLong("3340389178830755611"), "v" : 2, "op" : "d", "ns" : "unittest.conversations", "b" : true, "o" : { "_id" : ObjectId("53998232f8b13f4f46528ee0") } }
(...)
{ "ts" : Timestamp(1402569266, 4), "h" : NumberLong("-1104737614570451506"), "v" : 2, "op" : "i", "ns" : "unittest.conversations", "o" : { "_id" : ObjectId("53998232f8b13f4f46528ee0"), "date" : ISODate("2012-06-13T07:00:00Z"), "surfer_id" : "123456", "messages" : [ { "date" : ISODate("2012-06-13T07:00:00Z"), "content" : "J'ai une question urgente", "advisor_login" : null, "from" : "123456@conference.public.chat.com/123456", "queue" : "sav" }, { "date" : ISODate("2012-06-13T07:01:00Z"), "content" : "Je suis là pour ça,,,", "advisor_login" : "sav1", "from" : "123456@conference.public.chat.com/sav1", "queue" : "sav" } ] } }
(...)
```

Sans rentrer dans le détail du [format des oplogs](https://www.compose.io/articles/the-mongodb-oplog-and-node-js/), le champ "op" de chaque ligne indique l'opération que fait mongodb. Les valeurs peuvent être i (insert), u (update), d (delete), c (command), n (no-ops). Nous voyons ici une ligne de conversation insérée, puis 3 secondes plus tard, elle est supprimée.

> Wot ? Pourquoi ça ?

Dans notre test, sauf dans le tear down où nous supprimons toutes les données, *il n'y a pas de suppressions*. Tout se passe comme si mongoDB décidait seul de détruire des conversations, mais *de temps en temps*. Dans ce cas le test est rouge (à peu près une fois sur trois), quand il ne le fait pas, le test est vert.

Une suppression automatique... ahem... cela nous fait penser au Time To Live (TTL) : dans mongoDB, il est possible de préciser une date d'expiration des données en posant un index de type TTL :

```
db.conversations.createIndex( { "date": 1 }, { expireAfterSeconds: 3600*24*366 } )
```
Nous devons conserver nos conversations pendant un an et un jour. Pour la durée de notre test, ça devrait aller... sauf... sauf que... comme il s'agit d'un test de statistique, nous sommes en temps simulé. Or nous avons utilisé la date de l'écriture du test comme date de référence et cela date de plus d'un an. Du coup l'enregistrement est probablement supprimé par mongoDB.

Pour étayer cette hypothèse, nous changeons la date du temps de référence pour une date récente, et le test passe vert, *toujours*.

Il reste deux mystères cependant :

* pourquoi le test n'est-il pas toujours rouge ?
* pourquoi était-il toujours vert sur un seul noeud ?

Nous nous plongeons dans la documentation et nous trouvons sur [ce thread](https://groups.google.com/forum/#!topic/mongodb-user/mlIZjH3F2Bc) l'explication au premier point : le thread de suppression des données expirées tourne toutes les 60 secondes. Comme notre test dure 20 secondes, il y a environ une chance sur trois qu'il se déclenche pendant le test.

Pour le 2e mystère, nous relançons mongoDB en mode non clusterisé, et nous scrutons les logs. Nous voyons ces lignes s'afficher :

```
Wed Jun 18 18:58:21,900 [initandlisten] ** WARNING: mongod started without --replSet yet 1 documents are present in local.system.replset
Wed Jun 18 18:58:21,900 [initandlisten] **          Restart with --replSet unless you are doing maintenance and no other clients are connected,
Wed Jun 18 18:58:21,900 [initandlisten] **          The TTL collection monitor will not start because of this,
Wed Jun 18 18:58:21,900 [initandlisten] **          For more info see http://dochub.mongodb.org/core/ttlcollections
```

Tout est clair maintenant, comme nous l'avions lancé en mode cluster **avant** de le lancer sur un seul noeud, le moniteur de gestion du TTL n'était pas lancé. Pour résoudre ce problème, il faut faire :

```
> use local
switched to db local
> db.dropDatabase()
```

Morale de l'histoire, une nouvelle fois nous voyons l'antipattern "il y a un bug dans la JVM (ici mongoDB)", alors que le problème se situe *entre la chaise et le clavier*.  
