---
layout: post
status: publish
published: true
title: Using Netbeans to generate PHP class methods
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3037
wordpress_url: http://www.edmondscommerce.co.uk/?p=3037
date: 2012-03-08 14:31:19.000000000 +00:00
categories:
- netbeans
tags:
- development
- php
- magento
- class
- methods
- helpful tips
---
One of the features that I was previously unaware of in Netbeans is its ability to automatically generate common class methods. This post is a quick guide of how this works for future reference.

To get the system to work, first load up a php class. For this example I'm going to be extending the Magento Product Model. This basic class can be seen here, with a couple of extra properties added.
<a href="http://www.edmondscommerce.co.uk/wp-content/uploads/2012/03/screenshot5.png"><img src="{% img  ({{ site.url }}/assets/screenshot5-600x166.png %}" alt="" title="screenshot5" width="600" height="166" class="aligncenter size-medium wp-image-3038" /></a>

To start generating the methods you need to press [Alt] & [Insert] and you will be presented with a menu similar to the one below

<a href="{% img  ({{ site.url }}/assets/screenshot6.png %}"><img src="{% img  ({{ site.url }}/assets/screenshot6.png %}" alt="" title="screenshot6" width="427" height="421" class="aligncenter size-full wp-image-3039" /></a>

This lists all of the common methods that do not currently exist within the class. The first thing that we'll do is to generate a constructor, which gives us the following options

<a href="{% img  ({{ site.url }}/assets/screenshot7.png %}"><img src="{% img  ({{ site.url }}/assets/screenshot7.png %}" alt="" title="screenshot7" width="445" height="328" class="aligncenter size-full wp-image-3040" /></a>

Here you can select which of the class properties you want to be set using the constructor. Pick the ones you want and click OK, and the following code is generated

<a href="http://www.edmondscommerce.co.uk/wp-content/uploads/2012/03/screenshot8.png"><img src="{% img  ({{ site.url }}/assets/screenshot8-600x368.png %}" alt="" title="screenshot8" width="600" height="368" class="aligncenter size-medium wp-image-3041" /></a>

The Getters and Setters work in the same way, and the Override & Implement provides you with a list of all of the methods that the class can override from its parents. Using these together can help you to quickly all of the methods you need in minutes, as shown below.

<a href="http://www.edmondscommerce.co.uk/wp-content/uploads/2012/03/screenshot14.png"><img src="{% img  ({{ site.url }}/assets/screenshot14-600x547.png %}" alt="" title="screenshot14" width="600" height="547" class="aligncenter size-medium wp-image-3044" /></a>
