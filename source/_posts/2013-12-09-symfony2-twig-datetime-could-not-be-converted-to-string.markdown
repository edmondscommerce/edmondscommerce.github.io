---
layout: post
title: "Symfony2 Twig  'DateTime could not be converted to string'"
date: 2013-12-09 18:43:03 +0000
comments: true
author: joseph
categories: 
 - symfony2
tags: 
 - symfony2
 - twig
 - sensio
 - generator
 - doctrine
 - entity
description: "Symfony2 Twig 'DateTime could not be converted to string' issue and a possible solution if you are using the Sensio Generator Bundle"
---

I just hit an interesting issue with a nice and easy solution once you understand what is going on. 
On a current project I making heavy use of the [SensioGeneratorBundle](https://github.com/sensiolabs/SensioGeneratorBundle) to generate CRUD etc. So far its working really nicely.

However I started to see an issue with one of my entities that Twig was not handling a DateTime column properly but others were being handled fine.

Looking through the Twig template I noticed this:

{% codeblock lang:html+jinja %} 
{% raw %}
  {%- for field, metadata in fields %}
            {%- if loop.first and ('show' in actions) %}

                <td><a href="{{ "{{ path('" ~ route_name_prefix ~ "_show', { 'id': entity.id }) }}" }}">{{ '{{ entity.' ~ field|replace({'_': ''}) ~ ' }}' }}</a></td>

            {%- elseif metadata.type in ['date', 'datetime'] %}

                <td>{{ '{% if entity.' ~ field|replace({'_': ''}) ~ ' %}{{ entity.' ~ field|replace({'_': ''}) ~ '|date(\'Y-m-d H:i:s\') }}{% endif %}' }}</td>
{% endraw %}
{% endcodeblock %}

What this means is that the first entity will never have the DateTime handling. Of course you probably don't want a DateTime to be the first entity so I think this is reasonable.

To fix this, all you need to do is make sure that your Doctrine class does not declare the first property as a DateTime. 

If you have a primary key or unique reference property then try to get this as the first declared property in your Doctrine entity class and then rebuild the CRUD and the problem goes away.
