---
layout: post
status: publish
published: true
title: Magento Line Up Grid View
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1337
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1337
date: 2010-02-01 11:46:26.000000000 +00:00
categories:
- magento
tags:
- magento
- grid
- view
- lineup
---
If your Magento front end looks a little untidy with Add to Cart buttons not lining up on the x axis, this little bit of extra CSS might sort you out:

add a min-height to the '.catalog-listing h5' CSS rule

for IE6 you can use:
height: auto !important; height: 60px

I haven't tried this but a friend who knows his CSS recommended it as a solution to something that has been bugging me for a while
