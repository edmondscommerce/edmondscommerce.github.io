---
layout: post
status: publish
published: true
title: Managing Your Web Site and Code Version Control
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 4133
wordpress_url: http://www.edmondscommerce.co.uk/?p=4133
date: 2013-03-11 18:22:29.000000000 +00:00
categories:
- git
tags:
- git
- version control
- code
- manegment
---
Managing a web site posses many difficulties. On the technical side of things there are really two big problems which are the database and the code for the site.

Managing the database is currently the hardest thing to do right. The best you can do generally is to make sure you have a daily backup. Then if some thing should happen you would only lose up to 24 hours of new products, order and customers. Significantly more complex solutions are available that offer grater flexibility but these solutions usually depend on the hosting company to support it and often have a large setup cost.

Conversely, on the code management there are many solutions available that can be implemented easily and generally do not require the assistance of the hosting provider.
To get your sites code base under control you need to use a version control system. A version control system is a system that remembers every change made to code at a given point in time and allows you to easily see the differences between different versions.

Been able to see the many different versions of all the files that make up the site gives you the following advantages:
You can see when some thing changed.
You can see what was changed.
You can see who changed it.
You can see why it was changed.
You can see the logical progress of changes that lead to a given state.

Version control is important to maintaining a good code base for all the reasons above plus more (integration with issue tracking, deployment and other systems). It can also be invaluable in disaster recovery scenarios where some code has been altered and it's negatively impacted the site even out side of the version control system. In such scenarios you can take what ever is on the live site and compare it with what is in the version control system really easily.

It used to be the case that using version control was quite a difficult and technical matter. Fortunately since then there are many tools and websites available to make the whole process much easier.

GitHub and Bitbucket are currently two really popular websites for hosting Git repositories and provide much material for helping new users along.

At Edmonds Commerce Git is our version control system of choice because it's very powerful, highly flexible and integrates with many systems. There are several different clients available to help you along with Git but due to the flexibility that git offers to do certain things you may end up reverting to the command line.

Here is a list of alternative to the TortoiseGit (a popular Windows tool) client
http://alternativeto.net/software/tortoisegit/
