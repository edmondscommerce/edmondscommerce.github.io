---
layout: post
status: publish
published: true
title: Netbeans Word Wrap
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2203
wordpress_url: http://www.edmondscommerce.co.uk/?p=2203
date: 2011-03-11 11:45:02.000000000 +00:00
categories:
- netbeans
tags:
- netbeans
- line
- word
- wrap
- ide
- long
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
I love Netbeans, but there has been one bug bear that I just learned to deal with. 

Files with very long lines (or even quite long lines) and Netbeans inability to line wrap.

Now though there is a possiblity to enable line wrapping. And its dead easy. And it works!

You can use word wrap in Netbeans.

Add the following to netbeans.conf (netbeans_installation_path/etc/netbeans.conf, by default /etc/netbeans.conf under linux):
```

-J-Dorg.netbeans.editor.linewrap=true

```
to the sixth line so it looks like this:

```

netbeans_default_options="-J-client -J-Xss2m -J-Xms32m -J-XX:PermSize=32m -J-XX:MaxPermSize=200m -J-Dapple.laf.useScreenMenuBar=true -J-Dapple.awt.graphics.UseQuartz=true -J-Dsun.java2d.noddraw=true -J-Dorg.netbeans.editor.linewrap=true"

```
and restart Netbeans.

Set the Line Wrap option in Tools->Options->Editor->Formating.

Works fine for me in Netbeans 6.9

<a href="http://stackoverflow.com/questions/255862/word-wrap-in-net-beans?tab=active#tab-top">http://stackoverflow.com/questions/255862/word-wrap-in-net-beans?tab=active#tab-top</a>
