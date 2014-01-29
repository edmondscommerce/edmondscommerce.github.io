---
layout: post
status: publish
published: true
title: Automating PHP Scripts Using Cron (Without CLI)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 104
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=104
date: 2009-01-27 14:34:55.000000000 +00:00
categories:
- php
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
A lot of hosting accounts do not have CLI PHP enabled. If you have some maintainence scripts that you want to run on a regular basis then you can still do this using cron combined with cURL.

For example check out this crontab command:

```

# 0 0 * * * * /usr/bin/curl http://www.mydomain.co.uk/currency_update.php

```

This will run the currency update script every night.

To edit your crontab simply log into the server via SSH and then type the following command:

```

crontab -e

```

Hit [i] to go into insert mode. Then type your command. Then hit [esc] to get out of insert mode. Finally type :wq to save the changes and quit. 

If your command is not right, you will get a message saying so with an option to try again at editing the file.
