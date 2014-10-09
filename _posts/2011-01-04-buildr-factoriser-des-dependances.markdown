---
layout: post
status: publish
published: true
title: ! 'Buildr : factoriser des dépendances'
author:
  display_name: Philippe Blayo
wordpress_id: 869
wordpress_url: http://www.barreverte.fr/?p=869
categories:
- java
- buildr
tags:
- buildr
- buildfile
---
<p><a href="http://buildr.apache.org">Buildr</a> utilise les conventions et les repos maven. Pour un projet spring-mvc qui utilise également spring-jdbc, cela fait beaucoup de dépendances. Heureusement, <code>Buildr::group</code> permet de les rassembler par groupId :</p>

{% highlight ruby %}
SPRING_3 = Buildr::group('spring-core', 'spring-asm', 'spring-web', 'spring-webmvc', 
'spring-context', 'spring-beans', 'spring-expression', 'spring-jdbc', 'spring-tx',
:under=>'org.springframework', :version=>'3.0.5.RELEASE')
{% endhighlight %}
<p>(<code>:under=>'org.springframework'</code> factorise le groupid)</p>
Cette factorisation facilite le changement de version dans le buildfile : pour repasser à spring 2.5.6, il suffit de changer <code>:version=>'3.0.5.RELEASE'</code> en</p>
{% highlight ruby %}
:version=>'2.5.6'
{% endhighlight %}
