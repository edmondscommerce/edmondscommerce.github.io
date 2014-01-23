---
layout: post
status: publish
published: true
title: Wondering what you're waiting for? Mytop tells all
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3253
wordpress_url: http://www.edmondscommerce.co.uk/?p=3253
date: 2012-08-14 16:03:11.000000000 +01:00
categories:
- mysql
tags:
- mysql
- terminal
- query
- mytop
---
Mytop is a handy utility which shows what queries are currently being executed on your MySQL server - useful for those times when you're not quite sure if it's still on the job

Running mytop is easy, just run it from the command line and it'll give you a top-like list of any queries currently being executed on the server
You need to tell my top how it should connect to your database. You <em>can</em> specify everything as parameters on the command, such as
```bash

$ mytop -u=myuser -p=mypassword --db=mydatabase -P=3306

```

But chances are you're not changing your database server <em>that</em> often.

<h3>Setting the default parameters for mytop</h3>

If you want to save yourself the effort of repeatedly typing the same details over and over, just tell mytop what you want it to choose if you don't tell it any parameters

All you need to do is let mytop know how to connect to your MySQL database in the form of a config file called .mytop in your home folder, with the following contents (replace as necessary):
<blockquote>
<code>
 	 user=myuser
         pass=
         host=my.host.name
         db=
         delay=5
         port=3306
         socket=
         batchmode=0
         header=1
         color=1
         idle=1
</code>
</blockquote>

You can add as many or as few of these as you like for easy configuration, like specifying the db flag if you're primarily accessing only one database. I like to leave the password field blank, and use the --prompt flag to avoid any awkward leaks!
