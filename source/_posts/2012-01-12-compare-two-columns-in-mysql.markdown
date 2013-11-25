---
layout: post
status: publish
published: true
title: Compare two columns in mysql
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2844
wordpress_url: http://www.edmondscommerce.co.uk/?p=2844
date: 2012-01-12 18:02:17.000000000 +00:00
categories:
- mysql
tags:
- development
- problem
- developer
- solution
- tip
---
Many database queries rely on seeing if two columns match / differ, however sometimes you may want to check if either column contains a sub-string of the other. MySql allows you to do this, but it isn't that well documented, so hopefully this will help someone looking for this in the future

<code>
SELECT *
FROM 
	`table`
WHERE 
	`col1` LIKE CONCAT('%', `col2`, '%')
	OR col2 LIKE CONCAT('%',`col1`,'%')
</code>
