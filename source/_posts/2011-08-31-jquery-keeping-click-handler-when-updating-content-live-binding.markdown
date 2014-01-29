---
layout: post
status: publish
published: true
title: JQuery Keeping Click Handler when Updating Content - Live Binding
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2605
wordpress_url: http://www.edmondscommerce.co.uk/?p=2605
date: 2011-08-31 15:02:23.000000000 +01:00
categories:
- jquery
tags:
- javascript
- html
- jquery
- update
- solution
- event
- handler
- bind
- live
- attach
- dom
- maintain
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are using jQuery and attaching click handlers etc to elements as part of your document ready block, you may find you are losing those handlers if you update the page with Javascript after load.

For example if you have some kind of slide show which involves redrawing the contents of a div, you might find that the click handlers you had attached to the links of class 'slideshow-link' stop working.

Of course you can reattach handlers manually after dropping in your new HTML but that's pretty messy.

A much nicer solution is this:

Instead of using 
```javascript

jQuery('.slideshow-link').click(function(){});

```

You can use
```javascript

jQuery('.slideshow-link').live('click', function(){});

```

The Live method will keep the attachment to elements matching the selector now and in the future.

<a href="http://api.jquery.com/live/">http://api.jquery.com/live/</a>

Gotta love jQuery ;)
