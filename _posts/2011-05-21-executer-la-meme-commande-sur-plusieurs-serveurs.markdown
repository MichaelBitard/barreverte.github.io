---
layout: post
status: publish
published: true
title: Exécuter la même commande sur plusieurs serveurs
author:
  display_name: Florence Chabanois
  login: florence
  email: flocha2000-agile@yahoo.fr
  url: ''
author_login: florence
author_email: flocha2000-agile@yahoo.fr
excerpt: ! "Nous avons parfois besoin d'effectuer une même opération sur plusieurs
  serveurs. Les équipes exploitation connaissent bien cette problématique avec la
  multitude de frontaux à mettre à jour lors d'une mise en production.\r\n\r\nLes
  développeurs aussi. Nous devons créer un répertoire sur les serveurs de recette
  et d'intégration; suite à un bogue, nous partons à la recherche d'informations dans
  les logs sur les cinq frontaux; nous avons besoin de comparer les logs de production
  avec ceux de recette, etc. Il y a au moins trois possibilités à ce type de besoin
  : le faire à la main à la suite; utiliser clusterSSH; ou Gnome Connection Manager."
wordpress_id: 1911
wordpress_url: /?p=1911
date: !binary |-
  MjAxMS0wNS0yMSAxMjoyODo0MCArMDIwMA==
date_gmt: !binary |-
  MjAxMS0wNS0yMSAxMToyODo0MCArMDIwMA==
categories:
- admin
tags:
- ubuntu
- devops
- prete tes jouets
comments: []
---
<p>Nous avons parfois besoin d'effectuer une même opération sur plusieurs serveurs. Les équipes exploitation connaissent bien cette problématique avec la multitude de frontaux à mettre à jour lors d'une mise en production.</p>
<p>Les développeurs aussi. Nous devons créer un répertoire sur les serveurs de recette et d'intégration; suite à un bogue, nous partons à la recherche d'informations dans les logs sur les cinq frontaux; nous avons besoin de comparer les logs de production avec ceux de recette, etc. Il y a au moins trois possibilités à ce type de besoin : le faire à la main à la suite; utiliser clusterSSH; ou Gnome Connection Manager.<a id="more"></a><a id="more-1911"></a></p>
<p><a title="ClusterSSH" href="http://sourceforge.net/projects/clusterssh/">ClusterSSH</a> permet d'exécuter une commande sur plusieurs machines en même temps, mais honnêtement, il y a mieux. Premièrement, le copier coller n'est pas possible. Deuxièmement, plus il y a de serveurs, plus les consoles sont petites. Avec cinq frontaux, on n'y voit plus rien.</p>
<p><a href="http://blog.johanbleuzen.fr/">Johan</a> m'a fait découvrir <a title="Gnome Connection Manager" href="http://kuthulu.com/gcm/">Gnome Connection Manager</a>, qui permet de configurer les serveurs une fois pour toutes. Le fichier de configuration est sous SVN.</p>
<p><a href="/images/gnome1.png"><img class="aligncenter size-large wp-image-1975" title="gnome-connection-1" src="/images/gnome1-800.png" alt="" width="800" /></a></p>
<p>Surtout, il permet d'exécuter des commandes sur des clusters de serveurs.</p>
<p><a href="/images/gnome21.png"><img class="aligncenter size-large wp-image-1979" title="gnome-connection-2" src="/images/gnome21-800.png" alt="" width="800" /></a>
</p>
<p>Il suffit d'appuyer sur <em>[Entrée]</em> pour envoyer la commande.</p>
<p><a href="/images/gnome3.png"><img class="aligncenter size-large wp-image-1978" title="gnome-connection-3" src="/images/gnome3.png" alt="" width="800" /></a></p>
<p>L'application s'installe très simplement avec Ubuntu, ce serait dommage de s'en priver. Personnellement, je ne peux plus m'en passer pour les commandes groupées.</p>
<h2>Liens</h2>
<p>GnomeConnectionManager : <a href="http://kuthulu.com/gcm/">http://kuthulu.com/gcm/</a><br />
ClusterSSH : <a href="http://sourceforge.net/projects/clusterssh/">http://sourceforge.net/projects/clusterssh/</a><br />
Multitail : <a href="http://www.vanheusden.com/multitail/">http://www.vanheusden.com/multitail/<br />
</a><br />
<em>[Edit du 24 Mai, suite aux remarques de JP]</em><br />
Puppet : <a rel="nofollow" href="http://www.puppetlabs.com/puppet/introduction/" target="_blank">http://www.puppetlabs.com/puppet/introduction</a><br />
Chef : <a rel="nofollow" href="http://www.opscode.com/chef/" target="_blank">http://www.opscode.com/chef</a><br />
CF Engine : <a rel="nofollow" href="http://www.cfengine.org/" target="_blank">http://www.cfengine.org</a><br />
=&gt; plus rien n'est manuel, tout est dans svn/git, tout est répétable. Dans ma boite, nous avons eu des surprises en production avec puppet., suite à des modifications "automatiques".</p>
