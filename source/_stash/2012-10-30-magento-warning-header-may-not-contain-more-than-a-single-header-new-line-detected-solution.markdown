---
layout: post
status: publish
published: true
title: 'Magento Warning: Header may not contain more than a single header, new line
  detected + Solution'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3469
wordpress_url: http://www.edmondscommerce.co.uk/?p=3469
date: 2012-10-30 14:08:10.000000000 +00:00
categories:
- magento
tags:
- magento
- solution
- line
- warning
- new
- header
- single
- detected
---
If you are puzzled by the error message:

<code>
Warning: Header may not contain more than a single header, new line detected
</code>
When dealing with a Magento migration, you might want to double check you have not accidentally added a new line character to the end of your base_url field when you were updating the core_config_data table. 

I just did this using phpMyadmin's nifty ajax editing feature however I must have hit return by accident. Simply editing them again and making sure there is absolutely no white space at the end of the URL and the problem is solved.
