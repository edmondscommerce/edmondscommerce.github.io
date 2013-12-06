---
layout: post
status: publish
published: true
title: Magento Module Not Working? This Might be Why
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 803
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=803
date: 2009-06-15 18:46:01.000000000 +01:00
categories:
- magento
tags:
- magento
- custom
- module
- xml
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
After a few hours of intense googling I have finally figured out why my Magento custom module is refusing to activate. I finally figured it out. It's all because the snippet of XML that I copied and pasted off a tutorial somewhere did not have the right capitalisation.

<b>doesn't work - EC_All.xml</b>
```xml

<?xml version="1.0"?>
<config>
    <modules>
        <EC_CatalogSearch>
            <active>true</active>
            <codepool>local</codepool>
        </EC_CatalogSearch>
    </modules>
</config>

```

<b>does work - EC_All.xml</b>
```xml

<?xml version="1.0"?>
<config>
    <modules>
        <EC_CatalogSearch>
            <active>true</active>
            <codePool>local</codePool>
        </EC_CatalogSearch>
    </modules>
</config>

```

I think next time I'm just going to use the module creator!
