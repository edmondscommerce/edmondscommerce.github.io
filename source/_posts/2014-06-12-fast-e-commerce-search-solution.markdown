---
layout: post
title: "Fast E-Commerce Search Solution"
date: 2014-06-12 10:09:16 +0100
comments: true
author: joseph
categories: 
 - ecommerce
tags: 
 - search
 - solr
 - ecommerce
description: "Looking beyond MySQL powered search engines for your e-commerce store"
---

One of the trickiest parts of any e-commerce store to get running quickly is the search results. The problem is compounded for large or complex stores where a database query based search for a multi word search phrase can become a real behemoth of a database query that has to search for each word in a multitude of database tables and columns. Then throw in other issues such as table locking and the performance issues can start to hurt the site as a whole.

###Caching for Performance

One common solution to scaling up e-commerce stores is to use a variety of methods and levels of caching, from a database query cache right up to a full page caching system perhaps powered by Varnish. This solution works well for product and category pages for which there is a finite number. When it comes to search results pages though, each possible search phrase is a completely separate set of pages. You might be able to keep a warm cache for your most popular search phrases but anything else will be raw results. It will show your server at its worst performance.

###Alternative Enterprise Search Engine
In this scenario it is time to start looking at other search solutions. If you want a turnkey professional solution then check out Google Commerce Search. This premium offering gives you a powerful search engine that is entirely outsourced and uses Google technology to deliver great quality results. As you can probably imagine though, this premium product comes with a premium and enduringly high subscription fee.

###Enterprise Open Source
Instead what we are now recommending to our larger clients is to look at implementing the Solr search engine. Apache Solr is an enterprise level search engine. It is used in a wide variety of impressive sites – you can see a list here. Names like Netflix, The Guardian and eBay really underline the fact that this is serious and powerful technology.

###Advanced Search Functionality
The great thing is that it is also pretty easy to set up and get running. To get a basic search engine working is no more than a few hours of work. There are many possibilities with the search engine including spelling suggestions, parametric (faceted in Solr speak) search, synoyms, auto suggest and loads more. Depending on exactly how you want this to work will determine exactly how much work is involved.

Solr provides a huge amount of configurability and tuning. For this reason we would always expect a new install of Solr to be followed up with a bit of tweaking to make sure you are getting the right results. Once the right configuration has been determined we can then expect the engine to work tirelessly, serving up lightning fast and excellent quality results without any further investment from your business.

##Implement Solr Search Today
If you would like your site to be fitted out with a Solr based search system by a professional UK based e-commerce web development agency then get in touch with [Edmonds Commerce](http://www.edmondscommerce.co.uk/contact) today.
