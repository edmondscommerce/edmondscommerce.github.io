---
layout: post
status: publish
published: true
title: Magento Disable Logging Without Editing Core Files
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2136
wordpress_url: http://www.edmondscommerce.co.uk/?p=2136
date: 2011-02-16 09:52:27.000000000 +00:00
categories:
- magento
tags:
- magento
- upgrade
- database
- log
- disable
- event
- local.xml
- core
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you want to disable Magento's logging functioality (which can cause a lot of issues due to very large tables being generated and the overhead associated with that) then this is a possible solution.

You can disable events by putting some special XML in your app/etc/local.xml file. 

This file does not get touched by upgrades (AFAIK) and the effects should kick in as soon as the configuration cache is cleared and rebuilt.

```xml

    <frontend> 
        <events> 
            <controller_action_predispatch> 
                <observers><log><type>disabled</type></log></observers> 
            </controller_action_predispatch> 
            <controller_action_postdispatch> 
                <observers><log><type>disabled</type></log></observers> 
            </controller_action_postdispatch> 
            <customer_login> 
                <observers><log><type>disabled</type></log></observers> 
            </customer_login> 
            <customer_logout> 
                <observers><log><type>disabled</type></log></observers> 
            </customer_logout> 
            <sales_quote_save_after> 
                <observers><log><type>disabled</type></log></observers> 
            </sales_quote_save_after> 
            <checkout_quote_destroy> 
                <observers><log><type>disabled</type></log></observers> 
            </checkout_quote_destroy> 
        </events> 
    </frontend> 

```
