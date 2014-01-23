---
layout: post
status: publish
published: true
title: Secure and Insecure Contents in HTTPS
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 88
wordpress_url: http://www.edmondscommerce.co.uk/blog/security/secure-and-insecure-contents-in-https/
date: 2008-12-18 15:16:55.000000000 +00:00
categories:
- security
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If your web site's secure HTTPS area includes any content such as images, javascript or whatever via standard HTTP, your visitors may well get a security warning popping up saying that the page contains secure and insecure content.

For some of your sites visitors, this rather vague and worrying statement might make them decide to abandon your checkout procedure and cost you a sale.

Often this is very easy to fix.

Simply go to the page that is triggering the error message and "View Source"

Then in the source code, search for

```html

src="http://

or

src=http://

```

Now that you have found the offending items, you either need to remove them from your secure pages, or ensure that they are using the https:// method when the pages are being viewed by HTTPS.

that's it - dead easy :-)
