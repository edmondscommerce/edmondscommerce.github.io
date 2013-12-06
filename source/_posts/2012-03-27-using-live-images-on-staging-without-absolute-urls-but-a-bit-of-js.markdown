---
layout: post
status: publish
published: true
title: Using Live Images on Staging Without Absolute URLs (but a bit of JS)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3057
wordpress_url: http://www.edmondscommerce.co.uk/?p=3057
date: 2012-03-27 11:05:49.000000000 +01:00
categories:
- javascript
tags:
- javascript
- development
- jquery
- hosting
- images
- debugging
- image
- tip
- urls
- staging
- abolute
- img
---
If you have a staging copy of your site anywhere then you might not bother copying over your entire catalogue of product images etc. 

You might decide to drop in absolute URLs for those images so that they are pulled from live. However you really don't want absolute URLs in your code and you certainly don't want that to go live because it just adds unnecessary bloat.

A nice trick you can do here is make a change to your staging site as follows. Of course ensure this change doesn't go live, but it should be just one file so that's easy to handle.

(Note this assumes you already have jQuery available on your page)

```javascript

<script type="text/javascript">
$().ready(function(){
    $('img').each(function(){
        var src = $(this).attr('src')+'';        
        if(-1 == src.indexOf('http')){
            var new_src = 'http://www.LIVEDOMAIN.co.uk/'+src;
            $(this).attr('src', new_src);
        }
    });
});    
</script>

```

Don't forget to change LIVEDOMAIN to be your real live domain
