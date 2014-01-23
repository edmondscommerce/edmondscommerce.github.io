---
layout: post
status: publish
published: true
title: MySQL Substring not Returning Anything + Solution
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4459
wordpress_url: http://www.edmondscommerce.co.uk/?p=4459
date: 2013-08-20 10:54:20.000000000 +01:00
categories:
- mysql
tags:
- mysql
- problem
- sql
- solution
- empty
- query
- substring
---
If you are puzzled why your simple usage of the MySQL SUBSTRING() function is not returning anything this could be your solution.

The substring function allows you to specify a string (eg a column), the start character and the length. If you are used to languages like PHP then you are probably used to this kind of function regarding 0 as the starting character. In fact this function regards 1 as the starting character. If you specify 0 then you simply won't get any results.

This does not work:
```

SELECT SUBSTRING(column, 0, 10) as tenchars

```

This does work:
```

SELECT SUBSTRING(column, 1, 10) as tenchars

```
