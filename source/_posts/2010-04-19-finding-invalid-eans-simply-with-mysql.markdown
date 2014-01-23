---
layout: post
status: publish
published: true
title: Finding invalid EANs (simply) With MySQL
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1607
wordpress_url: http://www.edmondscommerce.co.uk/?p=1607
date: 2010-04-19 14:54:09.000000000 +01:00
categories:
- mysql
tags:
- mysql
- ean
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Check out this little query for checking for obviously invalid EANs. 

Note this is not checking the check digit for validity, it is purely looking for data that is in no way possibly an EAN number.

```sql

update products set ean = '' where ean != '' and ean not regexp '^[0-9]{13}$'

```

assuming you have a column called ean, this will empty the value for the EAN for any product that has dodgy data in there.

MySQL regex is actually very powerful and fast.
