---
layout: post
title: Installer une chaîne SSL avec dovecot
author:
  display_name: Bruno Thomas
tags:
- admin
- devops
- ssl
- email
categories:
- linux
comments: true
---

Nous avons entamé avec quelques amis développeurs notre cure de dégooglelisation il y a quelques années. Pour le mail, nous avons choisi, aussi pour notre apprentissage, de monter notre serveur postfix/dovecot. Pour ceux que ça intéresse, mais qui ne veulent pas mettre les mains dans le cambouis, il y a des infos chez [Framasoft](https://degooglisons-internet.org/).

Afin de pouvoir utiliser le service de messagerie avec la couche SSL, il nous a fallu acheter un certificat SSL et l'installer. La semaine dernière, le certificat arrivait en fin de validité, j'ai du le changer. Manque de chance, le certificat "intermédaire", celui de Gandi avait changé aussi, et nous n'avions pas documenté l'installation d'origine. Comme j'ai un peu galéré, alors que c'est très simple, je mets pour mémoire les étapes ici.

## Le problème du certificat intermédiaire

Je vais voir dans notre fichier de configuration `/etc/dovecot/dovecot.conf` comment sont configurés les certificats. Je trouve :

````
ssl_cert = </etc/ssl/certs/monServeur.crt
ssl_key = </etc/ssl/private/monServeur.key
````

OK donc j'achète et je télécharge notre nouveau certificat chez Gandi. Je me dis qu'il suffit de le copier à la place de l'ancien, avec le même nom, et je recharge dovecot au cas où il le monte en mémoire.

````sh
$ cp /etc/ssl/certs/monServeur.crt monServeur.crt.old && cp monServeur.crt /etc/ssl/certs/
$ service dovecot restart
````

J'essaye de récupérer mes messages depuis mon Thunderbird, j'ai une erreur SSL `identité inconnue`. Je vais voir les logs dovecot et je vois :

````
Jul 18 11:36:46 monServeur dovecot: imap-login: Disconnected (no auth attempts in 0 secs): user=<>, rip=xx.xx.xx.xx, lip=yy.yy.yy.yy, TLS handshaking: SSL_accept() failed: error:14094416:SSL routines:SSL3_READ_BYTES:sslv3 alert certificate unknown: SSL alert number 46, session=<w/nxtOU3RwBOwT0M>
````

Le certificat de notre fournisseur n'est pas le bon, puisque le mien est neuf, fraîchement installé. Alors je vérifie le certificat. Je trouve dans notre répertoire `/etc/ssl/certs/` un certificat intermédiaire Gandi. J'essaye :

````
$ openssl verify -CAfile /etc/ssl/certs/GandiStandardSSLCA.pem monServeur.crt
monServeur.crt: OU = Domain Control Validated, OU = Gandi Standard Wildcard SSL, CN = *.monServeur.io
error 20 at 0 depth lookup:unable to get local issuer certificate
````

Sur le site de notre fournisseur de certificat, lorsque nous le téléchargeons, il propose aussi de télécharger le certificat "intermédiaire". Surprise ! Il s'appelle `GandiStandardSSLCA2.pem`. Je le copie dans `/etc/ssl/certs/` et à présent :

````
$ openssl verify -CAfile /etc/ssl/certs/GandiStandardSSLCA2.pem monServeur.crt
monServeur.crt: OK
````

## Installation manuelle dans le client mail

J'essaye de récupérer mes mails dans Thunderbird. Toujours la même alerte `Impossible de vérifier ce certificat car l'émetteur est inconnu`. L'erreur est différente côté dovecot :

````
Jul 18 11:45:15 monServeur dovecot: imap-login: Disconnected (no auth attempts in 0 secs): user=<>, rip=xx.xx.xx.xx, lip=yy.yy.yy.yy, TLS: SSL_read() failed: error:14094418:SSL routines:SSL3_READ_BYTES:tlsv1 alert unknown ca: SSL alert number 48, session=<qcIvFiY4rABOwT0M>
````

Dans l'état du certificat sur thunderbird, il est indiqué `Ce site essaie de s'identifier lui-même avec des informations invalides`. Quand je clique sur le bouton "Voir" je vois la ligne

````
Organisation (O) <Ne fait pas partie du certificat>
````
Je comprends que le certificat de Gandi n'est pas envoyé par dovecot. Alors je vais dans `Edition > Préférences > Avancé > Certificats` de thunderbird et je clique sur `Voir les certificats` puis j'importe manuellement mon certificat `GandiStandardSSLCA2.pem`. Maintenant sur mon thunderbird, ça fonctionne. Sur mon mobile ça ne fonctionne pas. On ne va pas importer ce certificat dans **tous** nos clients mail ?

## Utilisation de la chaîne SSL

Heureusement, grâce à la ***chaine SSL***, ce n'est pas nécessaire.

Quand je vérifie par ligne de commande l'état de mon certificat imap j'obtiens :

````
$ openssl s_client -crlf  -connect imap.monServeur.io:993
CONNECTED(00000003)
depth=0 OU = Domain Control Validated, OU = Gandi Standard Wildcard SSL, CN = *.monServeur.io
verify error:num=20:unable to get local issuer certificate
verify return:1
depth=0 OU = Domain Control Validated, OU = Gandi Standard Wildcard SSL, CN = *.monServeur.io
verify error:num=27:certificate not trusted
verify return:1
depth=0 OU = Domain Control Validated, OU = Gandi Standard Wildcard SSL, CN = *.monServeur.io
verify error:num=21:unable to verify the first certificate
verify return:1
---
Certificate chain
0 s:/OU=Domain Control Validated/OU=Gandi Standard Wildcard SSL/CN=*.monServeur.io
i:/C=FR/ST=Paris/L=Paris/O=Gandi/CN=Gandi Standard SSL CA 2
---
Server certificate
...
````

On constate l'absence de chaîne car `Gandi Standard SSL CA 2` a certifié monServeur, mais la vérification s'arrête là. La profondeur (`depth`) est de 1 (ou zero si on compte comme un informaticien). Je crée alors la chaîne de monServeur : `monServeur -> gandi -> USERTrust` en **concaténant** les certificats (USERTrust était déjà dans le fichier pem de Gandi) :

````
$ cat monServeur.crt GandiStandardSSLCA2.pem  > monServeur-chain.crt
$ cp monServeur-chain.crt /etc/ssl/certs/monServeur.crt
````

Je redémarre dovecot. Je relance ma commande :

````
$ openssl s_client  -crlf  -connect imap.monServeur.io:993
CONNECTED(00000003)
depth=2 C = US, ST = New Jersey, L = Jersey City, O = The USERTRUST Network, CN = USERTrust RSA Certification Authority
verify error:num=20:unable to get local issuer certificate
verify return:0
---
Certificate chain
0 s:/OU=Domain Control Validated/OU=Gandi Standard Wildcard SSL/CN=*.monServeur.io
i:/C=FR/ST=Paris/L=Paris/O=Gandi/CN=Gandi Standard SSL CA 2
1 s:/C=FR/ST=Paris/L=Paris/O=Gandi/CN=Gandi Standard SSL CA 2
i:/C=US/ST=New Jersey/L=Jersey City/O=The USERTRUST Network/CN=USERTrust RSA Certification Authority
2 s:/C=US/ST=New Jersey/L=Jersey City/O=The USERTRUST Network/CN=USERTrust RSA Certification Authority
i:/C=SE/O=AddTrust AB/OU=AddTrust External TTP Network/CN=AddTrust External CA Root
---
Server certificate
...
````

Il y a toujours une erreur mais la chaîne `monServeur -> gandi -> USERTrust` est là (depth=2).

## Indication du chemin des certificats racines

Il ne trouve pas USERTrust. C'est la racine, et elle est déjà installée dans les clients mails. Donc ici, c'est juste l'exécution de la commande `openssl` qui est incorrecte, mais la configuration SSL est bonne côté serveur. J'essaye sur mon mobile, ça fonctionne. Et sur tous les autres clients jusqu'à présent.

Pour avoir une vraie barreverte(©) dans notre ligne de commande, il faut ajouter `-CApath` pour indiquer à `openssl` où se trouvent les certificats racine :

````
$ openssl s_client -CApath /etc/ssl/certs/ -crlf  -connect imap.monServeur.io:993
CONNECTED(00000003)
depth=3 C = SE, O = AddTrust AB, OU = AddTrust External TTP Network, CN = AddTrust External CA Root
verify return:1
depth=2 C = US, ST = New Jersey, L = Jersey City, O = The USERTRUST Network, CN = USERTrust RSA Certification Authority
verify return:1
depth=1 C = FR, ST = Paris, L = Paris, O = Gandi, CN = Gandi Standard SSL CA 2
verify return:1
depth=0 OU = Domain Control Validated, OU = Gandi Standard Wildcard SSL, CN = *.monServeur.io
verify return:1
---
Certificate chain
0 s:/OU=Domain Control Validated/OU=Gandi Standard Wildcard SSL/CN=*.monServeur.io
i:/C=FR/ST=Paris/L=Paris/O=Gandi/CN=Gandi Standard SSL CA 2
1 s:/C=FR/ST=Paris/L=Paris/O=Gandi/CN=Gandi Standard SSL CA 2
i:/C=US/ST=New Jersey/L=Jersey City/O=The USERTRUST Network/CN=USERTrust RSA Certification Authority
2 s:/C=US/ST=New Jersey/L=Jersey City/O=The USERTRUST Network/CN=USERTrust RSA Certification Authority
i:/C=SE/O=AddTrust AB/OU=AddTrust External TTP Network/CN=AddTrust External CA Root
---
Server certificate
...
````

Tout est ok cette fois.

A noter que l'organisation va être cachée par thunderbird et les clients mails. Une fois que je me suis connecté une fois sur notre serveur mail, je retrouve USERTRUST -> Gandi CA 2 dans les certificats. Si vous remettez le certificat seul, sans la chaîne, ça fonctionnera sur les clients s'étant déjà connectés une fois.
