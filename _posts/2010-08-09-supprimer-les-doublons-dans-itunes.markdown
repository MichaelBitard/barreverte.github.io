---
layout: post
status: publish
published: true
title: Supprimer les doublons dans iTunes
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Ma musicothèque est essentiellement en FLAC (en provenance des CD que
  je continue d'acheter), et je me sers de ces fichiers FLAC pour générer mes MP3.
  J'importe ensuite ces MP3 sur le macbook de Nadège pour emmener notre musique avec
  nous.\r\nComme je fais cette manipulation assez souvent, je me retrouve avec plein
  de doublons dans iTunes (je n'ai pas encore très bien compris les heuristiques d'import
  d'iTunes). Comme j'ai un peu galéré pour trouver une solution \"automatique\", je
  la mets ici.\r\n\r\n"
wordpress_id: 442
wordpress_url: http://www.lagrappe.net/?p=442
date: !binary |-
  MjAxMC0wOC0wOSAxNzo0NzoxMyArMDIwMA==
date_gmt: !binary |-
  MjAxMC0wOC0wOSAxNTo0NzoxMyArMDIwMA==
categories:
- mac
- shell
tags: []
comments:
- id: 23
  author: Pierre
  author_email: pierremauge@yahoo.fr
  author_url: ''
  date: !binary |-
    MjAxMC0xMC0yMSAxMDowMDozNSArMDIwMA==
  date_gmt: !binary |-
    MjAxMC0xMC0yMSAwOTowMDozNSArMDIwMA==
  content: ! "Génial!\r\nSeul soucis, je n'arrive pas ensuite à suprimer les fichier
    si ce n'est de supprimer tous le dossiers \"absents\" et je ne sais pas si cela
    règlera"
- id: 24
  author: Pierre
  author_email: pierremauge@yahoo.fr
  author_url: ''
  date: !binary |-
    MjAxMC0xMC0yMSAxMDowMTowNyArMDIwMA==
  date_gmt: !binary |-
    MjAxMC0xMC0yMSAwOTowMTowNyArMDIwMA==
  content: ! '...mon problème pardon...'
---
<p>Ma musicothèque est essentiellement en FLAC (en provenance des CD que je continue d'acheter), et je me sers de ces fichiers FLAC pour générer mes MP3. J'importe ensuite ces MP3 sur le macbook de Nadège pour emmener notre musique avec nous.<br />
Comme je fais cette manipulation assez souvent, je me retrouve avec plein de doublons dans iTunes (je n'ai pas encore très bien compris les heuristiques d'import d'iTunes). Comme j'ai un peu galéré pour trouver une solution "automatique", je la mets ici.</p>
<p><a id="more"></a><a id="more-442"></a></p>
<p>1) je supprime les doublons physiques dans les arborescences avec le terminal et ce script qui génère un script "rm_doublons.sh" qui efface tous les doublons :</p>
<pre lang="bash">#!/bin/sh
FICHIER_SORTIE=rm_doublons.sh
echo "#!/bin/sh" &gt; $FICHIER_SORTIE
find "$@" -type f -exec md5 {} \; |
  sort --field-separator = --key=2,2 |
  awk -F ' = ' '{ if (!($2 in a)) {a[$2]} else {print}}' |
  sed 's/MD5 (\(.*\)) =.*/rm ""/' &gt;&gt; $FICHIER_SORTIE
chmod a+x $FICHIER_SORTIE
ls $FICHIER_SORTIE</pre>
<p>Pour l'utiliser, copier le contenu dans un fichier avec un nom qui parle (ex genere_rm_doublons.sh), que l'on rend exécutable (par exemple en faisant un chmod +x  genere_rm_doublons.sh). Et puis le lancer en lui donnant une liste de répertoires contenant des doublons. Il se base sur les empreintes numériques <a href="http://fr.wikipedia.org/wiki/MD5">MD5</a> des fichiers (le contenu des fichiers).</p>
<p>2) dans iTunes, les fichiers supprimés sont toujours visibles. Il y a une astuce sur <a href="http://paulmayne.org/blog/2007/11/how-to-remove-broken-or-dead-tracks-from-itunes/">ce post</a> que je résume :</p>
<ul>
<li>créer une playlist intelligente tous_les_morceaux en mettant un critère qui inclut tous les morceaux (par exemple dont l'artiste n'est pas 1234567890)</li>
<li>créer une playlist statique Tous</li>
<li>créer une playlist intelligente TousLesMorceauxEffaces qui est tous_les_morceaux et qui n'est pas Tous</li>
<li>copier ensuite le contenu de tous_les_morceaux dans Tous. Les fichiers qui sont absents ne seront pas copiés et apparaîtront dans la liste TousLesMorceauxEffaces</li>
<li>reste ensuite à supprimer tout ce qu'il y a dans TousLesMorceauxEffaces</li>
</ul>
