---
layout: post
status: publish
published: true
title: Handy Easy Javascript
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 8
wordpress_url: http://www.edmondscommerce.co.uk/blog/javascript/handy-easy-javascript/
date: 2008-02-07 15:28:02.000000000 +00:00
categories:
- javascript
tags:
- javascript
- html
- web design
- user friendly
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Javascript can seem daunting for new comers who are learning html and coding for the web. However there are a few dead easy things you can do with javascript which do not require any particularly complicated code and can make your site a bit smoother and slicker for the end user.

<strong>Form Submit on Change</strong>

A dead easy one to make forms automatically submit when people make a selection on a drop down menu. All you have to do is add onchange="submit();" into your opening select tag

```html


<form action="index.php"> <select name="view" onchange="submit();"> <option>option1</option><option>option 2</option></select> </form>
```

<strong>Javascript Back Button</strong>

another really easy one - you can replicate the functionality of the back button. This is especially handy if you are displaying content in a javascript window without the usual controls.

```html


<a href="javascript: history.go(-1)"><-- Back</a>


```
