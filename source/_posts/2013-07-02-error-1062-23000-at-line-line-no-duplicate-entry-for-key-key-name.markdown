---
layout: post
status: publish
published: true
title: 'ERROR 1062 (23000) at line [Line No]: Duplicate entry for key ''[Key Name]'''
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4400
wordpress_url: http://www.edmondscommerce.co.uk/?p=4400
date: 2013-07-02 14:09:53.000000000 +01:00
categories:
- mysql
tags:
- mysql
- error
- keys
---
Importing a database dump from one location using mysqldump, and them importing it into a blank database I received this error:

ERROR 1062 (23000) at line [Line No]: Duplicate entry for key '[Key Name]'

The issue here is that a constraint is set up to prevent two rows containing the same value. Although key checks are disabled, it still can't add the rows. Sometimes as a useful technique to just get it running locally (obviously there's an issue here which does need resolving), simply change the "INSERT INTO" statement to "INSERT IGNORE INTO", which will skip that entry.
