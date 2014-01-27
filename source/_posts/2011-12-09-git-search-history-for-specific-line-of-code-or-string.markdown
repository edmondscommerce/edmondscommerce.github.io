---
layout: post
status: publish
published: true
title: Git Search History for Specific Line of Code or String
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2749
wordpress_url: http://www.edmondscommerce.co.uk/?p=2749
date: 2011-12-09 11:18:51.000000000 +00:00
categories:
- git
tags:
- git
- debug
- search
- log
- string
- history
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you need to track down exactly how and when a particular change happened and you are not even sure exactly where it is (perhaps because its no longer present but you are not totally sure where it was supposed to be) then this little trick can be a life saver.

You can search git log for a specific string with the -S flag

eg, searching for a constant definition

git -log -SCONSTANT_NAME

very handy indeed :)
