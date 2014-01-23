---
layout: post
status: publish
published: true
title: MySQL DB Admin GUI for Windows / XAMPP
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 35
wordpress_url: http://www.edmondscommerce.co.uk/blog/mysql/mysql-db-admin-gui-for-windows-xampp/
date: 2008-03-25 12:19:10.000000000 +00:00
categories:
- mysql
- Windows
- xampp
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are using windows (with XAMPP) to develop your MySQL applications, you might currently be using phpMyAdmin for your DBA tasks. The phpMyAdmin package is an awesome tool and is a must have, however due to the fact that it runs under Apache and PHP - it can be tricky to use when dealing with big database dumps or other heavy processing.

At this stage, you may decide that the best thing to do is to hit the command line. That's fair enough if you don't mind using command line applications. If however you fancy keeping it GUI, then I can highly recommend using the free community edition of SQLyog. 

This open source community edition is a free version of their main Enterprise Edition software which is paid for. If you are doing a lot of DBA work then you may want to consider supporting this company by handing over some cash for the fully featured software. The enterprise edition can handle external as well as local MySQL database administration, using SSH, SSL or HTTP/HTTPS tunnelling. It features all kinds of GUI functionality for building your database schema and designing queries. For the serious DBA's out there it may well be worth a look.

For the occasional big DB import / export session on the local windows host though, the community edition does seem to suffice.

You can download both the community and the enterprise edition here:

http://www.webyog.com/en/downloads.php

To compare functionalty check out this page:

http://www.webyog.com/en/sqlyog_feature_matrix.php
