---
layout: post
status: publish
published: true
title: Magento 1.4 Fatal Error Stack Frame + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1380
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1380
date: 2010-02-15 14:10:35.000000000 +00:00
categories:
- magento
tags:
- magento
- error
- '1.4'
- stack frame
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If your shiny new Magento 1.4 is displaying this error message at the bottom of the page then you might want to apply this fix.

<strong>Fatal error: Exception thrown without a stack frame in Unknown on line 0</strong>

The solution is to comment out a small section of code in 

app/code/core/Mage/Core/Model/Cache.php

line 180

```php

                /*try {
                    if (class_exists($type, true)) {
                        $implements = class_implements($type, true);
                        if (in_array('Zend_Cache_Backend_Interface', $implements)) {
                            $backendType = $type;
                        }
                    }
                } catch (Exception $e) {
                }*/

```

found the solution here:
<a href="http://www.magentocommerce.com/boards/viewthread/76782/">http://www.magentocommerce.com/boards/viewthread/76782/</a>
