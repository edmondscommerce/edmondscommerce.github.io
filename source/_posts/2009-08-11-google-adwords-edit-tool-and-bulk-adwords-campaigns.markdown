---
layout: post
status: publish
published: true
title: Google Adwords Edit Tool and Bulk Adwords Campaigns
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1148
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1148
date: 2009-08-11 17:40:46.000000000 +01:00
categories:
- adwords
tags:
- seo
- ppc
- adwords
- marketing
- bulk
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I have recently been working on shoehorning a large amount of data into a Google Adwords account for a client. Looking at setting up unique ads for around 50k products (targeting in stock products only so this is just a slice of the full catalogue size). I have managed to figure my way around the various Adwords limits and decided to use the adwords tool (running on a VirtualBox XP machine) to handle the bulk uploading. 

I took a brief look at the API and then realised that you have to actually pay to use it! Forget that, already paying Google enough..

Anyway, now using the Adwords Edit Tool to upload the data and my god is it slow. I wonder if the API is as slow?

For the record - I found out that you can only have 25 campaigns. Each campaign can have up to 2000 ad groups inside it. Each ad group can contain an as yet undetermined amount of ads and keywords. You can't determine which keywords are displayed with which ad, but you can use dynamic keywords to allow you to effectively have one ad displaying a large number of keywords each with their own unique(ish) ad. Variable keyword lengths though cause pain with this approach.

Ultimately I have found making adwords do exactly what I want it to do to be an excercise in flexible, lateral thinking and generally working around the system rather than with it. That's never really as much fun and the whole thing has given me a new found respect for Amazons AMTU system. The real achilles heel of the Adwords Edit Tool is that you are going to need to manually run it every time, and if it runs this slow then forget about keeping a large amount of ads updated on a regular basis.

I am sure there are some hardcore Adwords abusers who could shed light on a few more sneaky tricks. I suspect a lot involve setting up multiple adwords accounts and that is something that I might consider.
