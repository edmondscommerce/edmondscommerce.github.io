---
layout: post
status: publish
published: true
title: jQuery Plugin Not Loading + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3145
wordpress_url: http://www.edmondscommerce.co.uk/?p=3145
date: 2012-06-06 13:27:20.000000000 +01:00
categories:
- javascript
tags:
- javascript
- problem
- jquery
- solution
- plugin
---
If you are struggling to figure out why a perfectly good jQuery plugin that works elsewhere is not loading into jQuery for a particular page, this may well be your solution.

This behaviour will happen if something reloads jQuery elsewhere on your page, below the script tag that calls the plugin.

If this happens, jQuery is effectively reloaded and has lost all the extensions you have made to it.

The solution of course is to simply remove the extra jQuery loads. If that is not very easy to do, you can at least try to modify it so that it won't reload it if it already exists:

```javascript

<script type="text/javascript">
    if (typeof jQuery == 'undefined') {
        var script     = document.createElement('script');
        script.setAttribute("type","text/javascript");
        script.src = "jquery-latest.pack.js";
        var head = document.getElementsByTagName('head')[0],
        done = false;

        // Attach handlers for all browsers
        script.onload = script.onreadystatechange = function() {
            if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {
                done = true;
                // callback function provided as param
                onload_stuff();
                script.onload = script.onreadystatechange = null;
            };
        };
        head.appendChild(script);
    }else{
        onload_stuff();
    }
    onload_stuff = function(){
         // your onload stuff goes here
    }
</script>

```
