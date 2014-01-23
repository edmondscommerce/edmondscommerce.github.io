---
layout: post
status: publish
published: true
title: PHP Split String on Word Break (No Regex or Arrays, Dead Simple)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2780
wordpress_url: http://www.edmondscommerce.co.uk/?p=2780
date: 2012-01-03 17:32:27.000000000 +00:00
categories:
- php
tags:
- php
- split
- string
- word
- tip
- strpos
- substr
- shorten
- break
- regex
---
Need to take a string of text and shorten it down but make sure you split on a word break?

This little snippet might be exactly what you are looking for.

```php

$text=substr($text, 0, strpos($text, ' ', 50));

```

effectively you are saying give me the position of the first space after character 50 and then chop the string there.

