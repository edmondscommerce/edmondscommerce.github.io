---
layout: post
status: publish
published: true
title: Magento Overiding XML Case Inconsistency Continues
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 807
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=807
date: 2009-06-23 14:57:16.000000000 +01:00
categories:
- magento
tags:
- magento
- xml
- override
- case
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Had another tearing hair out moment when trying to figure out why my helper override was working fine,  but my block override wasn't working. Here is the result:

<b>helper working, block not working:</b>
```xml

<?xml version="1.0"?>
<config>
    <modules>
        <EC_CatalogSearch>
            <version>0.1.0</version>
        </EC_CatalogSearch>
    </modules>
    <global>
        <helpers>
            <catalogSearch>
                <rewrite>
                    <data>EC_CatalogSearch_Helper_Data</data>
                </rewrite>
            </catalogSearch>
        </helpers>
        <blocks>
            <catalogSearch>
                <rewrite>
                    <result>EC_CatalogSearch_Block_Result</result>
                </rewrite>
            </catalogSearch>
        </blocks>
    </global>
</config>

```

then after a load of messing about, this one does work:

<b>helper and block both working</b>
```xml

<?xml version="1.0"?>
<config>
    <modules>
        <EC_CatalogSearch>
            <version>0.1.0</version>
        </EC_CatalogSearch>
    </modules>
    <global>
        <helpers>
            <catalogSearch>
                <rewrite>
                    <data>EC_CatalogSearch_Helper_Data</data>
                </rewrite>
            </catalogSearch>
        </helpers>
        <blocks>
            <catalogsearch>
                <rewrite>
                    <result>EC_CatalogSearch_Block_Result</result>
                </rewrite>
            </catalogsearch>
        </blocks>
    </global>
</config>

```

yeah exactly :S
