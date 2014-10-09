---
layout: post
status: publish
published: true
title: Changer la « ROM » de son android
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
excerpt: ! "Une fois le <a href=\"http://www.barreverte.fr/rooter-android-avec-unrevoked\">recovery
  clockworkmod installé</a>, vous pouvez facilement changer votre système en entrant
  dans le recovery. Mais avant cela, il est conseillé de faire une sauvegarde de l'actuel
  à l'aide également du recovery : allumez votre mobile en appuyant simultanément
  sur volume- vous voyez apparaître le menu suivant\r\n<p style=\"text-align: center;\"><img
  class=\"size-medium wp-image-502 aligncenter\" title=\"hboot\" src=\"http://www.lagrappe.net/wp-content/hboot-274x300.jpg\"
  alt=\"hboot\" width=\"274\" height=\"300\" /></p>\r\n"
wordpress_id: 518
wordpress_url: http://www.lagrappe.net/?p=518
date: !binary |-
  MjAxMC0xMC0xMCAyMjozMToxNCArMDIwMA==
date_gmt: !binary |-
  MjAxMC0xMC0xMCAyMDozMToxNCArMDIwMA==
categories:
- android
tags: []
comments: []
---
<p>Une fois le <a href="http://www.barreverte.fr/rooter-android-avec-unrevoked">recovery clockworkmod installé</a>, vous pouvez facilement changer votre système en entrant dans le recovery. Mais avant cela, il est conseillé de faire une sauvegarde de l'actuel à l'aide également du recovery : allumez votre mobile en appuyant simultanément sur volume- vous voyez apparaître le menu suivant</p>
<p style="text-align: center;"><img class="size-medium wp-image-502 aligncenter" title="hboot" src="http://www.lagrappe.net/wp-content/hboot-274x300.jpg" alt="hboot" width="274" height="300" /></p>
<p><a id="more"></a><a id="more-518"></a><br />
Puis allez sur "Recovery" et appuyez sur le bouton Power pour sélectionner, vous aurez :</p>
<p style="text-align: center;"><img class="aligncenter" title="Menu recovery" src="http://www.lagrappe.net/wp-content/menu-recovery.jpg" alt="Menu recovery" /></p>
<p>Pour faire une sauvegarde complète (avec nandroid) de votre téléphone allez dans "backup and restore &gt; backup". Vous retrouverez sur votre SDcard un répertoire clockworkmod/backup dans lequel se trouveront toutes les sauvegardes (classées par date) de votre mobile.</p>
<p>Ces sauvegardes comprennent toutes les données du système et les données utilisateur du mobile elles permettent de remettre le téléphone tel qu'il était à une date donnée.</p>
<p>Pour sauvegarder uniquement vos données (SMS, applications, contacts, etc), maintenant que vous êtes root, vous pouvez installer Titanium Backup, à partir du market android (gratuit). De cette manière, lorsque vous aurez installé un nouveau système, vous pourrez remettre votre mobile avec le nouveau système dans la même configuration que l'ancien système. Cela peut servir également si vous devez changer de mobile : j'avais un problème d'écran, Orange m'a changé mon mobile, et j'ai perdu mes SMS, connexions wifi, applications (je n'utilise pas le logiciel de synchronisation car il ne tourne pas sous linux). Voici une capture de Titanium :</p>
<p style="text-align: center;"><img class="size-medium wp-image-544  aligncenter" title="screenshot_titanium_backup" src="http://www.lagrappe.net/wp-content/screenshot_2.png" alt="capture d'écran titanium backup" width="250" /></p>
<p>Après avoir pris ces 2 précautions, vous pouvez télécharger une image système par exemple en partant de<a href="https://spreadsheets.google.com/ccc?key=0As0sg9AKQwCpdHRIcjNKbGZIUVk1VE9mYjVJNENnTHc&amp;hl=fr&amp;authkey=CJ3e6NQB"> cette feuille</a>. J'ai installé la ROM de MoDaCo, qui fonctionne bien en 2.2-froyo. Le user-agent est même celui d'orange, ce qui fait que les applis orange continuent de fonctionner (TV sur mobile par exemple). Il faut poser le fichier zip à la racine de la carte SD. Arrêter le téléphone et le redémarrer en mode recovery, puis sélectionner "install zip from sdcard" dans le menu (voir ci-dessus). Il existe aussi lorsque vous avez l'accès root sur votre téléphone une application qui s'appelle ROM Manager, et qui permet de le faire à partir d'android.</p>
<p>J'ai trouvé toutes ces informations sur les forums android comme <a href="http://forum.frandroid.com/">http://forum.frandroid.com/</a>, vous aurez toutes les ressources pour en savoir plus.</p>
