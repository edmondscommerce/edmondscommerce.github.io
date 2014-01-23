---
layout: post
status: publish
published: true
title: Linux Mint 14 / Ubuntu 12.10 Slow Wifi with Ath9k Drivers + Solution
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3784
wordpress_url: http://www.edmondscommerce.co.uk/?p=3784
date: 2012-12-12 10:44:52.000000000 +00:00
categories:
- linux
tags:
- ''
- ubuntu
- linux
- wireless
- problem
- solution
- slow
- issue
- mint
- '12.10'
- wifi
- ath9k
- nohwcrypt
- ifconfig
- wlan0
---
I upgrade my laptop to the latest release of Linux Mint 14 MATE edition. Everything is working beautifully apart from the wireless which, whilst functional, was cripplingly slow.

After a load of searching and testing, the solution that worked for me was:

```bash

sudo -s

iwconfig wlan0 rate 54M

echo "options ath9k nohwcrypt=1" > /etc/modprobe.d/ath9k.conf

reboot

```

If you copy and paste the above into a terminal it will force the wifi speed to 54M and will make sure hardware crypt is disabled and finally reboot your machine.

I did this and my wifi speed is now perfectly fast, I'm a happy bunny :)
