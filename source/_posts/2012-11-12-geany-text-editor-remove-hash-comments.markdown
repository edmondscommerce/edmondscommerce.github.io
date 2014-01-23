---
layout: post
status: publish
published: true
title: Geany Text Editor Remove Hash Comments
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3612
wordpress_url: http://www.edmondscommerce.co.uk/?p=3612
date: 2012-11-12 11:25:16.000000000 +00:00
categories:
- geany
tags:
- replace
- htaccess
- text
- regex
- editor
- geany
---
I recently needed to quickly remove some commented lines from a .htaccess file using Geany (a really nice lightweight IDE or feature rich text editor depending on your point of view).

Geany has some powerful regex replace functionality in there but I found that it was overly aggressive so removed lines that had more than one hash and were in fact title sections that needed to stay intact.

The working formula was:

Search for:
<code>
^[#]([^#])
</code>

And replace with:

<code>\1</code>


And of course tick the regex box.

{% img  /assets/geany.png %}
