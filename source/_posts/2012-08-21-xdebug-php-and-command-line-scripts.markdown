---
layout: post
status: publish
published: true
title: Xdebug PHP and Command Line Scripts
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3302
wordpress_url: http://www.edmondscommerce.co.uk/?p=3302
date: 2012-08-21 16:31:15.000000000 +01:00
categories:
- php
tags:
- php
- xdebug
- shell
- bash
- line
- tip
- command
- step
- through
- debugger
- scripts
---
I had a requirement to use Xdebug to step through a PHP script that is being run on the command line.

Oh no I thought, this is bound to be really complicated to figure out because I normally use the web browser and I have never done this before.

Pleasant surprise, its actually really easy to do this, all you need to do on the command line is run the following command:

```bash

export XDEBUG_CONFIG=&quot;idekey=netbeans-xdebug&quot;

```

Then get your IDE (PHPStorm for me) listening for Xdebug and then run your PHP file on the command line.

```bash

php ./myfile.php

```

That's it, it just works. 

One caveat (which I actually quite like) is that it will now ALWAYS get picked up by xdebug which could get in your way. To stop this, simply unset the variable like this:

```bash

unset XDEBUG_CONFIG

```
