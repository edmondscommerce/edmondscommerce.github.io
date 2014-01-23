---
layout: post
status: publish
published: true
title: Sticky page scrolling in JavaScript with JQuery
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 3939
wordpress_url: http://www.edmondscommerce.co.uk/?p=3939
date: 2013-02-20 17:35:30.000000000 +00:00
categories:
- jquery
tags:
- javascript
- web design
- web
- design
- jquery
- solution
- tip
---
If you have a page that keeps getting longer because new items appear on it at the bottom and what's at the bottom of the page is most important it can be a paint to have to keep scrolling done to see it.

You can make it auto scroll continuously with JQuery but that's potentially really awkward if at any point you need to scroll up (it basically means you can't).

The best solution is to make the page auto scroll in a sticky fashion. So when the page is already scrolled all the way to the bottom it auto scrolls, when it's not at the bottom it does not scroll.

This can be achieved quite easily with the following code:
```javascript

var num = (lastDocumentHeight - $(window).height()) - $(document).scrollTop();
if(num == 0) {
	$(&quot;html, body&quot;).animate({ scrollTop: $(document).height() }, &quot;slow&quot;);
}
lastDocumentHeight = $(document).height();

```

In this example lastDocumentHeight is a global. It works by determining if the current position is the same as it was previously and this position equates to being at the bottom of the page then scroll. This needs to run after your page length has increased.
