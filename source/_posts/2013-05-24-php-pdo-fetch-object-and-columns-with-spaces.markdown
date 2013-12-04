---
layout: post
status: publish
published: true
title: PHP PDO Fetch Object and Columns with Spaces
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4274
wordpress_url: http://www.edmondscommerce.co.uk/?p=4274
date: 2013-05-24 17:39:35.000000000 +01:00
categories:
- php
tags:
- php
- database
- object
- columns
- PDO
- spaces
- fetchObject
---
If you use PDO and Fetch Object, it might not be clear exactly to access row properties that are based on columns that have spaces.

I know I searched for things like:

PDO Columns with spaces
PDO::fetchObject spaces
and PDO spaces in column names

I eventually found what I was looking for in the depths of the PHP.net comments however hopefully this post will be a little bit easier to find thanks to a bit of primitive SEO up there.

The solution to using columns with spaces is simply this:

```php

$sql="select * from table_with_spaces_in_column_names ";
$statement = $myPDOObject->prepare($sql);
$statement->execute();
$row = $statement->fetchObject();
$ColumnWithSpaces = $row->{'Column With Spaces'}

```
