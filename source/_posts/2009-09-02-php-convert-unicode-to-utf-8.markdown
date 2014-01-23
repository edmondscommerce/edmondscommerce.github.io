---
layout: post
status: publish
published: true
title: PHP Convert UNICODE to UTF-8
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1177
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1177
date: 2009-09-02 10:46:26.000000000 +01:00
categories:
- php
tags:
- php
- unicode
- iconv
- text file
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are struggling with a UNICODE file in your PHP scripts and aren't ready or able to make the jump to PHP5.3 then this little snippet might help you out:

```php

$converted = dirname(__FILE__).'/converted.txt';
$source= dirname(__FILE__).'/source.txt';
shell_exec("iconv -o $conv  -f UNICODE -t UTF-8 -V $converted");

```

Its using the Linux iconv command. Of course it requires you to be running on Linux.
