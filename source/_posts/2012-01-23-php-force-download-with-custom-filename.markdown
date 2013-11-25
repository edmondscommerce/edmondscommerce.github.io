---
layout: post
status: publish
published: true
title: PHP Force Download with Custom Filename
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2902
wordpress_url: http://www.edmondscommerce.co.uk/?p=2902
date: 2012-01-23 15:22:03.000000000 +00:00
categories:
- php
tags:
- php
- custom
- file
- save
- feed
- download
- text
- header
- force
- as
- filename
- txt
- export
---
If you want to serve up text files for download (perhaps product feeds etc) then you might like this little snippet.

Not only will it force the file to be downloaded but it allows you to specify a custom filename that it should be saved as.

```php

if(isset($_GET['download_file'])){
    header("Content-type: application/octet-stream");
    header("Content-Disposition: attachment; filename=Export.txt");
    readfile('Export.txt');
    die;
}

```
