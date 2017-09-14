---
layout: post
title: DynamoDB, comment ça marche ?
author:
  display_name: Jean-Philippe Caruana
tags:
- BDD
- AWS
- scalabilité
comments: true
---

Amazon a publié un SDK Java qui permet d’interagir avec tous les services AWS, y compris DynamoDB.

# Principes généraux
DynamoDB est une base de données clef/valeur "_infiniement scalable_". On ne paye qu'à l'usage selon 3 axes, selon notre réglage sur chaque table :

* la _quantité_ de données stockées
* la capacité en _lecture_ par seconde
* la capacité en _écriture_ par seconde

DynamoDB s'intègre très bien avec Amason  Redshift et EMR (Elastic Map Reduce, Hadoop).

Vue hiérarchique :

* Chaque compte AWS possède une collection de **tables** par région.
* Chaque table est une collection d' **items**
* Chaque item est une collection arbitraire d' **attributs** (des couples clef/valeur)

Chaque table doit avoir une **clef primaire** et chaque item doit avoir une clef **unique**.

Il y a 2 types de clefs primaires :

* **hash** : un seul attribut (index non ordonné sur le hash)
* **hash + range** : clef composite sur 2 attributs.

Les type de données :

* des **Strings** (stockées en UTF-8) et des **StringSets**
* des **Numbers** (jusqu'à 38 digits) et des **NumberSets**
* des **Binaries** et des **BinarySets**

La taille maximum d'un item est de **64 ko**. Le nom des attributs _compte_ dans la taille d'un item.

## Les indexes

* les données sont indexées sur les clefs primaires
* les **LSI** (Local Secondary Indexes) permettent de parcourir les données hors des clefs de manière plus efficace. Pour moi, cela se rapproche des indexes de MOngoDB sans le coût de RAM à gérer. La limite est de 10 Go par clef hash
* les **GSI** (Global Secondary Indexes) permettent de parcourir les données sur n'importe quel champ. Par contre, des frais supplémentaires s'appliquent.

Les indexes ne peuvent être changés après leur création. Par contre, le provisioning peut être modifié (à la baisse ou à la hausse) à n'importe quel moment. Par ailleurs, des alarmes par mail peuvent être mises en place pour indiquer si une table a besoin de plus de lectures ou plus d'écriture.

Amazon se charge de sharder/partitionner/répartir les données selon la taille des données et le provisionning lecture/écriture demandé. En cas de changement de provisionning, les données sont reshardées automatiquement. Pour scaler massivement, il faut donc un grand nomble de clefs hash différentes.

## API
### en lecture

* **GetItem** : aller chercher un élément par sa clef primaire
* **Query** : s'appuie sur la clef composite
    * sur une valeur du hash
    * compter des éléments sur un critère
    * les top N (ou bottom N) éléments
    * pagination avec limites
* **BatchGetItem** : récupérer différents éléments (sur plusieurs tables)
* **Scan** : plutot pour en export de données

### en écriture

* **PutItem** :
    * ajouter un nouvel élément
    * remplacer un nouvel élément
    * peut-être conditionnel (si existe ou non)
    * peut-retourner l'élément remplacé (OLD_ITEM)
* **PutUpdateItem** :
    * ajouter/modifier/supprimer un attribut d'un élément
    * incrémenter (de manière atomique) un attribut
* **DeleteItem**
* **BatchWriteItem** : jusqu'à 25 put/delete dans la même requête

# Comment modéliser les données ?
Pour modéliser, il faut partir des usages et des **Use Case**, puis identifier les différents **patterns d'utilisation** de ces Use Case pour enfin en déduire le **design** des données.

exemples : 

* relations 1-1 : hash 
* relations 1-n : hash sur une table et Hash/Range sur l'autre
* relations n-m : Hash/Range sur les 2 tables (respectivement inveres l'une de l'autre)

Dans le cas d'un multi-client' utiliser le client ID comme hash et ajouter une range key spécifique à la donnée (ex: user ID)

# Conseils

* garder la taille des items la plus petite possible
    * en compressant de manière binaire
    * en choisissant des noms succincts pour les attributs
* utiliser Amazon S3 pour stocker des données lourdes (et référencer le bucket/hash S3 dans DynameDB)
* utiliser les tables *overflow* et la command BatchGet
* pour les données de type *time series* créer des tables par période de temps (par semaine)
* éviter de garder des données froides dans DynamoDB : il vaut mieux les déplacer ailleurs pour réduire les couts et ne pas trop provisionner
* il est possible de mapper une table DynamoDB sur EMR/Hyve

# liens

* [documentation officielle](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/)
* [vidéos officielles](https://aws.amazon.com/fr/dynamodb/getting-started/)
* SDK officiel:
    * [téléchargement des binaires et explications](http://aws.amazon.com/fr/sdkforjava/) 
    * [code source](https://github.com/aws/aws-sdk-java) 
    * [javadoc](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/dynamodbv2/package-summary.html)  
* [libs et mocks](http://aws.typepad.com/aws/2012/04/amazon-dynamodb-libraries-mappers-and-mock-implementations-galore.html), en particulier pour le monde java :
    * des mappeurs objet
        * [jsoda](https://github.com/williamw520/jsoda) : Simple Java object layer for AWS databases (SimpleDB and DynamoDB)
        * [phoebe-dynamodb](https://code.google.com/p/phoebe-dynamodb/) : the thinnest convenient layer which addresses these issues, yet preserves the elegance of get, put, delete, and query type operations. 
        * [jcabi-dynamo](http://www.jcabi.com/jcabi-dynamo/) a Amazon Dynamo DB Object Layer
    * des mocks
        * [alternator](https://github.com/mboudreau/Alternator/) : A mock DynamoDB that runs locally for testing purposes
        * [DynameDB local](http://aws.typepad.com/aws/2013/09/dynamodb-local-for-desktop-development.html) : a client-side database that supports the complete DynamoDB API, but doesn't manipulate any tables or data in DynamoDB itself
