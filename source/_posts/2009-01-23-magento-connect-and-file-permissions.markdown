---
layout: post
status: publish
published: true
title: Magento Connect and File Permissions
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 102
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=102
date: 2009-01-23 14:51:57.000000000 +00:00
categories:
- magento
tags:
- edmondscommerce
---
If you installed Magento via any other method than the downloader, then when you come to use Magento Connect, you will find that you are unable to due to permissions. For Magento Connect to work, all folders must have 777 permissions. 

If you have SSH access to your server, you can fix this by running the following command:

```

find ./ –type d –exec chmod 777 {} \;

```

If you don't have SSH access you could try a php based SSH emulator instead.

The other option is to use Filezilla 3 to recursively chmod the files for you. This can take a little while to run, but at least you don't have to do it manually!
