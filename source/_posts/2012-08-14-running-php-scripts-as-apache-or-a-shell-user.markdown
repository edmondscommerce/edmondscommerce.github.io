---
layout: post
status: publish
published: true
title: Running PHP Scripts as Apache or a Shell User
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3246
wordpress_url: http://www.edmondscommerce.co.uk/?p=3246
date: 2012-08-14 14:05:32.000000000 +01:00
categories:
- linux
tags:
- linux
- apache
- permissions
- configuration
- user
- group
- vigr
- etc
- shadow
- httpd
---
If you have PHP scripts that need to be able to run via the web server as Apache and also be runnable directly on the command line then you may run into permissions issues, especially if those scripts are doing anything with files.

The scenario is that you run the script via the webserver and all of the files etc that are created are owned by Apache. Then you try to run on the command line and the script cannot run because it does not have permission to access Apache's files. The opposite scenario is also true.

There are a few possible solutions to this but the most elegant and simple is to do the follwing.

Assuming you are running Centos, you first of all need to set Apache to run with a umask of 002. This means that files it creates will have read/write permissions for the Apache group as well as the Apache user. 

To do this, simply add a line to the file /etc/sysconfig/httpd. You can do this in one command like this:

```bash

echo "umask 002" >> /etc/sysconfig/httpd

```

Then you need to restart Apache to apply this.

```bash

service httpd restart

```

You then need to add your shell user to the apache group. To do this you need to do the following:

```bash

vigr

```

Then find the line with your shell user and at the end add a comma and the word apache. This will add that user to the apache group along with it's own group.

You will get a prompt to also edit etc/shadow. Agree to this and repeat the process. 

You will then need to log out and log back in to apply those changes and that should resolve your permissions issues for good.
