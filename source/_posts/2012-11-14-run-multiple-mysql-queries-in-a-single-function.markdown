---
layout: post
status: publish
published: true
title: Run Multiple MySQL Queries in a Single Function
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3630
wordpress_url: http://www.edmondscommerce.co.uk/?p=3630
date: 2012-11-14 12:45:09.000000000 +00:00
categories:
- php
tags:
- mysql
- php
- table
- migration
- sql
- database
- phpmyadmin
- query
- create
- multiquery
- drop
---
If you want to be able to run multiple queries in a single function call, for example doing the classic drop table blah; create table blah; then you might like this function.

The use case is for things like database migration systems which you might copy and paste chunks of SQL including multiple queries from things like phpMyAdmin

```php

/**
 * Run multiple queries passed in as a single string
 * This is optimised for copying and pasting from phpMyAdmin
 * 
 * Handy for things like database migration systems
 * 
 * @param string $sql  multiple queries terminated with ; and a new line
 */
function multiQuery($sql)
{
    $sqls = preg_split('%;$%m', trim($sql));
    foreach ($sqls as $q) {
        if (empty($q)) {
            continue;
        }
        mysql_query($q); //suggest you replace this with your custom query function or if not throw in some extra error checking at least
    }
}

```
