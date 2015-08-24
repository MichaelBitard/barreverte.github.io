---
layout: post
title: Optimiser son client ssh
author:
  display_name: Jean-Philippe Caruana
login: jp
email: jp@barreverte.fr
categories:
- astuces
tags:
- ssh
- unix
- shell
comments: true
---

Dans mon travail quotidien, je me connecte très souvent à une multitude de serveurs, que ce soit pour aller sur le serveur de logs, pour faire une mise en production ou faire de la maintenance système.  Je me connecte également très souvent (sans le savoir) aux serveurs de github à chacune de mes actions `git pull` et `git push`.

Il se trouve que `ssh` est un outil très complet, très configurable si on prend le temps de bien lire la documentation. J'ai ainsi découvert comment accélérer considérablement ma connexion à tous ces serveurs, passant d'un délai moyen compris entre 2 et 3 secondes à une connexion quasi instantannée (de mon point de vue humain). 

Toutes les modification dont on va parler seront locales à un utilisateur, en éditant le fichier `~/.ssh/config`.

# Completion des noms de serveurs

Tout d'abord, il est possible d'avoir la completion des noms de serveurs depuis la ligne de commande. Ainsi, on peut taper `ssh user@mons <TAB>` et le shell nous remplit pour nous le reste (`ssh user@monseveur.com`). Par défaut, dans les distributions dérivées de debian, cette option est désactivée

`~/.ssh/config` :

````
HashKnownHosts no
````

Je vous recommande de supprimer votre fichier `~/.ssh/known_hosts` après cela. 

# Accélérer la vitesse de connexion

Ensuite, pour accélérer la vitesse de connexion, il est très  utile de désactiver le protocole `kerberos` lorsque vous tentez de vous connecter à vos serveurs.

`~/.ssh/config` :

````
GSSAPIAuthentication no
GSSAPIKeyExchange no
GSSAPIRenewalForcesRekey no
````

Rien qu'avec cela, vous devriez obtenir des vitesses de connexion beaucoup plus rapides (c'est ici que vous gagnez vos 2/3 secondes)

# Compression des données

Pour un petit surcoût en CPU (côté client et côté serveur mais négligeable), vous pouvez également activer la compression des données pour toutes vos communications entre vous et votre serveur. J'ai choisi pour ma part de mettre le curseur au maximum en configurant un niveau de compression à 9.

`~/.ssh/config` :

````
Compression yes
CompressionLevel 9
````

# Garder les connexions ouvertes

Enfin, il est possible de garder ses connexions ouvertes pendant un certain temps. Ssh peut ainsi garder des sockets ouvertes pendant la durée désirée. En outre, si vous établissez plusieurs connexions avec un même serveur, votre client `ssh` va réutiliser la socket existante et faire du multiplexage : autant dire que vos connexions seront instantannées. Ici, un paramétrage pour garder les connexions ouvertes pendant 1/2h :

`~/.ssh/config` :

````
ControlMaster auto
ControlPath ~/.ssh/%r@%h:%p
ControlPersist 30m
````

Vous pouvez lister le contenu de votre répertoire `~/.ssh` dans lequel vous verrez des sockets dont le nom sera de la forme `utilisateur@serveur:port`.

Attention cependant si vous êtes sur un réseau wifi et que vous perdez votre connexion, `ssh` tentera d'utiliser la socket et vous ne pourrez pas vous connecter. Dans ce cas, vous pouvez diminuer cette durée ou demander à `ssh` de fermer cette connexion :

````bash
ssh -O close user@monseveur.com
````

# Dire à ansible d'utiliser ce paramétrage

Ansible utilise déjà par défaut cette option `ControlMaster` mais paramétrée différement (lieu et durée de stockage des sockets). Si vous voulez réutiliser les mêmes sockets et pour une même durée en travaillant avec ansible, il faut le lui dire !

Ainsi, mon fichier `~/.ansible.cfg` ressemble à ceci :

````
[ssh_connexion]
ssh_args = -o ControlMaster=auto -o ControlPersist=30m
control_path=~/.ssh/%%r@%%h:%%p
````

Et vous, quelles sont vos options pour votre client ssh qui améliorent votre vie ?


----


* Mon fichier `~/.ssh/config` complet :

````
# allow server name completion
HashKnownHosts no

# faster connexion
GSSAPIAuthentication no
GSSAPIKeyExchange no
GSSAPIRenewalForcesRekey no

# compress data to the max
Compression yes
CompressionLevel 9

# keep connexions open
ControlMaster auto
ControlPath ~/.ssh/%r@%h:%p
ControlPersist 30m
````

* [la man page de ssh](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/slogin.1?query=ssh)
