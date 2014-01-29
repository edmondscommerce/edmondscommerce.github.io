---
layout: post
status: publish
published: true
title: Be Broadband Counter Strike Connection Problems + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1273
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1273
date: 2009-11-28 11:32:31.000000000 +00:00
categories:
- misc
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you use Be or Be There broadband and the supplied Bebox (THOMSON TG585v7) and you are having connection problems when playing Counter Strike or other Steam games, try this solution (taken from here: <a href="http://www.beusergroup.co.uk/technotes/index.php/Steam_issues">http://www.beusergroup.co.uk/technotes/index.php/Steam_issues</a>)

This fix should correct the following issues:

* Servers in Steam/in Steam games suffer ping 'spikes'
* Difficulty/Inability to connect to servers
* Use of Steam/Steam games causes the BeBox to freeze/stall/restart (crash)
* Loss of connection to servers, or timeouts
* Poor performance ('lag') in servers

If you are having problems with the fix supplied below then please post in this thread and I will try to help, but I will not be held responsible for any damage to Be equipment etc. You know the drill.

This fix involves editing the user.ini file to change configuration. of the BeBox. This can also be done through telnet but I recommend it be done this way as I ran into problems trying the fix via telnet.

1. Follow this link to the router configuartion page:
<a href="http://bebox/cgi/b/bandr/?be=0&l0=0&l1=1&tid=BACKUP_RESTORE">http://bebox/cgi/b/bandr/?be=0&l0=0&l1=1&tid=BACKUP_RESTORE</a>

2.Enter username & password (default is Administrator, with password left blank)

3. Select Backup Configuration Now.... Don't close this window

You should now have a user.ini file containing your router configuration options.

4. Open it in Notepad. Go to Edit , Find and search for appconfig application=GAME(UDP)

You should see three entries regarding UDP. You need to change them to:

 appconfig application=GAME(UDP) trace=enabled timeout=3
 appconfig application=CONE(UDP) trace=enabled timeout=3
 appconfig application=LOOSE(UDP) trace=enabled timeout=3

Now again, go to Edit , Find and this time search for timerconfig timer=udpidle

You should change this entry to:

timerconfig timer=udpidle value=3

5. Save that user.ini file to the desktop. Switch back to the Speedtouch router page and select Restore Configuration Now....

6. Use the router dialog to locate and select the user.ini file that you have modified. The router should upload the file.

7. Once configuration is uploaded, restart your router and all 'Connection Problem' or Server list crashes or Restarting of the BeBox due to UDP flooding in CSS and other games should be FIXED.
