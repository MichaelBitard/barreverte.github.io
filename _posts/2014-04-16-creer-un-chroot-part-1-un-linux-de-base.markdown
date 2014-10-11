---
layout: post
status: publish
published: true
title: ! 'Créer un chroot (part. 1) : un linux de base'
author:
  display_name: Philippe Blayo
  login: philippe
  email: philippe.blayo@gmail.com
  url: ''
author_login: philippe
author_email: philippe.blayo@gmail.com
excerpt: ! "Notre environnement standardisé va s'appuyer sur chroot. Pour l'initier,
  utilisons le package debootstrap :\r\n<pre lang=\"bash\">sudo apt-get install debootstrap</pre>\r\nIl
  crée des arborescences Debian ou Ubuntu. Pour voir quelles versions sont disponibles
  :\r\n<pre lang=\"bash\">dpkg -L debootstrap | grep scripts/ | awk -F / '{print $NF}'</pre>\r\n<ul>\r\n\t<li><code
  lang=\"bash\">dpkg -L</code> liste tous les fichiers du package</li>\r\n\t<li><code
  lang=\"bash\">grep scripts/</code> sélectionne les scripts</li>\r\n\t<li><code lang=\"bash\">awk
  -F / '{print $NF}'</code> sélectionne leur nom</li>\r\n</ul>\r\n"
wordpress_id: 799
wordpress_url: /?p=799
date: !binary |-
  MjAxNC0wNC0xNiAxODoyMzozNSArMDIwMA==
date_gmt: !binary |-
  MjAxNC0wNC0xNiAxNzoyMzozNSArMDIwMA==
categories:
- linux
tags:
- chroot
comments:
- id: 30357
  author: ! 'Créer un chroot (part. 2) : se connecter | Barre Verte !'
  author_email: ''
  author_url: /creer-un-chroot-part-2-se-connecter
  date: !binary |-
    MjAxNC0wNC0yMyAxMDoyNzoyOCArMDIwMA==
  date_gmt: !binary |-
    MjAxNC0wNC0yMyAwOToyNzoyOCArMDIwMA==
  content: ! '[&#8230;] &larr; Créer un chroot (part. 1) : un linux de base [&#8230;]'
---
<p>Notre environnement standardisé va s'appuyer sur chroot. Pour l'initier, utilisons le package debootstrap :</p>
<pre lang="bash">sudo apt-get install debootstrap</pre>
<p>Il crée des arborescences Debian ou Ubuntu. Pour voir quelles versions sont disponibles :</p>
<pre lang="bash">dpkg -L debootstrap | grep scripts/ | awk -F / '{print $NF}'</pre>
<ul>
<li><code lang="bash">dpkg -L</code> liste tous les fichiers du package</li>
<li><code lang="bash">grep scripts/</code> sélectionne les scripts</li>
<li><code lang="bash">awk -F / '{print $NF}'</code> sélectionne leur nom</li>
</ul>
<p><a id="more"></a><a id="more-799"></a>J'obtiens les versions disponibles à la fois pour debian (potato, sarge...) et pour ubuntu (lucid, maverick...) :</p>
<pre>potato
sarge
...
lucid
maverick</pre>
<p>Ensuite, on exécute la commande en tant que root, par exemple pour créer l'arborescence d'une lucid :</p>
<pre lang="bash">sudo debootstrap lucid root_dir</pre>
<p>root_dir représente la racine du chroot. En quelques minutes, une arborescence de 260 Mo a été crée. Un ls dans root_dir/ nous le confirme :</p>
<pre lang="bash">root_dir$ ls
 bin  boot  dev  etc  home  lib  media  mnt  opt  proc  root  sbin  selinux  srv  sys  tmp  usr  var</pre>
<p>On peut dès maintenant se connecter par</p>
<pre lang="bash">sudo chroot root_dir/</pre>
<p>et réussir à contacter barreverte.fr (ping barreverte.fr)</p>
<p>Toujours connecté au chroot (matérialisé dans la suite par l'invite 'chroot'), on créé un user pour représenter le projet (disons barreverte) :</p>
<pre lang="bash">'chroot'$ adduser barreverte</pre>
<p>et on peut maintenant se connecter en tant que barreverte :</p>
<pre lang="bash">'chroot'$ su barreverte</pre>
<p>Mais cette arborescence a besoin d'être rattachée à la machine sur laquelle elle va s'exécuter, ce qui fera l'objet d'un prochain <a href="/creer-un-chroot-part-2-se-connecter">billet</a>...</p>
