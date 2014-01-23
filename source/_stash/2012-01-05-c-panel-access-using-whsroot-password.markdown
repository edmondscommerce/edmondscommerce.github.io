---
layout: post
status: publish
published: true
title: C-Panel Access using WHS/Root Password
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2792
wordpress_url: http://www.edmondscommerce.co.uk/?p=2792
date: 2012-01-05 15:29:03.000000000 +00:00
categories:
- server
tags:
- server
- access
- login
- whs
---
Ever wondering how you could gain access into any Control panel(c-panel) account when you confidently know only the username of the c-panel account. I tried doing this by actually using the Web host manager (WHS) password, and it worked brilliantly for any c-panel user account. 

But the only gotcha I found out  was that I could not use Phpmyadmin. Nevertheless, you could still find a way around this by adding a PHP database management file on the web root directory which installs an alternative database management User interface which provides functions similar to Phpmyadmin.
