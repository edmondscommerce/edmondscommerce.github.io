---
layout: post
status: publish
published: true
title: Javascript Associate Arrays / Objects with Dynamic Key Access
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1199
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1199
date: 2009-09-26 18:19:24.000000000 +01:00
categories:
- javascript
tags:
- javascript
- array
- associative
- object
- dynamic
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are trying to use associative arrays in Javascript, the first thing is to not use the Array type and instead just use objects.

The weird and wonderful thing is that if you create your array as an object, you can still use the array style square brackets to access object properties.

So for example take this:

```javascript

var assocArrayObject = {"key1":"value1", "key2":"value2"};

alert(assocArrayObject["key1");

```

You can also access object properties by using a dynamic key this way as well, but not via the normal method, for example

```javascript


var dynamicKey = "key1";

//doesnt work
alert(assocArrayObject.dynamicKey);

//does work
alert(assocArrayObject[dynamicKey]);


```

easy when you know how, took me a while to clear this one up :)
