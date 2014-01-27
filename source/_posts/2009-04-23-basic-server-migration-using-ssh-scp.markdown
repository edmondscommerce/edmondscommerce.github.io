---
layout: post
status: publish
published: true
title: Basic Server Migration Using SSH + SCP
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 340
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=340
date: 2009-04-23 13:50:57.000000000 +01:00
categories:
- hosting
tags:
- scp
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
The scenario here is that you have access to two servers - old and new - and you want to copy a site + database from old server to new server directly.

You have root SSH access to both servers.

<strong>1. Create  a TAR archive of the document root for the site on the old server.</strong>
Log into SSH on the old server.

Navigate to your vhost root (the folder just above httpdocs) then use the following command to make a tar archive of your entire httpdocs folder:
```

tar -cvvf httpdocs.tar httpdocs/

```

<strong>2. Gzip the TAR archive</strong>
```
 gzip httpdocs.tar
```

<strong>3. Transer the File to the New Server</strong>
Log into SSH on the new server

This bit may change according to your specific server setups. The way I approached this was to log into the new server  at the vhost root where I want to import the old httpdocs folder. I then use the following SCP command to log into the old server, find my archive and copy it to the current location. 

I am using a custom port (not the real one in the example of course) for SSH so that must be specified. Unlike SSH, you must use a capital P to specify a custom port

<em><strong>Note the space and full stop at the end - they are very important!</strong></em>

```

scp -P 1111 old_server_username@123.123.123.123:/path/to/file/on/old/server/archive.tar.gz .

```

<strong>4. Dump all DB's and Transfer</strong>
To dump all of the databases into one single file we can use the following mysqldump syntax. Note you can simply use the --all-databases switch but this will backup database that you probably don't want to include. Better to declare a list of all the DB's that you do want.
```

mysqldump -u SomeUser -p --databases mydb1 mydb2 mydb3 > myDbs.sql

```

Once you have this dump file you can Gzip it and transfer it via SCP using the same kind of commands as above.
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.auctionreport.com/?p=1765" rel="nofollow">Auction Report » <b>SCP</b> Auctions - 0% Commission Special!</a><br><a href="http://www.pakistanviews.com/scp-four-new-judges-take-oath/" rel="nofollow"><b>SCP</b> four new judges take oath - Pakistan News</a><br><a href="http://dandygadget.com/2009/04/01/the-sanyo-scp-2700-phone-will-color-sprint-operator/" rel="nofollow">The Sanyo <b>SCP</b>-2700 Phone Will Color Sprint Operator | dandygadget.com</a><br></div>
