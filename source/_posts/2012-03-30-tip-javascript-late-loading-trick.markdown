---
layout: post
status: publish
published: true
title: 'Tip: Javascript late-loading trick'
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3066
wordpress_url: http://www.edmondscommerce.co.uk/?p=3066
date: 2012-03-30 14:36:08.000000000 +01:00
categories:
- javascript
tags:
- javascript
- html
- firefox
- chrome
- jquery
- path
- tip
---
Having issues with javascript dependencies or awkwardly structured html defining objects you need before run?

This is a little trick I used combined with <a href="https://github.com/csnover/RoundRect">csnover's roundrect.js</a> to provide IE versions < 9 with border-radius rounded corners.

Create a separate source file e.g. mylateloader.js and in it include the following code :-
```

function myInArray(needle, haystack) {
    var length = haystack.length;
    for(var i = 0; i < length; i++) {
        var str = jQuery(haystack[i]).attr('src');
        if(typeof(str) != 'undefined' && str.search('.*'+needle+'.*') > -1) return str;
    }
    return false;
}

jQuery(document).ready(function(){
    var script = document.createElement('script');
    url = myInArray('mylateloader.js', document.getElementsByTagName('script'));
    script.src = url.replace('mylateloader.js','mycoolminifiedfile.min.js');
    document.getElementsByTagName('head')[0].appendChild(script);
    setTimeout("mycoolobject.run()",2000);
})

```

That way, at document.ready(), mycoolminifiedfile.min.js is loaded <em>from the same directory on the server as the late loader js</em> and 2 seconds later, the mycoolobject.run() is called.
