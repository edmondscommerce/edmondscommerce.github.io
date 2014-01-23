---
layout: post
status: publish
published: true
title: Wget For Beginners
author: daya
author_login: daya
author_email: info+daya@edmondscommerce.co.uk
wordpress_id: 3639
wordpress_url: http://www.edmondscommerce.co.uk/?p=3639
date: 2012-11-19 08:02:25.000000000 +00:00
categories:
- linux
tags:
- http
- linux
- server
- wget
- bash
- remote
- website
- tip
- ftp
- filedownload
---
<h3>What is Wget in general ?</h3>

Wget is a free utility for non-interactive download of file from the web. The user doesn’t need to login system every time <a href="http://www.gnu.org/software/wget/" rel="nofollow">Wget</a> can download the entire web page or mirroring the entire web page. If download crashed or stop for various reason Wget will start download again from where it stopped. It is highly recommended for downloading file from web with slow network connections.

<h2>How to Use Wget ? </h2>

```php


wget -t 10 www.google.com


```


If network connection fails Wget will to try to reconnect 20 times in default.With -t command we can specify how many times it need to  reconnect.


```php


wget -p --convert-links -r www.google.com -o logfile


```


This command will download the site -p and --convert will make sure all linked files are linked to downloaded document such as images and external links it enables complete offline viewing. Log file can be enabled with -O command to view the output message.


```php


wget --spider --force-html www.google.com


```

--spider Will check the webpage is existent or not.
--force  It will enforce the file type that have to be downloaded.


```php


wget -u mozilla www.google.com


```


some site access allowed to certain user <a href="http://www.user-agents.org/" rel="nofollow">agents</a>. So to access with certain user agent you can use this command.


Ftp connection download is achieved by

```php


wget -r ftp://username:password@ftp.example.com


```
