---
layout: post
status: publish
published: true
title: MySQL Data Cleanse EAN Numbers
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1251
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1251
date: 2009-11-17 17:25:51.000000000 +00:00
categories:
- barcode
tags:
- mysql
- ean13
- barcode
- ean
- validation
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Just found this MySQL snippet for validating EAN numbers.

<a href="http://snipplr.com/view.php?codeview&id=17928">http://snipplr.com/view.php?codeview&id=17928</a>

I have modified it a bit to suit my requirements (namely totally corrupted EAN data).

```sql

SELECT ean
FROM products
WHERE
(LENGTH(ean) != 13)
||
(SUBSTRING((10 - ((((
SUBSTRING(ean FROM 2 FOR 1) +
SUBSTRING(ean FROM 4 FOR 1) +
SUBSTRING(ean FROM 6 FOR 1) +
SUBSTRING(ean FROM 8 FOR 1) +
SUBSTRING(ean FROM 10 FOR 1) +
SUBSTRING(ean FROM 12 FOR 1)  
)*3) + (
SUBSTRING(ean FROM 1 FOR 1) +
SUBSTRING(ean FROM 3 FOR 1) +
SUBSTRING(ean FROM 5 FOR 1) +
SUBSTRING(ean FROM 7 FOR 1) +
SUBSTRING(ean FROM 9 FOR 1) +
SUBSTRING(ean FROM 11 FOR 1)
)) MOD 10)) FROM -1 FOR 1) != SUBSTRING(ean FROM 13 FOR 1))

```
