---
layout: post
status: publish
published: true
title: Saving a File or Webpage using PHP
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 23
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/saving-a-file-or-webpage-using-php/
date: 2008-02-28 18:06:42.000000000 +00:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Sometimes you want your PHP script to grab a text file or other external resource and save it locally.

Here is my simple function for doing just that.

```php

function save_external_resource($resource, $filename){
$data = fopen($resource, 'r');
file_put_contents($filename, $data);
}

```

You can save any kind of resource from anywhere on the web that you have access to and save it locally.

For large files you may need to edit your php.ini and increase the resource limits and max execution time.
