---
layout: post
title: "cPanel Download Site Files and Database"
date: 2014-02-10 18:03:36 +0000
comments: true
author: kenneth
categories: 
 - cpanel
tags: 
 - cpanel
 - magento
 - linux
 - migration
 - staging
description: How to get a copy of a site's files and database when provided with cPanel access
---


Often a client won't have access to SSH, or won't be able to provide you with some of the more specifics such as FTP, PHPMyAdmin etc. All they know to give you is access to their cPanel. Through this there's various tools at your disposal.

Try SSH
-------

Your cPanel login is actually a Linux user login, which cPanel's FTP hooks into. The first step is to navigate in your cPanel to FTP Accounts and click Configure FTP client on a user. These are SFTP details and can very often provide you with SSH shell access, unless the host has disabled this.

Simply try `ssh user@host -p 1234`, where the user, host and password are your cPanel login, and the port displayed on the FTP Accounts page.

From here you're free to use `tar`, `gzip`, `mysqldump` etc to acquire the files and database.


If SSH isn't enabled
--------------------

Sometimes the host disables SSH access, only allowing its use for SFTP. There are still many ways to acquire the site's files and database:

###Getting hold of the files

- **Plain old FTP** - You can just use an FTP client such as Filezilla to access and download the site's files using FTP or SFTP. This is the simplest way, but can take a long time because of the amount of files involved
- **File Manager Web UI** - compressing the site's files obviously shrinks the download size, but also vastly reduces the amount of connections you need to make, leading to a faster download speed.
    1. Navigate to the File Manager section (remember to tick "Show hidden files" to pick up .htaccess files)
    - Browse to the web root folder, select all the files and folders you want using Ctrl+Click. Remember to exclude unnecessary large files such as sql dumps, media folders and the var folder
    - Click Compress from the toolbar

###Getting hold of the database

- **PHPMyAdmin** - PHPMyAdmin offers an array of options for dumping your database. You should start by checking the database's size and considering excluding the dump of tables such as `log_url`, `log_url_info`, `log_visitor`, `log_visitor_info`, `report_viewed_product_index`
    1. Navigate to the PHPMyAdmin area of cPanel and locate the database in use (check your `app/etc/local.xml` if you're not sure which
    - Click the Export tab
    - Select Custom: here's where you can selectively export information
    - Tick 'Disable foreign key checks' and set 'Dump table' to 'structure'. This will have PHPMyAdmin set up only the tables' columns but no data (we'll get to that)
    - Click Go
    - Once this is complete, navigate back to the Export page and click Custom again.
    - Deselect (ctrl+click) any tables which are unnecessary
    - Tick 'Disable foreign key checks' and set 'Dump table' this time to 'data'
    - This will provide you with two files representing the database. Import first the Structure one, and then the Data one (or concatenate the two together)

