---
layout: post
title: "Sorting Results Arbitrarily in MySQL"
date: 2013-12-03 12:40:04 +0000
comments: true
author: joseph
categories: 
 - mysql
tags: 
 - sort
 - find_in_set
 - order_by
description: "How to arbitrarily sort results in a MySQL query" 
---

When you have a result set in MySQL that you need to order in a specific way you might think that it is not possible and instead you are going to have to read all
of your results into your application domain (eg PHP) and manage the sorting from there. On a large results set that could be seriously inefficient.

The truth is that you don't have to do that. You can specify any kind of sort order including sorting by string values as you see fit.

The way to do this is to use the magic of [FIND_IN_SET](http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_find-in-set) combined with ORDER BY.

For a full example see this query that is pulling out product images from a data repository in descending image size as described in one of the columns as a string.

``` mysql
SELECT
  dcl.prodID,
  dcl.contentGuid,
  dc.url,
  dcmv.metaValueName AS resolution
FROM cds_DigContent dc
  JOIN cds_DigContent_Links dcl
    ON (dc.contentGuid = dcl.contentGuid)
  JOIN cds_DigContent_Meta dcm
    ON (dcm.contentGuid = dc.contentGuid
        AND dcm.metaAtrId = 6)
  JOIN cds_DigContent_Meta_ValVoc dcmv
    ON (dcmv.metaValueId = dcm.metaValueId)
WHERE dc.mediaTypeId = 15
      AND dcl.prodId = '{$this->getCnetProdID()}'

ORDER BY
  FIND_IN_SET(dcmv.metaValueName, '2400 x 1800,1200 x 900,1024 x 768,800 x 600,640 x 480,400 x 300,200 x 150,75 x 75')

LIMIT 0, 1

```

