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
 
