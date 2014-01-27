---
layout: post
status: publish
published: true
title: Apache, mod_rewrite and SEO
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 27
wordpress_url: http://www.edmondscommerce.co.uk/blog/search-engine-optimisation/apache-mod_rewrite-and-seo/
date: 2008-03-04 11:26:55.000000000 +00:00
categories:
- search engine optimisation
- mod_rewrite
- apache
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Dynamic database driven web sites tend to use various GET variables to define which content to display on that particular page. This is perfectly normal and reasonable. However it does make things a little confusing for search engine spiders as not every GET variable pertains to alternative content. Often GET is used for session, or maybe referrer tracking - or pretty much any piece of information which your web site may use.

This can mean that your product page about fluffy banana shaped teddy bears has the address 
```

mysite.com/index.php?cat=123&amp;product=333&amp;breadcrumb=123_43_2&amp;session_id=89o7324kjhlef8y234h

```
Not only does this make life difficult for search engine spiders, but its not exactly the most memorable url for your visitors either.

There is a solution and its called mod_rewrite.

Apache is part of the LAMP stack which is one of the most popular software and operating system combinations used to power web servers. Mod_rewrite is a particular plugin for Apache which allows you to create rules which will rewrite urls when they meet specific criteria.

The only really tricky part about setting up rewrite rules is that by neccessity they rely on regular expressions. Regular expressions can seem like a dark art at first, and often even for a seasoned coder familiar with a bit of regex, decoding someone elses expression can take a bit of brain power to say the least!

However there is no real reason to worry as all you really need to do is to learn how to achieve what you want. You do not need to learn the ins and outs of every particular regex function or operator.

For example take this

```


RewriteEngine On

RewriteRule ^(.*)\.p(.*).html$ product.php?products_id=$2&amp;%{QUERY_STRING} [L]


```

This rewrite rule will take a url in the form of:
mysite.com/whatever-you-want-here.p.[products_id].html

And automatically convert it so that to your web system it is the url:
mysite.com/product.php?products_id=[products_id]

All you need to do now is devise a nice way of dynamically generating all of those nice keyword rich urls for your product pages and you are in business.

If you want any help enabling the power of mod_rewrite to give your web site properly search engine friendly URLS, get in touch today.

