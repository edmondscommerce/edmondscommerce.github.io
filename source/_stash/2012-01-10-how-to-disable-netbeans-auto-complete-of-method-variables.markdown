---
layout: post
status: publish
published: true
title: 'How to disable netbeans auto-complete of method variables '
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2819
wordpress_url: http://www.edmondscommerce.co.uk/?p=2819
date: 2012-01-10 13:10:10.000000000 +00:00
categories:
- netbeans
tags:
- development
- php
- problem
- upgrade
- developer
- solution
---
There is a new feature in Netbeans that tries to auto fill the variables for methods and functions in PHP. Whilst this may be something that is a time saver for some, it often gets these wrong, and if you are using descriptive variables in the method then these are overwritten if you have a variable of the same type above your method call.

Thankfully there is a way to disable this feature and revert to the old ways. In netbeans go to Tools -> Options -> Editor -> Code Completion and select Language PHP. From there you can deselect the Use Smart Parameters Pre-Filling and netbeans will work the way it used to
