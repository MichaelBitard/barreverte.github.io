---
layout: author
name: philippe
---

# Philippe Blayo

Mes articles sur barreverte :

{% for article in site.posts %}
    {% if article.author.display_name == 'Philippe Blayo' %}
* [{{article.title}}]({{article.url}})
    {% endif %}
{% endfor %}

