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
{% img  /assets/screenshot5-600x166.png %}

To start generating the methods you need to press [Alt] & [Insert] and you will be presented with a menu similar to the one below

{% img  /assets/screenshot6.png %}

This lists all of the common methods that do not currently exist within the class. The first thing that we'll do is to generate a constructor, which gives us the following options

{% img  /assets/screenshot7.png %}

Here you can select which of the class properties you want to be set using the constructor. Pick the ones you want and click OK, and the following code is generated

{% img  /assets/screenshot8-600x368.png %}

The Getters and Setters work in the same way, and the Override & Implement provides you with a list of all of the methods that the class can override from its parents. Using these together can help you to quickly all of the methods you need in minutes, as shown below.

{% img  /assets/screenshot14-600x547.png %}
