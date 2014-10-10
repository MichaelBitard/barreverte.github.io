---
layout: post
status: publish
published: true
title: Affichage firefox sans couleurs
author:
  display_name: Bruno Thomas
  login: bruno
  email: bruno@barreverte.fr
  url: http://www.barreverte.fr
author_login: bruno
author_email: bruno@barreverte.fr
author_url: http://www.barreverte.fr
wordpress_id: 2620
wordpress_url: http://www.barreverte.fr/?p=2620
date: !binary |-
  MjAxMi0wNi0wNCAxNzozMjo0NSArMDIwMA==
date_gmt: !binary |-
  MjAxMi0wNi0wNCAxNjozMjo0NSArMDIwMA==
categories:
- geekeries
tags:
- binômage
- vnc
- firefox
- trucs et astuces
comments: []
---
<p>VNC est un bon outil pour binômer à distance (il faut une bonne liaison réseau), mais il peut avoir des impacts assez étonnants sur le poste de travail :</p>
<ul>
<li>plus de répétition des touches</li>
<li>raccourcis clavier cassés</li>
<li>exécution de commandes impromptues</li>
</ul>
<p>Pendant un binômage VNC, sur une tâche de développement d'écran Web sous firefox (avec firebug, webdevelopper), mon affichage n'avait plus les couleurs des sites :<br />
<a href="/images/capture_affichage_ff.png"><img src="/images/capture_affichage_ff-300x249.png" alt="" title="capture_affichage_ff" width="300" height="249" class="aligncenter size-medium wp-image-2622" /></a></p>
<p>Après avoir cherché un moment, j'ai pu rétablir l'affichage original en faisant about:config dans la barre d'url, et puis en double cliquant sur le paramètre
<pre>browser.display.use_document_color</pre>
<p> le passant de false à true.</p>
