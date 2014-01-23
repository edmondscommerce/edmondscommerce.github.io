---
layout: post
status: publish
published: true
title: PHPUnit and PDOException + Solution
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3472
wordpress_url: http://www.edmondscommerce.co.uk/?p=3472
date: 2012-11-01 12:30:21.000000000 +00:00
categories:
- php
tags:
- development
- problem
- solution
- phpunit
- PDO
---
I recently needed to run a test suite against a couple of classes that were making use of PDO.

When I tried to run the I got the following errors in the output for every test

PDOException: You cannot serialize or unserialize PDO instances

There is a quick way around this you just need to add the following lines to the class level doc block

```php


/**
 *
 * @backupGlobals disabled
 * @backupStaticAttributes disabled
 */


```

A full explanation of these, and other annotations can be found <a title="PHP Unit Appendix B. Annotations" href="http://www.phpunit.de/manual/current/en/appendixes.annotations.html">here</a>
