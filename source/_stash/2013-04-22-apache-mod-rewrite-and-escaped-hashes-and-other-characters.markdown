---
layout: post
status: publish
published: true
title: Apache Mod Rewrite and Escaped Hashes (and other characters)
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4226
wordpress_url: http://www.edmondscommerce.co.uk/?p=4226
date: 2013-04-22 13:57:49.000000000 +01:00
categories:
- apache
tags:
- apache
- search
- mod_rewrite
- solr
- url
- flag
- encoded
---
If you are having issues with mod rewrite apparently abandoning sections of variables after encoded hashes then this could be your solution.

The use case is particularly clear when using mod_rewrite in front of a search engine (such as Solr which I am really enjoying working with at the moment).

Imagine someone search for a partcode ABC#123

This gets encoded to search/abc%23123

Your rewritten search term will then be mangled by Apache and your search script will only actually see ABC. That is of course a problem and the solution is not really clear.

After a bit of searching around I found the solution is to add a B flag to your mod_rewrite rule so that mod_rewrite will escape these characters so that they are cleanly passed through.

For example:

```php

RewriteRule ^(.*)search/(.*)$ advanced_search_result.php?keywords=$2 [L,B]

```
