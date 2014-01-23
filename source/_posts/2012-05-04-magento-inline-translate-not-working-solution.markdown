---
layout: post
status: publish
published: true
title: Magento Inline Translate Not Working + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3098
wordpress_url: http://www.edmondscommerce.co.uk/?p=3098
date: 2012-05-04 09:04:03.000000000 +01:00
categories:
- magento
tags:
- mysql
- table
- problem
- magento
- solution
- save
- inline
- translate
- varchar
- can't
---
If you are puzzled as to why inline translate in Magento is not saving a particular translation, this could be your issue.

Inline translate uses the table core_translation to store the translations.

The fields that store the data are set to VARCHAR(255) fields.

If your source string is longer than 255 characters, it will fail silently to save the translation.

The simplest solution is to shorten the source string and stick to using inline translate on strings that are shorter than 255 characters.

You could alternatively modify the table but we prefer not to do that kind of thing unless we really have to.

Another workaround for text sections that need to be long is to simply use a static block instead.
