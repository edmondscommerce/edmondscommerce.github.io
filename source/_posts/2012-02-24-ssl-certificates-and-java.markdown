---
layout: post
status: publish
published: true
title: SSL Certificates and Java!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2961
wordpress_url: http://www.edmondscommerce.co.uk/?p=2961
date: 2012-02-24 11:21:55.000000000 +00:00
categories:
- java
tags:
- ssl
- java
- keystore
- certificate
- programming
---
Java is a bit more picky about SSL authorities than, say, Chrome or Firefox. Fortunately adding a certificates to Java to accept it as secure is fairly straight forward:

sudo keytool -import -keystore /usr/lib/jvm/java-6-sun/jre/lib/security/cacerts -file cert.crt
Password: changeit

Of course acquiring the certificate file can be a little tricky as it's entirely dependant on your setup. Also /usr/lib/jvm/java-6-sun/jre/lib/security/cacerts is the default location for the keystore on Ubuntu, this may differ depending on your OS/distribution.
