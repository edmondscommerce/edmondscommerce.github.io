---
layout: post
status: publish
published: true
title: Comply with the cookie law with very little effort
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3271
wordpress_url: http://www.edmondscommerce.co.uk/?p=3271
date: 2012-08-15 14:16:16.000000000 +01:00
categories:
- jquery
tags:
- javascript
- html
- development
- developer
- jquery
- cookies
- script
- tip
- law
---
A lot of concern has been caused by the "Cookie Law" which says you must tell people that you use cookies if you do, and 99% of sites do!

Well here's a very simple jQuery bolt-on that deals with that, and although visitors need javascript enabled to see it, you have made "best efforts" to inform them, and on any eCommerce site you're going to have a "this site requires javascript message" anyway.

The file to download is from github (isn't opensource great?) <a href="https://github.com/carlwoodhouse/jquery.cookieBar" title="jQuery.cookiebar on github">here</a> and is as simple to implement as add the script file to the head and somewhere on the page insert the following :
```javascript

<script type="text/javascript">
    $(document).ready(function() {
      $.cookieBar();
    });
</script>

```

The example page is also on github : <a href="http://carlwoodhouse.github.com/jquery.cookieBar/" title="CookieBar example page">http://carlwoodhouse.github.com/jquery.cookieBar/</a>.
