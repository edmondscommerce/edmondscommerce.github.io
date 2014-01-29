---
layout: post
status: publish
published: true
title: Sed Error Unknown option to 's' + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2160
wordpress_url: http://www.edmondscommerce.co.uk/linux/sed-error-unknown-option-to-s-solution/
date: 2011-03-02 22:34:30.000000000 +00:00
categories:
- linux
tags:
- linux
- error
- option
- bash
- sed
- script
- unknown
- delimiter
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are struggling to figure out why your Sed script is failing this could well be the solution.

Every example you see using sed specifies / as a delimiter.

Now what if your pattern actually includes a slash in the body text?

If you are using a variable you might not realise that you are including a slash.

Easy thing to do, just switch the delimiter to something else like #

so 

```
sed "s/find/$REPLACE/" 
```

becomes

```
sed "s#find#$REPLACE#"
```

and hey presto it works!
