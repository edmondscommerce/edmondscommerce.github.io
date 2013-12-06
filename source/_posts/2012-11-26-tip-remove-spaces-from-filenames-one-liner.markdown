---
layout: post
status: publish
published: true
title: 'Tip: Remove spaces from filenames one-liner'
author: martyn
author_login: martyn
author_email: info+martyn@edmondscommerce.co.uk
wordpress_id: 3704
wordpress_url: http://www.edmondscommerce.co.uk/?p=3704
date: 2012-11-26 16:16:58.000000000 +00:00
categories:
- bash
tags:
- development
- bash
- sed
- tip
- filenames
---
There is often the case when you need to remove spaces from filenames - for instance when importing broken data feeds into <a title="Magento" href="http://www.edmondscommerce.co.uk/platforms/magento">Magento</a> or <a title="osCommerce" href="http://www.edmondscommerce.co.uk/platforms/osCommerce">osCommerce</a> systems.

The following strips spaces and replaces them with nothing :-

```bash
find directoryname -name '* *' -type f | while read f; do mv &quot;$f&quot; &quot;$(echo $f | sed s/&quot; &quot;/&quot;&quot;/g)&quot;;  done
```

or alternatively replace them with underscores :-

```bash
find directoryname -name '* *' -type f | while read f; do mv &quot;$f&quot; &quot;$(echo $f | sed s/&quot; &quot;/&quot;_&quot;/g)&quot;;  done
```

Or any other character/string combo you like, you can even be more clever moving them out into subdirectories with more sed magic but you get the idea.  The reason the read command is there is to get the spaces in found filenames which if you simply use a "for" loop, bash splits on the spaces.
