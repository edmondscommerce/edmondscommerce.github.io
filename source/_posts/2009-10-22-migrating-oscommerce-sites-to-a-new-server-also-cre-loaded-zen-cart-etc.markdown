---
layout: post
status: publish
published: true
title: Migrating osCommerce Sites to a New Server (also CRE Loaded, Zen Cart etc)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1212
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1212
date: 2009-10-22 11:27:32.000000000 +01:00
categories:
- oscommerce
tags:
- oscommerce
- server
- cre loaded
- migration
- zen cart
- move
- hosting
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to move your osCommerce (and derivatives such as CRE Loaded and Zen Cart) based site to a new server, here is a quick explanation of our approach which enables you to handle the migration without any downtime and no loss of order or customer information despite the fact that in the propagation period, visitors may visit the new server or the old server.

This propagation period is due to the fact that DNS servers around the globe may have cached your old DNS record, which points your domain name at your old IP address. These caches can stay alive for up to 48 hours meaning that you can not be certain that a visitor will definitely go to your new server within this period despite the fact that you have updated your domain name to point at your new name servers.

<strong>First - Copy the Files + Database:</strong>

Of course you need to copy all of the site files from the old server to the new server. The slowest and least reliable way to do this is via FTP. By using FTP, you have to actually download all the files on your old server to your local PC and then upload those files from your local PC to the new server. This can take a long time, especially the uploading part (thanks to the asynchronous nature of ADSL).

For the database you need to create a dump file via the command line or exporting from phpMyAdmin. Like FTP for the files, if you use phpMyAdmin then you have to download the dump file to your local machine and then upload it to the new server.

A better method for moving the files and database dump is to use SCP to copy files directly from the old server to the new server. I have written an article explaining this technique here: <a href="http://www.edmondscommerce.co.uk/blog/hosting/basic-server-migration-using-ssh-scp/">Basic Server Migration Using SSH + SCP</a>.

<strong>Configuring the New Server</strong>
Unfortunately osCommerce based sites often require register globals to be enabled. They also use the old fashioned long arrays. That means that you will probably need to edit the configuration of the new server to enable these old PHP features.

This is an example vhost.conf (don't forget to create the vhost_ssl.conf with the same settings) for Plesk.

```

<Directory /var/www/vhosts/********.co.uk/httpdocs>
php_admin_value open_basedir /var/www/vhosts/******.co.uk/dbCreds:/var/www/vhosts/******.co.uk/httpdocs:/tmp
AllowOverride All
php_admin_flag register_globals on
php_admin_flag register_long_arrays on
</Directory>

```

Note that I have specified a non webaccessible folder called dbCreds which contains the database credentials. I can then simply include this file from within the includes/configure.php and admin/includes/configure.php files.

<strong>Ensuring No Loss of Customer or Order Information</strong>
To make sure that you don't lose any customer or order information, we need to take a couple of extra steps. First though an explanation of what can go wrong:

During the propagation period, there is a distinct possibility that you will be taking orders on both servers. If you don't take any extra steps, then you might have orders and customers on both servers that have the same id number on the database. This can then make transferring the missing orders from the old server to the new server problematic.

A simple solution is to simply edit the autoincrement value on the orders and the customers table. I would normally suggest using a big jump in increment like 1000. This will mean that new orders and customers created on the new server will have id numbers that are 1000 higher than the old server. By doing this, we can then import any missing order and customer information over, safe in the knowledge that the id numbers will not clash. Of course, if you expect to create 1000 orders or customers within a couple of days then you will need to make a bigger increment increase on the new server. You are probably also turning over vast amounts of cash :)

Once the propagation period is over, lets say 3 days after you update your name servers, you can use this little script I created to help you to export the missing orders from your old server to your new server

<a href="http://addons.oscommerce.com/info/5958">Server Migration Orders / Customers Synchronisation</a>

<strong>Get Someone To Handle it For You</strong>
Of course, if you prefer you can book someone to handle the migration for you. If you would like us to take care of your migration, just <a href="http://www.edmondscommerce.co.uk/contact-about-oscommerce-server-migration.html">get in touch</a>.
