---
layout: post
status: publish
published: true
title: Netbeans Clear Cache to Correct Broken Code Completion
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2139
wordpress_url: http://www.edmondscommerce.co.uk/?p=2139
date: 2011-02-16 11:37:30.000000000 +00:00
categories:
- netbeans
tags:
- netbeans
- auto
- cache
- fix
- code
- completion
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If your Netbeans project is behaving a bit weirdly with regards to code auto completion then this little fix might be for you.

Netbeans maintains a cache folder and it looks like this can get corrupted sometimes and need clearing out.

Close Netbeans down, empty your $HOME/.netbeans/6.9/var/cache/ folder and then restart Netbeans and hopefully that should fix it
