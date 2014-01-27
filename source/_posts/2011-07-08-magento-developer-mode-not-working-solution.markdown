---
layout: post
status: publish
published: true
title: 'Magento Developer Mode not Working + Solution '
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2483
wordpress_url: http://www.edmondscommerce.co.uk/?p=2483
date: 2011-07-08 14:14:22.000000000 +01:00
categories:
- magento
tags:
- php
- problem
- magento
- debugging
- developer mode
---
I in the middle of carrying out an upgrade for a client, which is causing the usual compatibility problems...

Normally I rely on Developer mode to point me in the right direction with these, but in this case no matter what I did, I could not get magento to display errors.

Finally I came across a modified version of the App class in code/local/Mage, which carried out a reset of the Mage static variables, including developer mode. Reset developer mode to true after this line and everything will work as it should.

Just be sure not to upload it to the live server!
