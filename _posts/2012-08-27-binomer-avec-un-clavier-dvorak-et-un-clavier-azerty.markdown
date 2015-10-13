---
layout: post
status: publish
published: true
title: Binômer avec un clavier dvorak et un clavier azerty
author:
  display_name: Jean-Philippe Caruana
  login: jp
  email: jp@barreverte.fr
  url: /
author_login: jp
author_email: jp@barreverte.fr
author_url: /
excerpt: ! "Nous avons récemment succombé à la geekerie du moment : un clavier <a
  href=\"http://typematrix.com/\" target=\"_blank\">Type Matrix</a> dvorak.\r\n\r\n[caption
  id=\"attachment_2679\" align=\"aligncenter\" width=\"300\"]<a href=\"/images/tmx-2030_gallery-1.png\"><img
  class=\"size-medium wp-image-2679\" title=\"tmx-2030_gallery-1\" alt=\"Clavier Type
  Matrix 2030 dvorak\" src=\"/images/tmx-2030_gallery-1-300x135.png\"
  width=\"300\" height=\"135\" /></a> Clavier Type Matrix 2030 dvorak[/caption]\r\n\r\nSous
  Linux, la commande <tt>setxkbmap</tt> permet de changer le mapping de son clavier.
  Ainsi, pour passer en Dvorak avec la composition pour les accents (3 touches pour
  écrire <tt>é</tt> : compose (le Alt de droite), apostrophe, e), il faut écrire :"
wordpress_id: 2674
wordpress_url: /?p=2674
date: !binary |-
  MjAxMi0wOC0yNyAxMzozMjo0MSArMDIwMA==
date_gmt: !binary |-
  MjAxMi0wOC0yNyAxMjozMjo0MSArMDIwMA==
categories:
- linux
- geekeries
tags:
- programmation
- linux
- debian
- tdd
- bonnes pratiques
comments:
- id: 1557
  author: Bruno Thomas
  author_email: bruno@barreverte.fr
  author_url: http://www.barreverte.fr
  date: !binary |-
    MjAxMi0wOS0xOCAyMDo0NjozNCArMDIwMA==
  date_gmt: !binary |-
    MjAxMi0wOS0xOCAxOTo0NjozNCArMDIwMA==
  content: à noter que c'est même faisable en "zero touch" avec udev. Le souci c'est
    qu'il faut attendre que le clavier ait été reconnu par le kernel et X avant de
    l'ajouter. Cela explique cette vilaine tempo d'une seconde. Merci à @BitardMichael
    https://gist.github.com/3531813
- id: 3036
  author: Jean-Philippe Caruana
  author_email: jp@barreverte.fr
  author_url: /
  date: !binary |-
    MjAxMi0xMS0wNyAxODowMzoyNCArMDEwMA==
  date_gmt: !binary |-
    MjAxMi0xMS0wNyAxNzowMzoyNCArMDEwMA==
  content: on peut rester en "zéro touch" également en ajoutant ce script au démarrage
    de la session X (autostart.sh pour les dérivés d'OpenBox)
---
<p>Nous avons récemment succombé à la geekerie du moment : un clavier <a href="http://typematrix.com/" target="_blank">Type Matrix</a> dvorak.</p>
<p align="center"><a href="/images/tmx-2030_gallery-1.png"><img class="size-medium wp-image-2679" title="tmx-2030_gallery-1" alt="Clavier Type Matrix 2030 dvorak" src="/images/tmx-2030_gallery-1-300x135.png" width="300" height="135" /></a>
<br>
Clavier Type Matrix 2030 dvorak</p>

<p>Sous Linux, la commande <tt>setxkbmap</tt> permet de changer le mapping de son clavier. Ainsi, pour passer en Dvorak avec la composition pour les accents (3 touches pour écrire <tt>é</tt> : compose (le Alt de droite), apostrophe, e), il faut écrire :</p>

````
setxkbmap dvorak en -option compose:ralt
````

<p>Après une période d'apprentissage, nous sommes assez contents, mais tout le monde n'est pas prêt ou n'a pas forcément envie de faire cet effort.</p>
<p>Dans un premier temps, j'ai donc mappé sur le raccourci <tt>Windows + F5</tt> une commande de basculement dvorak/azerty. (NB: La touche Windows s'appelle Start sur mon clavier)</p>
<p>J'utilise <a href="http://lxde.org/">LXDE</a> comme gestionnaire de fenêtres, un mapping se rajoute ainsi dans le fichier <tt>~/.config/openbox/lxde-rc.xml</tt> :</p>

````xml
<keybind key="W-F5">
    <action name="Execute">
        <command>~/bin/switch_dv_fr</command>
    </action>
</keybind>
````

<p>Le script de bascule <tt>~/bin/switch_dv_fr</tt> est le suivant :</p>

````bash
#!/bin/bash

kbd=`setxkbmap -query | grep layout | awk '{print $2}'`

if [ 'fr' = $kbd ]
then 
        notify-send 'Keyboard is now Dvorak'
        setxkbmap dvorak en -option compose:ralt
else
        notify-send 'Keyboard is now French'
        setxkbmap fr -option ""
fi
````

<p>(<tt>notify-send</tt> permet d'afficher une notification dans Linux)</p>
<p>Ce n'était toujours pas satisfaisant, car il fallait taper une combinaison de touches avant de se passer le clavier. Heuereusement, avec Linux il est possible d'avoir deux claviers branchés avec deux mappings différents. Le programme <tt>xinput</tt> permet de configurer les périphériques d'entrée. Pour obtenir la liste de tous les périphériques branchés sur sa machine, il suffit de taper <tt>xinput list</tt>. Chez moi cela donne :</p>

````
⎡ Virtual core pointer                          id=2    [master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
⎜   ↳ Logitech USB Optical Mouse                id=8    [slave  pointer  (2)]
⎜   ↳ HID 046a:0023                             id=10   [slave  pointer  (2)]
⎜   ↳ TypeMatrix.com USB Keyboard               id=13   [slave  pointer  (2)]
⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
    ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
    ↳ Power Button                              id=6    [slave  keyboard (3)]
    ↳ Power Button                              id=7    [slave  keyboard (3)]
    ↳ HID 046a:0023                             id=9    [slave  keyboard (3)]
    ↳ Dell WMI hotkeys                          id=11   [slave  keyboard (3)]
    ↳ TypeMatrix.com USB Keyboard               id=12   [slave  keyboard (3)]
````

<p>On constate que mon clavier Type Matrix possède l'identifiant 12 et mon autre clavier (un HID 046a:0023) le 9. Du coup, maintenant que je connais le nom de mes claviers, je peux trouver leurs identifiants et les passer à <tt>setxkbmap</tt> grâce à l'option <tt>--device</tt>. Le script final donne :</p>

````bash
DVORAK=`xinput list | grep TypeMatrix | grep keyboard | sed 's/.*id=\([0-9]*\).*/\1/'`
AZERTY=`xinput list | grep HID | grep keyboard | sed 's/.*id=\([0-9]*\).*/\1/'`
setxkbmap -device $DVORAK dvorak -option compose:ralt
setxkbmap -device $AZERTY fr -option ""
````

<p>Nous pouvons désormais binômer sur mon poste avec deux claviers différents !</p>
