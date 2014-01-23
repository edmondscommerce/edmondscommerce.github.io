---
layout: post
status: publish
published: true
title: 'Mail Chimp and Magento '
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1249
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1249
date: 2009-11-11 17:49:00.000000000 +00:00
categories:
- magento
tags:
- magento
- bulk
- mail chimp
- email marketing
- list segmentation
- emails
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Currently working on a project that requires some fairly complex integration between Magento and Mail Chimp.

I'm really impressed with Mail Chimp so far - the API is really well documented and a pleasure to work on. A breath of fresh air compared to most API's that I have worked on before. It's amazing what a difference decent documentation does.

Magento on the other hand - well I'm sure you know that Magento documentation is a bit like rocking horse ****. Thankfully though I do seem to be getting my head around it and am now utilising both the overriding method of customisation and the extremely useful event/observer method. 

The ability to drop in some extra functionality at a key point (event) in the application flow is amazingly powerful and very clean. I am not touching any core code at all, just taking the objects that are passed over to the observer (which thanks to the nature of Magento and the amazing interconnectedness of every object to every other object) is plenty to give me access to the information I need.

Now that I am working in detail with the Mail Chimp API though I can see some really powerful opportunities for tightly focussed email marketing thanks to the powerful list segmentation capabilities. If I had the time (or someone who was willing to pay for it) I would love to roll together a really powerful Mail Chimp based Magento email marketing module... Any takers?
