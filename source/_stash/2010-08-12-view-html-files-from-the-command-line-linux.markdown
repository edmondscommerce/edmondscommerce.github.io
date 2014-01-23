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
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
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
