---
layout: post
status: publish
published: true
title: Magento Newsletters Not Sending + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 228
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=228
date: 2009-03-11 17:06:44.000000000 +00:00
categories:
- magento
tags:
- magento newsletters
- magento cron
- magento emails
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are scratching your head trying to figure out why your Magento is not sending out newsletter emails then this post is what you need.

Magento has a script called cron.php which handles all of the timed jobs that your Magento store has to do. In this list is the task of sending out newsletters. You have to set up your server crontab to run this cron.php script at regular intervals (eg 5 minutes). 

Once you do this, you should find that your newsletter will be sent out as expected.

<a href="http://www.magentocommerce.com/wiki/how_to/how_to_setup_a_cron_job" rel="nofollow">See this page for some instructions</a>

However - here are my simple instructions for a linux server.

1. Open up an SSH session with your server. (If you can't do this you are going to have to ask your hosts to do this for you instead).

2. Browse to the document root of your magento store, the folder with cron.php in there

3. enter the command
```
pwd
```
This command gives you the current full path. Write this down somewhere

4. enter the command
```
which php
```
This command gives you the path to your PHP binary. Write this down somewhere

5. enter the command
```
crontab -e
```
This opens up your crontab editor which is the system for scheduling tasks on Linux

6. hit the ```i
 key to go into insert mode on the crontab editor (vi basically)

7. on a new line paste the following, but replacing the paths with the paths you got before
[code]
*/5 * * * * /path/to/php -f /path/to/cron.php

```

8. Hit ```esc
 then type the command
[code]:wq
```
This saves the crontab

9. Create a newsletter and schedule it to send in 2 minutes time.

It should send. If it doesn't then something else is wrong, but hopefully this should fix it for you.
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.nicksays.co.uk/2009/02/cron-jobs-for-magento-modules/" rel="nofollow">Cron jobs for Magento Modules</a><br><a href="http://www.molotovbliss.com/blog/2009/02/magento-security-vulnerability/" rel="nofollow"><b>Magento</b> Security Vulnerability | molotov.bliss</a><br><a href="http://lapenguina.com/?p=5" rel="nofollow">Location of Magento Email Templates</a><br><a href="http://www.magshops.de/magento-allgemeines/magento-emails-bearbeiten" rel="nofollow"><b>Magento Emails</b> bearbeiten | MagShops</a><br><a href="http://www.magentoshoppingcartvideos.com/?p=33" rel="nofollow">Transactional Emails</a><br><a href="http://www.website-hosting-reviews-blog.com/2420/magento-hosting-order-notification-emails-not-sending/" rel="nofollow">Magento Hosting : Order notification <b>emails</b> not sending</a><br><a href="http://www.sharpdotinc.com/mdost/2009/03/10/magento-error-simplexmlelementaddattribute-attribute-already-exists/" rel="nofollow"><b>Magento</b>: Error - SimpleXMLElement::addAttribute() Attribute <b>...</b></a><br><a href="http://ecommerce.aheadworks.com/blog/2009/01/product-questions-extensions/" rel="nofollow">aheadWorks <b>Magento</b> Blog » Product Questions extensions</a><br><a href="http://ecommerce.aheadworks.com/blog/2009/01/test/" rel="nofollow">aheadWorks <b>Magento</b> Blog » Featured Products extension, version 1.5 <b>...</b></a><br><a href="http://www.shirasmane.com/2009/03/03/posts-about-ecommerce-as-of-march-3-2009/" rel="nofollow">Posts about Ecommerce as of March 3, 2009</a><br><a href="http://www.shirasmane.com/2009/02/25/posts-about-ecommerce-as-of-february-25-2009/" rel="nofollow">Posts about Ecommerce as of February 25, 2009</a><br></div>
