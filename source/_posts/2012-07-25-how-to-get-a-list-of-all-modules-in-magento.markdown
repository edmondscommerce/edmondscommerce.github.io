---
layout: post
status: publish
published: true
title: How to get a list of all modules in Magento
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3181
wordpress_url: http://www.edmondscommerce.co.uk/?p=3181
date: 2012-07-25 17:42:32.000000000 +01:00
categories:
- magento
tags:
- development
- linux
- problem
- magento
- solution
- bash
- tip
---
I was recently asked to generate a list of all of the modules in a copy of magento. 

To this I put together this quick one-line bash command to go through the modules folder and output the content

<code>
cat /path/to/magento/app/etc/modules/* | grep -B 1 "<.*active" | grep -v "<.*active" | sed 's/<//g' | sed 's/>//g' | awk '{print $1}' | sort | uniq > /path/to/file
</code>

If you just the active modules then run this instead
<code>
cat /path/to/magento/app/etc/modules/* | grep -B 1 "<.*active.*true" | grep -v "<.*active" | sed 's/<//g' | sed 's/>//g' | awk '{print $1}' | sort | uniq > /path/to/file
</code>
