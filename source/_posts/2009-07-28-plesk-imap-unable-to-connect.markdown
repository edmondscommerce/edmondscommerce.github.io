---
layout: post
status: publish
published: true
title: Plesk IMAP Unable to Connect
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1140
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1140
date: 2009-07-28 10:14:24.000000000 +01:00
categories:
- linux
tags:
- plesk
- imap
- connection
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are struggling to connect to your IMAP mailboxes but other machines on the same network are working fine, then chances are you are hitting the rather restrictive max connections per IP setting that is the default with Courier IMAP and Plesk. As standard it is limited to only 4 connections per IP. For me that was taken up by one machine connecting to 2 inboxes and also running a mail notifier system (which of course doubled up the connections).

After nearly tearing my hair out, I stumbled across the following posts:

<a href="http://kb.mediatemple.net/questions/259/(dv)+HOWTO:+Raise+Courier-IMAP+Connections">http://kb.mediatemple.net/questions/259/(dv)+HOWTO:+Raise+Courier-IMAP+Connections</a>

<a href="http://blog.makeitcomplete.com/2008/11/increase-the-number-of-connection-for-courier-imap-in-plesk/">http://blog.makeitcomplete.com/2008/11/increase-the-number-of-connection-for-courier-imap-in-plesk/</a>

And 30 seconds later I'm connected. I'm bound to hit this issue again in the future so I have added this post as a reminder.

```

vi /etc/courier-imap/imapd

```
I changed MAXDAEMONS from 40 to 80 and MAXPERIP from 4 to 40.

```

/etc/init.d/courier-imap stop
/etc/init.d/courier-imap start

```

Sorted

