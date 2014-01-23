---
layout: post
status: publish
published: true
title: 'Wordpress: Disqus plugin hiding content on mobile'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3323
wordpress_url: http://www.edmondscommerce.co.uk/?p=3323
date: 2012-08-22 10:46:58.000000000 +01:00
categories:
- wordpress
tags:
- design
- bug
- problem
- wordpress
- solution
- fix
- tip
- css
- disqus
---
If you use the disqus plugin on your wordpress site, you may be surprised to learn that your content is hidden on mobile devices (specifically ipad/iphone).

The problem that occurs is that the content is covered by a nice white box that you can't see through.

Thankfully there's a nice quick fix.  In your site's css rules, simply add the following :-
```css

#disqus_thread { clear: both !important; }

```

And mobile users can see your content again!
