---
layout: post
status: publish
published: true
title: Magento Template Path Hints - In Admin!
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1835
wordpress_url: http://www.edmondscommerce.co.uk/?p=1835
date: 2010-09-25 10:37:22.000000000 +01:00
categories:
- magento
tags:
- magento
- custom
- module
- path
- admin
- template
- hints
- block
---
If you love template path hints in Magento for quickly figuring out which template file or block you need to edit or override and have a requirement for some admin side coding, you are going to love this.

You might not have thought it was possible to enable template path hints in admin, but it is!

Just run this query:

```sql

INSERT INTO core_config_data (scope, scope_id, path, value)
VALUES ('default', 0, 'dev/debug/template_hints', 1),
('default', 0, 'dev/debug/template_hints_blocks', 1);

```

To disable them again, run this query
```sql

UPDATE core_config_data set value = 0 where scope = 'default' and scope_id = 0 and path ='dev/debug/template_hints'

```

To enable again run this query
```sql

UPDATE core_config_data set value = 1 where scope = 'default' and scope_id = 0 and path ='dev/debug/template_hints'

```
