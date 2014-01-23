---
layout: post
status: publish
published: true
title: Magento Remove Hard Coded URLs from Theme
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1804
wordpress_url: http://www.edmondscommerce.co.uk/?p=1804
date: 2010-09-02 14:14:18.000000000 +01:00
categories:
- magento
tags:
- links
- design
- magento
- theme
- grep
- cms
- hard coded
- sed
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are working on a theme, you may find that there are hard coded links dotted all over the place.

This can make testing a site offline (and thereby not on the same URL) a bit of a pain.

Here is a quick fix for you:

1. Remove all hard coded links from the CMS section:

```sql

update cms_block set content = replace(content, 'http://www.domain.com/', '{{store url=''}}');

```

```sql

update cms_page set content = replace(content, 'http://www.domain.com/', '{{store url=''}}');

```

2. Remove all hard coded links from the theme files.

This is a command line one using grep and sed.

Firstly, cd into the root theme folder

```

cd app/design/frontent/default/hardtheme

```

Now find files with hard coded links

```

grep -rl 'http://www.domain.com' ./

```

Now to automatically remove all those, 

```

grep -rl 'http://www.domain.com' ./ | xargs sed -i 's/http:\/\/domain.com\//<?php echo Mage::getBaseUrl(Mage_Core_Model_Store::URL_TYPE_WEB);?>/'

```
