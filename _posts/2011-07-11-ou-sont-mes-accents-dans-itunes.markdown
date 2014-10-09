---
layout: post
status: publish
published: true
title: Où sont mes accents dans iTunes ?
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Si vous êtes sous ubuntu, en installation par défaut (ou une autre distribution
  linux en UTF-8), que vous encodez des mp3 avec lame (version 3.98.2 pour moi) en
  spécifiant des tags mp3, et que vous importez ces mp3 avec iTunes, alors vous devez
  avoir des problèmes d'affichage d'accents. Ça fait beaucoup de si, mais c'est mon
  cas, et j'ai cherché un moment avant de comprendre pourquoi, alors je vous donne
  les raisons.\r\n\r\nIl existe un octet dans les entêtes id3v2 qui indique le charset
  des textes. Cet octet est situé juste après les flags de chaque champ (frame). Un
  champ id3v2 se compose comme suit :\r\n<pre>xx xx xx xx tt tt tt tt ff ff 0e valeur
  champ\r\nframe id      taille    flags encodage\r\nex : \r\nTPE1 00000007 0000 03
  prince</pre>\r\n"
wordpress_id: 2027
wordpress_url: http://www.barreverte.fr/?p=2027
date: !binary |-
  MjAxMS0wNy0xMSAyMDowODoyMCArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNy0xMSAxOTowODoyMCArMDIwMA==
categories:
- linux
- mac
- shell
- geekeries
tags:
- iTunes
- mp3
- id3v2
- lame
comments: []
---
<p>Si vous êtes sous ubuntu, en installation par défaut (ou une autre distribution linux en UTF-8), que vous encodez des mp3 avec lame (version 3.98.2 pour moi) en spécifiant des tags mp3, et que vous importez ces mp3 avec iTunes, alors vous devez avoir des problèmes d'affichage d'accents. Ça fait beaucoup de si, mais c'est mon cas, et j'ai cherché un moment avant de comprendre pourquoi, alors je vous donne les raisons.</p>
<p>Il existe un octet dans les entêtes id3v2 qui indique le charset des textes. Cet octet est situé juste après les flags de chaque champ (frame). Un champ id3v2 se compose comme suit :</p>
<pre>xx xx xx xx tt tt tt tt ff ff 0e valeur champ
frame id      taille    flags encodage
ex : 
TPE1 00000007 0000 03 prince</pre>
<p><a id="more"></a><a id="more-2027"></a><br />
Dans l'exemple, TPE1 correspond à "lead performer/soloïst" ensuite on a 7 qui est la taille en caractères de la valeur "prince" + "03" qui sont ces fameux 2 octets d'encodage (équivalent à la taille d'un caractère).<br />
Or, les spécifications id3v2 nous disent :</p>
<ul>
<li><a href="http://www.id3.org/id3v2.3.0#sec3.3">en v2.3</a> : par défaut les champs sont en ISO-8859-1 dans ce cas, la valeur d'encodage est <span style="background-color: #ff9900;">00</span>. Si l'unicode est utilisé (Universal Multiple-Octet Coded Character Set) cette valeur vaut 01</li>
<li><a href="http://www.id3.org/id3v2.4.0-structure">en v2.4</a>: par défaut les champs sont aussi en ISO-8859-1, mais il y a plus de valeurs possibles :
<ul>
<li><span style="background-color: #ff9900;">00</span> : ISO-8859-1</li>
<li>01 et 02 respectivement UTF-16 et UTF-16BE</li>
<li>03 : UTF-8</li>
</ul>
</li>
</ul>
<p>Dans notre exemple, le "03" indique que la valeur "prince" est encodée en UTF-8.</p>
<p>Ok, très bien mais que fait lame alors ? Lame ajoute les tags MP3 en id3v2.3 et il met "00" dans le champ d'encodage des caractères, même si votre système et votre terminal sont en UTF-8. Exécutons la ligne de commande suivante dans un shell en UTF-8 :</p>
<pre lang="bash">$ lame --add-id3v2 \
    --ta "artiste"  --tt "titre à accent" tmp.wav  tmp.mp3</pre>
<p>Si on fait un hexdump du début du fichier on a (j'ai conservé uniquement la partie pertinente) :<br />
<img src="http://www.barreverte.fr/wp-content/uploads/2011/07/hexdump_mp3.png" alt="" /></p>
<p>En jaune on retrouve les identifiants de frame, en vert c'est le "à" encodé en utf-8 et en rouge les codes d'encodage qui valent 00, donc ISO-8859-1. Si vous donnez ça à iTunes, il affichera "titre Ã  accent".</p>
<p><strong>EDIT</strong> (4 nov 2012) : c'était avec lame 3.98. La version 3.99 corrige ce problème.</p>
<p>En bash, ça dépend quel outil :</p>
<pre lang="bash">$ id3v2 --list tmp.mp3 
id3v2 tag info for tmp.mp3:
TPE1 (Lead performer(s)/Soloist(s)): artiste
TIT2 (Title/songname/content description): titre à accent
TLEN (Length): 23
$
$ eyeD3 tmp.mp3 
tmp.mp3	[ 1.27 KB ]
(...)
ID3 v2.3:
title: titre Ã  accent	artist: artiste</pre>
<p>Voila pourquoi je ne comprenais pas : pendant longtemps j'ai fait confiance à id3v2 alors qu'il était trop intelligent (ou trop laxiste avec la spec c'est selon), il m'affichait correctement mes tags alors qu'ils n'étaient pas conformes. Je vous conseille donc <a href="http://eyed3.nicfit.net/">eyeD3</a> qui est beaucoup plus proche des spécifications (et qui pour l'instant m'a toujours affiché les mêmes infos que iTunes).</p>
<p>Mais alors que faire ?</p>
<p>En ce qui me concerne, j'ai fait un petit utilitaire s'appuyant sur eyeD3 qui convertit uniquement l'octet d'encodage pour lui forcer à prendre les chaînes de caractère pour de l'UTF-8 :<br />
<script src="http://gist-it.appspot.com/github/barreverte/flac2mp3/raw/master/src/main/convert_id3v2_to_utf8.py"></script></p>
<p>Attention ce script force la valeur à 3 (UTF_8_ENCODING), sans tenir compte de l'encodage réel du texte. Si vous êtes certains que vos tags sont en UTF-8 ça fonctionne, sinon il faut que vous vérifiez vos fichiers (en allant voir l'hexa par exemple), pour déterminer l'encodage des textes et la valeur précisée dans l'octet d'encodage.</p>
<p>Ce qui est étonnant c'est que j'ai fait ça sur des tags v2.3 qui ne comprennent pas normalement la valeur 03 comme valeur possible, mais iTunes se débrouille et affiche les accents correctement.</p>
