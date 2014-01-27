---
layout: post
status: publish
published: true
title: Remove footer from Loaded Commerce (CRELoaded new name)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2742
wordpress_url: http://www.edmondscommerce.co.uk/?p=2742
date: 2011-11-30 16:08:35.000000000 +00:00
categories:
- oscommerce
tags:
- development
- creloaded
- problem
- solution
- tip
- Loaded Commerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Well known is how Loaded Commerce/CRELoaded protect their google banners they wack on all opensource versions of their code.

Once you have removed the footer in the current version though, it checks the output buffer and you will find it after the closing html tag of your page.

The function that does this is cre_uregisterBasicFunctions(); and if you remove the call to it from application_bottom.php, bye bye ads!

Scarily, if a hacker got control of www.loadedcommerce.com, php code could actually be inserted into EVERY Loaded Commerce installation that doesn't remove this.
