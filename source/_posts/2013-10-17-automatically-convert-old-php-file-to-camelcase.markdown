---
layout: post
status: publish
published: true
title: 'Automatically convert old PHP file to camelCase '
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 4538
wordpress_url: http://www.edmondscommerce.co.uk/?p=4538
date: 2013-10-17 10:53:15.000000000 +01:00
categories:
- bash
tags:
- development
- php
- bash
- tip
- helpful tips
- coding standards
---
I've recently been working with an old project that uses a combination of different coding styles.

One of the more trivial annoyances with this is that the variables used through the project are a combination of $camelCase and $snake_case which throws of the coding standards tools that I use.

To get round this I have put a little script together that will convert $snake_case to $camelCase automatically.

Obviously, you will need to check the results of this to make sure that there are not variables that should not be changed, but it has saved me a lot of time doing this manually.

I've added this to my .bash_allias file, though it could easily be turned into a standalone script if required

```bash

#Fix legacy code
 cammelCase() {
   vim -E -s $@ <<-EOF
   :%s#\%($\%(\k\+\)\)\@<=_\(\k\)#\u\1#g
   :update
   :quit
EOF
 
}


```
