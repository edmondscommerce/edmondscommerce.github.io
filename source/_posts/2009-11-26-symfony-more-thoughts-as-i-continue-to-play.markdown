---
layout: post
status: publish
published: true
title: Symfony.. More Thoughts as I Continue to Play
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1264
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1264
date: 2009-11-26 17:47:15.000000000 +00:00
categories:
- symfony
tags:
- symfony
- yaml
- functions
- templates
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Continuing to play around with Symfony I am impressed with what I am seeing. It definitely has a feeling of "best practices" that seems to pervade the whole framework. It feels like without any effort you are going to be working in a secure way. It also seems to do a hell of a lot for you automatically.

As it relies heavily on command line scripts, there is even room for further automation by creating my own custom scripts to chain together symfony commands. In fact I'm starting to feel like I wont need to do any PHP coding at all any more, just figure out the data model and run a custom shell script, and then issue the invoice!

Of course its not going to be that easy. For one thing, creating YAML files is still taking some getting used to. And deciphering errors on the command line is also taking some getting used to, even though they are probably the same old error messages. One thing that tripped me up was a typo in one of my YAML files that sent Propel looking for a non existant class when running the data-load command. That's one of those "gotchas" that is bound to happen, but being so green it stumped me for a few minutes until I spotted the errant extra 'l' in one part of the YAML.

I now have some nice generated class structures with data models, and Netbeans's autocomplete is making life even easier for me, suggesting object property getters as I type so I don't even need to refer back to the schema to double check column names, cool.

Another thing I have noticed is the use of good old fashioned procedural style functions. This is good, because PHP lets you do this and why should you have to have absolutely everything inside a class when all you need is a little function that you can use here and there. Namely the template system uses functions like ```
<?php include_metas()?> and <?php echo url_for('module/action')?>
```. I like this. I'm not a Java developer, I'm a PHP developer, so we can do this kind of thing :).
