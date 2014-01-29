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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
