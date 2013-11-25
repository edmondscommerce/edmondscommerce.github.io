---
layout: post
status: publish
published: true
title: Avoiding 777 Permissions
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1299
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1299
date: 2010-01-04 15:15:31.000000000 +00:00
categories:
- linux
tags:
- linux
- apache
- permissions
- setfacl
- access control lists
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to be able to write to a folder with PHP but you do not want to have to use 777 permissions then instead you have the option to use access control lists.

This simple command will allow you to give permissions to Apache only, whilst keeping the standard permissions secure (eg 770) 

```

setfacl -m u:apache:rwx directory/

```
