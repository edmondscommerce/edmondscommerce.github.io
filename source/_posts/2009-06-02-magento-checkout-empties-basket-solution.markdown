---
layout: post
status: publish
published: true
title: Magento Checkout Empties Basket + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 419
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=419
date: 2009-06-02 13:24:32.000000000 +01:00
categories:
- magento
tags:
- magento
- checkout
---
A client recently experienced an issue where certain customers were having issues with the checkout redirecting people to the homepage instead of letting them checkout as normal.

After doing some research the client found that the issue is related to a security setting in Magento. Magento uses the IP address of a user as part of its session validation. This is perfectly reasonable approach and helps protect against XSS among other things. However it seems certain ISP's (AOL as usual) actually rotate the IP's that customers connections come from, which makes Magento think that the session is being hijacked.

You can disable this security setting by doing the following:

<blockquote>Change the Session Validation settings in the Magento Admin, found under System > Configurations > Web,  to ‘no’ on everything except “Validate HTTP_USER_AGENT.” After doing this,  go to System > Cache Management and refresh the configuration cache to apply the changes.</blockquote>
(originally found <a href="http://thewellrunsite.com/2009/02/12/fixing-the-magento-checkout-glitch/" target="_blank">here</a>)

I decided to blog about this one as it seems this would be a good idea to change on all Magento installations and by blogging about it I will remember.

