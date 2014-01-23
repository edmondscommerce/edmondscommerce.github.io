---
layout: post
status: publish
published: true
title: Magento Admin Login Not Working in Some Browsers + Solution
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3617
wordpress_url: http://www.edmondscommerce.co.uk/?p=3617
date: 2012-11-13 16:17:29.000000000 +00:00
categories:
- magento
tags:
- problem
- magento
- server
- admin
- solution
- time
- fix
- login
- issue
- hair
- cookie
- ntp
- tearing
- magento enterprise
- nginx
- php-fpm
---
If you are tearing your hair out trying to figure out why you are not able to log into the Magento admin on some browsers then this might be your solution.

This solution will apply particularly if you are setting up Magento on a brand new server or VPS as you will see.

The problem is actually that the server time is wrong. The server time is used for generating cookies and the fact that the time is wrong means that cookies become invalidated immediately. Some browsers will deal with this in a less aggressive way than others and might actually let the cookie work, others will go for hard line security and will make the whole thing break.

The way to check this is to SSH into the server and check the time:

```bash

date

```

If the time is wrong then you need to do the following to fix it:

```bash

yum install ntp
chkconfig ntpd on
ntpdate pool.ntp.org
/etc/init.d/ntpd start

```

The above will install NTP, make it run on startup, will update the time and will set it running so the time should stay up to date from here on.

To check that has worked simply check the time again:
```bash

date

```

Then finally flush your Magento cache and sessions

```bash

rm -rf var/cache/*
rm -rf var/sessions/*

```

And you should be good to go
