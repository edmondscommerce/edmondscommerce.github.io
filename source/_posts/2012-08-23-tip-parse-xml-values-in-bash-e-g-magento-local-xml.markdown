---
layout: post
status: publish
published: true
title: 'Tip: Parse XML Values in bash e.g. Magento local.xml'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3334
wordpress_url: http://www.edmondscommerce.co.uk/?p=3334
date: 2012-08-23 11:37:58.000000000 +01:00
categories:
- bash
tags:
- function
- linux
- magento
- developer
- xml
- bash
- parse
---
Not the most elegant way to do this, and probably could do with some extra tweaks but it works for our purposes, so presented here in case it fits yours :

```bash

# xml_value path/to/file node_key
function xml_value(){
    grep "<$2>.*<.$2>" $1 | sed -e "s/<\!\[CDATA\[//" | sed -e "s/\]\]>//" | sed -e "s/^.*<$2/<$2/" | cut -f2 -d">"| cut -f1 -d"<"
}
```


It also strips out the CDATA tags, which we needed to pull the database details from Magento's local.xml

To use this to get, for example, the database host, you would use the following:

```bash
DB_HOST=$(xml_value app/etc/local.xml host)
```

To use this 
