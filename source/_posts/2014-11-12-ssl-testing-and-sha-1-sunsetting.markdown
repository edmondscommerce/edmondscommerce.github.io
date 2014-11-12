---
layout: post
title: "SSL testing and SHA-1 Sunsetting"
date: 2014-11-12 13:03:36 +0000
comments: true
author: michael
categories: security
tags: 
 - ssl
 - certificate
 - server
 - chrome
description: Notes on testing ssl and SHA-1 being depricated for certificate signatures 
---

Over last few days we been doing a bit of work on doing some audits for people and one of the things that has come up is ssl. For the purpose of checking the servers ssl implementation we have been using [Qualys SSL Labs](https://www.ssllabs.com/ssltest/) which is a excelent tool.

The checker checks for the ssl certificate and tells you if your server setup is vulnerable to attacks such as Poodle and OpenSSL CCS Injection. We will produce a blog post shortly on the best practise setup to prevent these attcks.

For the moment SHA-1 as a certificate signature algorithm is getting depricated in [chrome](https://community.qualys.com/blogs/securitylabs/2014/09/09/sha1-deprecation-what-you-need-to-know). As the cost for collision attcks against SHA-1 will become more [affordable](https://www.schneier.com/blog/archives/2012/10/when_will_we_se.html) in the next few years.

Goole have set the cut off for certificates after 2016 but we will be seeing some crosses on the padlock in chrom during the first quater of 2015.

If your certificate expires in 2015 then you will not see any chrome. If your certificate expires in 2016 you will see some minor errors being reported in chrome. However if your certificate expires in 2017 then chrome will treat it as an insecure certificate in 2015.

So our advice is:

 - If your certificate expires in 2015: When you come to renew make sure you get SHA-256 as the certificate signature
 - If your certificate expires in 2016: Think about getting renewed during 2015 or earlier.
 - If your certificate expires in 2017: Think about getting a new one issue as soon as possible.
