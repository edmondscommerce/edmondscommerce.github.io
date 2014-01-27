---
layout: post
status: publish
published: true
title: View HTML Files from the Command Line - Linux
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1769
wordpress_url: http://www.edmondscommerce.co.uk/?p=1769
date: 2010-08-12 11:10:44.000000000 +01:00
categories:
- linux
tags:
- html
- browser
- ssh
- view
- shell
- w3m
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you ever want to have a quick look at a html file from the command line (eg when SSHing into a server) then you will love this little app.

Called w3m, its a basic text based browser that will render your html into readable formatted text right on the command line.

This is great for me as I often create log files in a HTML format, before this the only way to read them was to either have them web accessible or download them and view them locally in the browser.

Now with this little app I can view them right in situ - dead handy.

To install on Cent OS just
```

yum install w3m

```
