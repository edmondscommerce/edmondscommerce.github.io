---
layout: post
status: publish
published: true
title: RGBA Cross Browser Support + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 820
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=820
date: 2009-06-30 07:23:45.000000000 +01:00
categories:
- web design
tags:
- rgba
- alpha
- transparency
- opacity
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I recently came across rgba colours which are a very simple and logical way to produce a colour (rgb) with alpha transparency as well. This is ideal if for example you want to create a translucent white box to put some text in.

CSS does have some (dodgy) opacity controls, but they set everything as transparent including any text or pictures contained within the element. By using rgba, we can set a translucent background colour and have opaque elements contained within.

As usual, to get it to work in IE requires some extra effort, however this hack mentioned  <a href="http://css-tricks.com/rgba-browser-support/">here</a> and originally credited <a href="http://www.hedgerwow.com/360/dhtml/rgba/demo.php">here</a> seems to offer a solution.
